terraform {
  backend "s3" {
    bucket = "uttterraformbucket"
    key    = "uttterraform.tfstate"
    region = "us-east-1"
    acl    = "bucket-owner-full-control"
    dynamodb_table = "utt-terraform-lock"
  }
}