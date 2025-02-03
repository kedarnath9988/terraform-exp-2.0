terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  backend "s3" {
    bucket = "daws78-kedarnath-remote-bucket"
    key    = "dynamic-loop"
    region = "us-east-1"
    dynamodb_table  = "daws78s-locking"
  }
}

provider "aws" {

}