clear
cd $PSScriptRoot
$x="$PSScriptRoot\ProductivityTools.PSInstallService.psm1"
Import-Module $x -Force
Uninstall-Service -ServiceName PSCalendarService