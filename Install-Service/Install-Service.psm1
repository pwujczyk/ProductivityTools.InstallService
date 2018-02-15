function GetInstallUtilPath()
{
	$currentPath=$PSScriptRoot
	$installUtilPath=Join-Path $currentPath "InstallUtil.exe"
	return $installUtilPath
}

function Install-Service {
	[cmdletbinding()]
	param([string]$ServiceExePath)
	
	$installUtilPath=GetInstallUtilPath
	$command= "$installUtilPath $ServiceExePath"
	Write-Verbose "invoke command $command"
	Invoke-Expression -Command $command
}

function Install-ServiceIfNotInstalled{
	[cmdletbinding()]
	param([string]$ServiceExePath)
	
	$x=Get-WmiObject -Class Win32_Service |select pathname -ExpandProperty pathname
	if ($x.contains($ServiceExePath))
	{
		 Write-Verbose "Service not installed start installation [$ServiceExePath]"
		 Install-Service $ServiceExePath
	}
	else
	{
		Write-Host "Service Installed [$ServiceExePath]"
	}
}

function Uninstall-Service{
	[cmdletbinding()]
	param([string]$ServiceExePath, [string]$ServiceName)

	$installUtilPath=GetInstallUtilPath

	if ($ServiceExePath.Length -gt 0)
	{
		$servicePath=$ServiceExePath
	}
	if($ServiceName.Length -gt 0)
	{
		Stop-Service  $ServiceName
		$servicePath=Get-WmiObject -Class Win32_Service |where {$_.name -eq "$ServiceName"} |select pathname -ExpandProperty pathname
		Write-Verbose "Path to service $ServiceName = $servicePath"
	}

	$command= "$installUtilPath /u $servicePath"
	Write-Verbose "invoke command $command"
	Invoke-Expression -Command $command
}

Export-ModuleMember Install-Service
Export-ModuleMember Install-ServiceIfNotInstalled
Export-ModuleMember Uninstall-Service