variable "igw_id" {
  type = "string"
}

variable "cidr_block_route_table" {
  default = "0.0.0.0/0" # BLOCO TABELA DE ROTEAMENTO
}

variable "vpc_id" {
  type = "string"
}

variable "tags_table_route" {
  type    = "string"
  default = "ProjetoDW"
}
