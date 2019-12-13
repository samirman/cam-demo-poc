#####################################################################
##
##      Created 12/13/19 by admin. for demo-project-1213
##
#####################################################################

## REFERENCE {"existing-vpc":{"type": "aws_reference_network"}}

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

resource "aws_instance" "demo-instance" {
  ami = "${var.demo-instance_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.demo-instance_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id  = "${data.aws_subnet.subnet.id}"
  tags {
    Name = "${var.demo-instance_name}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "aws_key_pair" "auth" {
    key_name = "${var.aws_key_pair_name}"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

resource "aws_ebs_volume" "volume_name" {
    availability_zone = "${var.availability_zone}"
    size              = "${var.volume_name_volume_size}"
}

resource "aws_volume_attachment" "demo-instance_volume_name_volume_attachment" {
  device_name = "/dev/xvda"
  volume_id   = "${aws_ebs_volume.volume_name.id}"
  instance_id = "${aws_instance.demo-instance.id}"
}