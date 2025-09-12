resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC"
  }
}
# resource "aws_instance" "name" {
#     ami = "ami-00ca32bbc84273381"
#     instance_type = "t2.micro"
#     tags = {
#       Name = "ec2"
#     }
  
# }