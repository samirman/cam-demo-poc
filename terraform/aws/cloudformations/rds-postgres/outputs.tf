#####################################################################
##
##      Created 3/7/19 by admin. for rds-postgres
##
#####################################################################

output "jdbc_connection_string" {
  value = "${aws_cloudformation_stack.rds-postgres-cfn.outputs["JDBCConnectionString"]}"
}

output "db_address" {
  value = "${aws_cloudformation_stack.rds-postgres-cfn.outputs["DBAddress"]}"
}

output "db_port" {
  value = "${aws_cloudformation_stack.rds-postgres-cfn.outputs["DBPort"]}"
}

output "cloudformations_stack_id" {
  value = "${aws_cloudformation_stack.rds-postgres-cfn.id}"
}

output "cloudformations_stack_name" {
  value = "rds-test-${random_pet.stack_id.id}"
}