# Name of Additional buckets

output "s3_file_storage_id" {
    value = aws_s3_bucket.file_storage.id
}



# Arn of additional s3 buckets
output "s3_file_storage_arn" {
    value = aws_s3_bucket.file_storage.arn
}
