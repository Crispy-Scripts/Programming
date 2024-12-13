<#

Author: Cristian Renda

Date: 06/06/2024

Description: Generate all the commands needed to create the SSL cert request, bundle up the signed cert with the rootCA cert and the key into a .pfx file.

# TODO: Create new DHCP scopes with information listed in the .csv file

#>
$CSV = Import-Csv "C:\Programming\powershell\csv\SSLConfigScript.csv"

foreach ($item in $CSV) {
   $hostname = $item.Hostname
   $fqdn = $item.FQDN
   $ip = $item.IP

   Write-Output "*** Start $hostname - $ip ***"
   Write-Output "openssl req -new -sha256 -key KEY.pem -out $HOSTNAME-CERT.csr -config $hostname.cnf"
   
   Write-Output "---------------"
   write-output "openssl.exe pkcs12 -export -in $hostname.cer -inkey KEY.pem -certfile rootCA.cer -out $HOSTNAME-ALLCERTS.pfx"
   
   Write-Output "---------------"
   Write-Output "enable"
   Write-Output "config t"
   Write-Output "crypto pki import TP-01 pkcs12 tftp: password <password>"
   Write-Output "<TFTP_IP>"
   Write-Output "$HOSTNAME-ALLCERTS.pfx"
   Write-Output "!"
   Write-Output "ip http secure-server"
   Write-Output "ip http secure-trustpoint TP-01"
   Write-Output "!"
   Write-Output "do wr"
   Write-Output "!`n"

   Write-Output "https://$ip"
   Write-Output "*** End $hostname ***`n`n"
   
}