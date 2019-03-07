#####################################################################
##
##      Created 3/7/19 by admin. for redis-elasticache
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

variable "cache_node_type" {
  type = "string"
  description = "Generated"
  default = "cache.m3.medium"
}

variable "multi_az_support" {
  type = "string"
  description = "Generated"
  default = "true"
}

variable "num_cache_clusters" {
  type = "string"
  description = "Generated"
  default = "2"
}

variable "redis_port" {
  type = "string"
  description = "Generated"
  default = "6379"
}

variable "replication_group_description" {
  type = "string"
  description = "Generated"
  default = "Replication Group Description"
}

variable "cidr_ip" {
  type = "string"
  description = "Generated"
  default = "0.0.0.0/0"
}

variable "snapshot_retention_limit" {
  type = "string"
  description = "Generated"
  default = "7"
}

variable "snapshot_window" {
  type = "string"
  description = "Generated"
  default = "05:00-09:00"
}

variable "preferred_maintenance_window" {
  type = "string"
  description = "Generated"
  default = "sun:22:00-sun:23:30"
}