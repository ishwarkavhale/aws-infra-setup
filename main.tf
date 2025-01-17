# Previous configuration remains the same until EC2 instances section

# EC2 Instances using the module
module "jenkins_instance" {
  source = "./modules/ec2_instance"

  ami_id            = var.ami_id
  instance_type     = var.jenkins_instance_type
  subnet_id         = aws_subnet.public_subnet.id
  security_group_id = aws_security_group.devops_sg.id
  key_pair_name     = var.key_pair_name
  instance_name     = "jenkins"
  volume_size       = 25
  user_data        = file("${path.module}/scripts/jenkins-install.sh")
}

module "terraform_host_instance" {
  source = "./modules/ec2_instance"

  ami_id            = var.ami_id
  instance_type     = var.terraform_instance_type
  subnet_id         = aws_subnet.public_subnet.id
  security_group_id = aws_security_group.devops_sg.id
  key_pair_name     = var.key_pair_name
  instance_name     = "terraform-host"
  volume_size       = 25
  user_data        = file("${path.module}/scripts/terraform-install.sh")
}

module "sonarqube_instance" {
  source = "./modules/ec2_instance"

  ami_id            = var.ami_id
  instance_type     = var.sonarqube_instance_type
  subnet_id         = aws_subnet.public_subnet.id
  security_group_id = aws_security_group.devops_sg.id
  key_pair_name     = var.key_pair_name
  instance_name     = "sonarqube"
  volume_size       = 25
  user_data        = file("${path.module}/scripts/sonarqube-install.sh")
}

module "nexus_instance" {
  source = "./modules/ec2_instance"

  ami_id            = var.ami_id
  instance_type     = var.nexus_instance_type
  subnet_id         = aws_subnet.public_subnet.id
  security_group_id = aws_security_group.devops_sg.id
  key_pair_name     = var.key_pair_name
  instance_name     = "nexus"
  volume_size       = 25
  user_data        = file("${path.module}/scripts/nexus-install.sh")
}