terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "ad" {
  source = "./modules/ad"
  AD_type = var.AD_type
}