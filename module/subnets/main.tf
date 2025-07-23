data "aws_availability_zones" "az" {}
resource "aws_subnet" "ladsoft-vpc-pub_subnets" {
   count = length(var.public_sub_cidrs)
   vpc_id   = var.vpc_id
   cidr_block = var.public_sub_cidrs[count.index]
   availability_zone = element(data.aws_availability_zones.az.names,count.index)
   map_public_ip_on_launch = true
   tags = {
     Name = "ladsoft-vpc-pub_subnet-${count.index + 1}"
   }
}

resource "aws_subnet" "ladsoft-vpc-pvt_subnets" {
   count = length(var.private_sub_cidrs)
   #var.private_sub_cidrs
   vpc_id   = var.vpc_id
   cidr_block = var.private_sub_cidrs [count.index ]
   availability_zone = element(data.aws_availability_zones.az.names,count.index)
      tags = {
     Name = "ladsoft-vpc-pvt_subnet-${count.index + 1}"
   }
}