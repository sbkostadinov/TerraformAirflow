variable "tags" {
    type = map(string)
    default = {}
}

variable "environment_name" {
    type = string
    description = "Name of MWA environment"
}
 
 variable "mwaa_env_arn" {
    type = string
    description = "ARN of MWAA Environment"
}