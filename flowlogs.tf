# resource "aws_flow_log" "VPC-FlowLogs" {
#   log_destination      = aws_s3_bucket.Terraformstate.arn
#   log_destination_type = "s3"
#   traffic_type         = "ALL"
#   vpc_id               = aws_vpc.Utthunga-VPC.id
# }