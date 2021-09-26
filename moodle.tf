resource "null_resource" "Moodle-Execution" {
  
    connection {
    type = "ssh"
    host = aws_instance.example.public_ip
    user = "ubuntu"
    private_key = "${tls_private_key.example.private_key_pem}"
    }

 
  provisioner "file" {
    source      = "moodle.sh"
    destination = "/home/ubuntu/moodle.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /home/ubuntu/moodle.sh",
      "sh /home/ubuntu/moodle.sh",
    ]
  }

  depends_on = [ aws_instance.example ]

  }
