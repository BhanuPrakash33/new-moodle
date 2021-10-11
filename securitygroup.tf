# auto scalling security group 
resource "aws_security_group" "bhanu-asg-sg" {
  vpc_id      = aws_vpc.bhanu-vpc.id
  name        = "bhanu-asg-sg"
  description = "security group for my instance"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["175.101.108.152/32"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.bhanu-lb-sg.id]
  }

  tags = {
    Name = "bhanu-asg-sg"
  }
}

#Instance security group
resource "aws_security_group" "bhanu-moodle-sg" {
  vpc_id      = aws_vpc.bhanu-vpc.id
  name        = "bhanu-moodle-sg"
  description = "security group for my instance"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["175.101.108.152/32"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bhanu-moodle-sg"
  }
}


# elb security group
resource "aws_security_group" "bhanu-lb-sg" {
  vpc_id      = aws_vpc.bhanu-vpc.id
  name        = "bhanu-lb-sg"
  description = "security group for load balancer"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "bhanu-lb-sg"
  }
}

# database security group
resource "aws_security_group" "bhanu-rds-mysql-sg" {
  vpc_id      = aws_vpc.bhanu-vpc.id
  name        = "bhanu-rds-mysql-sg"
  description = "bhanu-rds-mysql-sg"
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.bhanu-moodle-sg.id] 
  }

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.bhanu-asg-sg.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  tags = {
    Name = "bhanu-rds-mysql-sg"
  }
}


