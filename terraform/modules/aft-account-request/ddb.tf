resource "aws_dynamodb_table_item" "account-request" {
  table_name = var.account-request-table
  hash_key   = var.account-request-table-hash

  item = jsonencode({
    id = { S = var.control_tower_parameters["AccountEmail"] }
    control_tower_parameters = { M = {
      AccountEmail              = { S = var.control_tower_parameters["AccountEmail"] }
      AccountName               = { S = var.control_tower_parameters["AccountName"] }
      ManagedOrganizationalUnit = { S = var.control_tower_parameters["ManagedOrganizationalUnit"] }
      SSOUserEmail              = { S = var.control_tower_parameters["SSOUserEmail"] }
      SSOUserFirstName          = { S = var.control_tower_parameters["SSOUserFirstName"] }
      SSOUserLastName           = { S = var.control_tower_parameters["SSOUserLastName"] }
      }
    }
    change_management_parameters = { M = {
      change_reason       = { S = var.change_management_parameters["change_reason"] }
      change_requested_by = { S = var.change_management_parameters["change_requested_by"] }
      }
    }
    account_tags                = { S = jsonencode(var.account_tags) }
    account_customizations_name = { S = var.account_customizations_name }
    custom_fields               = { S = jsonencode(var.custom_fields) }
  })
}
