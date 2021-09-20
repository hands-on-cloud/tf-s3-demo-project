resource "aws_kms_key" "this" {
  description             = "Used to encrypt files in s3 bucket"
  enable_key_rotation     = true
  deletion_window_in_days = 30
  is_enabled              = true
  tags                    = local.common_tags

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Allow account admin of the key",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
POLICY

}