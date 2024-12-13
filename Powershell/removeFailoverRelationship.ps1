<#

Author: Cristian Renda

Date: 23/06/2022

Description: Removes the failover of DHCP scopes in the csv list.

# TODO: To Remove the DHCP scope run "removeDHCPScopes.ps1" script


#>

#--------[Params]---------------

Import-Module DhcpServer

$CSV = import-csv "C:\Programming\powershell\csv\removeDHCPScopes.csv" 

foreach ($item in $CSV) {
    $scopeID = $item.ScopeID
    $site = $item.Site

    Remove-DhcpServerv4FailoverScope -ComputerName "DHCP-PRI.domain.local" -Name "DHCP-SEC.domain.local-DHCP-PRI.domain.local" -ScopeId $scopeID
    
    Write-Output "Scope ID: $scopeID | $site : has relationship failover removed."

    Sleep -Seconds 2
}