############################################
# VPC
############################################

resource "aws_vpc" "this" {
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

############################################
# Internet Gateway
############################################

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

############################################
# Public Subnet
############################################

resource "aws_subnet" "public" {
  for_each = toset(var.azs)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr, 8, index(var.azs, each.value))
  availability_zone       = each.value
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-${each.value}"

    # Required for AWS Load Balancer
    "kubernetes.io/role/elb" = "1"
  }
}

############################################
# Public Route Table
############################################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

############################################
# Route Table Association
############################################

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

############################################
# Outputs
############################################

output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = values(aws_subnet.public)[*].id
}
