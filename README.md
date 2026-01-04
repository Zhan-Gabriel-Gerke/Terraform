# Terraform Learning Repository

This repository contains a set of educational Terraform configurations to demonstrate various concepts and best practices.

## Directory Structure

The repository consists of several folders, each being a separate, isolated example of a Terraform configuration.

- `02/`, `ec2-vars/`, `linux_vm2/`, `s3bucket/`, `telusko_course/`, `web_server/`: These are simple, single-purpose examples demonstrating basic concepts like creating EC2 instances, working with variables, creating S3 buckets, and using `user_data` scripts.

- `project/`: **This is the main, most comprehensive project in the repository.** It combines many best practices and demonstrates a more structured approach to infrastructure management.

---

## Main Project: `project/`

This directory is a complete Terraform project that provisions a web server on EC2 and an S3 bucket, using a modular and secure approach.

### Key Project Features

1.  **Modular Structure (`modules/`)**
    - Instead of keeping all the configuration in one large file, the project is broken down into logical, reusable components:
      - `modules/ec2`: All the logic for creating the virtual server (EC2), including its security group (firewall) and startup script.
      - `modules/s3`: The logic for creating the S3 bucket.
    - This approach makes the code cleaner, more readable, and easier to scale.

2.  **Dynamic AMI Discovery**
    - The project doesn't use a hard-coded system image ID (`ami-id`). Instead, it automatically finds the latest **Ubuntu 22.04 (ARM)** image using `data "aws_ami"`, which makes the configuration more flexible and up-to-date.

3.  **Remote Backend for State Management**
    - The `main.tf` file is configured with a `backend "s3"`. This means the Terraform state file (`.tfstate`), which keeps track of created resources, is stored centrally in an S3 bucket. This is critical for teamwork, allowing multiple people to safely work on the same infrastructure.

4.  **Security**
    - Instead of opening access to the whole world (`0.0.0.0/0`), the project creates a specific security group (`aws_security_group`) that allows SSH and HTTP access only from your IP address.

5.  **Automatic Server Configuration (`user_data`)**
    - On the server's first boot, a script is automatically executed to install and run an Apache web server, as well as create a simple HTML page.

### How to Run the Project

**Prerequisites:**
1.  Create an S3 bucket in AWS to store the state file.
2.  Replace `"your-terraform-state-bucket-name-goes-here"` in the `project/main.tf` file with the name of the bucket you created.
3.  Ensure you have an AWS Key Pair named `terraform` in the `eu-north-1` region.

**Execution:**
1.  Navigate to the project directory:
    ```sh
    cd c:\Users\zange\Documents\Terraform\project
    ```
2.  Initialize Terraform (this will download providers and configure the backend):
    ```sh
    terraform init
    ```
3.  Check what changes Terraform is going to make:
    ```sh
    terraform plan
    ```
4.  Apply the configuration to create the resources in AWS:
    ```sh
    terraform apply
    ```
