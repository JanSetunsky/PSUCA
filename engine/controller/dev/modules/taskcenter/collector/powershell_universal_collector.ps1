$CollectorProcessSC = {
    $CollectorDataPathGci = gci $CollectorDataPath
    if($CollectorDataPathGci.Count -eq 0){}
    else{
        foreach ($CollectorItem in $CollectorDataPathGci) {
            $CollectorItemFullName      = $CollectorItem.FullName
            $CollectorItemInvokeString  = '.'+"'"+"$CollectorItemFullName"+"'"
            $global:commandObject = (
@"
            $global:CollectorItemInvokeString
"@)         
            $argumentlist = "-command `"$commandObject`" -exit"
            Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -WindowStyle Hidden -ArgumentList $argumentlist -PassThru     
            TIMEOUT /T 2        
            Move-Item $CollectorItemFullName $CollectorTrashPath -Force
        }
    }
    TIMEOUT /T 10
    $CollectorProcessSC|iex
}

if($global:CollectorRunType -eq 'manual'){
    $CollectorDataPath  = 'd:\PSUCA\database\dev\modules\taskcenter\collector\collector_data\'
    $CollectorTrashPath = 'd:\PSUCA\database\dev\modules\taskcenter\collector\collector_trash\'
    $CollectorProcessSC|iex
}
elseif($global:CollectorRunType -eq 'auto'){
    $CollectorProcessSC|iex
}
