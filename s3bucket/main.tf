provider "aws" {
    region = "eu-north-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "s3bucketfortest1111864"
}