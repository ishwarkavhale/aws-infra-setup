output "jenkins_public_ip" {
  value = module.jenkins_instance.public_ip
}

output "terraform_host_public_ip" {
  value = module.terraform_host_instance.public_ip
}

output "sonarqube_public_ip" {
  value = module.sonarqube_instance.public_ip
}

output "nexus_public_ip" {
  value = module.nexus_instance.public_ip
}

output "vpc_id" {
  value = aws_vpc.devops_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}