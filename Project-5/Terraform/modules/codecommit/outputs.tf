output "repository_clone_url_http" {
  value = aws_codecommit_repository.repo.clone_url_http
}
output "codecommit_repository_name" {
  value = aws_codecommit_repository.repo.repository_name
}
output "codecommit_repository_arn" {
  value = aws_codecommit_repository.repo.arn
}
