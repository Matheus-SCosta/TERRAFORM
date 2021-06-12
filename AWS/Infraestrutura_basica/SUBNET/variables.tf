variable "cidr_block_subnet" {}

variable "vpc_id" {
  type = "string"
}

variable "subnet_ip_publico" {
  default = "true" # SE A SUBNET TERÁ IP PUBLICO
}

variable "tags_subnet" {
  type    = "string"
  default = "Projeto_DW"
}
