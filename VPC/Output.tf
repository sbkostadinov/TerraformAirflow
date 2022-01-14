output "arn" {
    description = "Amazon Resource Name (ARN) of VPC"
    value = aws_vpc.airflow_vpc.arn
}


output "id" {
    description = "The ID of the VPC"
    value = aws_vpc.airflow_vpc.id
}