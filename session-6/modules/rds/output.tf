output "db_address" {
  description = "RDS endpoint address"
  value       = aws_db_instance.database.address
}

output "db_name" {
  description = "RDS database name"
  value       = aws_db_instance.database.db_name  
}

output "db_secret_arn" {
  description = "ARN of the database secret"
  value       = data.aws_secretsmanager_secret.db.arn  
}

output "db_secret_key_id" {
  description = "ID of the database secret key"
  value       = data.aws_secretsmanager_secret_version.db.id  
}