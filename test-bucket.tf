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

resource "aws_s3_bucket" "armageddon_approval_from_theowaf.png" {
  bucket = "terraform-state-tedlclayton"
  key = "armageddon_approval_from_theowaf.png"
  source = "./armageddon_approval_from_theowaf.png"
  etag = filemd5("./armageddon_approval_from_theowaf.png")
  content_type = "image/png"
)  


resource "aws_s3_bucket" "Armageddon AWS Lab 2b Be a Man(#3) Deliverable.pdf" {
  bucket = "terraform-state-tedlclayton"
  key    = "Armageddon AWS Lab 2b Be a Man(#3) Deliverable.pdf"
  source = "./Armageddon AWS Lab 2b Be a Man(#3) Deliverable.pdf"
  etag   = filemd5("./Armageddon AWS Lab 2b Be a Man(#3) Deliverable.pdf")  
  content_type = "text/plain"
)