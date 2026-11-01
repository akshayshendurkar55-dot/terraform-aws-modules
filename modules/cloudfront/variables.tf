variable "origin_domain_name" {
  description = "The DNS domain name of the S3 bucket origin (e.g., my-bucket.s3.ap-south-1.amazonaws.com)"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]+\\.s3[a-zA-Z0-9.-]*\\.amazonaws\\.com$", var.origin_domain_name)) || can(regex("^[a-zA-Z0-9.-]+$", var.origin_domain_name))
    error_message = "The origin_domain_name must be a valid domain name."
  }
}

variable "origin_id" {
  description = "A unique identifier for the origin"
  type        = string
  default     = "S3Origin"
}

variable "default_root_object" {
  description = "Object that CloudFront returns when an end user requests the root URL (e.g., index.html)"
  type        = string
  default     = "index.html"
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content"
  type        = bool
  default     = true
}

variable "comment" {
  description = "Any comments you want to include about the distribution"
  type        = string
  default     = "Managed by Terraform Reusable CloudFront Module"
}

variable "price_class" {
  description = "The price class for this distribution (PriceClass_All, PriceClass_200, PriceClass_100)"
  type        = string
  default     = "PriceClass_100"

  validation {
    condition     = contains(["PriceClass_All", "PriceClass_200", "PriceClass_100"], var.price_class)
    error_message = "The price_class must be one of: PriceClass_All, PriceClass_200, PriceClass_100."
  }
}

variable "cache_policy_id" {
  description = "The unique identifier of the cache policy to attach to the default cache behavior. Defaults to AWS Managed-CachingOptimized policy."
  type        = string
  default     = "658327ea-f89d-4fab-a63d-7e88639e58f6"
}

variable "tags" {
  description = "A mapping of tags to assign to the CloudFront distribution"
  type        = map(string)
  default     = {}
}
