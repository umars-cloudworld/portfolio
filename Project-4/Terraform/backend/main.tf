resource "aws_s3_bucket" "backend_bucket" {
  bucket        = "s3-backend-alpha-007"
  force_destroy = true
}

