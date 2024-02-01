variable "vpc_id" {
  description = "ID of the VPC"
}

variable "security_group_id" {
  description = "ID of the security group"
}

variable "subnet_id" {
  description = "ID of the subnet"
}

variable "route_table_id" {
  description = "ID of the route table"
}

variable "instance_count" {
  description = "Number of EC2 instances"
  default     = 1
}
