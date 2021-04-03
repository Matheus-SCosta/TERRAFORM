resource "aws_instance" "ec2_modulo" {
  ami                    = "${var.ami}"            # ATRIBUIR NO MÓDULO
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key}"
  subnet_id              = "${var.subnet_id}"      # ATRIBUIR NO MÓDULO
  vpc_security_group_ids = "${var.security_group}" # ATRIBUIR NO MÓDULO

  root_block_device {
    volume_size           = "${var.volume_size}"           # ATRIBUIR NO MÓDULO
    volume_type           = "${var.volume_type}"
    delete_on_termination = "${var.delete_on_termination}"
  }
  user_data = "${file("/home/local/CONDUCTOR/m.costa/Documentos/VisualStudioCode/terraform/projetoDW/Modulos/EC2/script.sh")}"

  tags = {
    Name = "${var.tags}"
  }
}
