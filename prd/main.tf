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

provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

module "nqv-website" {
  source              = "../resources"
  env                 = "prd"
  acm_certificate_arn = module.nqv-website-virginia.acm_certificate_arn
}

module "nqv-website-virginia" {
  source = "../resources_virginia"
  env    = "prd"
  providers = {
    aws = aws.virginia
  }
}

