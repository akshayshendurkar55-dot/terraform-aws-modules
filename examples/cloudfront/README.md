# CloudFront Module Example with S3 Origin Access Control (OAC)

This example demonstrates how to consume the reusable AWS CloudFront module from `../../modules/cloudfront`.

## Prerequisites & Architecture

1. **S3 REST Origin:**
   CloudFront points directly to an S3 bucket REST endpoint (`<bucket-name>.s3.<region>.amazonaws.com`), NOT the S3 website endpoint.

2. **Origin Access Control (OAC):**
   This distribution uses AWS Origin Access Control (OAC) with SigV4 signing, which replaces the legacy Origin Access Identity (OAI).

3. **Required S3 Bucket Policy (Prerequisite):**
   To keep modules decoupled and adhere to the principle of least privilege, this module does **not** automatically modify external bucket policies.
   Instead, this module exports a `recommended_s3_bucket_policy` output. You must attach this statement to your S3 bucket's policy in the AWS console or via `aws_s3_bucket_policy`:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowCloudFrontServicePrincipalReadOnly",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::<YOUR_BUCKET_NAME>/*",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "<CLOUDFRONT_DISTRIBUTION_ARN>"
        }
      }
    }
  ]
}
```

## Running the Example

```powershell
terraform init
terraform fmt -check
terraform validate
terraform plan
```
