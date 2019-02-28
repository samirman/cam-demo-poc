#####################################################################
##
##      Created 2/28/19 by ucdpadmin. For Cloud cmh-vra for camc-sp-python
##
#####################################################################

output "dcList" {
    value = "${lookup(camc_scriptpackage.create_efs_export.result, "dcList")}"
}