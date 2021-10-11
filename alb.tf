resource "aws_alb" "bhanu-lb" { 
  name            = "bhanu-lb"
  internal        = false
  subnets         = [aws_subnet.bhanu-vpc-public-1.id, aws_subnet.bhanu-vpc-public-2.id]
  security_groups = [aws_security_group.bhanu-lb-sg.id]

  tags = {
    Name = "bhanu-lb"
  }
}

resource "aws_alb_target_group" "bhanu-tg" { 
  name     = "bhanu-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.bhanu-vpc.id
  tags = {
    Name = "bhanu-tg"
  }
}
resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = "${aws_alb.bhanu-lb.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = "${aws_alb_target_group.bhanu-tg.arn}"
    type             = "forward"
  }
}



