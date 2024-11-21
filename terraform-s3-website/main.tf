provider "aws" {
  region = var.region
}

resource "random_id" "unique_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "website" {
  bucket = "my-unique-website-bucket-${random_id.unique_suffix.hex}"

  tags = {
    Name = "MyStaticWebsite"
  }
}

resource "aws_s3_bucket_acl" "website_acl" {
  bucket = aws_s3_bucket.website.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "website_index" {
  bucket = aws_s3_bucket.website.id
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

resource "aws_s3_object" "website_error" {
  bucket = aws_s3_bucket.website.id
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
