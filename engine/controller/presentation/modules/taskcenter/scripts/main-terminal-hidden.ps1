function GetGlobalFilePaths {

    <# RUNSPACE MAIN TERMINAL SCRIPT FILEPATH #>
    $global:runspaceMainTerminalScriptFilePath = "$Global:RootAppDirectory"+'engine\controller\'+"$Global:RootControllerType"+'\modules\taskcenter\scripts\main-terminal-hidden.ps1'


    <# RUNSPACE SUB TERMINAL SCRIPT FILEPATH #>
    $global:runspaceSubTerminalScriptFilePath = "$Global:RootAppDirectory"+'engine\controller\'+"$Global:RootControllerType"+'\modules\taskcenter\scripts\sub-terminal-hidden.ps1'


    <# DATA RUNSPACE JSON FILEPATH #>
    $global:dataRunspaceJsonFilePath = "$Global:RootAppDirectory"+'database\dev\modules\taskcenter\data\data-runspace.json'


    <# DATA INTERFACE FILEPATH #>
    $global:dataInterfaceListFilePath = "$Global:RootAppDirectory"+'database\dev\modules\interface\'


    <# TRANSCRIPT RUNSPACE PROCESS FILEPATH #>
    $global:dataTranscriptRunspaceFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\transcript\runspace\'    


    <# TRANSCRIPT RUNSPACE PROCESS FILEPATH #>
    $global:dataTranscriptRunspaceProcessFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\transcript\runspaceProcess\'


    <# DATA TASK CENTER TASK LIST FILEPATH #>
    $global:dataTaskCenterTaskListFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\list\'


    <# DATA TASK CENTER TASK LIST FILEPATH #>
    $global:dataTaskCenterRunspaceDefaultPath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\'


    <# DATA TASK CENTER RUNSPACE DENIED FILEPATH #>
    $global:dataTaskCenterRunspaceDeniedFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\'+"$global:TerminalProcessId"+'\controller\'


    <# DATA TASK CENTER RUNSPACE DENIED FILEPATH #>
    $global:dataTaskCenterRunspaceDeniedFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\'+"$global:TerminalProcessId"+'\denied\'
    
    
    <# DATA TASK CENTER RUNSPACE HISTORY FILEPATH #>
    $global:dataTaskCenterRunspaceHistoryFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\'+"$global:TerminalProcessId"+'\history\'


    <# DATA TASK CENTER RUNSPACE QUEUE FILEPATH #>
    $global:dataTaskCenterRunspaceQueueFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\'+"$global:TerminalProcessId"+'\queue\'


    <# DATA TASK CENTER RUNSPACE PROCESSING FILEPATH #>
    $global:dataTaskCenterRunspaceProcessingFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\'+"$global:TerminalProcessId"+'\processing\'


    <# DATA TASK CENTER RUNSPACE TERMINAL FILEPATH #>
    $global:dataTaskCenterRunspaceTerminalFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\'+"$global:TerminalProcessId"+'\terminal\'

    
    <# PROCESS WINDOW STYLE RESULT FILEPATH #>
    $global:dataProcessWindowStyleResultFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\'+"$global:TerminalProcessId"+'\windowstyle\result\'


    <# PROCESS WINDOW STYLE REQUIREMENT FILEPATH #>
    $global:dataProcessWindowStyleRequirementFilePath = "$Global:RootAppDirectory"+'database\'+"$Global:RootControllerType"+'\modules\taskcenter\runspace\'+"$global:TerminalProcessId"+'\windowstyle\requirement\'

}




$ValidateRunspaceSC = {
    $GetProcess         = Get-Process
    $ActualRunspaceList = gci $global:dataTaskCenterRunspaceDefaultPath
    if($ActualRunspaceList){
        foreach ($Runspace in $ActualRunspaceList) {
            $RunspaceName     = $Runspace.Name
            $RunspaceFullName = $Runspace.FullName
            $RunspaceTerminal = "$RunspaceFullName"+'\'+'terminal'+'\'+'terminal'+'.json'
            $RunspaceGc       = gc $RunspaceTerminal
            $RunspaceJson     = $RunspaceGc|ConvertFrom-Json
            $RunspacePID      = $RunspaceJson.Pid
            foreach ($SearchRunspace in $GetProcess) {
                if($SearchRunspace.Id -eq $RunspacePID -and $SearchRunspace.ProcessName -eq 'pwsh'){
                    $IdentifyRunspace = $true
                }
            }
            if($IdentifyRunspace -eq $true){
                write-host ('Runspace is ON: '+"$RunspaceName")
                $IdentifyRunspace = $false
            }
            else{
                if(Test-Path $RunspaceFullName){
                    $Remove = Remove-Item $RunspaceFullName -Force -Confirm:$false -Recurse -Verbose
                    write-host ('Runspace is OFF: '+"$RunspaceName")
                }
                else{
                    write-host 'Runspace path is not exist'
                }
            }
        }
    }
}

