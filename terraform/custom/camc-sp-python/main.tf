#####################################################################
##
##      Created 2/28/19 by ucdpadmin. For Cloud cmh-vra for camc-sp-python
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

resource "camc_scriptpackage" "create_ucd_resource" {
  program = ["/usr/bin/python", "${path.module}/scripts/test_python_ucd.py", "${var.ucd_host}", "${var.resource_name}", "${var.ucd_user}" ]
  program_sensitive = ["${var.ucd_password}"]
  on_create = true
}


resource "camc_scriptpackage" "delete_ucd_resource" {
  depends_on = ["camc_scriptpackage.create_ucd_resource"]
  program = ["/usr/bin/python", "${path.module}/scripts/test-delete.py", "${var.ucd_host}", "${lookup(camc_scriptpackage.create_ucd_resource.result, "resource_id")}", "${var.ucd_user}" ]
  program_sensitive = ["-p", "${var.ucd_password}"]
  on_delete = true
}
