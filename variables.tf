variable "vpc_cidr" {
  type = string
  default = "10.0.0.0"
}

variable "aws_region" {
  type = string
}

variable "vpc_subnet" {
  type = map(object({
    cidr_block = string
    map_public_ip_on_launch = bool
    availability_zone = string
  }))
  default = {}
}

#security group


variable "sg_name" {
  type = string
}

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

#Security Group

variable "sg_ingress_rules" {
  type = list(object({
    cidr_ipv4   = string
    from_port   = number
    to_port     = number
    ip_protocol = string
  }))
  default = [
    {
      cidr_ipv4   = "10.0.0.0/8"
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
    },
    {
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
    }
  ]
}

variable "sg_egress_rules" {
  type = list(object({
    cidr_ipv4   = string
    from_port   = number
    to_port     = number
    ip_protocol = string
  }))
  default = [
    {
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 0
      to_port     = 0
      ip_protocol = "icmp"
    }
  ]
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
  }
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