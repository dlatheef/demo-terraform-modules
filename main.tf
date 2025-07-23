module "ladsoft-demo-vpc" {
  source   = "./module/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name

}

module "ladsoft-vpc-subnets" {
  source            = "./module/subnets"
  public_sub_cidrs  = var.public_sub_cidrs
  private_sub_cidrs = var.private_sub_cidrs
  vpc_id            = module.ladsoft-demo-vpc.vpc_id
}

module "ladsoft-igw" {
  source   = "./module/igw"
  vpc_id   = module.ladsoft-demo-vpc.vpc_id
  igw_name = var.igw_name
}

 module "nat" {
     source = "./module/nat"
     #ublic_subnet_ids = aws_subnet.ladsoft-vpc-pub_subnets[*].id
     #public_subnet_ids = module.ladsoft-vpc-subnets.ladsoft-vpc-public-subnet
     public_subnet_ids = [module.ladsoft-vpc-subnets.ladsoft-vpc-public-subnet[0]]

      }
module "ladsoft-vpc-route-tables" {
  source = "./module/route-tables"
  vpc_id = module.ladsoft-demo-vpc.vpc_id
  igw_id = module.ladsoft-igw.igw_id
  # public_route = module.ladsoft-vpc-route-tables.public_route_table_id
  #public_route = "0.0.0.0/0"
  public_route = var.public_route
}

# module "ladsoft-vpc-route-tables" {
#   source = "./module/route-tables"
#   vpc_id = module.ladsoft-demo-vpc.vpc_id
# #  igw_id = module.ladsoft-igw.igw_id
#   # public_route = module.ladsoft-vpc-route-tables.public_route_table_id
#   #public_route = "0.0.0.0/0"
#  # public_route = var.public_route
# }


module "subnet_associations" {
  source = "./module/subnet-associan"
  public_sub_cidrs         = module.ladsoft-vpc-subnets.ladsoft-vpc-public-subnet
  private_sub_cidrs        = module.ladsoft-vpc-subnets.ladsoft-vpc-private-subnet
  public_route_table_id    = module.ladsoft-vpc-route-tables.ladsoft-vpc-public_route
  private_route_table_id   = module.ladsoft-vpc-route-tables.ladsoft-vpc-private_route
}

module "Ladsoft_vpc_security_group" {
  source      = "./module/sg"
  vpc_id      = module.ladsoft-demo-vpc.vpc_id
  environment = var.environment
  project     = var.project
  owner       = var.owner
}

module "launch_template" {
  source = "./module/launch_template"

  launch_template_name = var.launch_template_name
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_group_ids   = [ module.Ladsoft_vpc_security_group.allow_all_sg_id ]
  #user_data_base64     = base64encode(file("user_data.sh")) # optional
  root_volume_size     = var.root_volume_size
  tags                 = var.tags
}
