module "Airflow_101221" {
    source = "./MWAA"
   /* CREATE INCLUDE Credentials in SystemVariables.tfvars file and call it upon a Terrform run
   After this is done upload the SystemVariables.tfvars to an S3 backend and encrypt using KMS
    access_key_id = "${var.access_key_id}"
    secret_key_id = "${var.secret_key_id}" */


    access_key_id = "${var.access_key_id}"
    secret_key_id = "${var.secret_key_id}"
    airflow_version = "1.10.12"
    account_id = "${var.account_id}"

    environment_name = "Development"
    internet_gateway_id = "ig-101221"

    private_subnet_cidrs = ["10.0.4.0/24","10.0.5.0/24", "10.0.6.0/24"]
    public_subnet_cidrs = ["10.0.1.0/24","10.0.2.0/24", "10.0.3.0/24"]
    region = "eu-west-1"
    source_bucket_arn = "arn:aws:s3:::MyMwaaBucket"
    vpc_id = "vpc-101221"
    networking_config = true

}

data aws_iam_policy_document "additional_execution_policy_doc" {
  statement {
    effect = "Allow"
    actions = [
      "<Your permissions>"
    ]
    resources = [
      "<YourResource>"]
  }
}

module "File_INPUT_S3" {

  source = "./S3"
  access_key_id = "${var.access_key_id}"
  secret_key_id = "${var.secret_key_id}"
  environment_name = "Development"
  s3_bucket_name = "DataInput131221"

}


module "File_OUTPUT_S3" {

  source = "./S3"
  access_key_id = "${var.access_key_id}"
  secret_key_id = "${var.secret_key_id}"
  environment_name = "Development"
  s3_bucket_name = "DataOutput131221"
 
}
