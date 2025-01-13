terraform {
  required_version = "~> 1.10.0"

  backend "s3" {
    bucket         = aws_s3_bucket.terraform_state.bucket
    region         = "us-east-1"
    key            = "eks/terraform.tfstate"
    dynamodb_table = aws_dynamodb_table.terraform_state_lock.name
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
