Write-Host "Roboto-as-Arial is a free and open source script that replaces the system font Arial with Roboto.

Roboto by Christian Robertson is licensed under the Apache License 2.0.
Roboto-as-Arial project is licensed under the Apache License 2.0.
If you use the script, do keep in mind you are using it at your own risk!
A backup of the original ArialMT fonts are stored in $env:USERPROFILE\Documents\ArialMT_Backup
A system restore point will be created if possible. [checkpoint-computer] can only create one checkpoint per day.
If a checkpoint exists, no restore will be created."

Write-Host "Please close all other running applications as this will prohibit the deletion of Arial!" -ForegroundColor Red

$title    = 'You must accept the terms and license to continue.'
$question = 'Do you agree?'
$choices  = '&Yes', '&No'

$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
if ($decision -eq 0) {
    Write-Host 'confirmed'
} else {
    Write-Host 'cancelled'
}
Write-Host "======================== Creating system restore point..." -ForegroundColor Yellow
Checkpoint-Computer -Description "Roboto as Arial Script"
Write-Host "======================== Delete existing Arial registry entries..." -ForegroundColor Yellow
# We have to delete the existing fonts from the system registry.
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial (TrueType)"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Bold (TrueType)"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Bold Italic (TrueType)"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Italic (TrueType)"
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Black (TrueType)"
Write-Host "======================== Replace existing Arial permissions..." -ForegroundColor Yellow
cd "$env:WINDIR\Fonts"
# take ownership
takeown /f arial.ttf /a
takeown /f arialbd.ttf /a
takeown /f arialbi.ttf /a
takeown /f ariali.ttf /a
takeown /f ariblk.ttf /a
# strip all permissions
icacls arial.ttf /inheritance:r /q
icacls arialbd.ttf /inheritance:r /q
icacls arialbi.ttf /inheritance:r /q
icacls ariali.ttf /inheritance:r /q
icacls ariblk.ttf /inheritance:r /q
# grant all full permissions
icacls arial.ttf /t /grant Administrators:F /q
icacls arial.ttf /t /grant Users:F /q
icacls arial.ttf /t /grant SYSTEM:F /q
icacls arial.ttf /t /grant Everyone:F /q
icacls arial.ttf /t /grant "NT SERVICE\TrustedInstaller:F" /q
icacls arialbd.ttf /t /grant Administrators:F /q
icacls arialbd.ttf /t /grant Users:F /q
icacls arialbd.ttf /t /grant SYSTEM:F /q
icacls arialbd.ttf /t /grant Everyone:F /q
icacls arialbd.ttf /t /grant "NT SERVICE\TrustedInstaller:F" /q
icacls arialbi.ttf /t /grant Administrators:F /q
icacls arialbi.ttf /t /grant Users:F /q
icacls arialbi.ttf /t /grant SYSTEM:F /q
icacls arialbi.ttf /t /grant Everyone:F /q
icacls arialbi.ttf /t /grant "NT SERVICE\TrustedInstaller:F" /q
icacls ariali.ttf /t /grant Administrators:F /q
icacls ariali.ttf /t /grant Users:F /q
icacls ariali.ttf /t /grant SYSTEM:F /q
icacls ariali.ttf /t /grant Everyone:F /q
icacls ariali.ttf /t /grant "NT SERVICE\TrustedInstaller:F" /q
icacls ariblk.ttf /t /grant Administrators:F /q
icacls ariblk.ttf /t /grant Users:F /q
icacls ariblk.ttf /t /grant SYSTEM:F /q
icacls ariblk.ttf /t /grant Everyone:F /q
icacls ariblk.ttf /t /grant "NT SERVICE\TrustedInstaller:F" /q
Write-Host "======================== Backup existing Arial..." -ForegroundColor Yellow
# we must backup the original arial family just in case.
New-Item -Path "$env:USERPROFILE\Documents" -Name "ArialMT_Backup" -ItemType "directory"
Start-Sleep -s 2 > $null
Copy-Item "$env:WINDIR\Fonts\ari*.ttf" -Destination "$env:USERPROFILE\Documents\ArialMT_Backup"
Start-Sleep -s 2 > $null
Write-Host "======================== Delete current Arial..." -ForegroundColor Yellow
# goodbye!
Remove-Item arial.ttf -Force
Remove-Item arialbd.ttf -Force
Remove-Item arialbi.ttf -Force
Remove-Item ariali.ttf -Force
Remove-Item ariblk.ttf -Force
Write-Host "======================== Replace existing Arial SxS Permissions..." -ForegroundColor Yellow
cd "$env:WINDIR\WinSxS"
# again with the permissions but this time with the SxS store.
takeown /f amd64_microsoft-windows-font-truetype-arial* /r /a
takeown /f amd64_microsoft-windows-f..truetype-arialblack* /r /a
icacls amd64_microsoft-windows-font-truetype-arial* /inheritance:r /q
icacls amd64_microsoft-windows-f..truetype-arialblack* /inheritance:r /q
icacls amd64_microsoft-windows-font-truetype-arial* /t /grant Administrators:F /q
icacls amd64_microsoft-windows-font-truetype-arial* /t /grant Users:F /q
icacls amd64_microsoft-windows-font-truetype-arial* /t /grant SYSTEM:F /q
icacls amd64_microsoft-windows-font-truetype-arial* /t /grant Everyone:F /q
icacls amd64_microsoft-windows-font-truetype-arial* /t /grant "NT SERVICE\TrustedInstaller:F" /q
icacls amd64_microsoft-windows-f..truetype-arialblack* /t /grant Administrators:F /q
icacls amd64_microsoft-windows-f..truetype-arialblack* /t /grant Users:F /q
icacls amd64_microsoft-windows-f..truetype-arialblack* /t /grant SYSTEM:F /q
icacls amd64_microsoft-windows-f..truetype-arialblack* /t /grant Everyone:F /q
icacls amd64_microsoft-windows-f..truetype-arialblack* /t /grant "NT SERVICE\TrustedInstaller:F" /q
cd "$env:WINDIR\WinSxS\Manifests"
takeown /f amd64_microsoft-windows-font-truetype-arial*.manifest /a
takeown /f amd64_microsoft-windows-f..truetype-arialblack*.manifest /a
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /inheritance:r /q
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /inheritance:r /q
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /t /grant Administrators:F /q
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /t /grant Users:F /q
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /t /grant SYSTEM:F /q
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /t /grant Everyone:F /q
icacls amd64_microsoft-windows-font-truetype-arial*.manifest /t /grant "NT SERVICE\TrustedInstaller:F" /q
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /t /grant Administrators:F /q
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /t /grant Users:F /q
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /t /grant SYSTEM:F /q
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /t /grant Everyone:F /q
icacls amd64_microsoft-windows-f..truetype-arialblack*.manifest /t /grant "NT SERVICE\TrustedInstaller:F" /q
Write-Host "======================== Backup existing Arial SxS..." -ForegroundColor Yellow
New-Item -Path "$env:USERPROFILE\Documents\ArialMT_Backup" -Name "SxS" -ItemType "directory"
Start-Sleep -s 2 > $null
cd "$env:WINDIR\WinSxS"
Copy-Item amd64_microsoft-windows-font-truetype-arial* -Destination "$env:USERPROFILE\Documents\ArialMT_Backup\SxS" -Recurse
Copy-Item amd64_microsoft-windows-f..truetype-arialblack* -Destination "$env:USERPROFILE\Documents\ArialMT_Backup\SxS" -Recurse
cd "$env:WINDIR\WinSxS\Manifests"
Copy-Item amd64_microsoft-windows-font-truetype-arial*.manifest -Destination "$env:USERPROFILE\Documents\ArialMT_Backup\SxS"
Copy-Item amd64_microsoft-windows-f..truetype-arialblack*.manifest -Destination "$env:USERPROFILE\Documents\ArialMT_Backup\SxS"
Start-Sleep -s 2 > $null
Write-Host "======================== Delete Arial SxS..." -ForegroundColor Yellow
# goodbye!
cd "$env:WINDIR\WinSxS"
Remove-Item amd64_microsoft-windows-font-truetype-arial*.manifest -Force
Remove-Item amd64_microsoft-windows-font-truetype-arial* -Recurse -Force
Remove-Item amd64_microsoft-windows-f..truetype-arialblack*.manifest -Force
Remove-Item amd64_microsoft-windows-f..truetype-arialblack* -Recurse -Force
cd "$env:WINDIR\WinSxS\Manifests"
Remove-Item amd64_microsoft-windows-font-truetype-arial*.manifest -Force
Remove-Item amd64_microsoft-windows-f..truetype-arialblack*.manifest -Force
Write-Host "======================== Copy replacement Arial fonts..." -ForegroundColor Yellow
# now we copy over the new fonts.
cd "$env:WINDIR\Fonts"
Copy-Item "$env:USERPROFILE\Desktop\roboto-as-arial\*" -Destination "$env:WINDIR\Fonts" -Recurse
Write-Host "======================== Set permissions..." -ForegroundColor Yellow
icacls arial.ttf /t /grant Administrators:F /q
icacls arial.ttf /t /grant Users:F /q
icacls arial.ttf /t /grant SYSTEM:F /q
icacls arial.ttf /t /grant Everyone:F /q
icacls arial.ttf /t /grant "NT SERVICE\TrustedInstaller:F" /q
icacls arialbd.ttf /t /grant Administrators:F /q
icacls arialbd.ttf /t /grant Users:F /q
icacls arialbd.ttf /t /grant SYSTEM:F /q
icacls arialbd.ttf /t /grant Everyone:F /q
icacls arialbd.ttf /t /grant "NT SERVICE\TrustedInstaller:F" /q
icacls arialbi.ttf /t /grant Administrators:F /q
icacls arialbi.ttf /t /grant Users:F /q
icacls arialbi.ttf /t /grant SYSTEM:F /q
icacls arialbi.ttf /t /grant Everyone:F /q
icacls arialbi.ttf /t /grant "NT SERVICE\TrustedInstaller:F" /q
icacls ariali.ttf /t /grant Administrators:F /q
icacls ariali.ttf /t /grant Users:F /q
icacls ariali.ttf /t /grant SYSTEM:F /q
icacls ariali.ttf /t /grant Everyone:F /q
icacls ariali.ttf /t /grant "NT SERVICE\TrustedInstaller:F" /q
icacls ariblk.ttf /t /grant Administrators:F /q
icacls ariblk.ttf /t /grant Users:F /q
icacls ariblk.ttf /t /grant SYSTEM:F /q
icacls ariblk.ttf /t /grant Everyone:F /q
icacls ariblk.ttf /t /grant "NT SERVICE\TrustedInstaller:F"
Write-Host "======================== Write registry entries..." -ForegroundColor Yellow
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial (TrueType)" -Value "arial.ttf"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Bold (TrueType)" -Value "arialbd.ttf"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Bold Italic (TrueType)" -Value "arialbi.ttf"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Italic (TrueType)" -Value "ariali.ttf"  -PropertyType "String"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "Arial Black (TrueType)" -Value "ariblk.ttf"  -PropertyType "String"
Write-Host "======================== It is done." -ForegroundColor Yellow
Write-Host "PLEASE REBOOT! The fonts are registered but the font cache has to rebuild on reboot." -ForegroundColor Red -BackgroundColor White
cd "$env:WINDIR\system32"
