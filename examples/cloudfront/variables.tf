variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "origin_s3_domain_name" {
  description = "The regional DNS domain name of the S3 bucket to serve as the origin (placeholder for demonstration)"
  type        = string
  default     = "my-demo-static-bucket.s3.ap-south-1.amazonaws.com"
}
