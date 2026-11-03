package terraform.azure.storage

# Enforce HTTPS-only traffic and TLS 1.2+
deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "azurerm_storage_account"
    
    after := resource.change.after
    after.enable_https_traffic_only != true

    msg := sprintf("Storage Account '%v' must have 'enable_https_traffic_only' set to true.", [resource.address])
}

deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "azurerm_storage_account"
    
    after := resource.change.after
    after.min_tls_version != "TLS1_2"

    msg := sprintf("Storage Account '%v' must enforce min_tls_version = 'TLS1_2'.", [resource.address])
}
