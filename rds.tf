resource "aws_db_subnet_group" "bhanu-mysql-subnet" {
  name        = "bhanu-mysql-subnet"
  description = "RDS subnet group"
  subnet_ids  = [aws_subnet.bhanu-vpc-private-1.id, aws_subnet.bhanu-vpc-private-2.id]
}


resource "aws_db_instance" "bhanu-rds" {
  allocated_storage       = 20 
  engine                  = "mysql"
  engine_version          = "8.0.23"
  instance_class          = "db.t2.micro" 
  identifier              = "bhanu-mysql"
  name                    = "moodle_db"
  username                = "admin"           
  password                = var.db-password 
  port                    = "3306"
  db_subnet_group_name    = aws_db_subnet_group.bhanu-mysql-subnet.name
  multi_az                = "false" 
  vpc_security_group_ids  = [aws_security_group.bhanu-rds-mysql-sg.id]
  storage_type            = "gp2"
  availability_zone       = aws_subnet.bhanu-vpc-private-1.availability_zone 
  skip_final_snapshot     = true 
  tags = {
    Name = "bhanu-rds"
  }
}

