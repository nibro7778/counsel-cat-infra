provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_vpc" "custom_vpc" {
  cidr_block = "10.0.0.0/16" # IP range available inside the vpc 
  instance_tenancy = "default"

  tags = {
    "Name" = "custom_vpc"
  }
}

