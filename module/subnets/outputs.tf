output "ladsoft-vpc-public-subnet" {
  value = aws_subnet.ladsoft-vpc-pub_subnets[*].id
}

output "ladsoft-vpc-private-subnet" {
  value = aws_subnet.ladsoft-vpc-pvt_subnets[*].id
}