<#
.SYNOPSIS
Detecteert mislukte loginpogingen (Event ID 4625) en exporteert ze naar een CSV-bestand

.AUTHOR
Wassim El Mahtouchi – POP 2025
#>

param(
    [int]$DaysBack = 1,
    [string]$OutputPath
)

# Inputvalidatie
if ($DaysBack -lt 0) {
    Write-Error "De waarde van -DaysBack mag niet negatief zijn. Geef een positief getal op."
    exit
}

# Fallback pad naar Documentenmap als er geen outputpad is opgegeven
if (-not $OutputPath) {
    $OutputPath = "$env:USERPROFILE\Documents\PoC_Output"
}

# Map aanmaken als die niet bestaat
if (-not (Test-Path $OutputPath)) {
    New-Item -Path $OutputPath -ItemType Directory | Out-Null
}

# Volledig pad naar CSV-bestand
$failedCsvPath = Join-Path -Path $OutputPath -ChildPath "failed_logins.csv"

# Ophalen en verwerken van Event ID 4625
try {
    $failedLogins = Get-WinEvent -FilterHashtable @{
        LogName = 'Security'
        Id = 4625
        StartTime = (Get-Date).AddDays(-$DaysBack)
    } | ForEach-Object {
        $event = [xml]$_.ToXml()
        [PSCustomObject]@{
            TimeCreated     = $_.TimeCreated
            AccountName     = $event.Event.EventData.Data[5].'#text'
            WorkstationName = $event.Event.EventData.Data[11].'#text'
            FailureReason   = $event.Event.EventData.Data[23].'#text'
        }
    }

    $failedLogins | Export-Csv -Path $failedCsvPath -NoTypeInformation
    Write-Host "Mislukte loginpogingen opgeslagen in $failedCsvPath"
}
catch {
    Write-Error "Fout bij het ophalen of opslaan van mislukte logins: $_"
}
