terraform {
  backend "s3" {
    bucket = "yoghesh.xyz"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}