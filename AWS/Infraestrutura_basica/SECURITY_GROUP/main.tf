resource "aws_security_group" "module_security_group" {
  name        = "${var.name}"        # ATRIBUIÇÃO NO MÓDULO
  description = "${var.description}" # ATRIBUIÇÃO NO MÓDULO
  vpc_id      = "${var.vpc_id}"

  ingress {
    description = "TLS from VPC"
    from_port   = "${var.ingress_from_port}"
    to_port     = "${var.ingress_to_port}"
    protocol    = "tcp"
    cidr_blocks = "${var.ingress_cidr_blocks}"
  }

  ingress {
    description = "PING"
    from_port   = "${var.ingress_from_port2}"
    to_port     = "${var.ingress_to_port2}"
    protocol    = "icmp"
    cidr_blocks = "${var.ingress_cidr_blocks2}"
  }

  egress {
    from_port   = "${var.egress_from_port}"
    to_port     = "${var.egress_to_port}"
    protocol    = "-1"
    cidr_blocks = "${var.egress_cidr_blocks}"
  }

  tags = {
    Name = "${var.tags}" # ATRIBUIÇÃO NO MÓDULO
  }
}
