output "function_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_function.function_name
}

output "function_arn" {
  description = "The Amazon Resource Name (ARN) of the Lambda function"
  value       = module.lambda_function.arn
}

output "invoke_arn" {
  description = "The invocation ARN for API Gateway integrations"
  value       = module.lambda_function.invoke_arn
}
