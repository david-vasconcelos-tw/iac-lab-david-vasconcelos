resource "aws_lb" "lb" {
  name               = "${var.prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets = [
    for subnet_id in module.vpc.public_subnets : subnet_id
  ]

  tags = {
    Name = format("%s-alb", var.prefix)
  }
}

resource "aws_lb_target_group" "tg" {
  port        = 8000
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    interval            = "30"
    matcher             = "200,302"
    path                = "/users"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
  }

  tags = {
    Name = format("%s-tg", var.prefix)
  }
}

resource "aws_lb_listener" "lb_listener" {
  port              = 80
  protocol          = "HTTP"
  load_balancer_arn = aws_lb.lb.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_security_group" "lb_sg" {
  vpc_id      = module.vpc.vpc_id
  description = "Allow HTTP inbound traffic"

  ingress {
    description = "Allow HTTP from ALB to ECS"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow self-communication on port 8000"
    protocol    = "tcp"
    from_port   = 8000
    to_port     = 8000
    self        = true
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}