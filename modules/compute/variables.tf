variable "subnets-compute" {
  description = "public subnetes for compute instances"
}
variable "ami-jenkins" {
  type        = string
  description = "ami for jenkins"
}



variable "ami-jfrog" {
  type        = string
  description = "ami for jfrog"
}
variable "ami-sonar" {
  type        = string
  description = "ami for sonar"
}
variable "sg-compute" {
  description = "security group for compute instances"
}
variable "keypair" {
  type        = string
  description = "keypair for instances"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "ami-bastion" {
  type        = string
  description = "ami for bastion"
}