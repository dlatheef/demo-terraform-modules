resource "aws_vpc" "ladsoft-demo-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = { Name = var.vpc_name }
}