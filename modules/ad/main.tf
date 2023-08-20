#CREATE VPC AND SUBNETS

# resource "aws_vpc" "main" {
#   cidr_block = "172.16.0.0/16"
# }

# resource "aws_subnet" "subnet1" {
#   vpc_id            = aws_vpc.main.id
#   availability_zone = "us-west-2a"
#   cidr_block        = "172.16.1.0/24"
# }

# resource "aws_subnet" "subnet2" {
#   vpc_id            = aws_vpc.main.id
#   availability_zone = "us-west-2b"
#   cidr_block        = "172.16.2.0/24"
# }

#CREATE AD

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

