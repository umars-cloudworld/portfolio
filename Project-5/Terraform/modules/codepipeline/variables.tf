variable "project" {
  type        = string
  description = "Project Name"
} //value comes from main.tf

variable "environment" {
  type        = string
  description = "The Name  of Environment"
} //value comes from main.tf
variable "pipeline_name" {
  type        = string
  description = "The Name  of CodePipeline"
} //value comes from main.tf
variable "artifacts_bucket" {
  type        = string
  description = "The Name  of CodePipeline"
} //value comes from main.tf
variable "codecommit_repository_name" {
  type        = string
  description = "The Name  of CodeCommit Repository"
} //value comes from main.tf
variable "s3_deployment_bucket" {
  type        = string
  description = "The Name  of S3 Bucket, where code needs to be deployed"
} //value comes from main.tf
variable "codebuild_project_name" {
  type        = string
  description = "The Name  of CodeBuild Project"
} //value comes from main.tf
variable "pipeline_role" {
  type        = string
  description = "The Name  of CodePipeline Role"
} //value comes from main.tf
variable "pipeline_policy" {
  type        = string
  description = "The Name  of CodePipeline Policy"
} //value comes from main.tf