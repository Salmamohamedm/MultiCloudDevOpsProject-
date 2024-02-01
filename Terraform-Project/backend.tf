resource "aws_s3_bucket" "example_bucket" {
  bucket = "project-state-bucket"  # Replace with your desired bucket name

  acl    = "private"  # Access Control List for the bucket (private, public-read, public-read-write, etc.)

  tags = {
    Name        = "ExampleBucket"
    Environment = "Production"
  }

  versioning {
    enabled = true
  }

terraform {
  backend "s3" {
    bucket         = "project-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    //dynamodb_table = "terraform-lock"
  }
}


