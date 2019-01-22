#####################################################################
##
##      Created 1/22/19 by admin. for foo-project
##
#####################################################################

output "public_ip" {
  value = "${aws_instance.foo-instance.public_ip}"
}

output "instance_id" {
  value = "${aws_instance.foo-instance.id}"
}

