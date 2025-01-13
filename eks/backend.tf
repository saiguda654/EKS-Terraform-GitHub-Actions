terraform {
  backend "s3" {
    bucket         = "saiguda654-backend-1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}
