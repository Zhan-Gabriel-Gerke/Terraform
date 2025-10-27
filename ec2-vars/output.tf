output "ec2_vm_public_ip" {
    value = aws_instance.linux_vm_var.public_ip
}