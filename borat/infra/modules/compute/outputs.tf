output "node1_ip" {
  value = aws_instance.nodes[0].private_ip
}

output "node2_ip" {
  value = aws_instance.nodes[1].private_ip
}
