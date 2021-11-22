terraform {
  backend "s3" {
    bucket = "uttterraformbucket"
    key    = "uttterraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "utt-terraform-lock"
  }
}