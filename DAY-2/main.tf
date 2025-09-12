resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "name" {
vpc_id = aws_vpc.name.id
cidr_block = "10.0.0.0/24"
}
resource "aws_instance" "dev" {
    ami = "ami-0b09ffb6d8b58ca91"
    instance_type = "t2.medium"
    tags = {
      Name = "ec2test"
    }
  
}
