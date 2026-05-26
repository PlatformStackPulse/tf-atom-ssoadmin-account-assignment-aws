variable "instance_arn" {
  description = "ARN of the SSO instance"
  type        = string
  validation {
    condition     = length(var.instance_arn) > 0
    error_message = "instance_arn must not be empty."
  }
}

variable "permission_set_arn" {
  description = "ARN of the permission set to assign"
  type        = string
  validation {
    condition     = length(var.permission_set_arn) > 0
    error_message = "permission_set_arn must not be empty."
  }
}

variable "principal_id" {
  description = "ID of the principal (user or group)"
  type        = string
  validation {
    condition     = length(var.principal_id) > 0
    error_message = "principal_id must not be empty."
  }
}

variable "principal_type" {
  description = "Type of principal (USER or GROUP)"
  type        = string
  default     = "GROUP"
  validation {
    condition     = contains(["USER", "GROUP"], var.principal_type)
    error_message = "principal_type must be USER or GROUP."
  }
}

variable "target_account_id" {
  description = "AWS account ID to assign the permission set in"
  type        = string
  validation {
    condition     = can(regex("^\\d{12}$", var.target_account_id))
    error_message = "target_account_id must be a 12-digit AWS account ID."
  }
}
