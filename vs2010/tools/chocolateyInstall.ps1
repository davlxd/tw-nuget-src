$packageName = 'vs2010'
$installerType = 'exe'
$url = 'http://10.18.8.100/en_visual_studio_2010_ultimate_x86_dvd_509116.zip'
$url64 = 'http://10.18.8.100/en_visual_studio_2010_ultimate_x86_dvd_509116.zip'
$silentArgs = 'SILENT_ARGS_HERE'
$validExitCodes = @(0)

try {
  Get-ChocolateyWebFile "$packageName" 'c:\vs2010.zip' "$url" "$url64" -validExitCodes $validExitCodes
  Get-ChocolateyUnzip "c:\vs2010.zip" "c:\vs2010" -validExitCodes $validExitCodes
  
  Install-ChocolateyInstallPackage "$packageName" "$installerType" "/UnattendFile C:\vs2010\unattend-install-vs2010.ini" 'C:\vs2010\en_visual_studio_2010_ultimate_x86_dvd_509116\Setup\setup.exe' -validExitCodes $validExitCodes
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
