#### Single Region Provider Block #####
# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.83.0"
    }
  }
}


#### Single Region Provider Block #####
provider "aws" {
    region = var.region
}