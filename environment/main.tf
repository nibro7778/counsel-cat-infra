provider "aws" {
  region = var.aws_region
}

module "vpc_module" {
  source = "../modules/vpc"
}