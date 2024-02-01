
terraform {
  backend "s3" {
    bucket         = "project-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    //dynamodb_table = "terraform-lock"
  }
}


