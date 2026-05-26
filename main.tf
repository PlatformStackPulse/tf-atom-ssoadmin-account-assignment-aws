resource "aws_ssoadmin_account_assignment" "this" {
  count = local.enabled ? 1 : 0

  instance_arn       = var.instance_arn
  permission_set_arn = var.permission_set_arn

  principal_id   = var.principal_id
  principal_type = var.principal_type

  target_id   = var.target_account_id
  target_type = "AWS_ACCOUNT"
}
