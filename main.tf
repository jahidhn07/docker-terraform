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
 #region  = "us-east-2"
  access_key = "AKIA5U7U4GLFAKPFCBGX"
  secret_key = "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"
  region = "ap-southeast-1"
}

resource "aws_instance" "app_server" {
  ami             = "ami-0bd6906508e74f692"
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
