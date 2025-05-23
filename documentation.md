# [Terraform](#terraform)
- [Terraform](#terraform)
- [Installation/setup](#installationsetup)
- [Infrastructure as Code](#infrastructure-as-code)
  - [Terraform](#terraform-1)
- [AWS Syntax](#aws-syntax)
  - [Create EC2 Instance](#create-ec2-instance)
  - [Create Security Group](#create-security-group)
    - [CIDR Blocks](#cidr-blocks)
  - [Create Key Pair](#create-key-pair)
- [Variables](#variables)
  - [Using a variable](#using-a-variable)
  - [Git Ignore](#git-ignore)

# Installation/setup
1. Download terraform: https://developer.hashicorp.com/terraform/install
2. Move terraform.exe to 'C:\terraform'
3. Add this location to the PATH environment variable
4. Add HashiCorp's Terraform extension for VSCode https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform

# Infrastructure as Code
Two types:
* Orchestration: Managing infrastructure (Terraform, CloudFormation (AWS), ARM/Bicep templates (Azure), ~Ansible)
* Cofiguration management: Installing and configuring software (Ansible, Chef, Puppet)

## Terraform
* IaC orchestration tool
* Sees infrastructure as immutable
* Uses Hashicorp Configuration Language, declarative
* Cloud agnostic, uses providers which act as interface with cloud's API

# AWS Syntax
## Create EC2 Instance
```
resource "aws_instance" [instance identifier] {
    ami = [instance image]
    instance_type = [instance type]
    associate_public_ip_address = [whether to add public IP]
    vpc_security_group_ids = [list of security group IDs]
    key_name = [public SSH key]
    tags = {
        Name = [instance name]
    }
}
```
## Create Security Group
```
resource "aws_security_group" [security group identifier] {
  name = [security group identifier]
  
  tags = {
    Name = [security group name]
  }
}

resource "aws_vpc_security_group_ingress_rule" [ingress rule name] {
  security_group_id = [security group identifier]
  from_port = [start of port range]
  to_port = [end of port range]
  ip_protocol = [protocol]
  cidr_ipv4 = [cidr blocks]
}

[other ingress/egress rules...]
  
```
### CIDR Blocks
* Anywhere: 0.0.0.0/0
* Local host: 127.0.0.1/8

## Create Key Pair
```
resource "aws_key_pair" [key identifier] {
  public_key = [public key]
}
```

# Variables
Create a folder called variable.tf, then use the following syntax to create a variable:
```
variable [variable identifier] {
    default = [default value]
}
```
## Using a variable
In the main.tf file, access a variable with the following syntax:
```
[parameter] = var.[variable identifier]
```
## Git Ignore
Add variable.tf to the git ignore file to ensure not variable files are added to the git repo, improving security.