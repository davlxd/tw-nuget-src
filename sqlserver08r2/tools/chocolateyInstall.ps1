$packageName = 'sqlserver08r2'
$installerType = 'exe'
$url = 'http://10.18.8.100/en_sql_server_2008_r2_enterprise_x86_x64_ia64_dvd_520517.zip'
$url64 = 'http://10.18.8.100/en_sql_server_2008_r2_enterprise_x86_x64_ia64_dvd_520517.zip'
$silentArgs = 'SILENT_ARGS_HERE'
$validExitCodes = @(0)

try {
  Get-ChocolateyWebFile "$packageName" 'c:\sqlserver08r2.zip' "$url" "$url64" -validExitCodes $validExitCodes
  Get-ChocolateyUnzip "c:\sqlserver08r2.zip" "c:\sqlserver08r2" -validExitCodes $validExitCodes
  
  Install-ChocolateyInstallPackage "$packageName" "$installerType" "/ConfigurationFile=C:\sqlserver08r2\ConfigurationFile.ini" 'C:\sqlserver08r2\en_sql_server_2008_r2_enterprise_x86_x64_ia64_dvd_520517\setup.exe' -validExitCodes $validExitCodes
  Write-ChocolateySuccess "$packageName" -validExitCodes $validExitCodes
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
