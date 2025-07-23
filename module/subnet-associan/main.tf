resource "aws_route_table_association" "public" {
  count          = length(var.public_sub_cidrs)
  subnet_id      = var.public_sub_cidrs[count.index]
  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_sub_cidrs)
  subnet_id      = var.private_sub_cidrs[count.index]
  route_table_id = var.private_route_table_id
}