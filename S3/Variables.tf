
# general 

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

 

variable "airflow_version" {
    type = string
    description = "Airflow version to  be used"
    default = "2.0.2"
}
 

# Additional S3 buckets name variable
variable "s3_bucket_name" {
    type = string
    description = "Name of s3 bucket for the processed data"
}


variable "environment_name" {
    type = string
}

