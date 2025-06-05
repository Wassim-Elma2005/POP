<#
.SYNOPSIS
Detecteert inactieve gebruikers in AD en exporteert ze naar een CSV-bestand

.AUTHOR
Wassim El Mahtouchi - PoC 2025
#>

param(
    [int]$DaysInactive = 0,
    [switch]$WhatIf,
    [string]$OutputPath
)

if ($DaysInactive -lt 0) {
    Write-Error "De waarde van -DaysInactive mag niet negatief zijn. Geef een positief getal op."
    exit
}

if (-not $OutputPath) {
    $OutputPath = "$env:USERPROFILE\Documents\PoC_Output"
}
if (-not (Test-Path $OutputPath)) {
    New-Item -Path $OutputPath -ItemType Directory | Out-Null
}

$csvFilePath = Join-Path -Path $OutputPath -ChildPath "inactive_users.csv"

Import-Module ActiveDirectory
$cutoff = (Get-Date).AddDays(-$DaysInactive)

$inactiveUsers = Get-ADUser -Filter {Enabled -eq $true -and LastLogonDate -lt $cutoff} `
    -Properties LastLogonDate |
    Select-Object SamAccountName, LastLogonDate

if ($WhatIf) {
    Write-Host "WHATIF: $($inactiveUsers.Count) accounts zouden worden gelogd."
} else {
    $inactiveUsers | Export-Csv -Path $csvFilePath -NoTypeInformation
    Write-Host "Resultaat opgeslagen in $csvFilePath"
}
