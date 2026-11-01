variable "function_name" {
  description = "The name of the Lambda function"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9-_]{1,64}$", var.function_name))
    error_message = "The function_name must be between 1 and 64 characters and contain only alphanumeric characters, hyphens, and underscores."
  }
}

variable "description" {
  description = "Description of what your Lambda Function does"
  type        = string
  default     = ""
}

variable "runtime" {
  description = "Identifier of the function's runtime (e.g., python3.11, nodejs20.x)"
  type        = string
  default     = "python3.11"
}

variable "handler" {
  description = "The function entrypoint in your code (e.g., index.handler, lambda_function.lambda_handler)"
  type        = string
  default     = "index.handler"
}

variable "role_arn" {
  description = "The Amazon Resource Name (ARN) of the function's execution role"
  type        = string

  validation {
    condition     = can(regex("^arn:aws[a-zA-Z-]*:iam::[0-9]{12}:role/", var.role_arn)) || can(regex("^arn:aws[a-zA-Z-]*:iam::", var.role_arn))
    error_message = "The role_arn must be a valid AWS IAM role ARN."
  }
}

variable "filename" {
  description = "Path to the function's deployment package within local filesystem (must be a ZIP archive)"
  type        = string
}

variable "source_code_hash" {
  description = "Used to trigger updates when local code changes. If null, filebase64sha256(var.filename) is calculated if the file exists."
  type        = string
  default     = null
}

variable "timeout" {
  description = "Amount of time your Lambda Function has to run in seconds (between 1 and 900)"
  type        = number
  default     = 3

  validation {
    condition     = var.timeout >= 1 && var.timeout <= 900
    error_message = "The timeout must be between 1 and 900 seconds."
  }
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime (between 128 and 10240)"
  type        = number
  default     = 128

  validation {
    condition     = var.memory_size >= 128 && var.memory_size <= 10240
    error_message = "The memory_size must be between 128 MB and 10240 MB."
  }
}

variable "environment_variables" {
  description = "Map of environment variables to pass to the Lambda function"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A mapping of tags to assign to the Lambda function"
  type        = map(string)
  default     = {}
}
