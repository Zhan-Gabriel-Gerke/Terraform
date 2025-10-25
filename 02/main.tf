terraform{
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "example" {
  ami           = "ami-093c36cac516bd92d"
  instance_type = "t4g.micro"
}