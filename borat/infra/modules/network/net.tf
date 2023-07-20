# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    "Name" = "${var.project}-IGW"
  }

  depends_on = [aws_vpc.this]
}

# Route the public subnet traffic through the IGW
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.project}-RT"
  }
}

# Route table and subnet associations
resource "aws_route_table_association" "internet_access" {
  count          = var.counter
  subnet_id      = aws_subnet.this[count.index].id
  route_table_id = aws_route_table.main.id
}


# # NAT Elastic IP
# resource "aws_eip" "main" {
#   vpc = true

#   tags = {
#     Name = "${var.project}-NGW-IP"
#   }
# }
