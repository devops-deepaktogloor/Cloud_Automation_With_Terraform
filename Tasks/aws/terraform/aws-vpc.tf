# Create a pvc
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "my_vpc"
  }
}

# Private subnet
resource "aws_subnet" "my-pri-sub" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.my-vpc.id
  tags = {
    name = "private-subnet"
  }
}

# Public subnet
resource "aws_subnet" "my-pub-sub" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.my-vpc.id
  tags = {
    name = "public-subnet"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    name = "my-igw"
  }
}

# Route Tables
resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
}

# Associate Route table to subnet
resource "aws_route_table_association" "pub-sub" {
  route_table_id = aws_route_table.my-rt.id
  subnet_id      = aws_subnet.my-pub-sub.id
}

resource "aws_instance" "my-vpc-instance" { 
    ami = "ami-04b4f1a9cf54c11d0"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.my-pub-sub.id
    tags = {
      key = "MyVPCBox"
    }
  
}