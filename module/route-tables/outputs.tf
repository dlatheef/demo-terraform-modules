output "ladsoft-vpc-public_route" {
  value = aws_route_table.ladsoft-vpc-pub-rt.id
}

output "ladsoft-vpc-private_route" {
  value = aws_route_table.ladsoft-vpc-pvt-rt.id
}