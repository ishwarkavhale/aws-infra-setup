vpc_cidr = "10.0.0.0/16"
aws_region = "us-east-1"

vpc_subnet = {
    pubs1 = {
        cidr_block = "10.0.1.0/24"
        map_public_ip_on_launch = true
        availability_zone = "us-east-1a"
    }
    pvts1 = {
        cidr_block = "10.0.2.0/24"
        map_public_ip_on_launch = false
        availability_zone = "us-east-1b"
    }
}

#Security Group

sg_name = "dev-sg"

sg_ingress_rules = [
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
    },
    {
      name        = "docker-api"
      from_port   = 2375
      to_port     = 2375
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },
    {
      name        = "docker-ssl"
      from_port   = 2376
      to_port     = 2376
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },
    {
      name        = "docker-swarm-manager"
      from_port   = 2377
      to_port     = 2377
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },
    {
      name        = "docker-swarm-communication"
      from_port   = 7946
      to_port     = 7946
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },
    {
      name        = "docker-swarm-overlay"
      from_port   = 4789
      to_port     = 4789
      protocol    = "udp"
      cidr_ipv4   = "0.0.0.0/0"
    },
    # Kubernetes Ports
    {
      name        = "k8s-api-server"
      from_port   = 6443
      to_port     = 6443
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },
    {
      name        = "k8s-node-port-range"
      from_port   = 30000
      to_port     = 32767
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },

    # Jenkins Ports
    {
      name        = "jenkins-web-interface"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },
    {
      name        = "jenkins-agent"
      from_port   = 50000
      to_port     = 50000
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },
    # SonarQube Ports
    {
      name        = "sonarqube-web"
      from_port   = 9000
      to_port     = 9000
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },
    # Trivy Ports
    {
      name        = "trivy-service"
      from_port   = 8081
      to_port     = 8081
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    },

    # HTTPS Ports
    {
      name        = "https"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
]

sg_egress_rules = [
    {
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 0
      to_port     = 0
      ip_protocol = "icmp"
    }
]

# key_pair_name = "devops-key"
# ami_id = "ami-0c7217cdde317cfec"  # Amazon Linux 2023 AMI

# # Instance types for each server
# jenkins_instance_type = "t2.medium"
# terraform_instance_type = "t2.micro"
# sonarqube_instance_type = "t2.medium"
# nexus_instance_type = "t2.medium"



aws_instance = {
    jenkins = {
        # instance_name     = ""
        user_data         = file("${path.module}/scripts/jenkins-install.sh")
    }
    nexus = {
        # instance_name     = ""
        user_data         = file("${path.module}/scripts/nexus-install.sh")
    }
    sonarqube = {
        # instance_name     = ""
        user_data         = file("${path.module}/scripts/sonarqube-install.sh")
    }
    host_machine = {
        # instance_name     = ""
        user_data         = file("${path.module}/scripts/terraform-install.sh")
    }
}

common_values = {
    ami_id            = "ami-04b4f1a9cf54c11d0"
    instance_type     = "t2.medium"
    key_pair_name     = "devops"
    volume_size       = "20"
    volume_type       = "gp2"
}

tags = {
    environment = "dev"
}