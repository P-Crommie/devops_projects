module "nodes" {
  source                     = "./modules/compute"
  ec2_ami                    = var.ec2_ami
  project_path               = var.project_path
  ec2_type                   = var.ec2_type
  project                    = var.project
  key_name                   = var.key_name
  user_home_directory        = var.user_home_directory
  availability_zones         = var.availability_zones
  nodes_subnet               = module.network_infra.nodes_subnet
  vpc_id                     = module.network_infra.vpc_id
  http_security_group        = module.network_infra.http_security_group
  ssh_security_group         = module.network_infra.ssh_security_group
  vpc_traffic_security_group = module.network_infra.vpc_traffic_security_group
  go_outside_security_group  = module.network_infra.go_outside_security_group
}


module "network_infra" {
  source             = "./modules/network"
  project            = var.project
  availability_zones = var.availability_zones
  subnet_cidr_bits   = var.subnet_cidr_bits
  ssh_allowed_cidr   = var.ssh_allowed_cidr
  vpc_cidr           = var.vpc_cidr
  counter            = var.counter
}
