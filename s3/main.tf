provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "duc-bucket-s3"

  tags = {
    Name        = "duc-bucket-s3"
  }
}