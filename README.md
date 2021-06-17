<!--Category:PowerShell--> 
 <p align="right">
    <a href="https://www.powershellgallery.com/packages/ProductivityTools.InstallService/"><img src="Images/Header/Powershell_border_40px.png" /></a>
    <a href="http://productivitytools.tech/install-service/"><img src="Images/Header/ProductivityTools_green_40px_2.png" /><a> 
    <a href="https://github.com/pwujczyk/ProductivityTools.InstallService/"><img src="Images/Header/Github_border_40px.png" /></a>
</p>
<p align="center">
    <a href="http://http://productivitytools.tech/">
        <img src="Images/Header/LogoTitle_green_500px.png" />
    </a>
</p>

# Install Service

Install service is a wrapper around InstallUtil.exe file. It exposes three functions:

<!--more-->
- Install-Service – it invokes InstallUtil.exe pathToExecutable command
- Install-ServiceIfNotInstalled – first it checks if service is installed if not perform the method Install-Service
- Uninstall-Service – it uninstalls service. ServiceName of path to executable can be used.

```PowerShell
Install-Service -ExePath d:\bin\SimpleMarketPlace\Team-Managment\PSTeamManagement.WindowsService.exe -Verbose
```
<!--og-image-->
![Install Service](Images/InstallService.png)



```PowerShell
Install-ServiceIfNotInstalled -ExePath d:\bin\SimpleMarketPlace\Team-Managment\PSTeamManagement.WindowsService.exe -Verbose
```

![Install Service if not installed](Images/InstallServiceIfNotInstalled.png)


```PowerShell
Uninstall-Service -Name PSTeamManagement -Verbose
```

![Unistall Service](Images/UninstallService.png)




