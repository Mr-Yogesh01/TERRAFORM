resource "aws_instance" "name" {
    ami = "ami-00ca32bbc84273381"
    instance_type = "t2.micro"
    subnet_id = "subnet-0172a31958b4b1358"
    for_each = toset(var.ec2)
    #count = length(var.ec2)
    tags = {
      Name = each.value
    }
  
}

variable "ec2" {
    type = list(string)
    default = ["prod"]
  
}