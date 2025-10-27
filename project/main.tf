module "my_ec2" {
  source = "./moduls/ec2"

  ami = "ami-0aa78f446b4499266"
}

module "my_s3" {
  source = "./moduls/s3"
}