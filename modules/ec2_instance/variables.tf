variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the instance"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the key pair to use"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
}

variable "volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 25
}

variable "user_data" {
  description = "User data script for instance initialization"
  type        = string
  default     = ""
}