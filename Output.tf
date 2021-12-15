output "mwaa_arn" {
  value = module.Airflow_101221.mwaa_arn
}

# Names of Data Input and Output S3 buckets 
output "S3_bucket_datainput_id" {
  value = module.File_INPUT_S3.s3_file_storage_id
}

output "S3_bucket_dataoutput_id" {
  value = module.File_OUTPUT_S3.s3_file_storage_id
}

output "S3_bucket_datainput_arn" {
  value = module.File_INPUT_S3.s3_file_storage_arn
}

output "S3_bucket_dataoutput_arn" {
  value = module.File_OUTPUT_S3.s3_file_storage_arn
}
