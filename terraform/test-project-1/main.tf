#####################################################################
##
##      Created 1/21/19 by admin. for test-project-1
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

data "aws_security_group" "group_name" {
  name = "${var.group_name}"
  vpc_id = "${var.vpc_id}"
}

resource "aws_instance" "test-instance" {
  ami = "${var.test-instance_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.test-instance_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id  = "${data.aws_subnet.subnet.id}"
  vpc_security_group_ids = ["${data.aws_security_group.group_name.id}"]
  tags {
    Name = "${var.test-instance_name}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "aws_key_pair" "auth" {
    key_name = "${var.aws_key_pair_name}"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

resource "aws_ebs_volume" "testprojvol1" {
    availability_zone = "${var.availability_zone}"
    size              = "${var.testprojvol1_volume_size}"
}

resource "aws_volume_attachment" "test-instance_testprojvol1_volume_attachment" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.testprojvol1.id}"
  instance_id = "${aws_instance.test-instance.id}"
}