data azurerm_subscription current_subscription {}

# Removed custom subscription owner role creation to comply with policy
# No custom subscription owner roles should be created
# If role creation is necessary, ensure it is not an owner role at subscription scope
# Hence, no resource block for azurerm_role_definition creating subscription owner roles