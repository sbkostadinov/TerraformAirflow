# BE CAREFUL AND CHANGE EVERYTIME
access_key_id = "<ACCESS_KEY_ID>" # LAST CHANGED 12/12/2021
secret_key_id = "<SECRET_KEY>" # LAST CHANGED 12/12/2021

# General
airflow_version = "1.10.12"
account_id = "<IAM ACCOUNT ID>"
region = "eu-west-2"
environment_name = "Development221221"

# VPC
vpc_id = "vpc-1012214672510"
internet_gateway_id = "ig-101221885409"
route_table_pub_cidr = "0.0.0.0/0"
private_subnet_cidrs = ["10.0.4.0/24","10.0.5.0/24", "10.0.6.0/24"]
public_subnet_cidrs = ["10.0.1.0/24","10.0.2.0/24", "10.0.3.0/24"]
networking_config = true

# S3 for Airflow environment
source_bucket_arn = "arn:aws:s3:::MyMwaaBucket231221"
s3_bucket_name_in = "DevInp231221"
s3_bucket_name_out = "DevOutp231221"
