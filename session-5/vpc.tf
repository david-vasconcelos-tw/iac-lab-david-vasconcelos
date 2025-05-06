module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name = "${var.prefix}-vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  public_subnets  = local.public_subnet_cidrs
  private_subnets = local.private_subnet_cidrs
  intra_subnets   = local.secure_subnet_cidrs


  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    Name = "${var.prefix}-vpc"
  }

  private_subnet_tags = {
    Name = format("%s-private-subnet", var.prefix)
  }

  public_subnet_tags = {
    Name = format("%s-public-subnet", var.prefix)
  }

  intra_subnet_tags = {
    Name = format("%s-secure-subnet", var.prefix)
  }

}

data "aws_availability_zones" "available" {
  state = "available"
}
