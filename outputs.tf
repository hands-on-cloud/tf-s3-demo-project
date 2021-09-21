output "bucket_id" {
  description = "The name of the bucket."
  value       =  aws_s3_bucket.test.id
}