$SubRunspaceTaskListSC = {
    $TaskList       = gci $global:dataTaskCenterTaskListFilePath
    $ActiveTaskList = @()
    foreach ($Task in $TaskList) {
        $TaskFullName = $Task.FullName
        $TaskGc       = gc $TaskFullName
        $TaskJson     = $TaskGc|ConvertFrom-Json
        $TaskStatus   = $TaskJson.TaskStatus
        if($TaskStatus -eq 'Active'){
            $TaskId            = $TaskJson.TaskUniqueId
            $RunspaceName      = $TaskJson.TaskNameIdTextBox
            $RunspaceInterface = $TaskJson.InterfaceBlocksStartPointIdSelectBox
            $TerminalHash      = @{Name=$RunspaceName;Interface=$RunspaceInterface;TaskId=$TaskId;Path=$TaskFullName}
            $ActiveTaskList   += $TerminalHash
        }
    }
    if($ActiveTaskList){
        $InterfaceList     = gci $global:dataInterfaceListFilePath
        $CompareList       = @()
        foreach ($InterfaceDir in $InterfaceList) {
            $InterfaceDirFullName = $InterfaceDir.FullName
            $InterfaceDirData     = gci $InterfaceDirFullName
            if($InterfaceDirData){
                foreach ($InterfaceFile in $InterfaceDirData) {
                    $InterfaceFileFullName     = $InterfaceFile.FullName
                    $InterfaceFileGc           = gc $InterfaceFileFullName
                    $InterfaceFileJson         = $InterfaceFileGc|ConvertFrom-Json
                    $InterfaceFileServiceId    = (($InterfaceFileJson.Selections).ServiceProvider).Id
                    $InterfaceFileServiceName  = (($InterfaceFileJson.Selections).ServiceProvider).Name
                    $InterfaceFileTerminalId   = (($InterfaceFileJson.Selections).TerminalProvider).Id
                    $InterfaceFileTerminalName = (($InterfaceFileJson.Selections).TerminalProvider).Name
                    foreach ($ActiveTask in $ActiveTaskList) {
                        if($ActiveTask.Interface -eq $InterfaceFileServiceId){
                            if('' -ne $CompareList -and (($true -eq $($CompareList.Id -match $ActiveTask.Interface)) -or ($($CompareList.Id -match $ActiveTask.Interface)).Count -gt 1)){
                                if($CompareList.Count -eq 0){
                                    [array]($CompareList).Data += $ActiveTask
                                }
                                else{
                                    $IndexNum = [array]::IndexOf($CompareList.Id,$ActiveTask.Interface)
                                    [array]($CompareList[$IndexNum]).Data += $ActiveTask
                                }
                            }
                            else{
                                $TaskRunspace = @{Id=$ActiveTask.Interface;Name=$InterfaceFileServiceName;Type='runspace_new';Data=$ActiveTask}
                                $CompareList += $TaskRunspace
                            }
                        }                        
                        elseif($ActiveTask.Interface -eq $InterfaceFileTerminalId){
                            if('' -ne $CompareList -and (($true -eq $($CompareList.Id -match $ActiveTask.Interface)) -or ($($CompareList.Id -match $ActiveTask.Interface)).Count -gt 1)){
                                if($CompareList.Count -eq 0){
                                    [array]($CompareList).Data += $ActiveTask
                                }
                                else{
                                    $IndexNum = [array]::IndexOf($CompareList.Id,$ActiveTask.Interface)
                                    [array]($CompareList[$IndexNum]).Data += $ActiveTask
                                }
                            }
                            else{
                                $TaskRunspace = @{Id=$ActiveTask.Interface;Name=$InterfaceFileTerminalName;Type='runspace_new';Data=$ActiveTask}
                                $CompareList += $TaskRunspace
                            }
                        }
                    }
                }
            }
        }
    }
    $RunspaceList = $CompareList
}

