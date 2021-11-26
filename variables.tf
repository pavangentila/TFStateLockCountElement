variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
# variable "public_subnet1_cidr" {}
# variable "public_subnet2_cidr" {}
# variable "public_subnet3_cidr" {}
# variable "public_subnet1_name" {}
# variable "public_subnet2_name" {}
# variable "public_subnet3_name" {}
variable "environment" {}
variable "public_subnets" {
    type = list
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "public_cidrs" {
    type = list
    default = ["10.50.1.0/24", "10.50.2.0/24", "10.50.3.0/24"]
}

variable "private_subnets" {
    type = list
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "private_cidrs" {
    type = list
    default = ["10.50.40.0/24", "10.50.50.0/24", "10.50.60.0/24"]
}