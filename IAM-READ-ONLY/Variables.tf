variable "tags" {
    type = map(string)
    default = {}
}

variable "environment_name" {
    type = string
    description = "Name of MWA environment"
}
 