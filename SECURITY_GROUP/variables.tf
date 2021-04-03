variable "ingress_to_port" {
  type    = "string"
  default = 22
}

variable "ingress_from_port" {
  type    = "string"
  default = 22
}

variable "ingress_cidr_blocks" {
  type    = "list"
  default = ["0.0.0.0/0"]
}

variable "ingress_to_port2" {
  type    = "string"
  default = 0
}

variable "ingress_from_port2" {
  type    = "string"
  default = 8
}

variable "ingress_cidr_blocks2" {
  type    = "list"
  default = ["0.0.0.0/0"]
}

variable "egress_to_port" {
  type    = "string"
  default = 0
}

variable "egress_from_port" {
  type    = "string"
  default = 0
}

variable "egress_cidr_blocks" {
  type    = "list"
  default = ["0.0.0.0/0"]
}

variable "vpc_id" {
  type = "string"
}

variable "name" {
  type = "string"
}

variable "description" {
  type = "string"
}

variable "tags" {
  type = "string"
}
