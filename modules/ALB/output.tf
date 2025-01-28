output "alb_dns_name" {
  value       = aws_lb.ext-alb.name
  description = "External load balance arn"
}

output "nginx-tgt" {
  description = "External Load balancaer target group"
  value       = aws_lb_target_group.nginx-tgt.arn
}


output "wordpress-tgt" {
  description = "wordpress target group"
  value       = aws_lb_target_group.wordpress-tgt.arn
}


output "tooling-tgt" {
  description = "Tooling target group"
  value       = aws_lb_target_group.tooling-tgt.arn
}

# The security froup for external loadbalancer
variable "public-sg" {
  description = "Security group for external load balancer"
}

# The public subnet froup for external loadbalancer
variable "public-sbn-1" {
  description = "Public subnets to deploy external ALB"
}
variable "public-sbn-2" {
  description = "Public subnets to deploy external  ALB"
}

variable "vpc_id" {
  type        = string
  description = "The vpc ID"
}

variable "private-sg" {
  description = "Security group for Internal Load Balance"
}

variable "private-sbn-1" {
  description = "Private subnets to deploy Internal ALB"
}
variable "private-sbn-2" {
  description = "Private subnets to deploy Internal ALB"
}

variable "ip_address_type" {
  type        = string
  description = "IP address for the ALB"
}

variable "load_balancer_type" {
  type        = string
  description = "the type of Load Balancer"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}



variable "name" {
  description = "Base name to use for naming the subnets"
  type        = string
  default     = "techeon"
}
variable "environment" {
  description = "Environment in which the resource is deployed (e.g., dev, staging, prod)"
  type        = string
  default     = "production"
}

variable "owner_email" {
  description = "Email of the resource owner"
  type        = string
  default     = "luwamarielleky@gmail"
}

variable "managed_by" {
  description = "Tool managing the resource"
  type        = string
  default     = "marielle"
}

variable "billing_account" {
  description = "Billing account associated with the resource"
  type        = string
  default     = "741448930322"
}


# Add your variable declarations here



# variable "ext_alb_sg_id" {

#   description = "Security group ID for the external ALB"

#   type        = string

# }



# variable "ami" {
#   type        = string
#   description = "AMI ID for the launch template"
# }


# variable "keypair" {
#   type        = string
#   description = "key pair for the instances"
# }

# variable "account_no" {
#   type        = number
#   description = "the account number"
# }


# variable "master-username" {
#   type        = string
#   description = "RDS admin username"
# }

# variable "master-password" {
#   type        = string
#   description = "RDS master password"
# }