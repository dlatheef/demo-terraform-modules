resource "aws_route_table" "ladsoft-vpc-pub-rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.public_route  
    gateway_id = var.igw_id         
  }

  tags = {
    Name = "ladsoft-vpc-public-rt"
  }
}

resource "aws_route_table" "ladsoft-vpc-pvt-rt" {
 vpc_id = var.vpc_id
  tags = {
   Name = "ladsoft-vpc-pvt-rt"
 }
}
