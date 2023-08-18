resource "aws_codecommit_repository" "repo" {
  repository_name = "${var.project}-${var.environment}-${var.repository_name}"
}

