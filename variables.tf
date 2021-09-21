 variable "DEPLOY_ROLE" {} # TODO: uncomment line after seed deployment

variable "PROJECT" {
  type        = string
  description = "should be lowercase with words separated by hyphens -"
  default     = "hands-on-cloud" # do not change after setting to first value
}

data "aws_caller_identity" "current" {}

variable "with_policy" {
    type = string
}

variable "tag_bucket_name" {
    type = string
}

variable "tag_bucket_environment" {
    type = string
}