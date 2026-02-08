resource "aws_vpc" "vpc_8byte" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_8byte"
  }
}

resource "aws_subnet" "subnet_8byte" {
  vpc_id            = aws_vpc.vpc_8byte.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "subnet_8byte"
  }
}

resource "aws_internet_gateway" "internet_gateway_8byte" {
  vpc_id = aws_vpc.vpc_8byte.id

  tags = {
    Name = "internet_gateway_8byte"
  }
}

resource "aws_route_table" "route_table_8byte" {
  vpc_id = aws_vpc.vpc_8byte.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_8byte.id
  }

  tags = {
    Name = "route_table_8byte"
  }
}

resource "aws_route_table_association" "route_table_association_8byte" {
  subnet_id      = aws_subnet.subnet_8byte.id
  route_table_id = aws_route_table.route_table_8byte.id
}

resource "aws_security_group" "security_group_8byte" {
  name        = "security_group_8byte"
  description = "Allow SSH and Main Port of Node 3000"
  vpc_id      = aws_vpc.vpc_8byte.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0 
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami                    = "ami-0f5ee92e2d63afc18" # this is standard image of Ubuntu 22.04
  instance_type           = var.instance_type
  subnet_id               = aws_subnet.subnet_8byte.id
  vpc_security_group_ids  = [aws_security_group.security_group_8byte.id]
  key_name                = var.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install docker.io -y
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "ec2-8byte"
  }
}
