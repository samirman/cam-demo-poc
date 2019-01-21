#####################################################################
##
##      Created 1/21/19 by admin. for cmh-test-template
##
#####################################################################

output "public IP address" {
  value = "${aws_instance.cmh-citi-vm.public_ip}"
}

output "pet_name" {
  value = "${random_pet.citi-pet.id}"
}


