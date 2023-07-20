resource "aws_security_group" "allow_http" {
  name   = "${var.project}-allow_http"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-allow_http"
  }
}

resource "aws_security_group" "allow_ssh" {
  name   = "${var.project}-allow_ssh"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_allowed_cidr
  }
  tags = {
    Name = "${var.project}-allow_ssh"
  }
}

resource "aws_security_group" "allow_vpc_traffic" {
  name   = "${var.project}-allow_vpc_traffic"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "${var.project}-allow_vpc_traffic"
  }
}

resource "aws_security_group" "go_outside" {
  name   = "${var.project}-go_outside"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-go_outside"
  }
}
