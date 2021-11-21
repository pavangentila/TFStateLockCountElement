#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

resource "aws_subnet" "subnet1-public" {
    vpc_id = "${aws_vpc.Utthunga-VPC.id}"
    cidr_block = "${var.public_subnet1_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "${var.public_subnet1_name}"
    }

    depends_on = [
    aws_flow_log.VPC-FlowLogs,
    aws_internet_gateway.Utthunga-IGW
    ]
}

resource "aws_subnet" "subnet2-public" {
    vpc_id = "${aws_vpc.Utthunga-VPC.id}"
    cidr_block = "${var.public_subnet2_cidr}"
    availability_zone = "us-east-1b"

    tags = {
        Name = "${var.public_subnet2_name}"
    }
    depends_on = [
    aws_flow_log.VPC-FlowLogs,
    aws_subnet.subnet1-public
    ]
}

resource "aws_subnet" "subnet3-public" {
    vpc_id = "${aws_vpc.Utthunga-VPC.id}"
    cidr_block = "${var.public_subnet3_cidr}"
    availability_zone = "us-east-1c"

    tags = {
        Name = "${var.public_subnet3_name}"
    }
	depends_on = [
    aws_flow_log.VPC-FlowLogs,
    aws_subnet.subnet2-public
    ]
}