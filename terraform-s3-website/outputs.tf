output "website_url" {
  description = "The URL of the static website"
  value       = "http://${aws_s3_bucket.website.bucket}.s3-website.${var.region}.amazonaws.com"
}
