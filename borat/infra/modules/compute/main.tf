resource "local_file" "nodes_ip" {
  content  = join("\n", [aws_instance.nodes[0].private_ip, aws_instance.nodes[1].private_ip])
  filename = "${var.project_path}/playbooks/nodes.txt"
}

resource "local_file" "controller_ip" {
  content  = aws_instance.controller.public_ip
  filename = "${var.project_path}/controller_ip.txt"
}

resource "null_resource" "this" {

  provisioner "local-exec" {
    command = "zip -rj playbooks.zip ${var.project_path}/playbooks"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${var.user_home_directory}/.ssh/${var.key_name}.pem")
    host        = aws_instance.controller.public_ip
    timeout     = 2
  }

  provisioner "file" {
    source      = "${var.user_home_directory}/.ssh/${var.key_name}.pem"
    destination = "/home/ubuntu/.ssh/${var.key_name}.pem"
  }

  provisioner "file" {
    source      = "./playbooks.zip"
    destination = "/home/ubuntu/playbooks.zip"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install zip unzip -y",
      "sudo mkdir -p /home/ubuntu/.ssh",
      "sudo chmod 0755 /home/ubuntu/.ssh",
      "sudo chmod 400 /home/ubuntu/.ssh/${var.key_name}.pem",
      "unzip /home/ubuntu/playbooks.zip -d /home/ubuntu/playbooks",
      "sudo sh -c \"echo 'export ANSIBLE_CONFIG=/home/ubuntu/playbooks/ansible.cfg' >> /home/ubuntu/.bashrc\""
    ]
  }

  depends_on = [
    local_file.nodes_ip
  ]
}
