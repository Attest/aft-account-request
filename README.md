# Account Factory for Terraform: Account Requests

Defines AWS account requests for provisioning via [AWS Control Tower Account Factory for Terraform (AFT)](https://developer.hashicorp.com/terraform/tutorials/aws/aws-control-tower-aft).

Each module invocation in `terraform/main.tf` represents an AWS account to be created and managed by Control Tower.

## Accounts

| Account | Organizational Unit | Customizations |
|---------|---------------------|----------------|
| attest-ct-shared-services | Infrastructure | shared-services |
| attest-ct-dev | Workloads | dev |
| attest-ct-qa | Workloads | qa |
| attest-ct-prod | Workloads | prod |
| attest-ct-new-ventures | Workloads | new-ventures |
| attest-ct-dr | DisasterRecovery | dr |

## Prerequisites

Tool versions are managed by [mise](https://mise.jdx.dev/). Run `mise install` to set up:

- Terraform 1.13.3
- tflint 0.59.1
- trivy 0.66.0
- terraform-docs 0.20.0
- Python 3.13.7 + pre-commit

## Usage

```bash
# Run all pre-commit checks (fmt, validate, lint, security scan)
mise run precommit
```

To add a new account, see [AGENTS.md](AGENTS.md#how-to-add-a-new-account).

## Documentation

- [AGENTS.md](AGENTS.md) -- Project overview, structure, and contribution guide
- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) -- System architecture with diagrams

## License

[Mozilla Public License 2.0](LICENSE)
