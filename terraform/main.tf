locals {
  account_name_prefix = "attest-ct"
}

# Note account_alias has to be between 3 and 63 characters.

module "shared_services" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "aws-attest-ct+shared-services@askattest.com"
    AccountName               = "${local.account_name_prefix}-shared-services"
    ManagedOrganizationalUnit = "Infrastructure"
    SSOUserEmail              = "emmanuel.pius-ogiji@askattest.com"
    SSOUserFirstName          = "Emmanuel"
    SSOUserLastName           = "Pius-Ogiji"
  }

  account_tags = {
    Name      = "shared-services",
    ManagedBy = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "Emmanuel Pius-Ogiji"
    change_reason       = "https://app.shortcut.com/attest/story/136343/step-1-deploy-aws-control-tower-and-the-landing-zone"
  }

  custom_fields = {
    group         = "infrastructure"
    description   = "Shared infrastructure for the organization like DNS, networking etc"
    account_alias = "${local.account_name_prefix}-shared-services"
  }

  account_customizations_name = "shared-services"
}

module "dev" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "aws-attest-ct+dev@askattest.com"
    AccountName               = "${local.account_name_prefix}-dev"
    ManagedOrganizationalUnit = "Workloads"
    SSOUserEmail              = "emmanuel.pius-ogiji@askattest.com"
    SSOUserFirstName          = "Emmanuel"
    SSOUserLastName           = "Pius-Ogiji"
  }

  account_tags = {
    Name      = "dev",
    ManagedBy = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "Emmanuel Pius-Ogiji"
    change_reason       = "https://app.shortcut.com/attest/story/136343/step-1-deploy-aws-control-tower-and-the-landing-zone"
  }

  custom_fields = {
    group         = "workloads"
    description   = "Workloads: Development"
    account_alias = "${local.account_name_prefix}-dev"
  }

  account_customizations_name = "dev"
}

module "qa" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "aws-attest-ct+qa@askattest.com"
    AccountName               = "${local.account_name_prefix}-qa"
    ManagedOrganizationalUnit = "Workloads"
    SSOUserEmail              = "emmanuel.pius-ogiji@askattest.com"
    SSOUserFirstName          = "Emmanuel"
    SSOUserLastName           = "Pius-Ogiji"
  }

  account_tags = {
    Name      = "qa",
    ManagedBy = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "Emmanuel Pius-Ogiji"
    change_reason       = "https://app.shortcut.com/attest/story/136343/step-1-deploy-aws-control-tower-and-the-landing-zone"
  }

  custom_fields = {
    group         = "workloads"
    description   = "Workloads: QA"
    account_alias = "${local.account_name_prefix}-qa"
  }

  account_customizations_name = "qa"
}

module "prod" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "aws-attest-ct+prod@askattest.com"
    AccountName               = "${local.account_name_prefix}-prod"
    ManagedOrganizationalUnit = "Workloads"
    SSOUserEmail              = "emmanuel.pius-ogiji@askattest.com"
    SSOUserFirstName          = "Emmanuel"
    SSOUserLastName           = "Pius-Ogiji"
  }

  account_tags = {
    Name      = "prod",
    ManagedBy = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "Emmanuel Pius-Ogiji"
    change_reason       = "https://app.shortcut.com/attest/story/136343/step-1-deploy-aws-control-tower-and-the-landing-zone"
  }

  custom_fields = {
    group         = "workloads"
    description   = "Workloads: Production"
    account_alias = "${local.account_name_prefix}-prod"
  }

  account_customizations_name = "prod"
}

module "new_ventures" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "aws-attest-ct+new-ventures@askattest.com"
    AccountName               = "${local.account_name_prefix}-new-ventures"
    ManagedOrganizationalUnit = "Workloads"
    SSOUserEmail              = "nikita.maximov@askattest.com"
    SSOUserFirstName          = "Nikita"
    SSOUserLastName           = "Maximov"
  }

  account_tags = {
    Name      = "new-ventures",
    ManagedBy = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "Nikita Maximov"
    change_reason       = "https://app.shortcut.com/attest/story/142375/set-up-aws-account-for-new-ventures-infrastructure"
  }

  custom_fields = {
    group         = "workloads"
    description   = "Workloads: New Ventures"
    account_alias = "${local.account_name_prefix}-new-ventures"
  }

  account_customizations_name = "new-ventures"
}

module "dr" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "aws-attest-ct+dr@askattest.com"
    AccountName               = "${local.account_name_prefix}-dr"
    ManagedOrganizationalUnit = "DisasterRecovery"
    SSOUserEmail              = "emmanuel.pius-ogiji@askattest.com"
    SSOUserFirstName          = "Emmanuel"
    SSOUserLastName           = "Pius-Ogiji"
  }

  account_tags = {
    Name      = "prod",
    ManagedBy = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "Emmanuel Pius-Ogiji"
    change_reason       = "https://app.shortcut.com/attest/story/136343/step-1-deploy-aws-control-tower-and-the-landing-zone"
  }

  custom_fields = {
    group         = "DisasterRecovery"
    description   = "DisasterRecovery: dr"
    account_alias = "${local.account_name_prefix}-dr"
  }

  account_customizations_name = "dr"
}

