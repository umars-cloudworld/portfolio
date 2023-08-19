output "s3_url" {
 value =  join("", ["http://", module.s3_bucket.bucket_name,".s3-website-us-east-1.amazonaws.com"])
}
output "bucket_name" {
 value = module.s3_bucket.bucket_name
}
