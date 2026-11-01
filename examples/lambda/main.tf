# Example invocation of the reusable Lambda module
module "lambda_function" {
  source = "../../modules/lambda"

  function_name = "example-demo-function"
  description   = "Example Lambda function deployed via reusable Terraform module"
  runtime       = "python3.11"
  handler       = "index.handler"
  role_arn      = var.lambda_role_arn
  filename      = var.deployment_package_path

  timeout     = 10
  memory_size = 256

  environment_variables = {
    ENVIRONMENT = "dev"
    APP_NAME    = "LambdaDemo"
  }

  tags = {
    Environment = "dev"
    Project     = "Terraform-AWS-Modules"
    ManagedBy   = "Terraform"
    Example     = "Lambda-Basic"
  }
}
