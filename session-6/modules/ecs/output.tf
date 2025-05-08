output "ecr_url" {
  description = "The Elastic Container Registry (ECR) URL."
  value       = aws_ecr_repository.api.repository_url
}

output "ecs_security_group_id" {
  description = "ECS Security group Id"
  value       = aws_security_group.ecs.id
}

output "ecr_repository" {
  value = aws_ecr_repository.api.name
}

output "ecs_service" {
  value = aws_ecs_service.this.name
}

output "ecs_cluster" {
  value = aws_ecs_cluster.this.name
}

output "ecs_task_definition" {
  value = aws_ecs_task_definition.this.family
}