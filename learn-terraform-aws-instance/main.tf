terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  profile = "default"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0729e439b6769d6ab" # ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20220610
  instance_type          = "t2.micro"
#  vpc_security_group_ids = ["vpc-33591648"]
#  subnet_id              = "subnet-68a94946"

  tags = {
      Name = var.instance_name
  }
}
