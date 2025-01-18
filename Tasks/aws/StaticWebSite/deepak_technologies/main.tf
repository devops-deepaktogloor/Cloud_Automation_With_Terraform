terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "~>5.83"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

resource "random_id" "rand_id" {
  byte_length = 8

}

resource "aws_s3_bucket" "S3website-bucket" {
  bucket = "website-bucket-${random_id.rand_id.hex}"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.S3website-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static_web" {
  bucket = aws_s3_bucket.S3website-bucket.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",
          Action    = "s3:GetObject",
          Resource  = "arn:aws:s3:::${aws_s3_bucket.S3website-bucket.id}/*"
        }
      ]
    }
  )
}

resource "aws_s3_bucket_website_configuration" "static_web" {
  bucket = aws_s3_bucket.S3website-bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.S3website-bucket.id
  source       = "./index.html"
  key          = "index.html"
  content_type = "text/html"
}

output "website" {
  value = aws_s3_bucket_website_configuration.static_web.website_endpoint
}
