terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"
}

# Fetch subnet by tag
data "aws_subnet" "name" {
  filter {
    name   = "tag:Name"
    values = ["new"]
  }
}

# EC2 Instance
resource "aws_instance" "name" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.name.id
  tags = {
    Name ="YOGIRAJ"
  }
}
