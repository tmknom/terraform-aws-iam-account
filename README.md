# terraform-aws-iam-account

[![CircleCI](https://circleci.com/gh/tmknom/terraform-aws-iam-account.svg?style=svg)](https://circleci.com/gh/tmknom/terraform-aws-iam-account)
[![GitHub tag](https://img.shields.io/github/tag/tmknom/terraform-aws-iam-account.svg)](https://registry.terraform.io/modules/tmknom/iam-account/aws)
[![License](https://img.shields.io/github/license/tmknom/terraform-aws-iam-account.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module which creates Account Alias and Account Password Policy resources on AWS.

## Description

Provision [Account Alias](https://docs.aws.amazon.com/IAM/latest/UserGuide/console_account-alias.html)
and [Account Password Policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_account-policy.html).
This module provides recommended settings.

- Define a minimum password length of at least 16 characters
- Require lowercase characters, uppercase characters, numbers, symbols in the password
- Avoid periodic policy of password changes
- Prevent password reuse

## Usage

### Minimal

```hcl
module "iam_account" {
  source        = "git::https://github.com/tmknom/terraform-aws-iam-account.git?ref=tags/1.0.0"
  account_alias = "minimal"
}
```

### Complete

```hcl
module "iam_account" {
  source        = "git::https://github.com/tmknom/terraform-aws-iam-account.git?ref=tags/1.0.0"
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
```

## Examples

- [Minimal](https://github.com/tmknom/terraform-aws-iam-account/tree/master/examples/minimal)
- [Complete](https://github.com/tmknom/terraform-aws-iam-account/tree/master/examples/complete)

## Inputs

| Name                           | Description                                                                                                                         |  Type  | Default | Required |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------- | :----: | :-----: | :------: |
| account_alias                  | The account alias.                                                                                                                  | string |    -    |   yes    |
| allow_users_to_change_password | Whether to allow users to change their own password.                                                                                | string | `true`  |    no    |
| hard_expiry                    | Whether users are prevented from setting a new password after their password has expired.                                           | string | `false` |    no    |
| max_password_age               | The number of days that an user password is valid. If specify 0, then passwords never expire.                                       | string |   `0`   |    no    |
| minimum_password_length        | Minimum length to require for user passwords.                                                                                       | string |  `16`   |    no    |
| password_reuse_prevention      | The number of previous passwords that users are prevented from reusing. If specify 0, then allowed from reusing previous passwords. | string |  `24`   |    no    |
| require_lowercase_characters   | Whether to require lowercase characters for user passwords.                                                                         | string | `true`  |    no    |
| require_numbers                | Whether to require numbers for user passwords.                                                                                      | string | `true`  |    no    |
| require_symbols                | Whether to require symbols for user passwords.                                                                                      | string | `true`  |    no    |
| require_uppercase_characters   | Whether to require uppercase characters for user passwords.                                                                         | string | `true`  |    no    |

## Outputs

| Name                                         | Description                                        |
| -------------------------------------------- | -------------------------------------------------- |
| iam_account_password_policy_expire_passwords | Indicates whether passwords in the account expire. |

## Development

### Requirements

- [Docker](https://www.docker.com/)

### Configure environment variables

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=ap-northeast-1
```

### Installation

```shell
git clone git@github.com:tmknom/terraform-aws-iam-account.git
cd terraform-aws-iam-account
make install
```

### Makefile targets

```text
check-format                   Check format code
cibuild                        Execute CI build
clean                          Clean .terraform
docs                           Generate docs
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
release                        Release GitHub and Terraform Module Registry
terraform-apply-complete       Run terraform apply examples/complete
terraform-apply-minimal        Run terraform apply examples/minimal
terraform-destroy-complete     Run terraform destroy examples/complete
terraform-destroy-minimal      Run terraform destroy examples/minimal
terraform-plan-complete        Run terraform plan examples/complete
terraform-plan-minimal         Run terraform plan examples/minimal
upgrade                        Upgrade makefile
```

### Releasing new versions

Bump VERSION file, and run `make release`.

### Terraform Module Registry

- <https://registry.terraform.io/modules/tmknom/iam-account/aws>

## License

Apache 2 Licensed. See LICENSE for full details.
