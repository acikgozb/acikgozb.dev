terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

    external = {
      source  = "hashicorp/external"
      version = "2.3.4"
    }
  }

  required_version = ">= 1.2.0"
}

//NOTE: acikgozb - Is it possible to pass region via env vars?
provider "aws" {
  region = "eu-west-2"
}

