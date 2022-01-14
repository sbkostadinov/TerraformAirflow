
resource "aws_vpc" "airflow_vpc" {
  cidr_block = "${var.vpc_cidr}"
  tags = {
    Name = "${var.environment_name}-vpc"
    Environment = "${var.environment_name}"
  }
}