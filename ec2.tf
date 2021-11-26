resource "aws_instance" "web-1" {
    count = 3 
    #ami = var.imagename
    ami = "ami-04902260ca3d33422"
    #ami = "${data.aws_ami.my_ami.id}"
    #availability_zone = "us-east-1a"
    instance_type = "t2.nano"
    key_name = "Orange Key"
    subnet_id = "${element(aws_subnet.public_subnets.*.id,count.index)}"
    vpc_security_group_ids = ["${aws_security_group.sg_allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "Server-${count.index+1}"
        Env = "Prod"
        Owner = "Pavan"
	CostCenter = "ABCD"
    }
}
