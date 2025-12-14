output "resource_group_name" {
  value = azurerm_storage_account.project-remote-statefile[0].name #can also use [*] to print multiple names
}
output "local_location" {
  value = local.location
}
output "env-variable" {
  value = var.environment

}

output "storage_account_names" {
  value = [for i in azurerm_storage_account.project-remote-statefile : i.name]
}

