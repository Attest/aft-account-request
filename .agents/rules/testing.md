# Testing Rules

## Validation

This repository has no unit tests in the traditional sense. Validation is performed via:

1. **`terraform validate`** -- Ensures HCL syntax and configuration are valid. Run via pre-commit.
2. **`terraform_tflint`** -- Lints Terraform files for errors, best practices, and provider-specific issues. Run via pre-commit.
3. **`terraform_trivy`** -- Scans for security misconfigurations. Run via pre-commit.

## Running Checks Locally

```bash
# Using mise task (runs all pre-commit hooks)
mise run precommit

# Or directly
pre-commit run --all-files
```

## Before Submitting Changes

- Run `mise run precommit` and ensure all hooks pass.
- Verify that new account modules have all required variables populated:
  - `control_tower_parameters` (all 6 fields)
  - `account_tags` (at minimum `Name` and `ManagedBy`)
  - `change_management_parameters` (`change_requested_by`, `change_reason`)
  - `account_customizations_name`
- Verify the `AccountEmail` is unique across all modules (it serves as the DynamoDB hash key).

## AFT Pipeline Validation

The AFT pipeline (AWS CodePipeline) runs `terraform plan` and `terraform apply` in the AFT management account. Changes merged to main are automatically picked up by the pipeline.
