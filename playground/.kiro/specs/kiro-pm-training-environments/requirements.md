# Requirements Document

## Introduction

This feature provisions 7–8 browser-accessible remote Kiro IDE development environments for TrendAI Product Managers attending a one-day training class. Each PM receives an isolated EC2 instance with a full Linux desktop, Kiro IDE, and pre-configured tooling, accessible via Amazon DCV through any modern browser. The infrastructure is managed via Terraform with a simple Makefile interface for deploy, status, and teardown operations.

## Glossary

- **Provisioning_System**: The Terraform-based infrastructure-as-code system that creates, configures, and destroys PM training environments on AWS
- **PM_Environment**: A single isolated EC2 instance configured with desktop access, Kiro IDE, and development tooling for one Product Manager
- **DCV_Server**: The Amazon DCV remote desktop server running on each EC2 instance, providing browser-based HTTPS access on port 8443
- **Setup_Script**: The user-data shell script that configures each EC2 instance with desktop environment, DCV, Kiro IDE, Node.js, and the starter kit
- **Operator**: The training administrator who deploys, monitors, and tears down the environments using the Makefile commands
- **PM_User**: A TrendAI Product Manager who accesses their assigned environment via browser during the training session
- **Starter_Kit**: The pre-cloned Git repository at ~/kiro-pm-starter containing training exercises and sample projects

## Requirements

### Requirement 1: Environment Provisioning

**User Story:** As an Operator, I want to provision multiple isolated PM environments with a single command, so that I can quickly set up a training class without manual per-instance configuration.

#### Acceptance Criteria

1. WHEN the Operator runs the apply command, THE Provisioning_System SHALL create the number of EC2 instances specified by the pm_count variable (configurable from 1 to 8)
2. THE Provisioning_System SHALL provision each PM_Environment with a unique public IP address, username, and randomly generated password
3. THE Provisioning_System SHALL create all supporting infrastructure (VPC, subnet, internet gateway, security group, IAM role) before provisioning instances
4. IF the pm_count variable exceeds 8, THEN THE Provisioning_System SHALL reject the configuration with a validation error
5. WHEN provisioning completes, THE Provisioning_System SHALL output access URLs and credentials for all PM_Environments

### Requirement 2: Browser-Based Remote Desktop Access

**User Story:** As a PM_User, I want to access my development environment through a web browser, so that I can participate in training without installing any software on my local machine.

#### Acceptance Criteria

1. THE DCV_Server SHALL accept HTTPS connections on port 8443 from any IP address
2. WHEN a PM_User navigates to their assigned URL, THE DCV_Server SHALL present a login page requiring username and password authentication
3. WHEN valid credentials are provided, THE DCV_Server SHALL display a full GNOME desktop session owned by the PM_User's account
4. THE DCV_Server SHALL support connections from Chrome, Firefox, Edge, and Safari browsers
5. WHILE a PM_User is connected, THE DCV_Server SHALL maintain the desktop session until the user disconnects or the instance is terminated

### Requirement 3: Kiro IDE Pre-Installation

**User Story:** As a PM_User, I want Kiro IDE pre-installed and ready to launch, so that I can start the training exercises immediately without setup delays.

#### Acceptance Criteria

1. THE Setup_Script SHALL install Kiro IDE version 0.12.224 on each PM_Environment
2. THE Setup_Script SHALL place a Kiro IDE desktop shortcut on the PM_User's desktop
3. THE Setup_Script SHALL install the Kiro CLI and make it available in the PM_User's PATH
4. WHEN the PM_User double-clicks the Kiro IDE desktop shortcut, THE PM_Environment SHALL launch Kiro IDE

### Requirement 4: Development Tooling

**User Story:** As a PM_User, I want Node.js, Git, and npm pre-installed, so that I can run the training exercises without additional setup.

#### Acceptance Criteria

1. THE Setup_Script SHALL install Node.js 20 LTS on each PM_Environment
2. THE Setup_Script SHALL install Git on each PM_Environment
3. THE Setup_Script SHALL install npm as part of the Node.js installation
4. WHEN the PM_User opens a terminal, THE PM_Environment SHALL have node, npm, and git commands available in the PATH

### Requirement 5: Starter Kit Deployment

**User Story:** As a PM_User, I want the training starter kit pre-cloned in my home directory, so that I can begin exercises immediately.

#### Acceptance Criteria

1. THE Setup_Script SHALL clone the starter kit repository into ~/kiro-pm-starter for each PM_User
2. WHEN the starter kit contains a package.json file, THE Setup_Script SHALL run npm install to pre-install dependencies
3. THE Setup_Script SHALL set correct file ownership so the PM_User has full read/write access to the starter kit directory

### Requirement 6: Environment Isolation

**User Story:** As an Operator, I want each PM to have a completely isolated environment, so that one PM's actions cannot affect another PM's training experience.

#### Acceptance Criteria

1. THE Provisioning_System SHALL create a separate EC2 instance for each PM_User
2. THE Provisioning_System SHALL generate a unique random password (12 characters, alphanumeric) for each PM_User
3. THE Provisioning_System SHALL assign each PM_Environment a distinct public IP address
4. WHILE multiple PM_Environments are running, THE Provisioning_System SHALL ensure no shared filesystem or process space exists between instances

### Requirement 7: Infrastructure Teardown

**User Story:** As an Operator, I want to destroy all environments with a single command, so that I can avoid ongoing costs after the training session ends.

#### Acceptance Criteria

1. WHEN the Operator runs the destroy command, THE Provisioning_System SHALL terminate all EC2 instances and delete all associated resources (VPC, subnet, security group, IAM role, key pair)
2. WHEN the destroy command completes, THE Provisioning_System SHALL leave no billable resources running in the AWS account for this project
3. IF a destroy operation fails partially, THEN THE Provisioning_System SHALL report which resources remain and allow re-running the destroy command

### Requirement 8: Operational Visibility

**User Story:** As an Operator, I want to check the status of all environments and retrieve credentials, so that I can troubleshoot issues and distribute access information to PMs.

#### Acceptance Criteria

1. WHEN the Operator runs the urls command, THE Provisioning_System SHALL display the access URL for each PM_Environment
2. WHEN the Operator runs the credentials command, THE Provisioning_System SHALL display the username and password for each PM_Environment
3. WHEN the Operator runs the status command, THE Provisioning_System SHALL display the instance name, state, and public IP for each PM_Environment
4. THE Provisioning_System SHALL mark credential outputs as sensitive to prevent accidental exposure in logs

### Requirement 9: Network Security

**User Story:** As an Operator, I want the environments to have appropriate network security controls, so that only necessary ports are exposed to the internet.

#### Acceptance Criteria

1. THE Provisioning_System SHALL allow inbound traffic only on port 8443 (DCV) and port 22 (SSH)
2. THE Provisioning_System SHALL allow all outbound traffic from PM_Environments (required for package installation and internet access)
3. THE DCV_Server SHALL use HTTPS (TLS) for all browser connections on port 8443
4. THE Provisioning_System SHALL create a dedicated VPC with a public subnet to isolate training resources from other AWS workloads

### Requirement 10: DCV License Validation

**User Story:** As an Operator, I want DCV license validation to work automatically, so that PMs can connect without license errors.

#### Acceptance Criteria

1. THE Provisioning_System SHALL create an IAM role with S3 read access to the DCV license bucket for the configured region
2. THE Provisioning_System SHALL attach the IAM instance profile to each PM_Environment EC2 instance
3. WHEN the DCV_Server starts, THE DCV_Server SHALL validate its license using the IAM role without requiring manual license keys
