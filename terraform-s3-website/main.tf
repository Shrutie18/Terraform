provider "aws" {
  region = var.region
}

resource "random_id" "unique_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "website" {
  bucket = "my-unique-website-bucket-${random_id.unique_suffix.hex}"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name = "MyStaticWebsite"
  }
}

resource "aws_s3_bucket_public_access_block" "website_public_access_block" {
  bucket                  = aws_s3_bucket.website.id
  block_public_acls       = false
  block_public_policy     = false
  restrict_public_buckets = false
  ignore_public_acls      = false
}

resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.website.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.website.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "website_index" {
  bucket = aws_s3_bucket.website.id
  key    = "index.html"
  content = <<EOF
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My Website</title>
  </head>
  <body>
    <h1>Welcome to My Static Website</h1>
    <p>This is a simple static website hosted on S3 using Terraform.</p>
  </body>
  </html>
  EOF
}

resource "aws_s3_object" "website_error" {
  bucket = aws_s3_bucket.website.id
  key    = "error.html"
  content = <<EOF
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
  </head>
  <body>
    <h1>Oops! Something went wrong.</h1>
    <p>Sorry, we couldn't find the page you were looking for.</p>
  </body>
  </html>
  EOF
}
