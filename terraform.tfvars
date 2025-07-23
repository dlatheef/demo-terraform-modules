vpc_name          = "ladsoft-module-vpc"
vpc_cidr          = "70.0.0.0/16"
region            = "ap-south-1"
public_sub_cidrs  = ["70.0.2.0/24", "70.0.3.0/24"]
private_sub_cidrs = ["70.0.4.0/24", "70.0.5.0/24"]
igw_name          = "ladsoft-vpc-igw"
public_route      = "0.0.0.0/0"
environment       = "Dev"
owner             = "Ladsoft"
project           =  "ursaminor"
launch_template_name = "ladsoft-app"
ami_id               = "ami-0f918f7e67a3323f0"
instance_type        = "t2.micro"
key_name             = "latheef-key"
root_volume_size = 20

# tags = {
#   Environment = "dev"
#   Project     = "ladsoft"
# }

