locals {
  account_name_prefix = "attest-ct"
}

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
    group       = "infrastructure"
    description = "Shared infrastructure for the organization like DNS, networking etc"
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
    group       = "workloads"
    description = "Workloads: Development"
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
    group       = "workloads"
    description = "Workloads: QA"
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
    group       = "workloads"
    description = "Workloads: Production"
  }

  account_customizations_name = "prod"
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
    group       = "DisasterRecovery"
    description = "DisasterRecovery: dr"
  }

  account_customizations_name = "dr"
}
