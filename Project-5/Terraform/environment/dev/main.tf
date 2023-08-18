data "aws_caller_identity" "current" {}
# S3 Bucket Module
module "s3_bucket" {
  source           = "../../modules/s3-bucket"
  project          = var.project
  environment      = var.environment
  bucket_name      = var.bucket_name
  artifacts_bucket = var.artifacts_bucket
}
# CodeCommit Module
module "codecommit" {
  source          = "../../modules/codecommit"
  project         = var.project
  environment     = var.environment
  repository_name = var.repository_name
}
# CodeBuild Module
module "codebuild" {
  source                    = "../../modules/codebuild"
  project                   = var.project
  environment               = var.environment
  repository_name           = module.codecommit.codecommit_repository_name
  region                    = var.region
  account_id                = data.aws_caller_identity.current.account_id
  codebuild_name            = var.codebuild_name
  build_timeout             = var.build_timeout
  repository_clone_url_http = module.codecommit.repository_clone_url_http
  codecommit_repository_arn = module.codecommit.codecommit_repository_arn
  artifacts_bucket          = module.s3_bucket.artifacts_bucket
  codebuild_role            = var.codebuild_role
  codebuild_policy          = var.codebuild_policy
}
# CodePipeline Module
module "codepipeline" {
  source                     = "../../modules/codepipeline"
  project                    = var.project
  environment                = var.environment
  pipeline_name              = var.pipeline_name
  artifacts_bucket           = module.s3_bucket.artifacts_bucket
  codecommit_repository_name = module.codecommit.codecommit_repository_name
  s3_deployment_bucket       = module.s3_bucket.bucket_name
  codebuild_project_name     = module.codebuild.codebuild_project_name
  pipeline_role              = var.pipeline_role
  pipeline_policy            = var.pipeline_policy
}
