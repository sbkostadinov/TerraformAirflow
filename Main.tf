

module "Airflow_231221" {
    source = "./MWAA"
   /* CREATE INCLUDE Credentials in SystemVariables.tfvars file and call it upon a Terrform run
   After this is done upload the SystemVariables.tfvars to an S3 backend and encrypt using KMS
    access_key_id = "${var.access_key_id}"
    secret_key_id = "${var.secret_key_id}" */


    access_key_id = "${var.access_key_id}"
    secret_key_id = "${var.secret_key_id}"
    airflow_version = var.airflow_version
    account_id = "${var.account_id}"

    environment_name = "${var.environment_name}"
    route_table_pub_cidr = "${var.route_table_pub_cidr}"
    route_table_priv_cidr = "${var.route_table_priv_cidr}"
    internet_gateway_id = "${var.internet_gateway_id}"
    private_subnet_cidrs = var.private_subnet_cidrs
    public_subnet_cidrs = var.public_subnet_cidrs
    region = "${var.region}"
    source_bucket_arn = "${var.source_bucket_arn}"
    vpc_id = "${var.vpc_id}"
    networking_config = true
    webserver_access_mode = "${var.webserver_access_mode}"
    weekly_maintenance_window_start = "${var.weekly_maintenance_window_start}"
    sg_ingress_cidr = var.sg_ingress_cidr
    sg_egress_cidr = var.sg_egress_cidr

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
  environment_name = "${var.environment_name}"
  s3_bucket_name = "${var.s3_bucket_name_in}"
 

}


module "File_OUTPUT_S3" {

  source = "./S3"
  access_key_id = "${var.access_key_id}"
  secret_key_id = "${var.secret_key_id}"
  environment_name = "${var.environment_name}"
  s3_bucket_name = "${var.s3_bucket_name_out}"
 
}
