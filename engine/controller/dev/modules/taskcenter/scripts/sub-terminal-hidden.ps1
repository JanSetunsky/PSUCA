function GetGlobalFilePaths {

    <# PROCESS WINDOW STYLE RESULT FILEPATH #>
    $global:dataProcessWindowStyleResultFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\windowstyle\result\'


    <# PROCESS WINDOW STYLE REQUIREMENT FILEPATH #>
    $global:dataProcessWindowStyleRequirementFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\windowstyle\requirement\'


    <# TRANSCRIPT RUNSPACE PROCESS FILEPATH #>
    $global:dataTranscriptRunspaceProcessFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\transcript\runspaceProcess\'


    <# DATA TASK CENTER TASK LIST FILEPATH #>
    $global:dataTaskCenterTaskListFilePath = "d:\BinBot\taskcenter\tasklist\"


    <# DATA TASK CENTER RUNSPACE DENIED FILEPATH #>
    $global:dataTaskCenterRunspaceDeniedFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\denied\'
    
    
    <# DATA TASK CENTER RUNSPACE HISTORY FILEPATH #>
    $global:dataTaskCenterRunspaceHistoryFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\history\'


    <# DATA TASK CENTER RUNSPACE QUEUE FILEPATH #>
    $global:dataTaskCenterRunspaceQueueFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\queue\'


    <# DATA TASK CENTER RUNSPACE TERMINAL FILEPATH #>
    $global:dataTaskCenterRunspaceTerminalFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\terminal\'

}

$terminalScriptBlock = {
    $dataTaskCenterRunspaceQueueFilePathGci = $null
    $dataTaskCenterRunspaceQueueFilePathGci = gci $dataTaskCenterRunspaceQueueFilePath
    $dataTaskCenterRunspaceQueueFilePathGciCount = $dataTaskCenterRunspaceQueueFilePathGci.Count
    $dataTaskCenterRunspaceQueueFilePathGciNum = 0
    if($dataTaskCenterRunspaceQueueFilePathGci){
        1..$dataTaskCenterRunspaceQueueFilePathGciCount | % {
            $dataTaskCenterRunspaceQueueFilePathGciSelectIndex = $dataTaskCenterRunspaceQueueFilePathGci[$dataTaskCenterRunspaceQueueFilePathGciNum]
            $dataTaskCenterRunspaceQueueFilePathGciSelectIndexFullName = $dataTaskCenterRunspaceQueueFilePathGciSelectIndex.FullName
            $dataTaskCenterRunspaceQueueFilePathGciSelectIndexFullNameDefault = ("$dataTaskCenterRunspaceQueueFilePathGciSelectIndexFullName"+'\'+'default'+'.ps1')
            $runspaceProcessMain = {
                [string]$uniqueId = [guid]::NewGuid().Guid
                $commandObject = ((
@"
                    `$ApiKey='$WalletDataApiKey';`$transcriptFileName = 'uniqueid'+'-'+`$PID+'.txt';Start-Transcript -Path ('transcriptFilePath'+`$transcriptFileName) -Append;.'defaultProcessFilePath';Stop-Transcript
"@ -replace 'transcriptFilePath',"$dataTranscriptRunspaceProcessFilePath") -replace 'uniqueid',"$uniqueId") -replace 'defaultProcessFilePath',"$dataTaskCenterRunspaceQueueFilePathGciSelectIndexFullNameDefault"
                $argumentlist = "/c pwsh.exe -command `"$commandObject`" -exit"
                $proc = Start-Process cmd.exe -WindowStyle Hidden -ArgumentList $argumentlist -PassThru 

                $procPID = $proc.Id
                $runspaceProcessMainId = $uniqueId
                $uniqueId = $null
                $runspaceProcessDetail = {
                    $items = Get-CimInstance -ClassName win32_process -filter "ProcessId = `'$procPID`'" 
                    foreach ($item in $items) {
                        #get owner
                        $owner = Invoke-CimMethod -InputObject $item -MethodName GetOwner
                        $parent = Get-Process -Id $item.ParentprocessID
                        if((gci $dataTranscriptRunspaceProcessFilePath -Filter ("$runspaceProcessMainId"+'*') -Recurse).Length -gt 0){
                            $status = 'Completed'
                            $lastAccessTime = (gci $dataTranscriptRunspaceProcessFilePath -Filter ("$runspaceProcessMainId"+'*') -Recurse).LastAccessTime
                        }
                        else{
                            $status = 'Running'
                        }
                        $runspaceProcess = [PSCustomObject]@{
                            PSTypename      = "CMD_PowerShell_Process"
                            ProcessID       = $item.ProcessID
                            Name            = $item.Name
                            ScriptName      = 'runspaceProcessDefault'
                            Status          = $status
                            Handles         = $item.HandleCount
                            WorkingSet      = $item.WorkingSetSize
                            ParentProcessID = $item.ParentProcessID
                            ParentProcess   = $parent.Name
                            ParentPath      = $parent.Path
                            Started         = $item.CreationDate
                            Ended           = $lastAccessTime
                            Owner           = "$($owner.Domain)\$($owner.user)"
                            CommandLine     = $item.Commandline
                        }
                        $processDetailToJson = $runspaceProcess | ConvertTo-Json
                        if(("$dataTaskCenterRunspaceQueueFilePathGciSelectIndexFullName"+'\'+'defaultProcessDetail'+'.json')){
                            Set-Content ("$dataTaskCenterRunspaceQueueFilePathGciSelectIndexFullName"+'\'+'defaultProcessDetail'+'.json') -Value $processDetailToJson 
                        }
                        else{
                            New-Item -ItemType File ("$dataTaskCenterRunspaceQueueFilePathGciSelectIndexFullName"+'\'+'defaultProcessDetail'+'.json') -Value $processDetailToJson
                        }
                    }
                }
                $runspaceProcessDetail|iex
            }
            $runspaceProcessMain|iex
            TIMEOUT /T 5
            Move-Item $dataTaskCenterRunspaceQueueFilePathGciSelectIndexFullName $dataTaskCenterRunspaceProcessingFilePath -Force
            $dataTaskCenterRunspaceQueueFilePathGciNum++
        }
    }
    else{
        write-host 'Runspace queue is null'
    }
}

$RepeatSC = {
    switch (1,2,3,4,5,6,7,8){
        1 {GetGlobalFilePaths}
        2 {TIMEOUT /T 5}
        8 {$RepeatSC|iex}
    }
}
$RepeatSC|iex