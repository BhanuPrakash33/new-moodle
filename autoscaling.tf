resource "aws_launch_configuration" "bhanu-lc" {
  name_prefix     = "bhanu-lc"
  image_id        = var.moodle-ami
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.bhanu-keypair.key_name
  security_groups = [aws_security_group.bhanu-asg-sg.id]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bhanu-asg" {
  name                      = "bhanu-asg"
  vpc_zone_identifier       = [aws_subnet.bhanu-vpc-public-1.id, aws_subnet.bhanu-vpc-public-2.id]
  launch_configuration      = aws_launch_configuration.bhanu-lc.name
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  target_group_arns         = [aws_alb_target_group.bhanu-tg.arn]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "bhanu-asg"
    propagate_at_launch = true
  }
}



