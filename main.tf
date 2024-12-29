terraform {
  backend "remote" {
    organization = "vath_organization"
    workspaces {
      name = "Example_Workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


resource "aws_instance" "app_server" {
  ami           = "ami-07d9cf938edb0739b"
  instance_type = "t2.micro"
  key_name      = "project"  
  tags = {
    Name = "my-instance"
  }
}

