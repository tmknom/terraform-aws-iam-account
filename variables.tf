# Input Variable Configuration
#
# https://www.terraform.io/docs/configuration/variables.html

variable "account_alias" {
  type        = "string"
  description = "The account alias."
}

variable "allow_users_to_change_password" {
  default     = true
  type        = "string"
  description = "Whether to allow users to change their own password."
}

variable "minimum_password_length" {
  default     = 6
  type        = "string"
  description = "Minimum length to require for user passwords."
}

variable "require_lowercase_characters" {
  default     = true
  type        = "string"
  description = "Whether to require lowercase characters for user passwords."
}

variable "require_numbers" {
  default     = true
  type        = "string"
  description = "Whether to require numbers for user passwords."
}

variable "require_symbols" {
  default     = true
  type        = "string"
  description = "Whether to require symbols for user passwords."
}

variable "require_uppercase_characters" {
  default     = true
  type        = "string"
  description = "Whether to require uppercase characters for user passwords."
}
