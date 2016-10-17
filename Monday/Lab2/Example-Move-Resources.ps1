$r = Get-AzureRmResource -ResourceName mikepf16 -ResourceGroupName servers

Move-AzureRmResource -ResourceId $r.ResourceId `
-DestinationResourceGroupName servers2

# here's another way to do it using the pipeline 

Get-AzureRmResource -ResourceName mikepf16 `
-ResourceGroupName servers2 | 
    Move-AzureRmResource -DestinationResourceGroupName servers

