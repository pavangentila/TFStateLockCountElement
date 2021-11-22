resource "aws_s3_bucket" "Terraformstate" {
  bucket = "uttremotestate"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

   depends_on = [
    aws_vpc.Utthunga-VPC
  ]
}