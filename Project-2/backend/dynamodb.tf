# resource "aws_dynamodb_table" "aws_dynamodb_table" {
#   name         = "terraform-state-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

