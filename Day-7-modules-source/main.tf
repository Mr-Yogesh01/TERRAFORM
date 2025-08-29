resource "aws_instance" "name" {
    ami = "ami-00ca32bbc84273381"
    instance_type = var.instance-type
    availability_zone = var.zone
    tags = {
      Name = var.name
    }
  
}
