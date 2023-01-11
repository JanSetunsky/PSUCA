[string]$UserName               = 'jan.setunsky@gmail.com'
[string]$UserPassword           = 'xxxxxxxxxxxxx'
[securestring]$SecurePassword   = ConvertTo-SecureString $UserPassword -AsPlainText -Force
[pscredential]$CredentialObject = New-Object System.Management.Automation.PSCredential ($UserName, $SecurePassword)

$NewPSSession   = New-PSSession -ComputerName $env:COMPUTERNAME -Credential $CredentialObject
$EnterPSSession = Enter-PSSession -Session $NewPSSession
$ExitPSSession  = Exit

$GetPSSession   = Get-PSSession

$InvokeSessionCommand = Invoke-Command -session $NewPSSession -scriptblock {
    $InvokeSessionJob = Start-RSJob -scriptblock {
        $ArrayList = @()
        1..10 | % {$ArrayList += Get-Process}
        $ArrayList
    }
}


$InvokeSessionCommand = Invoke-Command -session $NewPSSession -scriptblock {
    $InvokeSessionJob = Start-RSJob -scriptblock {
        get-process
    }
    $ReceiveSessionJob = Receive-RSJob -Id $InvokeSessionJob.Id
    $Result = $ReceiveSessionJob
}

$ReceiveSessionJob.count


$CollectorPath  = '.'+"'"+'d:\PSUCA\engine\controller\dev\modules\taskcenter\collector\powershell_universal_collector.ps1'+"'"


$global:commandObject = (
@"
    $global:CollectorPath
"@)         
$argumentlist = "-command `"$commandObject`" -exit"
Start-Process pwsh.exe -WindowStyle Normal -ArgumentList $argumentlist    

Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -WindowStyle Hidden 






# RUN SCRIPT AS ADMINISTRATOR
$RootServerAppDirectory = 'd:\PSUCA\'
$RootControllerType     = 'dev'
$CollectorDataPath      = "$RootServerAppDirectory"+'database\'+"$RootControllerType"+'\modules\taskcenter\collector\collector_data\'
$CollectorTrashPath     = "$RootServerAppDirectory"+'database\'+"$RootControllerType"+'\modules\taskcenter\collector\collector_trash\'
$ServerExecutablePath   = "$RootServerAppDirectory"+'engine\server\Universal.Server.exe'
Start-PSUServer -ExecutablePath $ServerExecutablePath -Port 5000

# RUN SCRIPT COLLECTOR
$CollectorPath    = "$RootServerAppDirectory"+'engine\controller\dev\modules\taskcenter\collector\powershell_universal_collector.ps1'
$global:commandObject = (
@'
    $global:CollectorRunType   = 'auto'
    $global:CollectorDataPath  = 'importcollectordatapath'
    $global:CollectorTrashPath = 'importcollectortrashath'
    .'importcollectorscript'
'@) -replace 'importcollectordatapath',"$CollectorDataPath" -replace 'importcollectortrashath',"$CollectorTrashPath" -replace 'importcollectorscript',"$CollectorPath"
$argumentlist = "/c pwsh.exe -noexit -command `"$commandObject`""
Start-Process cmd.exe -WindowStyle normal -ArgumentList $argumentlist -PassThru  


function Add-PSUCA-test_table {
write-host 'xxxx'
}


10..100
