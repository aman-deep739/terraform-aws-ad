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

resource "aws_directory_service_directory" "active_dir" {
  name     = "amandevops.xyz"
  password = "P7BQFF&b5%Z3"
  type     = var.AD_type

  vpc_settings {
    vpc_id     = "vpc-055898fbf04b2d879"
    subnet_ids = ["subnet-0f87a763d5e69bedb", "subnet-0481cbdc2c69a8d1b"]
  }

  edition = var.AD_type == "MicrosoftAD" ? "Standard" : null
  size    = var.AD_type == "SimpleAD" ? "Small" : null


  tags = {
    Project = "TEST"
  }
}

