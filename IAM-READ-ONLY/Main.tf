resource "aws_iam_role" "mwaa_read_only" {
    name = "mwaa_read_only"
    
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = [
                "airflow:ListEnvironments",
                "airflow:GetEnvironment",
                "airflow:ListTagsForResource"
                ]   
                Effect = "Allow"
                Resource = "*"
            },
        ]
    })

    tags = {
        Name = "${var.environment_name}-mwaa-read-access-role"
        Environment = "${var.environment_name}"
    }
}