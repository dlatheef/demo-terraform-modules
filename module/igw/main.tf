resource "aws_internet_gateway" "ladsoft-vpc-igw" {
  vpc_id = var.vpc_id
  tags = { Name = "var.igw_name"}
}