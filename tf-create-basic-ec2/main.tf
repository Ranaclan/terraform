#cloud provider name and region
provider "aws" {
  region = var.app_region
}

#security group
resource "aws_security_group" "allow-22-3000-80" {
  name = "allow-22-3000-80"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["127.0.0.0/8"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "tech504-kieron-tf-allow-port-22-3000-80"
  }
}

#key
resource "aws_key_pair" "public_key" {
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK6HOtOrLecOKzFnGBgZvggmjdojhMRddqPu7Smz3Dyw kiero@Kieron"
}

#ec2 instance
resource "aws_instance" "app_instance" {
    ami = var.app_ami_id
    instance_type = var.app_instance_type
    associate_public_ip_address = var.app_public_ip
    vpc_security_group_ids = [aws_security_group.allow-22-3000-80.id]
    key_name = aws_key_pair.public_key.key_name
    tags = {
        Name = var.app_name
    }
}