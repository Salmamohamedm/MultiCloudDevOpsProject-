
variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for the public subnets"
 default     = ["10.0.1.0/24"]
}
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a"]
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

