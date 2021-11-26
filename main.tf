#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

resource "aws_subnet" "public_subnets" {
    count = 3
    vpc_id = "${aws_vpc.Utthunga-VPC.id}"
    cidr_block = "${element(var.public_cidrs, count.index)}"
    availability_zone = "${element(var.public_subnets, count.index)}"

    tags = {
        Name = "Public-Subnet-${count.index+1}"
    }

    # depends_on = [
    # aws_flow_log.VPC-FlowLogs,
    # aws_internet_gateway.Utthunga-IGW
    # ]
}

resource "aws_subnet" "private_subnets" {
    count = 3
    vpc_id = "${aws_vpc.Utthunga-VPC.id}"
    cidr_block = "${element(var.private_cidrs, count.index)}"
    availability_zone = "${element(var.private_subnets, count.index)}"

    tags = {
        Name = "Private-Subnet-${count.index+1}"
    }

    # depends_on = [
    # aws_flow_log.VPC-FlowLogs,
    # aws_internet_gateway.Utthunga-IGW
    # ]
}