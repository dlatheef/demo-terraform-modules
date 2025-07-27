#variable "access_key" {
 # type = string
#}
#variable "secret_key" {
#  type = string
#}
variable "region" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "public_sub_cidrs" {
  type = list(string)
}
variable "private_sub_cidrs" {
  # var.private_sub_cidrs
  type = list(string)

}
variable "igw_name" {
  type = string
}

variable "public_route" {
  type = string
}

variable "environment" {
 type = string 
}
variable "project" {
 type = string 
}

variable "owner" {
  type = string
}
####### launch template variables
variable "launch_template_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

# variable "security_group_ids" {
#   type = list(string)
# }

variable "root_volume_size" {
  type    = number
 }

variable "tags" {
  type    = map(string)
  default = {}
}

