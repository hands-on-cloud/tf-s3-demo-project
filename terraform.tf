 terraform {
   backend "s3" {
     encrypt        = true
     bucket         = "hands-on-cloud-tf-remote-state" #* replace with remote_state_bucket name
     dynamodb_table = "hands-on-cloud-tf-locks" #* replace with tf_locks_table name
     region         = "us-east-2" #* replace with deployment region
     key            = "tf-infrastructure/PROD/terraform.tfstate" #* replace with name of the repo which will define all pipelines
     kms_key_id     = "arn:aws:kms:us-east-2:585584209241:key/2e919a03-5d7e-4e54-a373-df7b2314c7b4" #* replace with cmk_arn
   }
 }
