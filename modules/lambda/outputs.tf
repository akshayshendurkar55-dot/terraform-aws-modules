output "function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.this.function_name
}

output "arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function"
  value       = aws_lambda_function.this.arn
}

output "invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway"
  value       = aws_lambda_function.this.invoke_arn
}

output "qualified_arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function Version"
  value       = aws_lambda_function.this.qualified_arn
}
