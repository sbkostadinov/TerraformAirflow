resource "aws_mwaa_environment" "mwaa_dev" {
  airflow_configuration_options = var.airflow_configuration_options


  execution_role_arn = aws_iam_role.exec-role.arn
  name = var.environment_name
  max_workers = var.max_workers
  min_workers = var.min_workers
  environment_class = var.environment_class
  airflow_version = var.airflow_version

  source_bucket_arn = var.source_bucket_arn
  dag_s3_path = var.dag_s3_path
  plugins_s3_path = var.plugins_s3_path
  plugins_s3_object_version = var.plugins_s3_object_version
  requirements_s3_path = var.requirements_s3_path
  requirements_s3_object_version = var.requirements_s3_object_version


  logging_configuration {
    dag_processing_logs {
      enabled = true
      log_level = "INFO"
    }

    scheduler_logs {
      enabled = true
      log_level = "INFO"
    }

    task_logs {
      enabled = true  
      log_level = "INFO"
    }

    webserver_logs {
      enabled = true
      log_level = "INFO"
    }

    worker_logs {
      enabled = true
      log_level = "INFO"
    }
  }

  network_configuration {
    security_group_ids = [
      aws_security_group.mwaa_sg.id]
    subnet_ids = var.create_networking_config ? aws_subnet.private[*].id : var.private_subnet_ids
  }

  webserver_access_mode = var.webserver_access_mode

  tags = merge({
    Name = "mwaa-${var.environment_name}"
  }, var.tags)
}