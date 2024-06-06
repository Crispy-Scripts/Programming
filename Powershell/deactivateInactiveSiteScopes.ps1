<#

Author: Cristian Renda

Date: 25/01/2022

Description: 

# TODO: Deactive DHCP Scopes found to be no longer active on the DHCP Server

#>

#--------[Params]---------------
$CSV = import-csv "<FilePATH>\<File_Name>.csv" 

#--------[Script]---------------
foreach ($item in $CSV) {
    $scopeID = $item.ScopeID
    $site = $item.Site

    Set-DhcpServerv4Scope -ComputerName "DHCP01" -ScopeId $scopeID -State InActive
    Set-DhcpServerv4Scope -ComputerName "DHCP02" -ScopeId $scopeID -State InActive

    Write-Output "Scope ID: $scopeID | $site : has been Deactivated"
}

<#
#Enhancements

See if possible to set DHCP scope on once DHCP Server and replicate to failover

#>