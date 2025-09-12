resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "name" {
vpc_id = aws_vpc.name.id
cidr_block = "10.0.0.0/24"
}
resource "aws_instance" "dev" {
    ami = "ami-0efdf839508ec2995"
    instance_type = "t2.micro"
    tags = {
      Name = "ec2test"
    }
  
}