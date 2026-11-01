# Example invocation of the reusable CloudFront module with S3 OAC
module "cloudfront" {
  source = "../../modules/cloudfront"

  origin_domain_name  = var.origin_s3_domain_name
  origin_id           = "MyS3Origin"
  default_root_object = "index.html"
  price_class         = "PriceClass_100"
  comment             = "Demo CloudFront distribution with S3 OAC"

  tags = {
    Environment = "dev"
    Project     = "Terraform-AWS-Modules"
    ManagedBy   = "Terraform"
    Example     = "CloudFront-S3-OAC"
  }
}
