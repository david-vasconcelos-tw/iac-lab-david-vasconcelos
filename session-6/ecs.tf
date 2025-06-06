module "ecs" {
  source = "./modules/ecs" # 

  prefix                     = var.prefix
  region                     = var.region
  vpc_id                     = module.vpc.vpc_id
  private_subnets            = module.vpc.private_subnets
  public_subnets             = module.vpc.public_subnets
  alb_target_group_arn       = aws_lb_target_group.tg.arn
  alb_security_group_id      = aws_security_group.lb_sg.id
  db_address                 = module.rds.db_address
  db_name                    = module.rds.db_name
  db_username                = var.db_username
  db_secret_arn              = module.rds.db_secret_arn
  db_secret_key_id           = module.rds.db_secret_key_id
  container_cpu_architecture = var.container_cpu_architecture
}

