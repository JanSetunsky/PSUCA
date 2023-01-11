$CollectorPath  = '.'+"'"+'d:\PSUCA\engine\controller\dev\modules\taskcenter\collector\powershell_universal_collector.ps1'+"'"


$global:commandObject = (
@"
    $global:CollectorPath
"@)         
$argumentlist = " -noexit, -command `"$commandObject`""
Start-Process pwsh.exe -WindowStyle Normal -ArgumentList $argumentlist -PassThru     


