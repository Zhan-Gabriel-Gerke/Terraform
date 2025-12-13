output "instance_public_ip" {
    description = "public ip of instance"

    value       = aws_instance.linux_vm_var.public_ip
}