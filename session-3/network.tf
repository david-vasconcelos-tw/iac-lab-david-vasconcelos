resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

resource "aws_subnet" "subnet_private_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = format("%sa", var.region)

  tags = {
    Name = format("%s-private-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "subnet_private_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = format("%sa", var.region)

  tags = {
    Name = format("%s-private-subnet-2", var.prefix)
  }
}

resource "aws_subnet" "subnet_public_3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet3_cidr
  availability_zone = format("%sb", var.region)

  tags = {
    Name = format("%s-public-subnet-3", var.prefix)
  }
}

resource "aws_subnet" "subnet_public_4" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet4_cidr
  availability_zone = format("%sb", var.region)

  tags = {
    Name = format("%s-public-subnet-4", var.prefix)
  }

}

resource "aws_subnet" "subnet_public_5" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet5_cidr
  availability_zone = format("%sc", var.region)

  tags = {
    Name = format("%s-public-subnet-5", var.prefix)
  }

}

resource "aws_subnet" "subnet_public_6" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet6_cidr
  availability_zone = format("%sc", var.region)

  tags = {
    Name = format("%s-public-subnet-6", var.prefix)
  }
}

moved {
  from = aws_subnet.subnet_public_7
  to = aws_subnet.subnet_public_8
}

resource "aws_subnet" "subnet_public_8" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet8_cidr
  availability_zone = format("%sb", var.region)

  tags = {
    Name = format("%s-public-subnet-8", var.prefix)
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
  subnet_id     = aws_subnet.subnet_private_1.id

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

resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = aws_subnet.subnet_private_1.id
  route_table_id = aws_route_table.private_routetable.id
}

resource "aws_route_table_association" "private_subnet_2" {
  subnet_id      = aws_subnet.subnet_private_2.id
  route_table_id = aws_route_table.private_routetable.id
}

resource "aws_route_table_association" "public_subnet_3" {
  subnet_id      = aws_subnet.subnet_public_3.id
  route_table_id = aws_route_table.public_routetable.id
}

resource "aws_route_table_association" "public_subnet_4" {
  subnet_id      = aws_subnet.subnet_public_4.id
  route_table_id = aws_route_table.public_routetable.id
}
