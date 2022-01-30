resource "aws_instance" "intance" {
  ami                  = var.inst_ami
  instance_type        = var.inst_type
  iam_instance_profile = var.instance_role
  subnet_id            = var.inst_subnet
  security_groups      = var.security_groups

  tags = {
    Name = var.inst_name
  }

  root_block_device  {
    delete_on_termination = var.delete_on_termination
    tags                  = var.tags_root_disk
    volume_size           = var.volume_size
    volume_type           = var.volume_type
  }
}
