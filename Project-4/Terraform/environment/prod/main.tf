# S3 Bucket Module
module "s3_bucket" {
  source       = "../../modules/s3"
  app          = var.app
  environment  = var.environment
  bucket_names = var.bucket_names
}
