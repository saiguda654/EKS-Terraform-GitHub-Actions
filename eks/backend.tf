terraform {
  required_version = "~> 1.10.0"
  
  backend "s3" {
    bucket         = "saiguda654-backend-1"       # Use the S3 bucket name from the apply step
    region         = "us-east-1"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "Lock-Files"               # Use the DynamoDB table name from the apply step
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
}

provider "aws" {
  region  = var.aws-region
}
