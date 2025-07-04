terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }

  # To use S3 remote backend instead:
  # backend "s3" {
  #   bucket         = "your-remote-state-bucket"
  #   key            = "practice/terraform.tfstate"
  #   region         = "ap-southeast-2"
  #   dynamodb_table = "your-lock-table"
  # }
}

provider "aws" {
  region  = var.region
  # profile = "default"  # Change to your AWS CLI profile if needed 
  # ^^ THIS ONLY WORKS FOR RUNNING LOCALLY!!
}
