# AWS Infrastructure as Code with Terraform ☁️🛠️

This repository serves as a personal sandbox for designing and deploying cloud infrastructure on **AWS** using **Infrastructure as Code (IaC)** principles and **Terraform**. 

The project demonstrates a transition from basic resource provisioning to a scalable, modular architecture.

## 🚀 Key Features

* **Automated Web Server Deployment**: Provisioning EC2 instances with automated Apache (`httpd`) installation and configuration via `user_data` scripts.
* **Modular Architecture**: Separation of concerns by using independent modules for EC2 and S3, ensuring code reusability and maintainability.
* **Cloud Storage Management**: Provisioning S3 buckets with private ACLs and versioning enabled for data security and integrity.
* **Network Security**: Implementation of AWS Security Groups to manage inbound traffic for SSH (Port 22) and HTTP (Port 80).
* **Dynamic Configuration**: Extensive use of input variables (`vars.tf`) and output values (`outputs.tf`) for flexible infrastructure management.

## 🏗️ Tech Stack

* **Cloud Provider**: AWS (Region: `eu-north-1`).
* **IaC Tool**: Terraform (~> 3.0).
* **OS/Environment**: Amazon Linux, Ubuntu.
* **Automation**: Bash scripting.

## 📁 Project Structure

* `/project`: Main modular configuration using a clean directory structure.
    * `/modules/ec2`: Logic for compute resource management.
    * `/modules/s3`: Logic for cloud storage management.
* `/web_server`: Standalone configuration for an automated web server deployment.
* `/ec2-vars`: Examples of parameterization using Terraform variables.

## ⚙️ Usage

1. Install [Terraform](https://www.terraform.io/downloads.html).
2. Configure your AWS credentials (`aws configure`).
3. Navigate to a project directory (e.g., `/project`).
4. Initialize the workspace:
   ```bash
   terraform init
   ```
5. Review the execution plan:
   ```bash
   terraform plan
   ```
6. Deploy the infrastructure:
   ```bash
   terraform apply
   ```

## 🛡️ Security Best Practices
This repository follows essential security guidelines:

**Secret Management**: Sensitive files such as `.pem` keys and Terraform state files (`.tfstate`) are strictly excluded from version control via `.gitignore`.

**Least Privilege**: S3 buckets are configured as private by default.
