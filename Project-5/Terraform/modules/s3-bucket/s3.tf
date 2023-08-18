resource "aws_s3_bucket" "bucket" {
  bucket        = "${var.project}-${var.environment}-${var.bucket_name}"
  force_destroy = true
}
resource "aws_s3_bucket" "artifacts_bucket" {
  bucket        = "${var.project}-${var.environment}-${var.artifacts_bucket}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


resource "aws_s3_bucket_policy" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetPutObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "${aws_s3_bucket.bucket.arn}/*"
            ]

        }
    ]
}
POLICY
}