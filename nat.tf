resource "aws_eip" "bhanu-vpc-eip" {
    vpc = true
}

resource "aws_nat_gateway" "bhanu-nat-gw" {
    allocation_id = aws_eip.bhanu-vpc-eip.id
    subnet_id = aws_subnet.bhanu-vpc-public-1.id
    depends_on = [aws_internet_gateway.bhanu-vpc-igw]
    tags = {
        Name = "bhanu-nat-gw"
    }
}

