resource "aws_codebuild_project" "codebuild_project" {
  name          = "${var.project}-${var.environment}-${var.codebuild_name}"
  description   = "CodeBuild project for building React project"
  build_timeout = var.build_timeout
  service_role  = aws_iam_role.codebuild_role.arn
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:5.0"
    type         = "LINUX_CONTAINER"
  }
  source {
    type            = "CODECOMMIT"
    location        = var.codecommit_repository_arn
    buildspec       = "buildspec.yml"
    git_clone_depth = 1
  }
  artifacts {
    type                = "S3"
    location            = var.artifacts_bucket
    name                = "build"
    namespace_type      = "BUILD_ID"
    packaging           = "ZIP"
    encryption_disabled = true
  }
}
