# Internet VPC
resource "aws_vpc" "bhanu-vpc" {
  cidr_block           = "50.0.0.0/16"
  instance_tenancy     = "default"
  tags = {
    Name = "bhanu-vpc"
  }
}

# Subnets
resource "aws_subnet" "bhanu-vpc-public-1" {
  vpc_id                  = aws_vpc.bhanu-vpc.id
  cidr_block              = "50.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-1a"

  tags = {
    Name = "bhanu-vpc-public-1"
  }
}

resource "aws_subnet" "bhanu-vpc-public-2" {
  vpc_id                  = aws_vpc.bhanu-vpc.id
  cidr_block              = "50.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-1c"

  tags = {
    Name = "bhanu-vpc-public-2"
  }
}

resource "aws_subnet" "bhanu-vpc-public-3" {
  vpc_id                  = aws_vpc.bhanu-vpc.id
  cidr_block              = "50.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-1d"

  tags = {
    Name = "bhanu-vpc-public-3"
  }
}


resource "aws_subnet" "bhanu-vpc-private-1" {
  vpc_id                  = aws_vpc.bhanu-vpc.id
  cidr_block              = "50.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-1a"

  tags = {
    Name = "bhanu-vpc-private-1"
  }
}

resource "aws_subnet" "bhanu-vpc-private-2" {
  vpc_id                  = aws_vpc.bhanu-vpc.id
  cidr_block              = "50.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-1c"

  tags = {
    Name = "bhanu-vpc-private-2"
  }
}


# Internet GW
resource "aws_internet_gateway" "bhanu-vpc-igw" {
  vpc_id = aws_vpc.bhanu-vpc.id

  tags = {
    Name = "bhanu-vpc-igw"
  }
}

# route tables
resource "aws_route_table" "bhanu-vpc-public-rt" {
  vpc_id = aws_vpc.bhanu-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bhanu-vpc-igw.id
  }

  tags = {
    Name = "bhanu-vpc-public-rt"
  }
}

resource "aws_route_table" "bhanu-vpc-private-rt" {
  vpc_id = aws_vpc.bhanu-vpc.id
  #route {
  #  cidr_block = "0.0.0.0/0"
 #   nat_gateway_id = aws_nat_gateway.bhanu-nat-gw.id
 # }

  tags = {
    Name = "bhanu-vpc-private-rt"
  }
}


# route associations public
resource "aws_route_table_association" "bhanu-vpc-public-route-1" {
  subnet_id      = aws_subnet.bhanu-vpc-public-1.id
  route_table_id = aws_route_table.bhanu-vpc-public-rt.id
}

resource "aws_route_table_association" "bhanu-vpc-public-route-2" {
  subnet_id      = aws_subnet.bhanu-vpc-public-2.id
  route_table_id = aws_route_table.bhanu-vpc-public-rt.id
}

resource "aws_route_table_association" "bhanu-vpc-public-route-3" {
  subnet_id      = aws_subnet.bhanu-vpc-public-3.id
  route_table_id = aws_route_table.bhanu-vpc-public-rt.id
}



# route associations private
resource "aws_route_table_association" "bhanu-vpc-private-route-1" {
  subnet_id      = aws_subnet.bhanu-vpc-private-1.id
  route_table_id = aws_route_table.bhanu-vpc-private-rt.id
}

resource "aws_route_table_association" "bhanu-vpc-private-route-2" {
  subnet_id      = aws_subnet.bhanu-vpc-private-2.id
  route_table_id = aws_route_table.bhanu-vpc-private-rt.id
}


