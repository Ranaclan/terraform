#cloud provider name and region
provider "aws" {
  region = var.app_region
}

#security group
resource "aws_security_group" "allow-22-3000-80" {
  name = "allow-22-3000-80"

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow-22-from-local" {
  security_group_id = aws_security_group.allow-22-3000-80.id
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow-3000" {
  security_group_id = aws_security_group.allow-22-3000-80.id
  from_port = 3000
  to_port = 3000
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow-80" {
  security_group_id = aws_security_group.allow-22-3000-80.id
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow-egress" {
  security_group_id = aws_security_group.allow-22-3000-80.id
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}

#key
resource "aws_key_pair" "public_key" {
  key_name = "tech504-kieron-public-key"
  public_key = file(var.key_location)
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