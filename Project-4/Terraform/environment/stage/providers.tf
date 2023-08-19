terraform {
  #   required_version = "~> 1.1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.1"
    }
  }
  # backend "s3" {
  #   bucket = "s3-backend-alpha-007"
  #   key    = "stage/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

provider "aws" {
  region = var.region
}
