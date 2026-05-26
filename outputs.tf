output "id" {
  description = "ID of the account assignment"
  value       = try(aws_ssoadmin_account_assignment.this[0].id, null)
}
