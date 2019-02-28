#####################################################################
##
##      Created 2/28/19 by ucdpadmin. For Cloud cmh-vra for camc-sp-python
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

resource "camc_scriptpackage" "create_efs_export" {
  program = ["/usr/bin/python", "${path.module}/scripts/test_python.py"]
  on_create = true
}

