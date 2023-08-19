variable "region" {
  description = "aws region"
}
variable "app" {
  type        = string
  description = "Project Name"
}
variable "environment" {
  type        = string
  description = "The Name  of Environment"
}

variable "bucket_names" {
  type = list(string)
}
