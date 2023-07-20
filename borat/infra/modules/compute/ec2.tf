resource "aws_instance" "nodes" {
  count                       = 2
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  key_name                    = var.key_name
  subnet_id                   = var.nodes_subnet[0]
  availability_zone           = var.availability_zones[0]
  vpc_security_group_ids      = [var.http_security_group, var.vpc_traffic_security_group, var.go_outside_security_group]
  associate_public_ip_address = "true"

  tags = {
    Name = "${var.project}-ansibleNode-${count.index + 1}"
  }

}

resource "aws_instance" "controller" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  key_name               = var.key_name
  subnet_id              = var.nodes_subnet[1]
  availability_zone      = var.availability_zones[1]
  vpc_security_group_ids = [var.ssh_security_group, var.vpc_traffic_security_group, var.go_outside_security_group]
  tags = {
    Name = "${var.project}-ansibleController"
  }
  user_data = file("${path.module}/userdata/install_ansible.sh")
}
