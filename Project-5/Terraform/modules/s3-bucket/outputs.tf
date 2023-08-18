output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}
output "artifacts_bucket" {
  value = aws_s3_bucket.artifacts_bucket.bucket
}
output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "website_url" {
  value = "http://${aws_s3_bucket.bucket.bucket}.s3-website-us-east-1.amazonaws.com"
}