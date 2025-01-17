aws_region = "us-east-1"
key_pair_name = "devops-key"
ami_id = "ami-0c7217cdde317cfec"  # Amazon Linux 2023 AMI

# Instance types for each server
jenkins_instance_type = "t2.medium"
terraform_instance_type = "t2.micro"
sonarqube_instance_type = "t2.medium"
nexus_instance_type = "t2.medium"