﻿New-PSUDashboard -Name "psucaDev" -FilePath "dashboards\psucaDev\psucaDev.ps1" -BaseUrl "/app/dev" -Framework "UniversalDashboard:Latest" -SessionTimeout 0 -AutoDeploy -Description "Developer" -Credential "Default" 
New-PSUDashboard -Name "psucaPresentation" -FilePath "dashboards\psucaPresentation\psucaPresentation.ps1" -BaseUrl "/app/presentation" -Framework "UniversalDashboard:Latest" -SessionTimeout 0 -AutoDeploy -Description "Presentation" -Credential "Default" 