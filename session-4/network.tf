resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "private_subnets" {
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = "false"
  count                   = var.number_of_private_subnets

  cidr_block        = cidrsubnet(var.vpc_cidr, var.number_of_cidr_newbits, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s-private-subnet-%s", var.prefix, count.index + 1)
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id = aws_vpc.vpc.id
  count  = var.number_of_public_subnets

  cidr_block        = cidrsubnet(var.vpc_cidr, var.number_of_cidr_newbits, count.index + 2)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s-public-subnet-%s", var.prefix, count.index + 1)
  }
}

resource "aws_subnet" "secure_subnets" {
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = "false"
  count                   = var.number_of_secure_subnets

  cidr_block        = cidrsubnet(var.vpc_cidr, var.number_of_cidr_newbits, count.index + 4)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s-secure-subnet-%s", var.prefix, count.index + 1)
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = format("%s-igw", var.prefix)
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = [for key, subnet in aws_subnet.public_subnets : subnet.id][1]

  tags = {
    Name = format("%s-nat", var.prefix)
  }
}

resource "aws_route_table" "public_routetable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = format("%s-public-route-table", var.prefix)
  }
}

resource "aws_route_table" "private_routetable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = format("%s-private-route-table", var.prefix)
  }
}

resource "aws_route_table_association" "private_subnet" {
  count = var.number_of_private_subnets

  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_routetable.id
}

resource "aws_route_table_association" "public_subnet" {
  count = var.number_of_public_subnets

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_routetable.id
}
