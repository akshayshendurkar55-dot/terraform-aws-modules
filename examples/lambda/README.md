# Lambda Module Example

This example demonstrates how to consume the reusable AWS Lambda module from `../../modules/lambda`.

## Prerequisites

1. **IAM Execution Role:**
   An existing IAM Role ARN with basic execution permissions (`arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole`).
   Provide this ARN via `var.lambda_role_arn`.

2. **Deployment Package (ZIP):**
   AWS Lambda requires a compiled/packaged ZIP archive containing your function handler code.
   - For Python: Package your script (e.g. `index.py` with `def handler(event, context):`) into `build/function.zip`.
   - In accordance with clean repository standards, compiled binary ZIP files are **not** committed to Git.

## Packaging Example (PowerShell / Bash)

```powershell
# Create build directory
mkdir build

# Create a sample index.py
Set-Content -Path "build\index.py" -Value @"
def handler(event, context):
    return {
        'statusCode': 200,
        'body': 'Hello from Lambda!'
    }
"@

# Compress into function.zip
Compress-Archive -Path "build\index.py" -DestinationPath "build\function.zip"
```

## Running Terraform

```powershell
terraform init
terraform fmt -check
terraform validate
terraform plan
```
