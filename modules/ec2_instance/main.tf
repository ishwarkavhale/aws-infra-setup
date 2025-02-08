resource "aws_instance" "ec2" {
  for_each = var.aws_instance
  ami           = var.common_values.ami_id
  instance_type = var.common_values.instance_type
  key_name      = var.common_values.key_pair_name
  user_data     = each.value.user_data
  vpc_security_group_ids = var.common_values.vpc_security_group_ids
  subnet_id         = var.common_values.subnet_id

  root_block_device {
    volume_size = var.common_values.volume_size
    volume_type = var.common_values.volume_type
  }

  tags = {
    Name = each.key
    environment = var.tegs.environment
  }
}