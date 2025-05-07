locals {

  public_subnet_cidrs = [
    for index in range(var.number_of_public_subnets) :
    cidrsubnet(var.vpc_cidr, var.number_of_cidr_newbits, index)
  ]

  private_subnet_cidrs = [
    for index in range(var.number_of_private_subnets) :
    cidrsubnet(var.vpc_cidr, var.number_of_cidr_newbits, index + var.number_of_public_subnets)
  ]

  secure_subnet_cidrs = [
    for index in range(var.number_of_secure_subnets) :
    cidrsubnet(var.vpc_cidr, var.number_of_cidr_newbits, index + var.number_of_private_subnets + var.number_of_public_subnets)
  ]
}