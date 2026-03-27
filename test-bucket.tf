terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use latest version if possible
    }
  }

  backend "s3" {
    bucket  = "terraform-state-tedlclayton" # Name of the S3 bucket
    key     = "jenkins-test-031726.tfstate" # The name of the state file in the bucket
    region  = "us-east-1"                   # Use a variable for the region
    encrypt = true                          # Enable server-side encryption (optional but recommended)
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "frontend" {
  bucket = "jenkins-bucket-tedlclayton"
}

resource "aws_s3_object" "armageddon_approval_image" {
  bucket       = aws_s3_bucket.frontend.id
  key          = "armageddon_approval_from_theowaf.png"
  source       = "./armageddon_approval_from_theowaf.png"
  etag         = filemd5("./armageddon_approval_from_theowaf.png")
  content_type = "image/png"
}

resource "aws_s3_object" "deliverable_pdf" {
  bucket       = aws_s3_bucket.frontend.id
  key          = "deliverable.pdf"
  source       = "./deliverable.pdf"
  etag         = filemd5("./deliverable.pdf")
  content_type = "application/pdf"
}