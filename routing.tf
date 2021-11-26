resource "aws_route_table" "public-routing-table" {
    vpc_id = "${aws_vpc.Utthunga-VPC.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.Utthunga-IGW.id}"
    }

    tags = {
        Name = "Public-Routing-Table"
    }
}

resource "aws_route_table" "private-routing-table" {
    vpc_id = "${aws_vpc.Utthunga-VPC.id}"

    tags = {
        Name = "Private-Routing-Table"
    }
}

resource "aws_route_table_association" "public-rt-association" {
    count = 3
    subnet_id = "${element(aws_subnet.public_subnets.*.id,count.index)}"
    route_table_id = "${aws_route_table.public-routing-table.id}"
}

resource "aws_route_table_association" "private-rt-association" {
    count = 3
    subnet_id = "${element(aws_subnet.private_subnets.*.id,count.index)}"
    route_table_id = "${aws_route_table.private-routing-table.id}"
}