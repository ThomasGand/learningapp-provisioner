terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.57"
    }
  }

  required_version = ">= 1.2.0"
}

variable "public_key_file" {
  type = string
  default = "/home/haep/.ssh/aws_key.pub"
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_key_pair" "deployer" {
  key_name = "deployer-key"
  public_key = file(var.public_key_file)
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-06b6c7fea532f597e"
  instance_type = "t2.micro"
  key_name = "deployer-key"
  tags = {
    Name = "Jenkins"
  }
}