$GenerateDataToQueueSC = {
    if($RunspaceList){
        foreach ($Runspace in $RunspaceList) {
            $RunspaceJson     = $Runspace|ConvertTo-Json -Depth 100
            [string]$uniqueId = [guid]::NewGuid().Guid
            $CreateDirPath    = "$global:dataTaskCenterRunspaceQueueFilePath"+"$uniqueId"+'\'
            $CreateDataDir    = New-Item -ItemType Directory $CreateDirPath -Force
            if(Test-Path $CreateDataDir){
                $CreateDataFile = New-Item -ItemType File ("$CreateDirPath"+'config'+'.json') -Force
                $SaveDataToFile = Set-Content ("$CreateDirPath"+'config'+'.json') -Value $RunspaceJson -Force
            }
        }
    }
}

$ValidateQueueDataSC = {
    $DataRunspaceList = @()
    $dataTaskCenterRunspaceQueueFilePathGci = $null
    $dataTaskCenterRunspaceQueueFilePathGci = gci $dataTaskCenterRunspaceQueueFilePath
    if($dataTaskCenterRunspaceQueueFilePathGci){
        foreach ($QueueData in $dataTaskCenterRunspaceQueueFilePathGci) {
            $QueueDataFullName   = $QueueData.FullName
            $QueueDataConfig     = "$QueueDataFullName"+'\'+'config'+'.json'
            $QueueDataConfigGc   = gc $QueueDataConfig
            $QueueDataConfigJson = $QueueDataConfigGc|ConvertFrom-Json -Depth 100
            $QueueDataConfigId   = $QueueDataConfigJson.Id
            $QueueDataConfigName = $QueueDataConfigJson.Name
            $QueueDataConfigType = $QueueDataConfigJson.Type
            if($QueueDataConfigType -eq 'runspace_new'){
                $RunspaceConfigId   = $QueueDataConfigJson.Id
                $RunspaceScriptPath = $runspaceSubTerminalScriptFilePath
                $RunspaceUniquePath = "$dataTaskCenterRunspaceDefaultPath"+"$RunspaceConfigId"+'\'
                if($RunspaceUniquePath -and ($true -ne $(Test-Path $RunspaceUniquePath))){
                    $NewDirectory = New-Item -ItemType Directory ("$RunspaceUniquePath"+'controller\') -Force
                    $NewDirectory = New-Item -ItemType Directory ("$RunspaceUniquePath"+'denied\') -Force
                    $NewDirectory = New-Item -ItemType Directory ("$RunspaceUniquePath"+'history\') -Force
                    $NewDirectory = New-Item -ItemType Directory ("$RunspaceUniquePath"+'processing\') -Force
                    $NewDirectory = New-Item -ItemType Directory ("$RunspaceUniquePath"+'queue\') -Force
                    $NewDirectory = New-Item -ItemType Directory ("$RunspaceUniquePath"+'terminal\') -Force
                    $NewDirectory = New-Item -ItemType Directory ("$RunspaceUniquePath"+'windowstyle\requirement\') -Force
                    $NewDirectory = New-Item -ItemType Directory ("$RunspaceUniquePath"+'windowstyle\result\') -Force

                    $global:terminalWindowStyle = 'hidden'
                    [string]$uniqueId = $RunspaceConfigId
                    $command = (
@'
                    $transcriptFileName = 'uniqueid'+'-'+"$PID"+'.txt'
                    $global:TerminalProcessId = 'uniqueid'
                    $host.ui.RawUI.WindowTitle = 'uniqueid'
                    Start-Transcript -Path ("transcriptFilePath"+"$transcriptFileName") -Append
                    $global:RootAppDirectory   = 'importrootappdirectory'
                    $global:RootControllerType = 'importrootcontrollertype'
                    ."importterminalscriptpath"
                    Stop-Transcript
'@ -replace 'importterminalscriptpath',"$RunspaceScriptPath" -replace 'transcriptFilePath',"$global:dataTranscriptRunspaceFilePath" -replace 'importrootappdirectory',"$Global:RootAppDirectory" -replace 'importrootcontrollertype',"$Global:RootControllerType") -replace 'uniqueid',"$uniqueId"
                    $bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
                    $encodedCommand = [Convert]::ToBase64String($bytes)
                    $arg = "-NoExit", "-WindowStyle $terminalWindowStyle", "-encodedCommand $encodedCommand"
                    $proc = Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -argumentlist $arg -PassThru
                    $procPID  = $proc.Id
                    $procName = $proc.Name
                    $TerminalProcessId = $uniqueId
                    
                    $runspaceProcessDetail = {
                        $items = Get-CimInstance -ClassName win32_process -filter "ProcessId = `'$procPID`'"
                        $dataTranscriptFilePath = "$global:dataTranscriptRunspaceProcessFilePath"
                        foreach ($item in $items) {
                            #get owner
                            $owner = Invoke-CimMethod -InputObject $item -MethodName GetOwner
                            $parent = Get-Process -Id $item.ParentprocessID
                            if((gci $dataTranscriptFilePath -Filter ("$TerminalProcessId"+'*') -Recurse).Length -gt 0){
                                $status = 'Completed'
                                $lastAccessTime = (gci $dataTranscriptFilePath -Filter ("$TerminalProcessId"+'*') -Recurse).LastAccessTime
                            }
                            else{
                                $status = 'Running'
                            }
                            $processDetail = [PSCustomObject]@{
                                PSTypename      = "PowerShellProcess"
                                ProcessID       = $item.ProcessID
                                Name            = $item.Name
                                ScriptName      = 'SubRunspaceProcess'
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
                        }
                    }
                    $runspaceProcessDetail|iex                    
                    $TerminalJson = '['+'{'+'"'+'pid'+'"'+':'+'"'+"$procPID"+'"'+','+'"'+'Windowstyle'+'"'+':'+'"'+"$terminalWindowStyle"+'"'+','+'"'+'UniqueId'+'"'+':'+'"'+"$TerminalProcessId"+'"'+','+'"'+'Status'+'"'+':'+'"'+'run'+'"'+'}'+']'
                    $ProcessJson  = $processDetail | ConvertTo-Json
                    $NewFile      = New-Item -ItemType File ("$RunspaceUniquePath"+'terminal\'+'terminal'+'.json') -Force
                    $SaveContent  = Set-Content ("$RunspaceUniquePath"+'terminal\'+'terminal'+'.json') -Value $TerminalJson -Force
                    $NewFile      = New-Item -ItemType File ("$RunspaceUniquePath"+'terminal\'+'terminalProcessDetails'+'.json') -Force
                    $SaveContent  = Set-Content ("$RunspaceUniquePath"+'terminal\'+'terminalProcessDetails'+'.json') -Value $ProcessJson -Force
                    write-host ('Runspace PROCESS CREATED: '+"$QueueDataConfigId")
                    $GetTicks = (Get-Date).Ticks
                    $DataRunspaceList += @{
                        Type        = 'Runspace';
                        Name        = $QueueDataConfigName;
                        Ticks       = $GetTicks;
                        Credential  = 'Developer';
                        TaskId      = $QueueDataConfigId;
                        PID         = $procPID;
                        ProcessName = $procName;
                        ScriptPath  = $RunspaceScriptPath;
                    }

                }
                else{
                    write-host ('Runspace DIRECTORIES EXIST: '+"$QueueDataConfigId")
                }
            }
            elseif($QueueDataConfigType -eq 'runspace_validate'){

            }
            elseif($QueueDataConfigType -eq 'runspace_windowstyle'){

            }
            elseif($QueueDataConfigType -eq 'runspace_task'){

            }
            TIMEOUT /T 3
            Move-Item $QueueDataFullName $dataTaskCenterRunspaceProcessingFilePath -Force


        }
    }
    else{
        write-host 'Runspace queue is null'
    }
    if('' -ne $DataRunspaceList){
        $LocalPId = $PID
        foreach ($Runspace in $DataRunspaceList) {
            if($LocalPID -eq $Runspace.PID){
                $MainTerminalCondition = $true
            }
        }
        if($MainTerminalCondition -ne $true){
            $MainTerminalCondition = $false
            $GetTicks = (Get-Date).Ticks
            $DataRunspaceList += @{
                Type        = 'Terminal';
                Name        = 'Main-Runspace';
                Ticks       = $GetTicks;
                Credential  = 'Developer';
                TaskId      = $global:TerminalProcessId;
                PID         = $LocalPID;
                ProcessName = 'pwsh';
                ScriptPath  = $global:runspaceMainTerminalScriptFilePath;
            } 
        }
        
        $DataRunspacePSCO = [PSCustomObject]@{
            Status   = '1';
            TaskList = $DataRunspaceList;
        }
    }
    else{
        $DataRunspacePSCO = [PSCustomObject]@{
            Status   = '2';
            TaskList = 'null';
        }
    }
    $DataRunspaceJson = $DataRunspacePSCO|ConvertTo-Json
    if(Test-Path $global:dataRunspaceJsonFilePath){
        $Save = Set-Content $global:dataRunspaceJsonFilePath -Value $DataRunspaceJson -Force
    }
    else{
        $New  = New-Item -ItemType File $global:dataRunspaceJsonFilePath -Force
        $Save = Set-Content $global:dataRunspaceJsonFilePath -Value $DataRunspaceJson -Force
    }
}

$WindowStyleProcessSC = {
    $WindowStyleRequirementGci = gci $global:dataProcessWindowStyleRequirementFilePath
    foreach ($WindowStyle in $WindowStyleRequirementGci) {
        $dataProcessWindowStyleRequirementFilePathGciSelectIndex = $WindowStyle.FullName
        if('' -ne (gc $dataProcessWindowStyleRequirementFilePathGciSelectIndex)){
            $dataProcessWindowStyleRequirementFilePathGciSelectIndexGc = gc $dataProcessWindowStyleRequirementFilePathGciSelectIndex
            $dataProcessWindowStyleResultFilePathUniqueId = "$dataProcessWindowStyleResultFilePath"+"$dateTicksWindowStyleResult"+'-'+"$processWindowStyleRequirementId"+'.txt'
            if($dataProcessWindowStyleRequirementFilePathGciSelectIndexGc -match 'hidden'){
                $pwshIexString = 'powershell'+' '+'-window'+' '+'hidden'+' '+'-command'+' '+'"'+'New-Item'+' '+'-ItemType'+' '+'File'+' '+"$dataProcessWindowStyleResultFilePathUniqueId"+' '+'-value'+' '+"'"+'hidden success'+"'"+'"'
                $pwshIexString|iex
                write-host 'Window Style Requirement: hidden'
                TIMEOUT /T 3
            }
            elseif($dataProcessWindowStyleRequirementFilePathGciSelectIndexGc -match 'minimized'){
                $pwshIexString = 'powershell'+' '+'-window'+' '+'minimized'+' '+'-command'+' '+'"'+'New-Item'+' '+'-ItemType'+' '+'File'+' '+"$dataProcessWindowStyleResultFilePathUniqueId"+' '+'-value'+' '+"'"+'minimalized success'+"'"+'"'
                $pwshIexString|iex
                write-host 'Window Style Requirement: minimized'
                TIMEOUT /T 3
            }
            elseif($dataProcessWindowStyleRequirementFilePathGciSelectIndexGc -match 'normal'){
                $pwshIexString = 'powershell'+' '+'-window'+' '+'normal'+' '+'-command'+' '+'"'+'New-Item'+' '+'-ItemType'+' '+'File'+' '+"$dataProcessWindowStyleResultFilePathUniqueId"+' '+'-value'+' '+"'"+'normal success'+"'"+'"'
                $pwshIexString|iex
                write-host 'Window Style Requirement: normal'
                TIMEOUT /T 3
            }
            elseif($dataProcessWindowStyleRequirementFilePathGciSelectIndexGc -match 'maximized'){
                $pwshIexString = 'powershell'+' '+'-window'+' '+'maximized'+' '+'-command'+' '+'"'+'New-Item'+' '+'-ItemType'+' '+'File'+' '+"$dataProcessWindowStyleResultFilePathUniqueId"+' '+'-value'+' '+"'"+'maximalized success'+"'"+'"'
                $pwshIexString|iex
                write-host 'Window Style Requirement: maximized'
                TIMEOUT /T 3
            }
            else{
                write-host 'Window Style Requirement syntax is failed'
            }
        }
        else{
            write-host 'Window Style Requirement get-content is null'
        }        
    }
}

$SubTerminalSCxxxxxxxxxxxx = {
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
        2 {TIMEOUT /T 1}
        3 {$ValidateRunspaceSC|iex}
        4 {$SubRunspaceTaskListSC|iex}
        5 {$GenerateDataToQueueSC|iex}
        6 {$ValidateQueueDataSC|iex}
        8 {}
    }
}
$RepeatSC|iex

