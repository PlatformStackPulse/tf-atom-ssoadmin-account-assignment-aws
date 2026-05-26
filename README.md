# tf-atom-ssoadmin-account-assignment-aws

[![CI](https://github.com/PlatformStackPulse/tf-atom-ssoadmin-account-assignment-aws/actions/workflows/ci.yml/badge.svg)](https://github.com/PlatformStackPulse/tf-atom-ssoadmin-account-assignment-aws/actions/workflows/ci.yml)
![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.6.0-blueviolet)

## Purpose

AWS SSO account assignment linking a permission set to a principal (user/group) in a target account.

## Module Documentation

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | git::https://github.com/PlatformStackPulse/tf-label.git | v1.0.0 |

### Resources

| Name | Type |
|------|------|
| [aws_ssoadmin_account_assignment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_account_assignment) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_arn"></a> [instance\_arn](#input\_instance\_arn) | ARN of the SSO instance | `string` | n/a | yes |
| <a name="input_permission_set_arn"></a> [permission\_set\_arn](#input\_permission\_set\_arn) | ARN of the permission set to assign | `string` | n/a | yes |
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | ID of the principal (user or group) | `string` | n/a | yes |
| <a name="input_target_account_id"></a> [target\_account\_id](#input\_target\_account\_id) | AWS account ID to assign the permission set in | `string` | n/a | yes |
| <a name="input_principal_type"></a> [principal\_type](#input\_principal\_type) | Type of principal (USER or GROUP) | `string` | `"GROUP"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the account assignment |
<!-- END_TF_DOCS -->
