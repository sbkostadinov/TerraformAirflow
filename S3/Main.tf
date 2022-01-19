resource "aws_s3_bucket" "file_storage" {
    bucket = "${var.environment_name}-${var.s3_bucket_name}"
    acl = "private"
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm     = "AES256"
            }
        }
    }

    versioning {
        enabled = true
    }

    tags = {
        Name = "${var.environment_name}-${var.s3_bucket_name}"
        Environment = var.environment_name
    }


}



resource "aws_s3_bucket_public_access_block" "file_storage_access"{
    bucket = "${var.environment_name}-${var.s3_bucket_name}"
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}