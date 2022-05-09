# Create VPC
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block              = "${var.vpc-cidr}"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "Test VPC"
  }
}

# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "Test IGW"
  }
}



variable "subnet_prefix" {
  description = "The CIDR block for each subnet"
  
}

variable "aws_avz" {
  description = "The availabilty zone for each VPC"
}


resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_prefix[0].cidr_block
  availability_zone       = var.aws_avz[0]
  map_public_ip_on_launch = true

  tags      = {
    Name    = var.subnet_prefix[0].name
  }
}


resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_prefix[1].cidr_block
  availability_zone       = var.aws_avz[1]
  map_public_ip_on_launch = true

  tags      = {
    Name    = var.subnet_prefix[1].name
  }
}


resource "aws_route_table" "public-route-table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags       = {
    Name     = "Public Route Table"
  }
}


resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.public-subnet-1.id
  route_table_id      = aws_route_table.public-route-table.id
}


resource "aws_route_table_association" "public-subnet-2-route-table-association" {
  subnet_id           = aws_subnet.public-subnet-2.id
  route_table_id      = aws_route_table.public-route-table.id
}


resource "aws_subnet" "private-subnet-1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.subnet_prefix[2].cidr_block
  availability_zone        = var.aws_avz[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = var.subnet_prefix[2].name
  }
}


resource "aws_subnet" "private-subnet-2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.subnet_prefix[3].cidr_block
  availability_zone        = var.aws_avz[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = var.subnet_prefix[3].name
  }
}


resource "aws_subnet" "private-subnet-3" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.subnet_prefix[4].cidr_block
  availability_zone        = var.aws_avz[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = var.subnet_prefix[4].name
  }
}


resource "aws_subnet" "private-subnet-4" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.subnet_prefix[5].cidr_block
  availability_zone        = var.aws_avz[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = var.subnet_prefix[5].name
  }
}