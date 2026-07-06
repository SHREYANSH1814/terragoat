resource "alicloud_oss_bucket" "bad_bucket" {
  bucket = "wildwestfreeforall"
  acl    = "public-read-write"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "KMS"
        kms_master_key_id = "your-cmk-id"  # Replace with your actual Customer Master Key ID
      }
    }
  }

  tags = {
    git_commit           = "9c114f23d311f787c137723e1f71b27a52f0adec"
    git_file             = "terraform/alicloud/bucket.tf"
    git_last_modified_at = "2022-04-05 15:17:55"
    git_last_modified_by = "james.woolfenden@gmail.com"
    git_modifiers        = "james.woolfenden"
    git_org              = "bridgecrewio"
    git_repo             = "terragoat"
    yor_trace            = "80373049-248d-4f5e-9d25-740c3e80f2b9"
  }
}
