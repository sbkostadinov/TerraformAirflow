# general 

variable "region" {
    type = string
    description = "AWS region where the environment and its resources will be created"
}

variable "environment_name" {
    type = string
    description = "Name of MWA environment"
}
 
variable "account_id" {
    type = string
    description = "Account ID of the account in which MWAA will be started"
}
 

variable "airflow_version" {
    type = string
    description = "Airflow version to  be used"
    default = "2.0.2"
}


variable "access_key_id" {
    type = string
    description = "IAM User ACCESS KEY ID"
    sensitive = true
}

variable "secret_key_id" {
    type = string
    description = "IAM User SECRET ACCESS KEY"
    sensitive = true
}


variable "webserver_access_mode" {
    type = string
    description = "Default: PRIVATE_ONLY"
    

} 


# networking variables
variable "vpc_id" {
    description = "ID of the VPC in which environment resources are created"
}

variable "route_table_pub_cidr" {
    type = string
    description = "Custom CIDR block for public route table"
}

variable "route_table_priv_cidr" {
    type = string
    description = "Custom CIDR block for private route table"
}

variable "internet_gateway_id" {
    description = "ID of the VPC in which environment resource are created"
}

variable "networking_config" {
    description = "Set to true if networking resources (subnets, eip, NAT Gateway and route table) need to be created"
}

variable "public_subnet_cidrs" {
    description = "CIDR blocks for the public subnets used by MWAA. Must be at least 2 if networking_config = true"
    type = list(string)
    default = []
}

variable "private_subnet_cidrs" {
    description = "CIDR blocks for the private subnets used by MWAA. Must be at least 2 if networking_config = true"
    type = list(string)
    default = []
}

variable "private_subnet_ids" {
    description = "ID of the private subnets created by MWAA  if networking_config = false"
    type = list(string)
    default = []
}

variable "create_networking_config" {
  description = "true if networking resources (subnets, eip, NAT gateway and route table) should be created."
  type = bool
  default = true
}

variable "sg_ingress_cidr" {
    type = list(string)
    description = "CIDR block for ingress for Networking/ VPC security group"
}

variable "sg_egress_cidr" {
    type = list(string)
    description = "CIDR block for egress for Networking/ VPC security group"
}

# s3 configuration

variable "source_bucket_arn" {
    type = string
    description = "ARN of s3 bucket which hosts DAGS, Plugins"

}

variable "dag_s3_path" {
    type = string
    description = "Relative path of the dags folder within the source bucket"
    default = "/dags"

}

variable "plugins_s3_path" {
    type = string
    description = "Relative path of the plugins.zip within the source bucket"
    default = null

}

variable "plugins_s3_object_version" {
    default = null

}


variable "requirements_s3_object_version" {
    default = null
}

variable "requirements_s3_path" {
    type = string
    description = "relative path of the requirements.txt (incl filename) within the source bucket"
    default = null
}

# airflow.cfg values

variable "airflow_configuration_options" {
    type = map(string)
    description = "additional airflow configuration options"
    default = {}
}


variable "weekly_maintenance_window_start" {
    type = string
    description = "Start date of the maintanance window for the mwaa environment"
}




# IAM

variable "additional_execution_role_policy_document_json" {
  description = "Additional permissions to attach to the base mwaa execution role"
  type = string
  default = "{}"
}


variable "max_workers" {
    type = number
    default = "10"
}

variable "min_workers" {
    type = number
    default = "1"
}

variable "environment_class" {
    default = "mw1.small"
}


variable "tags" {
    type = map(string)
    default = {}
}