# output "alb_dns_name" {
#   value = aws_lb.ext-alb.dns_name
# }

# output "alb_target_group_arn" {
#   value = aws_lb_target_group.nginx-tgt.arn
# }

output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket"
}
# output "dynamodb_table_name" {
#   value       = aws_dynamodb_table.terraform_locks.name
#   description = "The name of the DynamoDB table"
# }
# output "ext_alb_sg_id" {  // Changed output name to contain underscore instead of dot  
#   value = aws_security_group.ACS[ext_alb_sg].id  // Ensure this reference is valid  
# }
# output "alb_dns_name" {  
#   value = aws_lb.ext_alb.dns_name  # Make sure this matches how you've declared your resource  
# }  

# output "alb_target_group_arn" {  
#   value = aws_lb_target_group.nginx_tgt.arn  # Accessing attributes from the resource  
# }

# output "alb_dns_name" {
#   value = aws_lb.ext-alb.dns_name
# }

# output "alb_target_group_arn" {
#   value = aws_lb_target_group.nginx-tgt.arn
# }

# output "ALB-sg" {
#   value = aws_security_group.ACS["ext-alb-sg"].id
# }


# output "IALB-sg" {
#   value = aws_security_group.ACS["int-alb-sg"].id
# }


# output "bastion-sg" {
#   value = aws_security_group.ACS["bastion-sg"].id
# }


# output "nginx-sg" {
#   value = aws_security_group.ACS["nginx-sg"].id
# }


# output "web-sg" {
#   value = aws_security_group.ACS["webserver-sg"].id
# }


# output "datalayer-sg" {
#   value = aws_security_group.ACS["datalayer-sg"].id
# }

# output "ext_alb" {
#   value = aws_security_group.ACS[ext_alb].id
# }

