#####################################################################
##
##      Created 3/7/19 by admin. for eks
##
#####################################################################

variable "cluster-name" {
  type = "string"
  description = "Generated"
  default = "my-eks-cluster"
}

variable "role_arn" {
  type = "string"
  description = "Generated"
}

variable "subnet_a" {
  type = "string"
  description = "Generated"
}

variable "subnet_b" {
  type = "string"
  description = "Generated"
}

variable "sec_group" {
  type = "string"
  description = "Generated"
}

variable "version" {
  type = "string"
  description = "Generated"
}
