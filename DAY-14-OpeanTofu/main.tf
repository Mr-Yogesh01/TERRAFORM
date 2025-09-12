provider "aws" {
  
}

resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name ="RAJ"
  }
}

resource "aws_subnet" "Public-Sub" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name ="Public-subls"
  }
}

resource "aws_subnet" "Private-Sub" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name ="private-sub"
  }
}
