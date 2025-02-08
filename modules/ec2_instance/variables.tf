
variable "aws_instance" {
  type = map(object({
    instance_name = string
    user_data     = string
  }))
}

variable "common_values" {
  type = object({
    ami_id            = string
    instance_type     = string
    key_pair_name     = string
    volume_size       = number
    volume_type       = string
    vpc_security_group_ids = list(string)
    subnet_id         = string
  })
}


variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
  }
}


# variable "ami_id" {
#   description = "AMI ID for the EC2 instance"
#   type        = string
# }

# variable "instance_type" {
#   description = "Instance type for the EC2 instance"
#   type        = string
# }

# variable "subnet_id" {
#   description = "Subnet ID where the instance will be launched"
#   type        = string
# }

# variable "security_group_id" {
#   description = "Security group ID for the instance"
#   type        = string
# }

# variable "key_pair_name" {
#   description = "Name of the key pair to use"
#   type        = string
# }

# variable "instance_name" {
#   description = "Name tag for the instance"
#   type        = string
# }

# variable "volume_size" {
#   description = "Size of the root volume in GB"
#   type        = number
#   default     = 25
# }

# variable "user_data" {
#   description = "User data script for instance initialization"
#   type        = string
#   default     = ""
# }