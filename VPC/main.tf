resource "aws_vpc" "vpc" {
  cidr_block       = "${var.cidr_block_vpc}" # ATRIBUIR NO MÓDULO
  instance_tenancy = "default"

  tags = {
    Name = "${var.tags_vpc}"
  }
}
