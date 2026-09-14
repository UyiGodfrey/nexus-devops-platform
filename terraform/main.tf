terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_ecr_repository" "nexus_api" {
  name                 = "nexus-api"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Project     = "Nexus DevOps Platform"
    Environment = "SIWES"
    ManagedBy   = "Terraform"
  }
}

output "repository_url" {
  value = aws_ecr_repository.nexus_api.repository_url
}
