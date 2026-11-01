output "distribution_id" {
  description = "The identifier for the CloudFront distribution"
  value       = aws_cloudfront_distribution.this.id
}

output "arn" {
  description = "The ARN (Amazon Resource Name) for the distribution"
  value       = aws_cloudfront_distribution.this.arn
}

output "domain_name" {
  description = "The domain name corresponding to the distribution (e.g., d111111abcdef8.cloudfront.net)"
  value       = aws_cloudfront_distribution.this.domain_name
}

output "hosted_zone_id" {
  description = "The CloudFront Route 53 zone ID that can be used to route an Alias resource to"
  value       = aws_cloudfront_distribution.this.hosted_zone_id
}

output "status" {
  description = "The current status of the distribution (e.g., InProgress, Deployed)"
  value       = aws_cloudfront_distribution.this.status
}

output "origin_access_control_id" {
  description = "The ID of the Origin Access Control"
  value       = aws_cloudfront_origin_access_control.this.id
}

output "recommended_s3_bucket_policy" {
  description = "Recommended IAM bucket policy statement JSON to attach to the S3 origin bucket to allow access from this CloudFront distribution via OAC"
  value = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipalReadOnly"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "arn:aws:s3:::<REPLACE_WITH_YOUR_BUCKET_NAME>/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.this.arn
          }
        }
      }
    ]
  })
}
