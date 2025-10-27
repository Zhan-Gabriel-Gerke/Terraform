resource "aws_instance" "linux_vm_var" {
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "terraform_keypair"
  security_groups = ["default"]
  tags = {
    Name = "Web_SRV_Terraform"
  }
}