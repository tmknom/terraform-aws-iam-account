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

# There is only a single policy allowed per AWS account.
# An existing policy will be lost when using this resource as an effect of this limitation.
#
# https://www.terraform.io/docs/providers/aws/r/iam_account_password_policy.html
# https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_account-policy.html
resource "aws_iam_account_password_policy" "default" {
  # You can permit all IAM users in your account to use the IAM console to change their own passwords
  allow_users_to_change_password = "${var.allow_users_to_change_password}"

  # You can specify the minimum number of characters allowed in an IAM user password.
  # You can type any number from 6 to 128.
  minimum_password_length = "${var.minimum_password_length}"

  # You can require that IAM user passwords contain at least one lowercase character
  # from the ISO basic Latin alphabet (a to z).
  require_lowercase_characters = "${var.require_lowercase_characters}"

  # You can require that IAM user passwords contain at least one numeric character (0 to 9).
  require_numbers = "${var.require_numbers}"

  # You can require that IAM user passwords contain at least one of the following nonalphanumeric characters:
  # ! @ # $ % ^ & * ( ) _ + - = [ ] { } | '
  require_symbols = "${var.require_symbols}"

  # You can require that IAM user passwords contain at least one uppercase character
  # from the ISO basic Latin alphabet (A to Z).
  require_uppercase_characters = "${var.require_uppercase_characters}"

  # You can set IAM user passwords to be valid for only the specified number of days.
  # You can choose a password expiration period between 1 and 1095 days, inclusive.
  # If specify 0, then passwords never expire.
  max_password_age = "${var.max_password_age}"
}
