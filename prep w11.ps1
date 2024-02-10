

#Install Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


choco intall firefox -y

choco install steam -y

choco install vscode -y

choco install python -y

choco install bitwarden -y

choco install docker-desktop -y

choco install mobaxterm -y

choco install openvpn -y

choco install vagrant -y

choco install winrar -y

choco install github-desktop -y

choco install lens -y

choco install virtualbox -y

choco install powertoys

wsl --install

Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online

#turn on dark mode
$k = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$v = (Get-ItemProperty -Path $k).SystemUsesLightTheme -bxor 1

Set-ItemProperty -Path $k -Name "SystemUsesLightTheme" -Value $v
Set-ItemProperty -Path $k -Name "AppsUseLightTheme" -Value $v

#Hide task view button
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0 -Force
#Hide search icon
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchBoxTaskbarMode -Value 0 -Type DWord -Force
#Uninstall widgets app
Get-AppxPackage | Where-Object {$_.Name -like "*WebExperience*"} | Remove-AppxPackage

#Restart Explorer
taskkill /f /im explorer.exe
sleep 2
start explorer.exe



#Install NuGet, PSWindowsUpdate and run updates
Install-PackageProvider NuGet -Force;
Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module -Name PSWindowsUpdate
Import-Module PSWindowsUpdate
Get-WindowsUpdate -Install -Verbose