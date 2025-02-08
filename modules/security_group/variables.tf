variable "vpc_id" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "ingress_rules" {
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

variable "egress_rules" {
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
