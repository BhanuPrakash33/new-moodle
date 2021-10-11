resource "null_resource" "Moodle-Execution" {
  
    connection {
    type = "ssh"
    host = aws_instance.bhanu-moodle-instance.public_ip
    user = "ubuntu"
    private_key = file("bhanu-key") 
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

  depends_on = [ aws_instance.bhanu-moodle-instance ]

  }
