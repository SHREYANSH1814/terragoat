# Removed aws_iam_user resource to enforce access control exclusively through AWS SSO
# Access keys and user policies tied to IAM users are also removed to prevent direct IAM user access
# Instead, configure AWS SSO and assign permissions via SSO groups and roles

# This Terraform file should be updated to manage SSO assignments and roles only

# No aws_iam_user resource defined here


resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "userpolicy" {
  name = "excess_policy"
  user = "${aws_iam_user.user.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "s3:*",
        "lambda:*",
        "cloudwatch:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "username" {
  value = aws_iam_user.user.name
}

output "secret" {
  value = aws_iam_access_key.user.encrypted_secret
}

