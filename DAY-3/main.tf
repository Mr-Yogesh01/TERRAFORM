provider "aws" { 
region ="us-east-1"
}


#data "aws_vpc" "my_vpc" {
 # cidr_block = "10.0.0.0/16"
#}

#data "aws_subnet" "my_subnet" {
 # vpc_id     = aws_vpc.my_vpc.id
  #cidr_block = "10.0.0.0/24"
#}



resource "aws_instance" "my_ec2" {
  ami                    = "ami-0b09ffb6d8b58ca91"
  instance_type          = "t2.micro"
  #subnet_id              = aws_subnet.my_subnet.id
  key_name               = "yogi"
}

