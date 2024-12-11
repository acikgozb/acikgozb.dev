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

provider "aws" {}

locals {
  bucket_id   = "acikgozb-dev"
  application = "acikgozb.dev"
}

resource "random_bytes" "bucket_id" {
  keepers = {
    bucket_id = local.bucket_id
  }

  length = 6
}

resource "aws_s3_bucket" "acikgozb-dev" {
  bucket = "${local.bucket_id}-${random_bytes.bucket_id.hex}"
  tags = {
    Name        = "site-bucket"
    application = local.application
  }
}

data "external" "cloudflare-cidr-ranges" {
  program = ["bash", "${path.module}/scripts/cloudflare-proxy-cidr"]
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions = ["s3:GetObject"]

    resources = [aws_s3_bucket.acikgozb-dev.arn]

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"
      values   = jsondecode(data.external.cloudflare-cidr-ranges.result.list)
    }
  }

  depends_on = [data.external.cloudflare-cidr-ranges]
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.acikgozb-dev.id
  policy = data.aws_iam_policy_document.s3_policy.json
}
