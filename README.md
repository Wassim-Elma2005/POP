# POP Scripts – Wassim El Mahtouchi

Welkom bij mijn Git-repository voor het Persoonlijk OnderzoeksProject (POP) binnen de proftaak bij Fonteyn Vakantieparken.

In deze repository verzamel ik alle PowerShell-scripts die ik ontwikkeld of uitgebreid heb tijdens mijn onderzoek naar Active Directory-beheer en automatisering. Deze scripts helpen bij het aantonen van verschillende leeruitkomsten, zoals:

✅ Provisioning & Connecting  
✅ Programming  
✅ Configureerbaarheid  
✅ Robuustheid  
✅ Deployment en overdraagbaarheid  
✅ Toepassen van kennis in context  

---

## 📂 Inhoud

| Scriptbestand               | Beschrijving                                                                 |
|-----------------------------|------------------------------------------------------------------------------|
| `detect_inactive_users.ps1` | De huidige, verbeterde versie die inactieve gebruikers detecteert, robuust werkt, input valideert en dynamisch output beheert via parameters |
| `Log-FailedLogins.ps1`      | Script dat mislukte loginpogingen (Event ID 4625) detecteert en exporteert naar CSV met validatie, foutafhandeling en dynamische opslaglocatie |
| `detect_inactive_users_basic.ps1` | De eerste versie zonder validatie of dynamisch padbeheer (alleen als referentie behouden) |

---

## 🛠️ Gebruik

De scripts zijn geschreven in PowerShell en bedoeld voor gebruik in een Active Directory-omgeving. Je kunt ze uitvoeren met standaard PowerShell 5.1 of hoger, op een domeingebonden Windows-machine met de `ActiveDirectory`-module geïnstalleerd.

Zie het scriptbestand zelf voor uitleg over parameters, voorbeeldgebruik en extra functies zoals `-WhatIf`.

---

## 📌 Voorbeeldfunctionaliteiten

### detect_inactive_users.ps1:
- Detectie van gebruikers die langer dan X dagen niet zijn ingelogd
- CSV-export naar veilige, configureerbare outputlocatie (standaard: Documentenmap)
- Automatisch aanmaken van outputmap indien deze niet bestaat
- Validatie van input (bijv. geen negatieve waarden bij `-DaysInactive`)
- `-WhatIf` functionaliteit om veilig te testen
- Duidelijke console-output voor feedback en foutmeldingen

### Log-FailedLogins.ps1:
- Detectie van mislukte loginpogingen via Event Log (Event ID 4625)
- XML-parsing van eventdata voor accountnaam, werkstation en reden
- Aanpasbare tijdsperiode via `-DaysBack` parameter
- Dynamisch outputpad via `-OutputPath`, met fallback naar Documentenmap
- Automatisch aanmaken van outputmap indien nodig
- Try/Catch-blok voor foutafhandeling bij toegang/logboekproblemen

---

## 👤 Auteur

**Wassim El Mahtouchi**  
Fontys Hogeschool ICT – Semester 2 – 2025  
Onderdeel van het POP: Active Directory-beheer, gebruikerslogging en compliance-automatisering binnen Fonteyn Vakantieparken.
