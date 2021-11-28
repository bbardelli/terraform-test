provider "aws" {
  region = var.region
  
}

resource "aws_default_vpc" "default" {
  region = var.region
  tags = {
    Name = "Default VPC"
  }
}

module "application" {
  source  = "app.terraform.io/company-foobar/application/aws"
  version = "~> 0.0.2"
  ami_name = "packer-linux-aws-python-app"
  region = var.region
  vpc_id = aws_default_vpc.default.id
}