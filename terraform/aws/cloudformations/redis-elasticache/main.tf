#####################################################################
##
##      Created 3/7/19 by admin. for redis-elasticache
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

resource "aws_cloudformation_stack" "redis-elasticache-cfn" {
  name = "redis-${random_pet.stack_id.id}"
  parameters = {
    VpcId = "${var.vpc_id}"
    SubnetA = "${var.subnet1}"
    SubnetB = "${var.subnet2}"
    CacheNodeType = "${var.cache_node_type}"
    MultiAZSupport = "${var.multi_az_support}"
    NumCacheClusters = "${var.num_cache_clusters}"
    RedisPort = "${var.redis_port}"
    ReplicationGroupDescription = "${var.replication_group_description}"
    CidrIp = "${var.cidr_ip}"
    SnapshotRetentionLimit = "${var.snapshot_retention_limit}"
    SnapshotWindow = "${var.snapshot_window}"
    PreferredMaintenanceWindow = "${var.preferred_maintenance_window}"
  }
  template_body = "${file("${path.module}/templates/redis-elasticache.json")}"
}

# Random string to use for stack names
resource "random_pet" "stack_id" {
}