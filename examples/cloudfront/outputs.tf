output "distribution_id" {
  description = "The ID of the created CloudFront distribution"
  value       = module.cloudfront.distribution_id
}

output "distribution_domain_name" {
  description = "The CloudFront distribution domain name"
  value       = module.cloudfront.domain_name
}

output "distribution_arn" {
  description = "The ARN of the CloudFront distribution"
  value       = module.cloudfront.arn
}

output "recommended_s3_bucket_policy" {
  description = "Recommended IAM bucket policy statement JSON to attach to your S3 bucket"
  value       = module.cloudfront.recommended_s3_bucket_policy
}
