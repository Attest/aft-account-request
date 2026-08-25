# Security Rules

## Sensitive Data

- **Never** commit `.tfvars` files. They are gitignored and may contain secrets.
- **Never** commit `.tfstate` files. State is stored remotely in S3 with KMS encryption.
- **Never** commit `backend.tf` or `providers.tf`. These are auto-generated from Jinja templates by AFT at runtime.
- Email addresses in `control_tower_parameters` are organizational emails, not personal. This is acceptable for account provisioning.

## Terraform Security

- **Trivy scanning** is enforced via pre-commit (`terraform_trivy` hook). All findings must be resolved before merging.
- **TFLint** catches common misconfigurations.
- The AWS provider assumes an IAM role (`aft_admin_role_arn`) with least-privilege scoping managed by AFT.
- Backend state is encrypted at rest (S3 + KMS) and uses DynamoDB for state locking.

## Access Control

- This repository provisions AWS accounts via Control Tower. Changes have high blast radius.
- All changes should go through pull request review.
- The `SSOUserEmail` field determines the initial SSO admin for each account -- verify this is intentional before changing.

## Account Provisioning

- New accounts are automatically enrolled in AWS Control Tower guardrails.
- The `ManagedOrganizationalUnit` determines which OU policies (SCPs) apply. Changing this has security implications.
- `account_customizations_name` links to customizations in a separate AFT repo -- verify those customizations before associating them.
