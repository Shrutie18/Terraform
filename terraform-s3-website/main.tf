provider "aws" {
  region = var.region
}

# S3 Bucket for hosting the static website
resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
  acl    = "public-read"

  # Tags block is valid here
  tags = {
    Name = "MyStaticWebsite"
  }
}

# S3 Bucket Website Configuration
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket         = aws_s3_bucket.website.bucket
  index_document = "index.html"
  error_document = "error.html"
}

# S3 Object for index.html
resource "aws_s3_object" "website_index" {
  bucket = aws_s3_bucket.website.bucket
  key    = "index.html"
  acl    = "public-read"
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

# S3 Object for error.html
resource "aws_s3_object" "website_error" {
  bucket = aws_s3_bucket.website.bucket
  key    = "error.html"
  acl    = "public-read"
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
