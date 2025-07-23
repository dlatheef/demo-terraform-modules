resource "aws_eip" "ladsoft-vpc-eip" {
    domain = "vpc"
tags = { Name = "adsoft-vpc-eip"}
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.ladsoft-vpc-eip.id ### working one 
  #allocation_id = [aws_eip.nat[0].id]  # just one EIP
 # allocation_id = [aws_eip.ladsoft-vpc-eip.id[0].id]  # just one EIP
  count = length(var.public_subnet_ids)
  subnet_id     = var.public_subnet_ids[0]
  tags = {
    Name = "ladsoft-vpc-NAT"
  }
}