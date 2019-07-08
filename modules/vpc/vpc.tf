# Define our VPC
resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Motor Aclaraciones test-vpc"
  }
}

# ${var.vpc_id_global} = aws_vpc.default.id 

output "vpc-defalut-info" {
  value = "VPC Tenacy : ${aws_vpc.default.instance_tenancy} VPC ID : ${aws_vpc.default.id}"
}


# Define the public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "${var.aws_availability_zone}"

  tags = {
    Name = "Motor Aclaraciones Web Public Subnet"
  }
}

output "public-subnet-info" {
  value = "VPC Public VPC_ID : ${aws_subnet.public-subnet.vpc_id} VPC Public ID : ${aws_subnet.public-subnet.id}"
}


# Define the private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "${var.aws_availability_zone}"

  tags = {
    Name = "Motor Aclaraciones Database Private Subnet"
  }
}

output "private-subnet-info" {
  value = "VPC Private VPC_ID : ${aws_subnet.private-subnet.vpc_id} VPC Private ID : ${aws_subnet.private-subnet.id}"
}


# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "Motor Aclaraciones VPC IGW"
  }
}

# Define the route table
resource "aws_route_table" "web-public-rt" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Motor Aclaraciones Public Subnet RT"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "web-public-rt" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.web-public-rt.id
}

# Define the security group for public subnet
resource "aws_security_group" "sg_public" {
  name        = "${var.project_name}-${var.vpc_sg_public_name}"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress { # MySQL
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = ["${var.private_subnet_cidr}"]
  }
  
  egress { # SSH
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.private_subnet_cidr}"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.private_subnet_cidr}"]
  }

  vpc_id = aws_vpc.default.id

  tags = {
    Name = "Motor Aclaraciones  Web Server SG"
  }
}

output "sg_public_info" {
  value = "${aws_security_group.sg_public.id}"
}

# Define the security group for private subnet
resource "aws_security_group" "sg_private" {
  name        = "${var.project_name}-${var.vpc_sg_private_name}"
  description = "Allow traffic from public subnet"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr]
  }

  vpc_id = aws_vpc.default.id

  tags = {
    Name = "Motor Aclaraciones DB SG"
  }
}

output "sg_private_info" {
  value = "${aws_security_group.sg_private.id}"
}