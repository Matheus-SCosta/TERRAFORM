variable "region" {
  default = "us-east-1"
}

variable "access_key" {
  default = "AKIAWG7GU6VTWMUNE22F"
}

variable "secret_key" {
  default = "N77szo1UyGu9ROn2PUc1ApQ4EwPt49g93+9mNpnm"
}

variable "name_security_group" {
  type    = "string"
  default = "ProjetoDW"
}

variable "description" {
  type    = "string"
  default = "ProjetoDW"
}

variable "tags_security_group" {
  type    = "string"
  default = "ProjetoDW"
}

variable "vpc_id" {
  type    = "string"
  default = "vpc-09f05ac4cbbc974e4"
}

variable "subnet_id" {
  type    = "string"
  default = "subnet-0ed6ec58a9db62c95"
}

variable "igw_id" {
  type    = "string"
  default = "igw-00ad34fa388b1d93f"
}

variable "tableroute_id" {
  type    = "string"
  default = "rtb-0534549d5c85c3651"
}

variable "cidr_block_subnet" {
  type    = "string"
  default = "10.0.0.0/24"
}

variable "cidr_block_vpc" {
  type    = "string"
  default = "10.0.0.0/16"
}

variable "ami" {
  type    = "string"
  default = "ami-038f1ca1bd58a5790"
}

variable "security_group_id" {
  type    = "list"
  default = ["sg-09a188f3870b8cd47"]
}

variable "volume_size" {
  type    = "string"
  default = 8
}
