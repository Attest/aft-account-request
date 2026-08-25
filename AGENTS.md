# AGENTS.md -- aft-account-request

## Project Overview

This repository defines **AWS account requests** for provisioning via [AWS Control Tower Account Factory for Terraform (AFT)](https://developer.hashicorp.com/terraform/tutorials/aws/aws-control-tower-aft). Each account is declared as a Terraform module invocation that writes a record to the AFT DynamoDB `aft-request` table.

## Tech Stack

| Layer | Technology |
|-------|-----------|
| IaC | Terraform >= 0.15.0 (pinned to 1.13.3 via mise) |
| Cloud | AWS (Control Tower, DynamoDB, S3, IAM, SSO) |
| Provider | hashicorp/aws >= 3.15 |
| Tooling | mise, pre-commit, tflint, trivy, terraform-docs |
| License | MPL 2.0 |

## Repository Structure

```
terraform/
  main.tf                              # Account request declarations (one module per account)
  versions.tf                          # Root Terraform + provider version constraints
  aft-providers.jinja                  # Jinja template: auto-generated provider config
  backend.jinja                        # Jinja template: auto-generated backend config
  modules/
    aft-account-request/
      ddb.tf                           # Writes account request item to DynamoDB
      variables.tf                     # Module input variables
      versions.tf                      # Module version constraints
.pre-commit-config.yaml                # Pre-commit hooks config
mise.toml                              # Tool version management
```

## How to Add a New Account

1. Add a new `module` block in `terraform/main.tf`.
2. Use `source = "./modules/aft-account-request"`.
3. Populate all required variables:
   - `control_tower_parameters`: AccountEmail (unique), AccountName, ManagedOrganizationalUnit, SSO user info
   - `account_tags`: at minimum `Name` and `ManagedBy = "AFT"`
   - `change_management_parameters`: who requested and why (Shortcut link)
   - `account_customizations_name`: links to customizations in the AFT account customizations repo
4. Follow naming conventions in `.agents/rules/code-style.md`.
5. Run `mise run precommit` to validate.
6. Open a pull request. Once merged, the AFT CodePipeline applies the change.

## Key Rules for AI Agents

- **Read-only awareness**: Jinja templates (`*.jinja`) are processed by AFT at runtime. Do not create or modify `backend.tf` or `providers.tf` directly.
- **DynamoDB key**: `AccountEmail` is the hash key in the `aft-request` table. It must be unique across all modules.
- **High blast radius**: This repo provisions AWS accounts. Every change should be reviewed carefully.
- Refer to `.agents/rules/` for code-style, testing, and security guidelines.
- Refer to `docs/ARCHITECTURE.md` for system architecture and data flow.

## Keeping Docs Current

When making changes:
- If you add/remove an account, update `README.md` account table and `docs/ARCHITECTURE.md` diagram.
- If you change tooling or versions, update `AGENTS.md` tech stack table.
- If you change module variables, update `AGENTS.md` "How to Add a New Account" section.
