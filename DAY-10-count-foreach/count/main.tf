resource "aws_instance" "name" {
    ami = "ami-00ca32bbc84273381"
    instance_type = "t2.micro"
    subnet_id = "subnet-0172a31958b4b1358"
    count = length(var.ec2)
    tags = {
      Name = var.ec2[count.index]
    }
  
}

variable "ec2" {
    type = list(string)
    default = [ "dev","prod"]
  
}