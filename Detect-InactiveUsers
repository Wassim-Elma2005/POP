<#
.SYNOPSIS
Detecteert inactieve gebruikers in AD en exporteert ze naar een CSV-bestand

.AUTHOR
Wassim El Mahtouchi - PoC 2025
#>

param(
    [int]$DaysInactive = 0,
    [switch]$WhatIf
)

Import-Module ActiveDirectory
$cutoff = (Get-Date).AddDays(-$DaysInactive)

$inactiveUsers = Get-ADUser -Filter {Enabled -eq $true -and LastLogonDate -lt $cutoff} `
    -Properties LastLogonDate |
    Select-Object SamAccountName, LastLogonDate

$outputPath = "C:\PoC_Output\inactive_users.csv"

if ($WhatIf) {
    Write-Host "WHATIF: $($inactiveUsers.Count) accounts zouden worden gelogd."
} else {
    if (-not (Test-Path "C:\PoC_Output")) {
        New-Item -Path "C:\PoC_Output" -ItemType Directory | Out-Null
    }

    $inactiveUsers | Export-Csv -Path $outputPath -NoTypeInformation
    Write-Host "Resultaat opgeslagen in $outputPath"
}
