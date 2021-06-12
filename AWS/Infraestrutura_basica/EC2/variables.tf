variable "instance_type" {
  type    = "string"
  default = "t2.micro"
}

variable "key" {
  type    = "string"
  default = "teste"
}

variable "tags" {
  type    = "string"
  default = "ProjetoDW"
}

variable "ami" {
  type = "string"
}

variable "subnet_id" {
  type        = "string"
  description = "subnet_que_tem"
}

variable "security_group" {
  type = "list"
}

variable "delete_on_termination" {
  type    = "string"
  default = "true"
}

variable "volume_size" {
  type = "string"
}

variable "volume_type" {
  type    = "string"
  default = "gp2"
}
