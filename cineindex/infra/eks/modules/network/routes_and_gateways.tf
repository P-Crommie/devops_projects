# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.project}-InternetGateWay"
  }
  depends_on = [aws_vpc.this]
}

# Route the public subnet traffic through the IGW
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.project}-InternetGateWayRoute"
  }
}

# Route traffic through the Nat Gateway
resource "aws_route" "this" {
  route_table_id         = aws_vpc.this.default_route_table_id
  nat_gateway_id         = aws_nat_gateway.this.id
  destination_cidr_block = "0.0.0.0/0"
}

# Route table and subnet associations
resource "aws_route_table_association" "this" {
  count = length(data.aws_availability_zones.this.zone_ids)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.this.id
}

# NAT Elastic IP
resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "${var.project}-InternetGateWay-ElaticIP"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.project}-Nat-GateWay"
  }
}
