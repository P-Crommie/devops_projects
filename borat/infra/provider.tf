terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "proj-tfstate"
    key            = "borat/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform"
  }
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      owner     = "crommie"
      project   = "BORAT"
      terraform = "true"
      env       = "dev"
    }
  }
}
