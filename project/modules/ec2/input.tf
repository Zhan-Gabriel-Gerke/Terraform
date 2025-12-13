variable "ami" {
        description = "Amazon Linux Image Info"
        type = string
        #default = "ami-0aa78f446b4499266"
}

variable "instance_type" {
    description = "Type of instance"
    default = "t3.micro"
}