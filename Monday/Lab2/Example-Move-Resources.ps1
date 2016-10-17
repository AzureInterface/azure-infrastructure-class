$r = Get-AzureRmResource -ResourceName mikepf16 -ResourceGroupName servers

Move-AzureRmResource -ResourceId $r.ResourceId `
-DestinationResourceGroupName servers2



