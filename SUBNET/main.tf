resource "aws_subnet" "subnet" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.cidr_block_subnet}"
  map_public_ip_on_launch = "${var.subnet_ip_publico}" # SUBNET COM IP PUBLICO

  tags = {
    Name = "${var.tags_subnet}"
  }
}
