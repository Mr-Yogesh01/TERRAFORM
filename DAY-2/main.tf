resource "aws_instance" "dev" {
    ami = "ami-0efdf839508ec2995"
    instance_type = "t2.micro"
    tags = {
      Name = "ec2test"
    }
  
}