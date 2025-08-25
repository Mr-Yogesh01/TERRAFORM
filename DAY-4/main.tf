resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name ="VPC"
  }
}

resource "aws_instance" "dev" {
    ami = "ami-0efdf839508ec2995"
    instance_type = "t2.medium"
    
    tags = {
      Name = "S3"
    }

  
}