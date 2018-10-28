module "iam_account" {
  source        = "../../"
  account_alias = "complete"

  allow_users_to_change_password = true
  minimum_password_length        = 32
  require_lowercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  require_uppercase_characters   = true
  max_password_age               = 0
  hard_expiry                    = false
  password_reuse_prevention      = 0
}
