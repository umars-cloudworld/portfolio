resource "aws_s3_bucket" "statefile_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}

