resource "aws_lb" "ext-alb" {
  name               = var.name
  internal           = false
  security_groups    = [var.public-sg]
  ip_address_type    = var.ip_address_type
  load_balancer_type = var.load_balancer_type

  subnets = [
    var.public-sbn-1,
    var.public-sbn-2,
  ]

  tags = merge(
    var.tags,
    {
      Name = "ext_alb"
    },
  )
}

resource "aws_lb_target_group" "nginx-tgt" {
  health_check {
    interval            = 10
    path                = "/healthstatus"
    protocol            = "HTTPS"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
  name        = "nginx-tgt"
  port        = 443
  protocol    = "HTTPS"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

# resource "aws_lb_listener" "nginx-listner" {
#   load_balancer_arn = aws_lb.ext-alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   certificate_arn   = aws_acm_certificate_validation.oyindamola.certificate_arn

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.nginx-tgt.arn
#   }
# }

# ----------------------------
#Internal Load Balancers for webservers
#---------------------------------

resource "aws_lb" "ialb" {
  name               = "ialb"
  internal           = true
  security_groups    = [var.private-sg]
  ip_address_type    = var.ip_address_type
  load_balancer_type = var.load_balancer_type

  subnets = [
    var.private-sbn-1,
    var.private-sbn-2,
  ]

  tags = merge(
    var.tags,
    {
      Name = "ACS-int-alb"
    },
  )


}

# --- target group  for wordpress -------

resource "aws_lb_target_group" "wordpress-tgt" {
  health_check {
    interval            = 10
    path                = "/healthstatus"
    protocol            = "HTTPS"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "wordpress-tgt"
  port        = 443
  protocol    = "HTTPS"
  target_type = "instance"
  vpc_id      = var.vpc_id
}


# --- target group for tooling -------

resource "aws_lb_target_group" "tooling-tgt" {
  health_check {
    interval            = 10
    path                = "/healthstatus"
    protocol            = "HTTPS"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "tooling-tgt"
  port        = 443
  protocol    = "HTTPS"
  target_type = "instance"
  vpc_id      = var.vpc_id
}


# resource "aws_lb_target_group" "nginx-tgt" {
#   name     = "nginx-tgt"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = var.vpc_id  # Replace with actual VPC ID
# }

# For this aspect a single listener was created for the wordpress which is default,
# A rule was created to route traffic to tooling when the host header changes


# resource "aws_lb_listener" "web-listener" {
#   load_balancer_arn = aws_lb.ialb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   certificate_arn   = aws_acm_certificate_validation.oyindamola.certificate_arn


#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.wordpress-tgt.arn
#   }
# }

# listener rule for tooling target

# resource "aws_lb_listener_rule" "tooling-listener" {
#   listener_arn = aws_lb_listener.web-listener.arn
#   priority     = 99

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.tooling-tgt.arn
#   }

#   condition {
#     host_header {
#       values = ["tooling.kadara-eda.shop"]
#     }
#   }
# }

# resource "aws_lb" "ext-alb" {
#   name               = "techeon-ext-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [var.public-sg]  # Replace with actual security group
#   subnets           = [var.public-sbn-1, var.public-sbn-2,]  # Replace with actual subnets

#   enable_deletion_protection = false
# }
