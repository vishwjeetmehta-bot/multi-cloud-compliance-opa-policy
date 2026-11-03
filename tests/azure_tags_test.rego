package terraform.azure.tags

test_missing_tags_denied {
    result := deny with input as {
        "resource_changes": [{
            "type": "azurerm_resource_group",
            "address": "azurerm_resource_group.test",
            "change": {
                "after": {
                    "tags": {"Owner": "DevOps"}
                }
            }
        }]
    }
    count(result) > 0
}

test_valid_tags_allowed {
    result := deny with input as {
        "resource_changes": [{
            "type": "azurerm_resource_group",
            "address": "azurerm_resource_group.test",
            "change": {
                "after": {
                    "tags": {
                        "Owner": "DevOps",
                        "Environment": "Production",
                        "ProvisionedBy": "Terraform"
                    }
                }
            }
        }]
    }
    count(result) == 0
}
