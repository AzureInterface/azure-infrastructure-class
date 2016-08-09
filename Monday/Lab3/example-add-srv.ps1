$cred = Get-Credential

$servers = "srv1","srv2"

foreach($server in $servers) {
    .\Add-AzureRmVm.ps1 -VMName $server `
    -ResourceGroupName TestServers `
    -StorageAccountName 78961559 `
    -Credential $cred
}