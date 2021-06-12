provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "module_vpc" {
  source         = "./VPC"
  cidr_block_vpc = "${var.cidr_block_vpc}"
}

module "module_subnet" {
  source            = "./SUBNET"
  vpc_id            = "${var.vpc_id}"
  cidr_block_subnet = "${var.cidr_block_subnet}"
}

module "module_igw" {
  source = "./IGW"
  vpc_id = "${var.vpc_id}"
}

module "module_table_route" {
  source = "./TABLE_ROUTE"
  vpc_id = "${var.vpc_id}"
  igw_id = "${var.igw_id}"
}

module "association_subnet_route_table" {
  source        = "./ASSOCIATION_SUBNET_TABLEROUTE"
  subnet_id     = "${var.subnet_id}"
  tableroute_id = "${var.tableroute_id}"
}

module "module_security_group" {
  source      = "./SECURITY_GROUP"
  name        = "${var.name_security_group}"
  vpc_id      = "${var.vpc_id}"
  description = "${var.description}"
  tags        = "${var.tags_security_group}"
}

module "module_ec2" {
  source         = "./EC2"
  ami            = "${var.ami}"
  subnet_id      = "${var.subnet_id}"
  security_group = "${var.security_group_id}"
  volume_size    = "${var.volume_size}"
}
