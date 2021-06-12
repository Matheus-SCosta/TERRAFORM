provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::##########:role/TerraformRole" 
    session_name = "terraform"
  }

}

terraform {
  backend "s3" {
    bucket         = "terraform-state-backend-new"
    key            = "ambiente-lab.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform"
    role_arn = "arn:aws:iam::##########:role/TerraformRole" 
  }
}

// Recursos são chamados logo abaixo

resource "aws_route53_zone" "ambiente_lab" {
  name = "ambiente.lab"
  comment = "Novo dns para o ambiente de lab"

  vpc {
    vpc_id = data.aws_vpc.selected.id
  }
}


resource "aws_route53_record" "dbesp" {
  name    = "dbesp.ambiente.lab"
  type    = "A"
  ttl     = "300"
  zone_id = aws_route53_zone.ambiente_lab.zone_id
  records = ["10.10.3.99"]
  depends_on = [
    aws_route53_zone.ambiente_lab
  ]
}

resource "aws_route53_record" "dbhml" {
  name    = "dbhml.ambiente.lab"
  type    = "A"
  ttl     = "300"
  zone_id = aws_route53_zone.ambiente_lab.zone_id
  records = ["10.10.3.10"]
  depends_on = [
    aws_route53_zone.ambiente_lab
  ]
}

resource "aws_route53_record" "dbm" {
  name    = "dbm.ambiente.lab"
  type    = "A"
  ttl     = "300"
  zone_id = aws_route53_zone.ambiente_lab.zone_id
  records = ["10.10.3.57"]
  depends_on = [
    aws_route53_zone.ambiente_lab
  ]
}

resource "aws_route53_record" "dbtst" {
  name    = "dbtst.ambiente.lab"
  type    = "A"
  ttl     = "300"
  zone_id = aws_route53_zone.ambiente_lab.zone_id
  records = ["10.10.5.23"]
  depends_on = [
    aws_route53_zone.ambiente_lab
  ]
}

resource "aws_route53_record" "poc" {
  name    = "poc.ambiente.lab"
  type    = "A"
  ttl     = "300"
  zone_id = aws_route53_zone.ambiente_lab.zone_id
  records = ["172.16.0.7"]
  depends_on = [
    aws_route53_zone.ambiente_lab
  ]
}

