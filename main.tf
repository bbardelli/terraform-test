module "application" {
  source  = "app.terraform.io/company-foobar/application/aws"
  version = "0.0.2"
  ami_name = "packer-linux-aws-tomcat-app"
  region = var.region
}