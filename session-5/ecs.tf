module "ecs" {
  source = "./modules/ecs"

  prefix                = var.prefix
  region                = var.region
  vpc_id                = module.vpc.vpc_id
  private_subnets       = module.vpc.private_subnets
  public_subnets        = module.vpc.public_subnets
  alb_target_group_arn  = aws_lb_target_group.tg.arn
  alb_security_group_id = aws_security_group.lb_sg.id
}

