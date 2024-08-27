# URL for the PPKG file
$ppkgUrl = "https://your-cloud-storage.com/path/to/your-package.ppkg"

# Local path for downloaded PPKG file
$ppkgPath = "$env:TEMP\temp-package.ppkg"

try {
    # Download PPKG file
    Invoke-WebRequest -Uri $ppkgUrl -OutFile $ppkgPath

    # Install PPKG file silently
    Add-ProvisioningPackage -PackagePath $ppkgPath -QuietInstall

    Write-Host "Package installed successfully."
}
catch {
    Write-Error "An error occurred: $_"
}
finally {
    # Clean up: Remove downloaded PPKG file
    if (Test-Path $ppkgPath) { Remove-Item $ppkgPath -Force }
}
