locals {
  account_name_prefix = "attest-ct"
}

module "shared_services" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "aws-attest-ct+shared-services@askattest.com"
    AccountName               = "${local.account_name_prefix}-shared-services"
    ManagedOrganizationalUnit = "Root"
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
    group = "infrastructure"
  }

  account_customizations_name = "shared-services"
}
