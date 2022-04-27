terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "cartographie-nationale"

    workspaces {
      prefix = "client-"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-3"
}
