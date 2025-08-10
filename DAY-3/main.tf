provider "aws" {
  
}

resource "aws_instance" "dev" {
    ami = "ami-0efdf839508ec2995"
    instance_type = "t2.medium"
    
    tags = {
      Name = "YOGI"
    }

  
}