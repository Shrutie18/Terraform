provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name = "MyStaticWebsite"
  }
}

resource "aws_s3_bucket_object" "website_index" {
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

resource "aws_s3_bucket_object" "website_error" {
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

output "website_url" {
  description = "The URL of the static website"
  value       = aws_s3_bucket.website.website_endpoint
}
