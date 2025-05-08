output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "ecr_url" {
  description = "The Elastic Container Registry (ECR) URL."
  value       = module.ecs.ecr_url
}

output "ecr_repository" {
  value = module.ecs.ecr_repository
}

output "ecs_service" {
  value = module.ecs.ecs_service
}

output "ecs_cluster" {
  value = module.ecs.ecs_cluster
}

output "ecs_task_definition" {
  value = module.ecs.ecs_task_definition
}

output "ecs_security_group_id" {
  description = "ECS Security group Id"
  value       = module.ecs.ecs_security_group_id
}

output "website_url" {
  description = "The website URL."
  value       = format("http://%s/users", aws_lb.lb.dns_name)
}