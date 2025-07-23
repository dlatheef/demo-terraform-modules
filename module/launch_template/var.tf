variable "launch_template_name" {
  type        = string
}

variable "ami_id" {
    type        = string
}

variable "instance_type" {
    type        = string
}

variable "key_name" {
   type        = string
}

variable "security_group_ids" {
    type        = list(string)
}

variable "user_data_base64" {
  
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "Root volume size (in GB)"
  type        = number
  default     = 20
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
