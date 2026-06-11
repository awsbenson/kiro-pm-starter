variable "aws_region" {
  description = "AWS region to deploy environments"
  type        = string
  default     = "ap-east-2"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "aai_benlai"
}

variable "pm_count" {
  description = "Number of PM environments to provision"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type for each PM environment"
  type        = string
  default     = "t3.xlarge"
}

variable "volume_size" {
  description = "EBS volume size in GB"
  type        = number
  default     = 20
}

variable "starter_kit_repo" {
  description = "Git repository URL for the starter kit"
  type        = string
  default     = "https://github.com/awsbenson/kiro-pm-starter.git"
}

variable "project_name" {
  description = "Project name used for resource tagging"
  type        = string
  default     = "trendai-pm"
}

variable "pm_names" {
  description = "Optional list of PM names for labeling. If fewer than pm_count, remaining use pm-N format."
  type        = list(string)
  default     = ["pm-1", "pm-2", "pm-3", "pm-4", "pm-5", "pm-6", "pm-7", "pm-8"]
}

variable "use_spot" {
  description = "Use spot instances (cheaper for testing, NOT for class day)"
  type        = bool
  default     = false
}

variable "custom_ami" {
  description = "Custom AMI ID (pre-built lab image). If set, skips user-data script."
  type        = string
  default     = ""
}
