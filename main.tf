terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  access_key = "XXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXX"
  region = "XXXXXXXXXXXXX"
}

resource "aws_instance" "app_server" {
  ami             = "ami-XXXXXXXXXXX"
  instance_type   = "t2.micro"
  key_name        = "docker"
  user_data	= file("file.sh")
  #security_groups = Docker

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_security_group" "Docker" {
  tags = {
    type = "terraform-test-security-group"
  }
}
