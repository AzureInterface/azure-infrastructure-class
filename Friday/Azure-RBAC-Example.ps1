<#

https://azure.microsoft.com/en-us/documentation/articles/role-based-access-control-manage-access-powershell/

#>

#Creating and assigning a custom role

$Role = Get-AzureRmRoleDefinition -Name "Virtual Machine Contributor"
$Role.Id = $Null
$Role.Name = "test"
$Role.Description = "Can monitor, start, and restart virtual machines."
$Role.Actions.RemoveRange(0,$Role.Actions.Count)
$Role.Actions.Add("Microsoft.Compute/*/read")
$Role.Actions.Add("Microsoft.Compute/virtualMachines/start/action")
$Role.Actions.Add("Microsoft.Compute/virtualMachines/restart/action")
$Role.Actions.Add("Microsoft.Network/*/read")
$Role.Actions.Add("Microsoft.Storage/*/read")
$Role.Actions.Add("Microsoft.Authorization/*/read")
$Role.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/read")
$Role.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/resources/read")
$Role.Actions.Add("Microsoft.Insights/alertRules/*")
$Role.Actions.Add("Microsoft.Support/*")
$Role.AssignableScopes.Remove("/") | Out-Null
$Role.AssignableScopes.Add("/subscriptions/d8dd8ffe-ca5c-425f-b0a7-d6d4a050c293")

New-AzureRmRoleDefinition -Role $Role

$user = Get-AzureRmADUser -UserPrincipalName dave@azurepassprotonmail.onmicrosoft.com


New-AzureRmRoleAssignment -ObjectId $user.Id `
-RoleDefinitionName 'Virtual Machine Contributor' `
-Scope '/subscriptions/d8dd8ffe-ca5c-425f-b0a7-d6d4a050c293'
