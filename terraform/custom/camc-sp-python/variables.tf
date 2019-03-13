#####################################################################
##
##      Created 2/28/19 by ucdpadmin. For Cloud cmh-vra for camc-sp-python
##
#####################################################################

variable "ucd_user" {
  type = "string"
  description = "UCD User"
  default = "admin"
}

variable "ucd_password" {
  type = "string"
  description = "UCD Password"
}

variable "ucd_host" {
  type = "string"
  description = "UCD Server URL"
}

variable "resource_name" {
  type = "string"
  description = "New resource name"
}