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
    account_alias = "shared-services"
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
    Name          = "dev",
    ManagedBy     = "AFT"
    account_alias = "workloads-dev"
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
    group         = "workloads"
    description   = "Workloads: QA"
    account_alias = "workloads-qa"
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
    account_alias = "workloads-prod"
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
    account_alias = "new-ventures"
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
    account_alias = "infra-dr"
  }

  account_customizations_name = "dr"
}
