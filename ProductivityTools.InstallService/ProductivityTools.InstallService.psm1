function GetInstallUtilPath()
{
	$currentPath=$PSScriptRoot
	$installUtilPath=Join-Path $currentPath "InstallUtil.exe"
	return $installUtilPath
}

function Install-Service {
	[cmdletbinding()]
	param([string]$ExePath)

	Write-Verbose "Trying to install service from path $ExePath"
	
	$installUtilPath=GetInstallUtilPath
	$command= "&'$installUtilPath' '$ExePath'"
	Write-Verbose "invoke command $command"
	Invoke-Expression -Command $command
}

function Install-ServiceIfNotInstalled{
	[cmdletbinding()]
	param([string]$ExePath)
	
	$x=Get-WmiObject -Class Win32_Service |select pathname -ExpandProperty pathname
	if ($x.contains("""$ExePath""") -or $x.contains($ExePath))
	{
		Write-Host "Service Installed [$ExePath]" 
	}
	else
	{
		Write-Verbose "Service not installed start installation [$ExePath]"
		Install-Service -ServiceExePath $ExePath
	}
}

function Uninstall-Service{
	[cmdletbinding()]
	param([string]$Name,[string]$ExePath)

	$installUtilPath=GetInstallUtilPath

	if ($ExePath.Length -gt 0)
	{
		$servicePath=$ExePath
		Write-Verbose "ExePath provided"
	}
	if($Name.Length -gt 0)
	{
		Write-Verbose "Service name provided"
		Stop-Service  $Name
		$servicePath=Get-WmiObject -Class Win32_Service |where {$_.name -eq "$Name"} |select pathname -ExpandProperty pathname
		Write-Verbose "Path to service $Name = $servicePath"
	}

	$command= "&'$installUtilPath' /u '$servicePath'"
	Write-Verbose "invoke command $command"
	Invoke-Expression -Command $command
}

Export-ModuleMember Install-Service
Export-ModuleMember Install-ServiceIfNotInstalled
Export-ModuleMember Uninstall-Service