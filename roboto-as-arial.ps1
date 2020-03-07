Write-Host "Roboto-as-Arial is a free and open source script that replaces the system font Arial with Roboto.

Roboto by Christian Robertson is licensed under the Apache License 2.0.
Roboto-as-Arial project is licensed under the Apache License 2.0.
If you use the script, do keep in mind you are using at your own risk!
A backup of the original ArialMT fonts are stored in $env:USERPROFILE\Documents\ArialMT_Backup

Please close all other running applications as this will prohibit the deletion of Arial!"

$title    = 'You must accept the terms and license to continue.'
$question = 'Do you agree?'
$choices  = '&Yes', '&No'

$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
if ($decision -eq 0) {
    Write-Host 'confirmed'
} else {
    Write-Host 'cancelled'
}
Write-Host "======================== Delete reg entries..." -ForegroundColor Yellow
# We have to delete the existing fonts from the system registry.
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial (TrueType)"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Bold (TrueType)"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Bold Italic (TrueType)"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Italic (TrueType)"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Black (TrueType)"
Write-Host "======================== Permissions..." -ForegroundColor Yellow
cd "$env:WINDIR\Fonts"
# take ownership
takeown /f arial.ttf /a
takeown /f arialbd.ttf /a
takeown /f arialbi.ttf /a
takeown /f ariali.ttf /a
takeown /f ariblk.ttf /a
# strip all permissions
icacls arial.ttf /inheritance:r
icacls arialbd.ttf /inheritance:r
icacls arialbi.ttf /inheritance:r
icacls ariali.ttf /inheritance:r
icacls ariblk.ttf /inheritance:r
# grant all full permissions
icacls arial.ttf /t /grant Administrators:F
icacls arial.ttf /t /grant Users:F
icacls arial.ttf /t /grant SYSTEM:F
icacls arial.ttf /t /grant Everyone:F
icacls arial.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
icacls arialbd.ttf /t /grant Administrators:F
icacls arialbd.ttf /t /grant Users:F
icacls arialbd.ttf /t /grant SYSTEM:F
icacls arialbd.ttf /t /grant Everyone:F
icacls arialbd.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
icacls arialbi.ttf /t /grant Administrators:F
icacls arialbi.ttf /t /grant Users:F
icacls arialbi.ttf /t /grant SYSTEM:F
icacls arialbi.ttf /t /grant Everyone:F
icacls arialbi.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
icacls ariali.ttf /t /grant Administrators:F
icacls ariali.ttf /t /grant Users:F
icacls ariali.ttf /t /grant SYSTEM:F
icacls ariali.ttf /t /grant Everyone:F
icacls ariali.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
icacls ariblk.ttf /t /grant Administrators:F
icacls ariblk.ttf /t /grant Users:F
icacls ariblk.ttf /t /grant SYSTEM:F
icacls ariblk.ttf /t /grant Everyone:F
icacls ariblk.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
Write-Host "======================== Backup fonts..." -ForegroundColor Yellow
# we must backup the original arial family just in case.
New-Item -Path "$env:USERPROFILE\Documents" -Name "ArialMT_Backup" -ItemType "directory"
Start-Sleep -s 2 > $null
Copy-Item "$env:WINDIR\Fonts\ari*.ttf" -Destination "$env:USERPROFILE\Documents\ArialMT_Backup"
Start-Sleep -s 2 > $null
Write-Host "======================== Delete fonts..." -ForegroundColor Yellow
# goodbye!
Remove-Item -Path $env:WINDIR\Fonts\arial.ttf -Force
Remove-Item -Path $env:WINDIR\Fonts\arialbd.ttf -Force
Remove-Item -Path $env:WINDIR\Fonts\arialbi.ttf -Force
Remove-Item -Path $env:WINDIR\Fonts\ariali.ttf -Force
Remove-Item -Path $env:WINDIR\Fonts\ariblk.ttf -Force
Write-Host "======================== Permissions..." -ForegroundColor Yellow
cd "$env:WINDIR\WinSxS"
# again with the permissions but this time with the SxS store.
takeown /f amd64_microsoft-windows-font-truetype-arial* /r /a
takeown /f amd64_microsoft-windows-f..truetype-arialblack* /r /a
icacls amd64_microsoft-windows-font-truetype-arial* /inheritance:r
icacls amd64_microsoft-windows-f..truetype-arialblack* /inheritance:r
icacls amd64_microsoft-windows-font-truetype-arial* /t /grant Administrators:F
icacls amd64_microsoft-windows-font-truetype-arial* /t /grant Users:F
icacls amd64_microsoft-windows-font-truetype-arial* /t /grant SYSTEM:F
icacls amd64_microsoft-windows-font-truetype-arial* /t /grant Everyone:F
icacls amd64_microsoft-windows-font-truetype-arial* /t /grant "NT SERVICE\TrustedInstaller:F"
icacls amd64_microsoft-windows-f..truetype-arialblack* /t /grant Administrators:F
icacls amd64_microsoft-windows-f..truetype-arialblack* /t /grant Users:F
icacls amd64_microsoft-windows-f..truetype-arialblack* /t /grant SYSTEM:F
icacls amd64_microsoft-windows-f..truetype-arialblack* /t /grant Everyone:F
icacls amd64_microsoft-windows-f..truetype-arialblack* /t /grant "NT SERVICE\TrustedInstaller:F"
cd "$env:WINDIR\WinSxS\Manifests"
takeown /f amd64_microsoft-windows-font-truetype-arial*.manifest /a
takeown /f amd64_microsoft-windows-f..truetype-arialblack*.manifest /a
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /inheritance:r
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /inheritance:r
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /t /grant Administrators:F
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /t /grant Users:F
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /t /grant SYSTEM:F
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /t /grant Everyone:F
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /t /grant "NT SERVICE\TrustedInstaller:F"
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /t /grant Administrators:F
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /t /grant Users:F
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /t /grant SYSTEM:F
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /t /grant Everyone:F
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /t /grant "NT SERVICE\TrustedInstaller:F"
Write-Host "======================== Delete SxS..." -ForegroundColor Yellow
# goodbye!
cd "$env:WINDIR\WinSxS"
Remove-Item amd64_microsoft-windows-font-truetype-arial*.manifest -Force
Remove-Item amd64_microsoft-windows-font-truetype-arial* -Recurse -Force
Remove-Item amd64_microsoft-windows-f..truetype-arialblack*.manifest -Force
Remove-Item amd64_microsoft-windows-f..truetype-arialblack* -Recurse -Force
cd "$env:WINDIR\WinSxS\Manifests"
Remove-Item amd64_microsoft-windows-font-truetype-arial*.manifest -Force
Remove-Item amd64_microsoft-windows-f..truetype-arialblack*.manifest -Force
Write-Host "======================== Copy replacement fonts..." -ForegroundColor Yellow
# now we copy over the new fonts.
cd "$env:WINDIR\Fonts"
Copy-Item "$env:USERPROFILE\Desktop\roboto-as-arial\*" -Destination "$env:WINDIR\Fonts" -Recurse
Write-Host "======================== Permissions..." -ForegroundColor Yellow
icacls arial.ttf /t /grant Administrators:F
icacls arial.ttf /t /grant Users:F
icacls arial.ttf /t /grant SYSTEM:F
icacls arial.ttf /t /grant Everyone:F
icacls arial.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
icacls arialbd.ttf /t /grant Administrators:F
icacls arialbd.ttf /t /grant Users:F
icacls arialbd.ttf /t /grant SYSTEM:F
icacls arialbd.ttf /t /grant Everyone:F
icacls arialbd.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
icacls arialbi.ttf /t /grant Administrators:F
icacls arialbi.ttf /t /grant Users:F
icacls arialbi.ttf /t /grant SYSTEM:F
icacls arialbi.ttf /t /grant Everyone:F
icacls arialbi.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
icacls ariali.ttf /t /grant Administrators:F
icacls ariali.ttf /t /grant Users:F
icacls ariali.ttf /t /grant SYSTEM:F
icacls ariali.ttf /t /grant Everyone:F
icacls ariali.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
icacls ariblk.ttf /t /grant Administrators:F
icacls ariblk.ttf /t /grant Users:F
icacls ariblk.ttf /t /grant SYSTEM:F
icacls ariblk.ttf /t /grant Everyone:F
icacls ariblk.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
Write-Host "======================== Write reg entries..." -ForegroundColor Yellow
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial (TrueType)" -Value "arial.ttf"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Bold (TrueType)" -Value "arialbd.ttf"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Bold Italic (TrueType)" -Value "arialbi.ttf"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Italic (TrueType)" -Value "ariali.ttf"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Black (TrueType)" -Value "ariblk.ttf"  -PropertyType "String"
Write-Host "======================== It is done." -ForegroundColor Yellow
Write-Host "PLEASE REBOOT! The fonts are registered but the font cache has to rebuild on reboot." -ForegroundColor Red -BackgroundColor White
cd "$env:WINDIR\system32"