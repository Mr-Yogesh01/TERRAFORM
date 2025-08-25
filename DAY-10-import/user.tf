provider "aws" {
  region = "us-east-1"
}

# IAM User
resource "aws_iam_user" "demo_user" {
  name = "my-user"
}

# IAM Role
resource "aws_iam_role" "demo_role" {
  name = "my-demo-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach Role to User (via inline policy)
resource "aws_iam_user_policy_attachment" "user_attach" {
  user       = aws_iam_user.demo_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
