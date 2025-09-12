terraform {
  backend "s3" {
    bucket = "yoghesh.xyz"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
