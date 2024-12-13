<#

Author: Cristian Renda

Date: 23/06/2022

Description: Removes the failover of DHCP scopes in the csv list.

# TODO: 

#>

#--------[Params]---------------

Import-Module DhcpServer

$CSV = import-csv "C:\Programming\powershell\csv\removeDHCPScopes.csv"

foreach ($item in $CSV) {
    $scopeID = $item.ScopeID
    $site = $item.Site

    Remove-DhcpServerv4Scope -ComputerName "DHCP-PRI.domain.local" -ScopeId $scopeID -Force
    
    Write-Output "Scope ID: $scopeID | $site : has been deleted from DHCP-PRI"

    Sleep -Seconds 1
}