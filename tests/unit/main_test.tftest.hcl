# Unit Tests for tf-atom-ssoadmin-account-assignment-aws
#
# These tests use a mock AWS provider — no real AWS calls are made.
# They assert only on plan-KNOWN values (tf-label id, resource count,
# and input pass-throughs), never on computed attributes like the
# assignment id/arn which are unknown under a mock provider.
#
# Run with:      terraform test -test-directory=tests/unit
# Run verbose:   terraform test -test-directory=tests/unit -verbose

mock_provider "aws" {}

variables {
  # tf-label identity inputs
  namespace = "eg"
  stage     = "test"
  name      = "thing"

  # Module-specific required inputs (valid sample values)
  instance_arn       = "arn:aws:sso:::instance/ssoins-0123456789abcdef"
  permission_set_arn = "arn:aws:sso:::permissionSet/ssoins-0123456789abcdef/ps-0123456789abcdef"
  principal_id       = "11111111-2222-3333-4444-555555555555"
  principal_type     = "GROUP"
  target_account_id  = "123456789012"
}

# ---------------------------------------------------------------------------
# Test: module creates the assignment when enabled (default)
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  # tf-label id is known at plan time: namespace-stage-name => "eg-test-thing"
  assert {
    condition     = module.this.id == "eg-test-thing"
    error_message = "tf-label id should be 'eg-test-thing' for namespace=eg, stage=test, name=thing."
  }

  # Exactly one account assignment resource is planned when enabled.
  assert {
    condition     = length(aws_ssoadmin_account_assignment.this) == 1
    error_message = "Expected exactly one aws_ssoadmin_account_assignment when enabled."
  }

  # Input pass-throughs are known at plan time.
  assert {
    condition     = aws_ssoadmin_account_assignment.this[0].target_id == "123456789012"
    error_message = "target_id should pass through the target_account_id input."
  }

  assert {
    condition     = aws_ssoadmin_account_assignment.this[0].target_type == "AWS_ACCOUNT"
    error_message = "target_type should be AWS_ACCOUNT."
  }
}

# ---------------------------------------------------------------------------
# Test: module creates nothing when disabled
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = length(aws_ssoadmin_account_assignment.this) == 0
    error_message = "No account assignment should be planned when enabled = false."
  }

  assert {
    condition     = output.id == null
    error_message = "id output should be null when the module is disabled."
  }
}
