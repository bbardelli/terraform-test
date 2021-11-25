module "application" {
  source  = "app.terraform.io/company-foobar/application/aws"
  version = "0.0.1"
  ami_name = "packer-linux-aws-tomcat-app"
}