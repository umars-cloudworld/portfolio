variable "project" {
  type        = string
  description = "Project Name"
} //value comes from main.tf

variable "environment" {
  type        = string
  description = "The Name  of Environment"
} //value comes from main.tf
variable "repository_name" {
  type        = string
  description = "The Name  of CodeCommit repository"
} //value comes from main.tf