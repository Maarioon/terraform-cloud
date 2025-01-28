variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpcp_cidr" {
  default = "10.1.0.0/16"
}
variable "enable_dns_support" {
  default = "true"
}
variable "enable_dns_hostnames" {
  default = "true"
}


variable "enable_classiclink" {
  default = "false"
}
variable "enable_classiclink_dns_support" {
  default = "false"
}

variable "preferred_number_of_public_subnets" {
  default = 2
}

variable "preferred_number_of_private_subnets" {
  default = 4
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
  default     = "1234567890"
}



variable "ami" {
  type        = string
  description = "AMI ID for the launch template"
}


variable "keypair" {
  type        = string
  description = "key pair for the instances"
}

variable "account_no" {
  type        = number
  description = "the account number"
}


variable "master-username" {
  type        = string
  description = "RDS admin username"
}

variable "master-password" {
  type        = string
  description = "RDS master password"
}

variable "ami-bastion" {
  type        = string
  description = "AMI ID for the launch template"
}

variable "ami-nginx" {
  type        = string
  description = "AMI ID for the launch template"
}

variable "ami-web" {
  type        = string
  description = "AMI ID for the launch template"
}
# variable "ami-jfrog" {
#   type        = string
#   description = "AMI ID for the launch template"
# }

variable "ami-sonar" {
  type        = string
  description = "AMI ID for the launch template"
}

# variable "ami-jenkins" {
#   type        = string
#   description = "AMI ID for the launch template"
# }


variable "ami-nginx-tgt" {
  type        = string
  description = "AMI ID for the launch template"
}


variable "ext_alb" {
  description = "ID of the external ALB security group"
  type        = string
}

# variable "int_alb_sg_id" {
#   description = "ID of the internal ALB security group"
#   type        = string
# }


variable "images" {
  type = map(string)
  default = {
    us-east-1 = "ami-12345678"
    us-west-2 = "ami-87654321"
  }
}



# variable "region" {
#   type = string
#   default = "us-east-1"
# }

variable "create_read_replica" {
  type    = bool
  default = false
}

# variable "aws_instance" "web" {
#   ami           = lookup(var.images, var.region, "ami-12323")
#   instance_type = "t2.micro"  # Replace with your desired instance type
# }
variable "wordpress-alb-tgt" {
  type        = string
  description = "wordpress target group"
}

variable "tooling-alb-tgt" {
  type        = string
  description = "tooling target group"

}

variable "aws_lb_target_group" {
  type        = string
  description = "target group"

}

variable "nginx-tgt" {
  description = "External Load balancaer target group"
  type        = string

}


# Add your variable declarations here



variable "ext_alb_sg_id" {

  description = "Security group ID for the external ALB"

  type        = string

}
