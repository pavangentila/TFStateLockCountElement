resource "aws_vpc" "Utthunga-VPC" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags = {
        Name = "${var.vpc_name}"
	    Owner = "Pavan Kumar C"
	#environment = "${var.environment}"
    }
}

resource "aws_internet_gateway" "Utthunga-IGW" {
    vpc_id = "${aws_vpc.Utthunga-VPC.id}"
	tags = {
        Name = "${var.IGW_name}"
    }
}