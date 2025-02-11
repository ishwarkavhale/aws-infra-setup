module "aws_vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "aws_subnet" {
  source = "./modules/subnet"
  vpc_id = module.aws_vpc.vpc_id
  vpc_subnet = var.vpc_subnet
}

module "security_group" {
  source = "./modules/security_group"
  sg_name = var.sg_name
  vpc_id = module.aws_vpc.vpc_id
  # ingress_rules = var.sg_ingress_rules
  # egress_rules = var.sg_egress_rules
}

#Local

locals = {
  common_values = {
    subnet_id = module.aws_subnet.pubs1_id
    vpc_security_group_ids = module.aws_security_group.security_group_id
  }
}

# EC2 Instances using the module
module "aws_instance" {
  source = "./modules/ec2_instance"
  
  common_values = merge(var.common_values, local.common_values)  # Pass the common_values object
  aws_instance  = var.aws_instance   # Pass the map of instances
}


