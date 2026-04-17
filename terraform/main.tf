terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install docker.io -y
              systemctl start docker
              sudo usermod -aG docker $USER
              newgrp docker
              docker pull neetesh/devops-app
              docker run -d -p 3000:3000 --name netflix-app neeteshsahu/netflix-clone:latest
              EOF

  tags = {
    Name        = var.instance_name
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
resource "aws_security_group" "devops_sg" {
  name = "devops-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_eip" "existing" {
  id = "eipalloc-03ca820e24a4e52bb"
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.this.id
  allocation_id = data.aws_eip.existing.id
}