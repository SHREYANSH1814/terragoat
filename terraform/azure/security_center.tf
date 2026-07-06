resource azurerm_security_center_subscription_pricing "pricing" {
  tier = "Free"
}

resource azurerm_security_center_contact "contact" {
  alert_notifications = true
  alerts_to_admins    = true
  email               = "some@email.com"
}