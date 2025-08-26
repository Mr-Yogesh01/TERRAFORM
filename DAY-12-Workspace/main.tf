# locals {
#   region        = "us-east-1"
#   instance_type = "t2.micro"
# }

# provider "aws" {
#   region = local.region
# }

# resource "aws_instance" "example" {
#   ami           = "ami-00ca32bbc84273381" # Replace with a valid AMI in your region
#   instance_type = local.instance_type

#   tags = {
#     Name = "MyEC2Instance"
#   }
# }






locals {
  region        = "us-east-1"
  instance_type = "t2.micro"
}

provider "aws" {
  region = local.region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-igw"
  }
}

# Create a subnet
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-subnet"
  }
}

# Create a route table
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my-rt"
  }
}

# Associate subnet with route table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_rt.id
}

# EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-00ca32bbc84273381" # Make sure this is valid in us-east-1
  instance_type = local.instance_type
  subnet_id     = aws_subnet.my_subnet.id


  tags = {
    Name = "MyEC2Instance"
  }
}
