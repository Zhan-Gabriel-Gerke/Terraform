terraform {
  backend "s3" {
    bucket = "some-cool-s3-for-tests"
    key    = "project/terraform.tfstate"
    region = "eu-north-1"
  }
}

module "my_ec2" {
  source = "./modules/ec2"
}

module "my_s3" {
  source = "./modules/s3"
}