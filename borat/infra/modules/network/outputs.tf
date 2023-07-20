output "nodes_subnet" {
  value = aws_subnet.this[*].id
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "http_security_group" {
  value = aws_security_group.allow_http.id
}

output "ssh_security_group" {
  value = aws_security_group.allow_ssh.id
}

output "vpc_traffic_security_group" {
  value = aws_security_group.allow_vpc_traffic.id
}

output "go_outside_security_group" {
  value = aws_security_group.go_outside.id
}
