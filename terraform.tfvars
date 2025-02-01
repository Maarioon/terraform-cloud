region = "us-east-1"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = "2"

preferred_number_of_private_subnets = "4"

environment = "production"

# ami = "ami-23456789"     # "ami-0e2c8caa4b6378d8c"  
# ami-web = "ami-34567890"  # "ami-0e2c8caa4b6378d8c"
# ami-nginx   = "ami-12345678"
# ami-bastion = "ami-87654321"
# ami-sonar = "ami-45678901"
# ami-nginx-tgt = "ami-56789012"  

# =         # "ami-0e2c8caa4b6378d8c" var.ami_web

ami = "ami-78901234"
ami-jenkins = "ami-23456789"   # Replace with the actual Jenkins AMI ID
ami-jfrog   = "ami-67890123"   # Replace with the actual JFrog AMI ID
ami-web     = "ami-34567890"
ami-nginx   = "ami-12345678"
ami-bastion = "ami-87654321"
ami-sonar   = "ami-45678901"
ami-nginx-tgt = "ami-56789012"



# ami-nginx   = "ami-12345678"
# ami-bastion = "ami-87654321"
keypair     = "devops"

# ami_list = [  
#   "ami-12345678",  # Example AMI 1  
#   "ami-23456789",  # Example AMI 2  
#   "ami-34567890",  # Example AMI 3  
#   "ami-45678901",  # Example AMI 4  
#   "ami-56789012"   # Example AMI 5
   
#   "ami-67890123",  # Example AMI 6  
#   "ami-78901234",  # Example AMI 7  
#   "ami-89012345",  # Example AMI 8  
# ]  


# Ensure to change this to your acccount number
account_no = "741448930322"


# db_username = "admin"


# db-password = "password"

master-password = "password"

master-username = "admin"


tags = {
  Enviroment      = "production"
  Owner-Email     = "colleymarion@gmail.com"
  Managed-By      = "terraform"
  Billing-Account = "741448930322"
}

# ext_alb = {
#   name               = "techeon-ext-alb"
#   load_balancer_type = "application"
#   ip_address_type    = "ipv4"
# }

wordpress-alb-tgt = "wordpress-tgt"
tooling-alb-tgt = "tooling-tgt"
aws_lb_target_group = "nginx-tgt" 

nginx-tgt = "nginx-tgt"

ext_alb = "techeon-ext-alb"

ext_alb_sg_id = "sg-12345678"
# alb-tgt = {
#   wordpress = "wordpress-tgt"
#   nginx     = "nginx-tgt"
#   tooling   = "tooling-tgt"
# }

# alb_tgt = {  
#   wordpress = "wordpress-tgt"  
#   nginx     = "nginx-tgt"  
#   tooling   = "tooling-tgt"  
# }

# vpc_id = "main"  # Replace with your actual VPC ID  

# lb_target_group = {  
#   health_check = {  
#     interval            = 10  
#     path                = "/healthstatus"  
#     protocol            = "HTTPS"  
#     timeout             = 5  
#     healthy_threshold   = 5  
#     unhealthy_threshold = 2  
#   }  
#   port        = 443  
#   protocol    = "HTTPS"  
#   target_type = "instance"  
#   vpc_id      = var.vpc_id  # Use the variable reference here  
# }