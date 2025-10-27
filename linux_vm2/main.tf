provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "linux-vm2" {
    ami             = "ami-093c36cac516bd92d"
    instance_type   = "t4g.micro"
    key_name        = "terraform_keypair"
    security_groups = ["default"]
    tags = {
        Name = "Terraform_Linux_VM2"
    }
}