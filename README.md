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

Named `terraform-<PROVIDER>-<NAME>`. Module repositories must use this three-part name format.

```sh
curl -fsSL https://raw.githubusercontent.com/tmknom/terraform-aws-iam-account/master/install | sh -s terraform-aws-sample
cd terraform-aws-sample && make install
```

## Examples

- [Minimal](https://github.com/tmknom/terraform-aws-iam-account/tree/master/examples/minimal)
- [Complete](https://github.com/tmknom/terraform-aws-iam-account/tree/master/examples/complete)

## Inputs

Write your Terraform module inputs.

## Outputs

Write your Terraform module outputs.

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
