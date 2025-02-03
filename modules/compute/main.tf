# # create instance for jenkins
# resource "aws_instance" "Jenkins" {
#   ami                         = var.ami-jenkins
#   instance_type               = "t2.small"
#   subnet_id                   = var.subnets-compute
#   vpc_security_group_ids      = var.sg-compute
#   associate_public_ip_address = true
#   key_name                    = var.keypair

#   tags = merge(
#     var.tags,
#     {
#       Name = "techeon-Jenkins"
#     },
#   )
# }


# # create instance for sonbarqube
# resource "aws_instance" "sonarqube" {
#   ami                         = var.ami-sonar
#   instance_type               = "t2.medium"
#   subnet_id                   = var.subnets-compute
#   vpc_security_group_ids      = var.sg-compute
#   associate_public_ip_address = true
#   key_name                    = var.keypair

#   tags = merge(
#     var.tags,
#     {
#       Name = "techeon-sonbarqube"
#     },
#   )
# }

# # create instance for artifactory
# resource "aws_instance" "artifactory" {
#   ami                         = var.ami-jfrog
#   instance_type               = "t2.medium"
#   subnet_id                   = var.subnets-compute
#   vpc_security_group_ids      = var.sg-compute
#   associate_public_ip_address = true
#   key_name                    = var.keypair

#   tags = merge(
#     var.tags,
#     {
#       Name = "techeon-artifactory"
#     },
#   )
# }



# create instance for jenkins
resource "aws_instance" "Bastion" {
  ami                         = var.ami-jenkins
  instance_type               = "t2.small"
  subnet_id                   = var.subnets-compute
  vpc_security_group_ids      = var.sg-compute
  associate_public_ip_address = true
  key_name                    = var.keypair

  tags = merge(
    var.tags,
    {
      Name = "techeon-Bastion"
    },
  )
}
