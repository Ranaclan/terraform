#create ec2 instance
#cloud provider name and region
provider "aws" {
  region = "eu-west-1"
}
#resource config
resource "aws_instance" "app_instance" {
    ami = "ami-0c1c30571d2dae5c9"
    instance_type = "t3.micro"
    associate_public_ip_address = true
    tags = {
        Name = "tech504-kieron-tf-test-app"
    }
}