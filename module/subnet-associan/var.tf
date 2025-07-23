variable "public_sub_cidrs" {
  type = list(string)
}
variable "private_sub_cidrs" {
  type = list(string)
}

variable "public_route_table_id" {
  description = "ID of the public route table"
  type        = string
}

variable "private_route_table_id" {
  description = "ID of the private route table"
  type        = string
}
