resource "aws_security_group" "this" {
  # name        = var.sg_name
  vpc_id      = var.vpc_id
  tags = {
    Name = var.sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = { for idx, rule in var.egress_rules : "rule_${idx}" => rule}
  security_group_id = aws_security_group.this.id
  ip_protocol = each.value.ip_protocol
  cidr_ipv4 = each.value.cidr_ipv4
  from_port = each.value.from_port
  to_port   = each.value.to_port

      #Dynamic block is not allowed in this resource beacuse of 
      # aws_vpc_security_group_ingress_rule is a singular resource that represents a single ingress
      # rule for a security group, so it doesn’t support multiple blocks being dynamically created inside of it.
}

resource "aws_vpc_security_group_egress_rule" "this" {
  for_each = { for idx, rule in var.egress_rules : "rule_${idx}" => rule}
  security_group_id = aws_security_group.this.id
  ip_protocol = each.value.ip_protocol
  cidr_ipv4 = each.value.cidr_ipv4
  from_port = each.value.from_port
  to_port   = each.value.to_port

}