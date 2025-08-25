provider "aws" {

  
}

resource "aws_instance" "name" {
  ami =  "ami-0efdf839508ec2995"
  instance_type = "t2.micro"
  tags = {
    Name ="Ec2"
  }
  
lifecycle {
  prevent_destroy =true
  create_before_destroy =false
  ignore_changes = [ tags ]
  
}
}