# ---------------------------------------------------------------------------
# The two Control Tower core accounts.
#
# These already exist -- Control Tower's landing zone created them on
# 2025-10-10, not Account Factory -- so these requests ENROL them rather than
# provision them. AFT matches on AccountEmail, finds the account already
# enrolled in Control Tower, skips creation, and builds only the surrounding
# AFT machinery: the `aft-request` record and the account's CodePipeline.
#
# Supported since AFT 1.4.0 ("you can now specify your shared/management
# accounts in your account request repository"); this org runs 1.21.1, pinned
# at aws-foundation-control-tower `root/account-factory/main.tf`.
#
# Why now: without an `aft-request` record the customizations pipeline refuses
# to target the account at all --
#
#   Account aws-attest-ct+audit@askattest.com  not found in aft-request
#     aft_customizations_identify_targets.py line 88
#
# -- so `aft-global-customizations/terraform/roles.tf` has never run in either
# account, and neither has an `app.terraform.io` OIDC provider or a
# `terraform-cloud-deploy-role`. MEASURED 2026-08-25: zero OIDC providers in
# `audit`, `NoSuchEntity` on the role in both. That is what blocks the
# `security-services-audit` Terraform Cloud workspace, which fails with
# `InvalidIdentityToken` from AssumeRoleWithWebIdentity.
#
# Every value below is measured (`organizations describe-account` and
# `list-parents`, 2026-08-25) rather than inferred from the naming pattern:
#
#   audit     552533871415  attest-ct-audit     ou-qdpf-dus0wk34 (Security)
#   security  215600395829  attest-ct-security  ou-qdpf-dus0wk34 (Security)
#
# Note the repo-internal short names are the reverse of what they suggest:
# `audit` is Control Tower's Audit account (`securityRoles`) and `security` is
# the Log Archive account (`centralizedLogging`). See
# aws-foundation-control-tower `docs/ARCHITECTURE.md`.
#
# Both set `account_customizations_name`, and it is not optional even though
# neither account needs per-account customizations. `./modules/aft-account-request`
# writes the attribute unconditionally --
# `account_customizations_name = { S = var.account_customizations_name }` in
# `ddb.tf` -- so leaving it at the module's `null` default renders
# `{"S": null}` (verified with `terraform console`), and DynamoDB rejects a
# string attribute with no value. Every one of the six pre-existing callers
# passes a real name, which is why that path has never been exercised here.
# Credit to Copilot on PR #7 for spotting it.
#
# The directories they name were added by aft-account-customizations
# `1453a317` and are deliberately no-op scaffolds: all seven files in each are
# byte-identical (compared by git blob SHA) to `dr/`, `prod/`, `dev/`, `qa/`,
# `new-ventures/` and `shared-services/`. What actually unblocks these two
# accounts is the GLOBAL customization -- `aft-global-customizations`
# `terraform/roles.tf` -- which runs for every enrolled account regardless of
# this value.
#
# The Control Tower MANAGEMENT account is deliberately NOT added. It is the one
# core account reported to fail this path (`account:PutAlternateContact`, and
# the provisioning-framework step function erroring on `run_create_pipeline?`),
# and nothing needs it -- the management account already has its deploy role.

module "audit" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "aws-attest-ct+audit@askattest.com"
    AccountName               = "${local.account_name_prefix}-audit"
    ManagedOrganizationalUnit = "Security"
    SSOUserEmail              = "emmanuel.pius-ogiji@askattest.com"
    SSOUserFirstName          = "Emmanuel"
    SSOUserLastName           = "Pius-Ogiji"
  }

  account_tags = {
    Name      = "audit",
    ManagedBy = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "Emmanuel Pius-Ogiji"
    change_reason       = "Enrol the Control Tower Audit account in AFT so global customizations create its terraform-cloud-deploy-role, unblocking the security-services-audit workspace"
  }

  custom_fields = {
    group         = "Security"
    description   = "Security: audit (Control Tower Audit, securityRoles); GuardDuty + Security Hub delegated admin"
    account_alias = "${local.account_name_prefix}-audit"
  }

  account_customizations_name = "audit"
}

module "security" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "aws-attest-ct+security@askattest.com"
    AccountName               = "${local.account_name_prefix}-security"
    ManagedOrganizationalUnit = "Security"
    SSOUserEmail              = "emmanuel.pius-ogiji@askattest.com"
    SSOUserFirstName          = "Emmanuel"
    SSOUserLastName           = "Pius-Ogiji"
  }

  account_tags = {
    Name      = "security",
    ManagedBy = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "Emmanuel Pius-Ogiji"
    change_reason       = "Enrol the Control Tower Log Archive account in AFT alongside audit, so the same gap does not have to be reopened for the next stack that needs it"
  }

  custom_fields = {
    group         = "Security"
    description   = "Security: security (Control Tower Log Archive, centralizedLogging)"
    account_alias = "${local.account_name_prefix}-security"
  }

  account_customizations_name = "security"
}
