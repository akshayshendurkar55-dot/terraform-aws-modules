variable "aws_region" {
  description = "AWS region for provisioning resources"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket (must be globally unique across all AWS accounts)"
  type        = string
  default     = "my-practical-tf-s3-bucket-demo"
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket resources"
  type        = map(string)
  default = {
    Environment = "Dev"
    Project     = "Terraform-S3-Module"
    ManagedBy   = "Terraform"
  }
}

