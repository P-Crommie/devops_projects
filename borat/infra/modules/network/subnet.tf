#Public Subnets
resource "aws_subnet" "this" {
  count             = var.counter
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_cidr_bits, count.index)
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.project}-SubNet-${count.index}"
  }
  map_public_ip_on_launch = true
}
