resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "utt-terraform-lock"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
      name = "DynamoDB terraform state lock"
  }
}