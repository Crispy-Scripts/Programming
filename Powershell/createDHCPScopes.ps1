<#

Author: Cristian Renda

Date: 23/06/2022

Description: 

# TODO: Create new folders in the Archive server for each network device listed in the .csv file

#>

#--------[Params]---------------
Import-Module DhcpServer

$CSV = Import-Csv "C:\Programming\powershell\csv\createDhcpScopes.csv"

#--------[Script]---------------

foreach ($item in $CSV){
    $scopeID = $item.scopeID
    $scopeName = $item.scopeName
    $subnetMask = $item.subnetMask
    $startRange = $item.startRange
    $endRange = $item.endRange
    $defaultGateway = $item.defaultGateway
    $dnsServers = @("192.168.3.5", "8.8.8.8") 

    #create the scope
    Add-DhcpServerv4Scope -name $scopeName -StartRange $startRange -EndRange $endRange -SubnetMask $subnetMask

    #set the optional vales to the scope
        #Setting the Default Gateway IP address
        Set-DhcpServerv4OptionValue -ScopeId $scopeID -OptionId 3 -Value $defaultGateway

        #Setting the DNS Server IP settings
        Set-DhcpServerv4OptionValue -ScopeId $scopeID -OptionId 6 -Value $dnsServers

}