variable "region" {
 default = "us-east-1"

}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}

# variable "enable_classiclink" {
#   type = bool
# }

variable "preferred_number_of_public_subnets" {
  type = number
}

variable "preferred_number_of_private_subnets" {
  type = number
}

variable "private_subnets" {
  type        = list(any)
  description = "List of private subnets"
}

variable "public_subnets" {
  type        = list(any)
  description = "list of public subnets"

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