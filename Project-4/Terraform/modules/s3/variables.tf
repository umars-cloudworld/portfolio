variable "bucket_names" {
  type = list(string)
}

variable "app" {
  type        = string
  description = "Project Name"
} //value comes from main.tf

variable "environment" {
  type        = string
  description = "The Name  of Environment"
} //value comes from main.tf