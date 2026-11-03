package terraform.azure.tags

# Mandatory tags required for SOC2 and FinOps governance
mandatory_tags := ["Owner", "Environment", "ProvisionedBy"]

deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "azurerm_resource_group"
    
    # Check if tags exist
    provided_tags := object.get(resource.change.after, "tags", {})
    missing := [tag | tag := mandatory_tags[_]; not provided_tags[tag]]
    count(missing) > 0

    msg := sprintf("Resource '%v' is missing mandatory governance tags: %v", [resource.address, missing])
}
