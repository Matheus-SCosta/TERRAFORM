resource "aws_route_table" "tableroute" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "${var.cidr_block_route_table}"
    gateway_id = "${var.igw_id}"
  }

  tags = {
    Name = "${var.tags_table_route}"
  }
}
