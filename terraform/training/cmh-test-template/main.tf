#####################################################################
##
##      Created 1/21/19 by admin. for cmh-test-template
##
#####################################################################

## REFERENCE {"ref-vpc":{"type": "aws_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "aws" {
  version = "~> 1.8"
}

data "aws_subnet" "subnet" {
  vpc_id = "${var.vpc_id}"
  availability_zone = "${var.availability_zone}"
}

resource "aws_instance" "cmh-citi-vm" {
  ami = "${var.cmh-citi-vm_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.cmh-citi-vm_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id  = "${data.aws_subnet.subnet.id}"
  tags {
    Name = "${var.cmh-citi-vm_name}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "aws_key_pair" "auth" {
    key_name = "key-${random_pet.citi-pet.id}"  # random_pet
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

resource "random_pet" "citi-pet" {
}
