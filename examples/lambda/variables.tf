variable "aws_region" {
  description = "The AWS region to deploy the example Lambda function"
  type        = string
  default     = "ap-south-1"
}

variable "lambda_role_arn" {
  description = "The ARN of an existing IAM execution role with AWSLambdaBasicExecutionRole permissions"
  type        = string
  default     = "arn:aws:iam::123456789012:role/service-role/demo-lambda-exec-role"
}

variable "deployment_package_path" {
  description = "Relative or absolute path to the deployment ZIP package (e.g., build/function.zip)"
  type        = string
  default     = "build/function.zip"
}
