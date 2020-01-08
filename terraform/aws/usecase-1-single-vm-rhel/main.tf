#####################################################################
##
##      Created 1/9/19 by slightly_more_obscure_admin. for usecase-1-single-vm-rhel
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

data "aws_security_group" "group_name" {
  name = "${var.security_group_name}"
  vpc_id = "${var.vpc_id}"
}

resource "aws_instance" "test-rhel-vm" {
  ami = "${var.test-rhel-vm_ami}"
  key_name = "${var.aws_key_pair_name}"  # Generated
  instance_type = "${var.test-rhel-vm_aws_instance_type}"
  subnet_id  = "${data.aws_subnet.subnet.id}"
  vpc_security_group_ids = ["${data.aws_security_group.group_name.id}"]
  tags = "${merge(
    module.camtags.tagsmap,
    map(
      "Name", "${var.test-rhel-vm_name}"
    )
  )}"
}


# Create 0-4 additional volumes
resource "aws_ebs_volume" "extra-volumes" {
  count             = "${var.volume_count}"
  availability_zone = "${var.availability_zone}"
  size              = "${var.volume_size}"
  type              = "gp2"
  tags = "${merge(
    module.camtags.tagsmap,
    map(
      "Name", "volume"
    )
  )}"
}

# TODO make the device names a variable or local
resource "aws_volume_attachment" "test-rhel-vm_volume_name_volume_attachment" {
  count             = "${var.volume_count}"
  device_name = "${element(split(",", "/dev/sdb,/dev/sdc,/dev/sdd,/dev/sde"), count.index)}"
  volume_id =   "${element(aws_ebs_volume.extra-volumes.*.id, count.index)}"
  instance_id = "${aws_instance.test-rhel-vm.id}"
}

module "camtags" {
  source = "./Modules/camtags"
}
