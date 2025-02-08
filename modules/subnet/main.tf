resource "aws_subnet" "this" {
  vpc_id                  = var.vpc_id
  for_each = var.vpc_subnet
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  availability_zone       = each.value.availability_zone

  tags = {
    Name = each.key
  }
}
