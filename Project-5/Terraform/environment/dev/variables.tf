variable "region" {
  type        = string
  description = "aws region"
}
variable "project" {
  type        = string
  description = "Project Name"
}
variable "environment" {
  type        = string
  description = "The Name  of Environment"
}
variable "bucket_name" {
  type        = string
  description = "The Name  of App Bucket"
}
variable "artifacts_bucket" {
  type        = string
  description = "The Name  of Artifacts Bucket for CodePipeline"
}
variable "repository_name" {
  type        = string
  description = "The Name  of ECR repository"
}
variable "pipeline_name" {
  type        = string
  description = "The Name  of CodePipeline"
}
variable "codebuild_name" {
  type        = string
  description = "The Name of CodeBuild Project"
}
variable "build_timeout" {
  type        = number
  description = "Build timeout"
}
variable "codebuild_role" {
  type        = string
  description = "The Name  of Codebuild Role"
}
variable "codebuild_policy" {
  type        = string
  description = "The Name  of Codebuild Policy"
}
variable "pipeline_role" {
  type        = string
  description = "The Name  of CodePipeline Role"
}
variable "pipeline_policy" {
  type        = string
  description = "The Name  of CodePipeline Policy"
} 