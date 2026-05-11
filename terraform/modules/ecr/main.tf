resource "aws_ecr_repository" "app" {
  name                 = "clouddevops-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = { Name = "clouddevops-ecr" }
}

output "repository_url" { value = aws_ecr_repository.app.repository_url }
