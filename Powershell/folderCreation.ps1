<#

Author: Cristian Renda

Date: 23/06/2022

Description: 

# TODO: Create new folders in the Archive server for each network device listed in the .csv file

#>

#--------[Params]---------------

$CSV = import-csv "<FilePATH>\<File_Name>.csv"

#--------[Script]---------------

foreach ($item in $CSV) {
   $newFolderName = $item.device_Name

   New-Item -Path "\\<Archive_Server>\d$\Cisco_Backup\Cisco_Switches\$newFolderName" -ItemType Directory
   Write-Output "\\<Archive_Server>\d$\Cisco_Backup\Cisco_Switches\$newFolderName"
}

