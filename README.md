Install service is a wrapper around InstallUtil.exe file. It exposes three functions:

- Install-Service – it invokes InstallUtil.exe pathToExecutable command
- Install-ServiceIfNotInstalled – first it checks if service is installed if not perform the method Install-Service
- Uninstall-Service – it uninstalls service. ServiceName of path to executable can be used.

More information here: http://www.productivitytools.tech/install-service/
Powershell module here: https://www.powershellgallery.com/packages/Install-Service/
