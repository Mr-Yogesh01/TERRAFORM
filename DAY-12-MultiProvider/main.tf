terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Default provider (us-east-1)
provider "aws" {
  region = "us-east-1"
}

# Second provider with alias (us-west-2)
provider "aws" {
  region = "us-west-2"
  alias  = "india"
}

# VPC in us-west-2 (using aliased provider)
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.india
}

# S3 bucket in us-east-1 (default provider)
resource "aws_s3_bucket" "name" {
  bucket   = "xcdvfbgrfdff"   # must be globally unique
  provider = aws
}
