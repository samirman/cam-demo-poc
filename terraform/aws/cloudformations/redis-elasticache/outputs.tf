#####################################################################
##
##      Created 3/7/19 by admin. for redis-elasticache
##
#####################################################################

output "redis_endpoint" {
  value = "${aws_cloudformation_stack.redis-elasticache-cfn.outputs["RGEndpoint"]}"
}

output "cloudformations_stack_id" {
  value = "${aws_cloudformation_stack.redis-elasticache-cfn.id}"
}

output "cloudformations_stack_name" {
  value = "redis-test-${random_pet.stack_id.id}"
}