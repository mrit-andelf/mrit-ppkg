# install_chocolatey.ps1

# Ensure the script is run as Administrator
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script. Please re-run this script as an Administrator."
    Break
}

# Set execution policy to allow script execution
Set-ExecutionPolicy Bypass -Scope Process -Force

# Download and install Chocolatey
$env:ChocolateyUseWindowsCompression = 'false'

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Verify Chocolatey installation
choco --version
