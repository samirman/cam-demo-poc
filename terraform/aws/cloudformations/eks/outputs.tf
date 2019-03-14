#####################################################################
##
##      Created 3/7/19 by admin. for eks
##
#####################################################################

output "kube_api_endpoint" {
  value = "${aws_cloudformation_stack.eks-cfn.outputs["APIEndpoint"]}"
}

output "cluster_arn" {
  value = "${aws_cloudformation_stack.eks-cfn.outputs["ClusterARN"]}"
}

output "cloudformations_stack_id" {
  value = "${aws_cloudformation_stack.eks-cfn.id}"
}

output "cloudformations_stack_name" {
  value = "eks-${random_pet.stack_id.id}"
}
