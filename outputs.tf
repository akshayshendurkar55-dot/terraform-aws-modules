output "bucket_name" {
  description = "The name of the created S3 bucket"
  value       = module.s3_bucket.bucket_name
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = module.s3_bucket.bucket_arn
}

