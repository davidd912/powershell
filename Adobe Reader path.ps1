# Define the possible installation paths for Adobe Reader
$adobePaths = @(
    "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe",
    "C:\Program Files\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe",
    "C:\Program Files (x86)\Adobe\Acrobat Reader 11.0\Reader\AcroRd32.exe",
    "C:\Program Files\Adobe\Acrobat Reader 11.0\Reader\AcroRd32.exe"
)

# Check if Adobe Reader is installed by looking for its executable file
foreach ($path in $adobePaths) {
    if (Test-Path $path) {
        $readerVersion = (Get-Command $path).FileVersionInfo.ProductVersion
        Write-Host "Adobe Reader is installed at: $path"
        Write-Host "Version: $readerVersion"
        break  # Exit the loop once Adobe Reader is found
    }
}

if (-not $readerVersion) {
    Write-Host "Adobe Reader is not installed on this computer."
}
