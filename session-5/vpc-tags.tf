resource "aws_ec2_tag" "public_subnet_tag" {
  count = var.number_of_public_subnets

  resource_id = module.vpc.public_subnets[count.index]
  key         = "Name"
  value       = format("%s-public-subnet-%s", var.prefix, count.index + 1)
}

resource "aws_ec2_tag" "private_subnet_tag" {
  count = var.number_of_private_subnets

  resource_id = module.vpc.private_subnets[count.index]
  key         = "Name"
  value       = format("%s-private-subnet-%s", var.prefix, count.index + 1)
}

resource "aws_ec2_tag" "secure_subnet_tag" {
  count = var.number_of_secure_subnets

  resource_id = module.vpc.intra_subnets[count.index]
  key         = "Name"
  value       = format("%s-secure-subnet-%s", var.prefix, count.index + 1)
}