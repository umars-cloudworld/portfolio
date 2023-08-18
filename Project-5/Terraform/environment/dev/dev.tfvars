# Resource Tagging: "${var.project}-${var.environment}-${var.resource_name}"
region      = "us-east-1"
project     = "alpha"
environment = "dev"
# S3
bucket_name      = "cicd-deployment-react-app"
artifacts_bucket = "artifacts"
# CodeCommit
repository_name = "react-app"
# CodeBuild
codebuild_name   = "react-codebuild-project"
build_timeout    = 60
codebuild_role   = "codebuild-role"
codebuild_policy = "codebuild-policy"
# CodePipeline
pipeline_name   = "react-pipeline-project"
pipeline_role   = "pipeline-role"
pipeline_policy = "pipeline-policy"