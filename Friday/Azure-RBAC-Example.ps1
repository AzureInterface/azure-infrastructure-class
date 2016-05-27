<#

https://azure.microsoft.com/en-us/documentation/articles/role-based-access-control-manage-access-powershell/

#>

#Creating and assigning a custom role

$role = Get-AzureRmRoleDefinition 'Virtual Machine Contributor'
$role.Actions.Add('Microsoft.Automation/automationAccounts/jobs/read')
Set-AzureRmRoleDefinition -Role $role

$user = Get-AzureRmADUser -UserPrincipalName dave@psdemoawsgmail.onmicrosoft.com

$sub = Get-AzureRmSubscription -SubscriptionName 'Azure Pass'
New-AzureRmRoleAssignment -ObjectId $user.Id -RoleDefinitionName 'Virtual Machine Contributor' -Scope '/subscriptions/a4fb11b2-a79c-4e9b-b0de-7272a7153ea3'