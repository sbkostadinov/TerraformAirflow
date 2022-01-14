# BE CAREFUL AND CHANGE EVERYTIME
access_key_id =  "<ACCESS_KEY_ID>" # LAST CHANGED 01/04/2022
secret_key_id =  "<SECRET_KEY>" # LAST CHANGED 01/04/2022

# General
airflow_version = "1.10.12"     #CHANGE
account_id =  "<IAM ACCOUNT ID>" #CHANGE
region = "eu-west-1"            #CHANGE
environment_name = "Development221221" #CHANGE

# VPC
vpc_id = "vpc-fake123"
vpc_cidr = "10.0.0.0/24"                  #CHANGE   
internet_gateway_id = "ig-101221885409"   #CHANGE
route_table_pub_cidr = "0.0.0.0/0"
route_table_priv_cidr = "0.0.0.0/80"       #CHANGE
private_subnet_cidrs = ["10.0.4.0/24"]     # Specifies how many private subnets, route tables and table associations will be created CHANGE
public_subnet_cidrs = ["10.0.1.0/24","10.0.2.0/24"]  # Specifies how many public subnets, route tables and table associations will be created CHANGE
networking_config = true
webserver_access_mode = "PUBLIC_ONLY" # SHOULD THIS BE PRIVATE_ONLY ?
weekly_maintenance_window_start = "04/01/21" # LAST CHANGED 04/01/22
sg_ingress_cidr = ["0.0.0.0/0"]
sg_egress_cidr = ["0.0.0.0/0"]

# S3 for Airflow environment
source_bucket_arn = "arn:aws:s3:::MyMwaaBucket231221"   #CHANGE
s3_bucket_name_in = "DevInp231221"                      #CHANGE
s3_bucket_name_out = "DevOutp231221"                    #CHANGE
