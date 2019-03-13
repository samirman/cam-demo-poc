#####################################################################
##
##      Created 1/16/19 by ucdpadmin. For Cloud cmh-azure for camc-sp-test
##
#####################################################################

output "full_result" {
  value = "${camc_scriptpackage.create_test_resource.result}"
}

output "resource_id" {
  value = "${lookup(camc_scriptpackage.create_test_resource.result, "resource_id")}"
}

output "resource_id_output" {
  value = "Successfully deleted ${lookup(camc_scriptpackage.delete_test_resource.result, "resource_id")}"
}
