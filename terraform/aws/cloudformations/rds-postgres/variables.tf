#####################################################################
##
##      Created 3/7/19 by admin. for rds-postgres
##
#####################################################################

variable "vpc_id" {
  type = "string"
  description = "Generated"
}

variable "subnet1" {
  type = "string"
  description = "Generated"
}

variable "subnet2" {
  type = "string"
  description = "Generated"
}

variable "db_id" {
  type = "string"
  description = "Generated"
  default = "CMHDBId"
}

variable "db_name" {
  type = "string"
  description = "Generated"
  default = "CMHDBName"
}

variable "db_user" {
  type = "string"
  description = "Generated"
  default = "cmhadmin"
}

variable "db_password" {
  type = "string"
  description = "Generated"
  default = "Passw0rd"
}

variable "db_allocated_storage" {
  type = "string"
  description = "Generated"
  default = "5"
}

variable "db_instance_class" {
  type = "string"
  description = "Generated"
  default = "db.m3.medium"
}

variable "MultiAZDatabase" {
  type = "string"
  description = "Generated"
  default = "false"
}