variable "aws_region" {
  description = "The AWS region to deploy the example VPC"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "dev"
}
