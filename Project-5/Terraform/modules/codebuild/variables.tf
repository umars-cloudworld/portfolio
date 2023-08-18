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

variable "region" {
  description = "aws region"
}
variable "account_id" {
  description = "aws region"
}
variable "codebuild_name" {
  type        = string
  description = "The Name of CodeBuild Project"
} //value comes from main.tf
variable "build_timeout" {
  type        = number
  description = "Build timeout"
} //value comes from main.tf
variable "repository_clone_url_http" {
  type        = string
  description = "The Name  of CodeCommit Repository URL"
} //value comes from main.tf
variable "codecommit_repository_arn" {
  type        = string
  description = "The Name  of CodeCommit Repository ARN"
} //value comes from main.tf
variable "artifacts_bucket" {
  type        = string
  description = "The Name  of artifacts bucket"
} //value comes from main.tf
variable "codebuild_role" {
  type        = string
  description = "The Name  of Codebuild Role"
} //value comes from main.tf
variable "codebuild_policy" {
  type        = string
  description = "The Name  of Codebuild Policy"
} //value comes from main.tf