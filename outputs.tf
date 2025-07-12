output "paintsite_url" {
  value = aws_s3_bucket_website_configuration.paint-site.website_endpoint
}