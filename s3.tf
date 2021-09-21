resource "aws_s3_bucket" "test" {
  bucket = var.name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.this.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  lifecycle {
    prevent_destroy = false
  }

  tags = local.common_tags
}

resource "aws_s3_bucket_public_access_block" "s3Public_test" {
  depends_on              = [aws_s3_bucket_policy.test]
  bucket                  = aws_s3_bucket.test.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "test" {
  bucket = aws_s3_bucket.test.id

  policy = <<POLICY
{
    "Version": "2008-10-17",
    "Statement": [
          {
            "Sid": "AllowedAccess",
            "Effect": "allow",
            "Principal": {
                "AWS": "arn:aws:iam::585584209241:root"
            },
            "Action": "s3:*",
            "Resource": [
                "${aws_s3_bucket.test.arn}",
                "${aws_s3_bucket.test.arn}/*"
            ]
        },  
        {
            "Sid": "DenyInsecureAccess",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "${aws_s3_bucket.test.arn}",
                "${aws_s3_bucket.test.arn}/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        },
        {
            "Sid": "EnforceEncryption",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": [
                "${aws_s3_bucket.test.arn}/*"
            ],
            "Condition": {
                "StringNotEquals": {
                    "s3:x-amz-server-side-encryption": "aws:kms"
                }
            }
        }
    ]
}
POLICY

}