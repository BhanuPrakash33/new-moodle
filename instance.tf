resource "aws_instance" "bhanu-moodle-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.bhanu-vpc-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.bhanu-moodle-sg.id]

  # the public SSH key
  key_name = aws_key_pair.bhanu-keypair.key_name

  tags = {
      Name = "bhanu-moodle-instance"
  }

}


