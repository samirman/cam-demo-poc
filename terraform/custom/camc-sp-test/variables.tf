#####################################################################
##
##      Created 1/16/19 by ucdpadmin. For Cloud cmh-azure for camc-sp-test
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
  default = "res1"
}

variable "resource_desc" {
  type = "string"
  description = "New resource description"
  default = "res 1 desc"
}