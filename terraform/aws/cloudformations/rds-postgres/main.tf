#####################################################################
##
##      Created 3/7/19 by admin. for rds-postgres
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

resource "aws_cloudformation_stack" "rds-postgres-cfn" {
  name = "rds-test-${random_pet.stack_id.id}"
  parameters = {
    VpcId = "${var.vpc_id}"
    Subnets = "${var.subnet1},${var.subnet2}"
    DBIdentifier = "${var.db_id}"
    MyDBName = "${var.db_name}"
    DBUser = "${var.db_user}"
    DBPassword = "${var.db_password}"
    DBAllocatedStorage = "${var.db_allocated_storage}"
    MyDBInstanceClass = "${var.db_instance_class}"
    MultiAZDatabase = "${var.MultiAZDatabase}"
  }
  template_body = "${file("${path.module}/templates/rds-postgres.json")}"
}

# Random string to use for stack names
resource "random_pet" "stack_id" {
}