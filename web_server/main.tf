provider "aws" {
    region = "eu-north-1"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "WEB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress{
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "linux_vm" {
  ami             = "ami-0aa78f446b4499266"
  instance_type   = "t3.micro"
  key_name        = "terraform_keypair"
  #security_groups = [aws_security_group.allow_ssh.id]
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  user_data       = file("installHttpd.sh")
  tags = {
    Name = "Web_SRV_Terraform"
  }
}