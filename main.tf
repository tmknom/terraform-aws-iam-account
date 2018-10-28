# Resource Configuration
#
# https://www.terraform.io/docs/configuration/resources.html

# There is only a single account alias per AWS account.
#
# https://www.terraform.io/docs/providers/aws/r/iam_account_alias.html
resource "aws_iam_account_alias" "default" {
  # Account aliases must be unique across AWS products, and must be alphanumeric following DNS naming conventions.
  # An alias must be lowercase, it must not start or end with a hyphen,
  # it cannot contain two consecutive hyphens, and it cannot be a 12-digit number.
  # Character Limits is 3 to 63.
  # https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html
  account_alias = "${var.account_alias}"
}
