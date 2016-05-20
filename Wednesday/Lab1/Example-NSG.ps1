$vnet = 'your vnet name'
$subnetName = 'your subnet name'

$sgRuleParams = @{
    Name = 'Allow-Http'
    Access = 'Allow'
    Protocol = 'TCP'
    Direction = 'Inbound'
    Priority = 100
    SourceAddressPrefix = '*'
    SourcePortRange = '*'
    DestinationAddressPrefix = '*'
    DestinationPortRange = 80
}

$group = New-AzureRmNetworkSecurityRuleConfig @sgRuleParams

Set-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetName -AddressPrefix 10.0.1.0/24 -NetworkSecurityGroup $group