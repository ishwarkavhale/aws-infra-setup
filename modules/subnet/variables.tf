variable "vpc_id" {
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