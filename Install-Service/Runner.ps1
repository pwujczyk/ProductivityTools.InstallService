clear
cd $PSScriptRoot
$x="$PSScriptRoot\Install-Service.psm1"
Import-Module $x -Force
Uninstall-Service -ServiceName PSCalendarService