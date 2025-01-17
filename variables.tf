# AWS Region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# Key Pair
variable "key_pair_name" {
  description = "Name of the key pair to use for EC2 instances"
  type        = string
}

# AMI ID
variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

# Instance Types
variable "jenkins_instance_type" {
  description = "Instance type for Jenkins server"
  type        = string
  default     = "t2.medium"
}

variable "terraform_instance_type" {
  description = "Instance type for Terraform host"
  type        = string
  default     = "t2.micro"
}

variable "sonarqube_instance_type" {
  description = "Instance type for SonarQube server"
  type        = string
  default     = "t2.medium"
}

variable "nexus_instance_type" {
  description = "Instance type for Nexus server"
  type        = string
  default     = "t2.medium"
}

# Security Group Rules
variable "security_group_rules" {
  description = "List of security group rules"
  type = list(object({
    port        = number
    to_port     = optional(number)
    description = string
  }))
  default = [
    {
      port        = 8080
      description = "Jenkins web interface"
    },
    {
      port        = 9000
      description = "SonarQube web interface"
    },
    {
      port        = 8081
      description = "Nexus web interface"
    },
    {
      port        = 22
      description = "SSH"
    },
    {
      port        = 443
      description = "HTTPS"
    },
    {
      port        = 30000
      to_port     = 32767
      description = "Kubernetes NodePort range"
    }
  ]
}