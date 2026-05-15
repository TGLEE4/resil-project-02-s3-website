output "website_url" {
  description = "The URL of the static website"
  value       = "http://${aws_s3_bucket_website_configuration.portfolio.website_endpoint}"
}