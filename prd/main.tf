terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "nqv-website-tfstate"
    region  = "ap-northeast-1"
    key     = "production.tfstate"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

module "nqv-website" {
  source = "../resources"
  env    = "prd"
}


