#####################################################################
##
##      Created 3/7/19 by admin. for eks
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

resource "aws_cloudformation_stack" "eks-cfn" {
  name = "eks-${random_pet.stack_id.id}"
  parameters = {
    RoleARN = "${var.role_arn}"
    ClusterName = "${var.cluster-name}"
    SubnetA = "${var.subnet_a}"
    SubnetB = "${var.subnet_b}"
    SecurityGroup = "${var.sec_group}"
    Version = "${var.version}"
  }
  template_body = "${file("${path.module}/templates/eks-template.json")}"
}

# Random string to use for stack names
resource "random_pet" "stack_id" {
}
