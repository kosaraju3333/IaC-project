terraform {
  backend "s3" {
    bucket = "terraform-spontansolutions"
    key    = "IaC-Project/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-remote-backend"
  }
}