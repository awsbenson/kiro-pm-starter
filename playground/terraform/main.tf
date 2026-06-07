# -----------------------------------------------------------------------------
# Data Sources
# -----------------------------------------------------------------------------

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# -----------------------------------------------------------------------------
# VPC & Networking
# -----------------------------------------------------------------------------

resource "aws_vpc" "main" {
  cidr_block           = "10.200.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "${var.project_name}-vpc"
    Project = var.project_name
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = "${var.project_name}-igw"
    Project = var.project_name
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.200.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name    = "${var.project_name}-public-subnet"
    Project = var.project_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name    = "${var.project_name}-public-rt"
    Project = var.project_name
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# -----------------------------------------------------------------------------
# Security Group
# -----------------------------------------------------------------------------

resource "aws_security_group" "kiro_ide" {
  name        = "${var.project_name}-kiro-ide-sg"
  description = "Allow DCV web client access and SSH"
  vpc_id      = aws_vpc.main.id

  # DCV web client (HTTPS)
  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "DCV web client"
  }

  # SSH (for troubleshooting)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  # ICMP (ping)
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ICMP ping"
  }

  # All outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-kiro-ide-sg"
    Project = var.project_name
  }
}

# -----------------------------------------------------------------------------
# SSH Key Pair
# -----------------------------------------------------------------------------

resource "aws_key_pair" "main" {
  key_name   = "${var.project_name}-key"
  public_key = file("${path.module}/keys/id_rsa.pub")

  tags = {
    Project = var.project_name
  }
}

# -----------------------------------------------------------------------------
# Random Passwords for each PM
# -----------------------------------------------------------------------------

resource "random_password" "pm_passwords" {
  count   = var.pm_count
  length  = 12
  special = false
}

# -----------------------------------------------------------------------------
# IAM Role for EC2 (DCV license validation requires S3 read access)
# -----------------------------------------------------------------------------

resource "aws_iam_role" "kiro_ide" {
  name = "${var.project_name}-kiro-ide-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Project = var.project_name
  }
}

resource "aws_iam_role_policy" "dcv_license" {
  name = "${var.project_name}-dcv-license"
  role = aws_iam_role.kiro_ide.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject"
        ]
        Resource = "arn:aws:s3:::dcv-license.${var.aws_region}/*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "kiro_ide" {
  name = "${var.project_name}-kiro-ide-profile"
  role = aws_iam_role.kiro_ide.name
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.kiro_ide.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# -----------------------------------------------------------------------------
# EC2 Instances
# -----------------------------------------------------------------------------

resource "aws_instance" "kiro_ide" {
  count = var.pm_count

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.main.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.kiro_ide.id]
  iam_instance_profile   = aws_iam_instance_profile.kiro_ide.name

  # Spot instances for testing (cheaper). On-demand for class day (no interruption).
  # Set use_spot=true for testing, use_spot=false (default) for class.

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp3"
  }

  user_data = templatefile("${path.module}/scripts/setup.sh", {
    pm_name          = var.pm_names[count.index]
    pm_password      = random_password.pm_passwords[count.index].result
    starter_kit_repo = var.starter_kit_repo
  })

  tags = {
    Name    = "${var.project_name}-${var.pm_names[count.index]}"
    Project = var.project_name
    PM      = var.pm_names[count.index]
  }
}
