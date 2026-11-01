variable "bucket_name" {
  description = "The name of the S3 bucket to create (must be globally unique)"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}

