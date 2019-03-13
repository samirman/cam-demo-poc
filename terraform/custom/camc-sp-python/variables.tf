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
  default = ""
}

variable "ucd_host" {
  type = "string"
  description = "UCD Server URL"
  default = "http://icdemo3.cloudy-demos.com:9080"
}

variable "resource_name" {
  type = "string"
  description = "New resource name"
  default = "py-a"
}