module "rds" {
  source = "./modules/rds"

  prefix                = var.prefix
  intra_subnets         = module.vpc.intra_subnets
  vpc_id                = module.vpc.vpc_id
  ecs_security_group_id = module.ecs.ecs_security_group_id
  db_name               = var.db_name
  db_username           = var.db_username
}