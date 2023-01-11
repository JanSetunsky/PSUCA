function GetGlobalFilePaths {

    <# RUNSPACE MAIN TERMINAL SCRIPT FILEPATH #>
    $global:runspaceMainTerminalScriptFilePath = "$Global:RootAppDirectory"+'engine\controller\'+"$Global:RootControllerType"+'\modules\taskcenter\scripts\main-terminal.ps1'


    <# RUNSPACE SUB TERMINAL SCRIPT FILEPATH #>
    $global:runspaceSubTerminalScriptFilePath = "$Global:RootAppDirectory"+'engine\controller\'+"$Global:RootControllerType"+'\modules\taskcenter\scripts\sub-terminal.ps1'


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

function StartSwitchForPart1 {
    switch (1,2,3,4,5,6,7,8){
        1 {GetGlobalFilePaths}
        2 {TIMEOUT /T 1}
        3 {$ValidateRunspaceSC|iex}
        4 {$SubRunspaceTaskListSC|iex}
        5 {$GenerateDataToQueueSC|iex}
        6 {$ValidateQueueDataBeginSC|iex}
        7 {$ValidateRunspaceNotificationDataBeginSC|iex}
        8 {}
    }
}

function StartSwitchForPart2 {
    switch (1,2,3,4,5,6,7,8){
        1 {$ValidateRunspaceSC|iex}
        2 {$SubRunspaceTaskListSC|iex}
        3 {$GenerateValidateDataToQueueSC|iex}
        5 {$ValidateRunspaceNotificationDataAfterSC|iex}
        6 {$WindowStyleProcessSC|iex}
        7 {TIMEOUT /T 10}
        8 {}
    }
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

    # COMPARE OLD RUNSPACE LIST WITH NEW RUNSPACE LIST
    $AddTaskListResult    = @()
    $RemoveTaskListResult = @()
    $OldTaskListResult    = @()
    if($OldRunspaceTaskList.Count -gt 0){
        foreach ($OldTaskList in $OldRunspaceTaskList) {
            $OldTaskListId = $OldTaskList.Id
            foreach ($NewTaskList in $RunspaceList) {
                $NewTaskListId = $NewTaskList.Id
                if($OldTaskListId -eq $NewTaskListId){
                    $CompareTaskListCondition = $true
                }
            }
            if($CompareTaskListCondition -eq $true){
                $CompareTaskListCondition = $null
            }
            else{
                $OldTaskListResult += $OldTaskList
            }
        }
        if($OldTaskListResult.Count -gt 0){
            foreach ($CompareOldTask in $OldTaskListResult) {
                $CompareOldTaskId = $CompareOldTask.Id
                foreach ($OldNotification in $OldRunspaceNotification.TaskList) {
                    $OldNotificationId  = $OldNotification.TaskId
                    $OldNotificationPID = $OldNotification.Pid
                    if($CompareOldTaskId -eq $OldNotificationId -and $OldNotificationPID -ne 'null'){
                        TASKKILL /PID $OldNotification.Pid
                    }
                    elseif($CompareOldTaskId -eq $OldNotificationId -and $OldNotificationPID -eq 'null'){
                        # NEED REMOVE FORM RUNSPACE NOTIFICATION
                        Write-Host 'NEED REMOVE CURENT DATA FORM RUNSPACE NOTIFICATION'
                        $OldNotification
                    }
                }
            }
        }
        else{

        }
    }
    elseif($OldRunspaceTaskList.Count -eq 0){
        if($RunspaceList.Count -gt 0){
            foreach ($CompareTask in $RunspaceList) {
                $CompareTaskId = $CompareTask.Id
                if(($OldRunspaceNotification.TaskList).Count -gt 0){
                    foreach ($OldNotification in $OldRunspaceNotification.TaskList) {
                        $OldNotificationId = $OldNotification.TaskId
                        if($CompareTaskId -eq $OldNotificationId){
                            $CompareTaskListCondition = $true
                        }
                    }
                    if($CompareTaskListCondition -eq $true){
                        $CompareTaskListCondition = $null
                    }
                    else{
                        $AddTaskListResult += $CompareTaskId
                    }                    
                }
                else{

                }
            }
            if($AddTaskListResult.Count -gt 0){

            }
            else{

            }
        }
        else{

        }
    }


    $global:OldRunspaceTaskList = $RunspaceList
    
}

$GenerateValidateDataToQueueSC = {
    $InactiveRunspaceList = @()
    if($ActualRunspaceList -and $RunspaceList){
        foreach ($TaskRunspace in $RunspaceList) {
            $TaskRunspaceId = $TaskRunspace.Id
            foreach ($ActiveRunspace in $ActualRunspaceList) {
                $ActiveRunspaceId = $ActiveRunspace.Name
                if($TaskRunspaceId -eq $ActiveRunspaceId){
                    $ActiveRunspaceCondition = $true
                }
            }
            if($ActiveRunspaceCondition -eq $true){
                $ActiveRunspaceCondition = $null
            }
            else{
                $InactiveRunspaceList += $TaskRunspace
            }
        }
    }
    if($InactiveRunspaceList){
        $GetProcess                       = Get-Process
        $RunspaceDataNotificationGc       = gc $global:dataRunspaceJsonFilePath
        $RunspaceDataNotificationJson     = $RunspaceDataNotificationGc|ConvertFrom-Json
        $RunspaceDataNotificationStatus   = $RunspaceDataNotificationJson.Status
        $RunspaceDataNotificationTaskList = $RunspaceDataNotificationJson.TaskList
        foreach ($Runspace in $InactiveRunspaceList) {
            $RunspaceId = $Runspace.Id
            if($RunspaceDataNotificationStatus -eq 1){
                foreach ($RunspaceDataTask in $RunspaceDataNotificationTaskList) {
                    $RunspaceDataTaskId = $RunspaceDataTask.TaskId
                    if($RunspaceDataTaskId -eq $RunspaceId){
                        $RunspaceDataTaskCondition = $true
                    }
                }
                if($RunspaceDataTaskCondition -eq $true){
                    $RunspaceDataTaskPID         = $RunspaceDataTask.Pid
                    $RunspaceDataTaskProcessName = $RunspaceDataTask.ProcessName
                    if($RunspaceDataTaskPID -eq 'null'){

                    }
                    else{
                        foreach ($Process in $GetProcess) {
                            $ProcessId   = $Process.Id
                            $ProcessName = $Process.ProcessName
                            if($ProcessId -eq $RunspaceDataTaskPID -and $ProcessName -eq $RunspaceDataTaskProcessName){
                                $ValidateGetProcessCondition = $true
                            }
                        }
                        if($ValidateGetProcessCondition -eq $true){
                            $ValidateGetProcessCondition = $null
                        }
                        else{
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
                else{
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
    }
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

$ValidateQueueDataBeginSC = {
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
                    $ToProcessing = Move-Item $QueueDataFullName $dataTaskCenterRunspaceProcessingFilePath -Force
                    $ProcessingPath = $QueueDataFullName -replace '\\queue\\','\processing\'
                    $HistoryPath    = $QueueDataFullName -replace '\\queue\\','\history\'
                    $global:terminalWindowStyle = 'normal'
                    [string]$uniqueId = $RunspaceConfigId
                    $command = (
@'
                    $Success = Move-Item 'importprocessingpath' 'importhistorypath' -Force
                    $transcriptFileName = 'uniqueid'+'-'+"$PID"+'.txt'
                    $global:TerminalProcessId = 'uniqueid'
                    $host.ui.RawUI.WindowTitle = 'uniqueid'
                    Start-Transcript -Path ("transcriptFilePath"+"$transcriptFileName") -Append
                    $global:RootAppDirectory   = 'importrootappdirectory'
                    $global:RootControllerType = 'importrootcontrollertype'
                    ."importterminalscriptpath"
                    Stop-Transcript
'@ -replace 'importterminalscriptpath',"$RunspaceScriptPath" -replace 'transcriptFilePath',"$global:dataTranscriptRunspaceFilePath" -replace 'importrootappdirectory',"$Global:RootAppDirectory" -replace 'importrootcontrollertype',"$Global:RootControllerType") -replace 'uniqueid',"$uniqueId" -replace 'importprocessingpath',"$ProcessingPath" -replace 'importhistorypath',"$HistoryPath"
                    $bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
                    $encodedCommand = [Convert]::ToBase64String($bytes)
                    $arg = "-NoExit", "-WindowStyle $terminalWindowStyle", "-encodedCommand $encodedCommand"
                    $proc = Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -argumentlist $arg -PassThru
                    $procPID  = $proc.Id
                    $procName = $proc.Name
                    $SubTerminalProcessId = $uniqueId
                    
                    $runspaceProcessDetail = {
                        $items = Get-CimInstance -ClassName win32_process -filter "ProcessId = `'$procPID`'"
                        $dataTranscriptFilePath = "$global:dataTranscriptRunspaceProcessFilePath"
                        foreach ($item in $items) {
                            #get owner
                            $owner = Invoke-CimMethod -InputObject $item -MethodName GetOwner
                            $parent = Get-Process -Id $item.ParentprocessID
                            if((gci $dataTranscriptFilePath -Filter ("$SubTerminalProcessId"+'*') -Recurse).Length -gt 0){
                                $status = 'Completed'
                                $lastAccessTime = (gci $dataTranscriptFilePath -Filter ("$SubTerminalProcessId"+'*') -Recurse).LastAccessTime
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
                    $TerminalJson = '['+'{'+'"'+'pid'+'"'+':'+'"'+"$procPID"+'"'+','+'"'+'Windowstyle'+'"'+':'+'"'+"$terminalWindowStyle"+'"'+','+'"'+'UniqueId'+'"'+':'+'"'+"$SubTerminalProcessId"+'"'+','+'"'+'Status'+'"'+':'+'"'+'run'+'"'+'}'+']'
                    $ProcessJson  = $processDetail | ConvertTo-Json
                    $NewFile      = New-Item -ItemType File ("$RunspaceUniquePath"+'terminal\'+'terminal'+'.json') -Force
                    $SaveContent  = Set-Content ("$RunspaceUniquePath"+'terminal\'+'terminal'+'.json') -Value $TerminalJson -Force
                    $NewFile      = New-Item -ItemType File ("$RunspaceUniquePath"+'terminal\'+'terminalProcessDetails'+'.json') -Force
                    $SaveContent  = Set-Content ("$RunspaceUniquePath"+'terminal\'+'terminalProcessDetails'+'.json') -Value $ProcessJson -Force
                    write-host ('Runspace process CREATED: '+"$QueueDataConfigId")
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
                    write-host ('Runspace directories EXIST: '+"$QueueDataConfigId")
                }
            }
            elseif($QueueDataConfigType -eq 'runspace_validate'){

            }
            elseif($QueueDataConfigType -eq 'runspace_windowstyle'){

            }
            elseif($QueueDataConfigType -eq 'runspace_task'){

            }
            TIMEOUT /T 3
        }
    }
    else{
        write-host 'Runspace queue is null'
    }
}

$ValidateRunspaceNotificationDataBeginSC = {
    if($DataRunspaceList.Count -gt 0){
        $LocalPId   = $PID
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
    $DataRunspaceJson = $DataRunspacePSCO|ConvertTo-Json
    if(Test-Path $global:dataRunspaceJsonFilePath){
        $Save = Set-Content $global:dataRunspaceJsonFilePath -Value $DataRunspaceJson -Force
    }
    else{
        $New  = New-Item -ItemType File $global:dataRunspaceJsonFilePath -Force
        $Save = Set-Content $global:dataRunspaceJsonFilePath -Value $DataRunspaceJson -Force
    }
}

$ValidateQueueDataAfterSC = {
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
                    $ToProcessing = Move-Item $QueueDataFullName $dataTaskCenterRunspaceProcessingFilePath -Force
                    $ProcessingPath = $QueueDataFullName -replace '\\queue\\','\processing\'
                    $HistoryPath    = $QueueDataFullName -replace '\\queue\\','\history\'
                    $global:terminalWindowStyle = 'normal'
                    [string]$uniqueId = $RunspaceConfigId
                    $command = (
@'
                    $Success = Move-Item 'importprocessingpath' 'importhistorypath' -Force
                    $transcriptFileName = 'uniqueid'+'-'+"$PID"+'.txt'
                    $global:TerminalProcessId = 'uniqueid'
                    $host.ui.RawUI.WindowTitle = 'uniqueid'
                    Start-Transcript -Path ("transcriptFilePath"+"$transcriptFileName") -Append
                    $global:RootAppDirectory   = 'importrootappdirectory'
                    $global:RootControllerType = 'importrootcontrollertype'
                    ."importterminalscriptpath"
                    Stop-Transcript
'@ -replace 'importterminalscriptpath',"$RunspaceScriptPath" -replace 'transcriptFilePath',"$global:dataTranscriptRunspaceFilePath" -replace 'importrootappdirectory',"$Global:RootAppDirectory" -replace 'importrootcontrollertype',"$Global:RootControllerType") -replace 'uniqueid',"$uniqueId" -replace 'importprocessingpath',"$ProcessingPath" -replace 'importhistorypath',"$HistoryPath"
                    $bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
                    $encodedCommand = [Convert]::ToBase64String($bytes)
                    $arg = "-NoExit", "-WindowStyle $terminalWindowStyle", "-encodedCommand $encodedCommand"
                    $proc = Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -argumentlist $arg -PassThru
                    $procPID  = $proc.Id
                    $procName = $proc.Name
                    $SubTerminalProcessId = $uniqueId
                    
                    $runspaceProcessDetail = {
                        $items = Get-CimInstance -ClassName win32_process -filter "ProcessId = `'$procPID`'"
                        $dataTranscriptFilePath = "$global:dataTranscriptRunspaceProcessFilePath"
                        foreach ($item in $items) {
                            #get owner
                            $owner = Invoke-CimMethod -InputObject $item -MethodName GetOwner
                            $parent = Get-Process -Id $item.ParentprocessID
                            if((gci $dataTranscriptFilePath -Filter ("$SubTerminalProcessId"+'*') -Recurse).Length -gt 0){
                                $status = 'Completed'
                                $lastAccessTime = (gci $dataTranscriptFilePath -Filter ("$SubTerminalProcessId"+'*') -Recurse).LastAccessTime
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
                    $TerminalJson = '['+'{'+'"'+'pid'+'"'+':'+'"'+"$procPID"+'"'+','+'"'+'Windowstyle'+'"'+':'+'"'+"$terminalWindowStyle"+'"'+','+'"'+'UniqueId'+'"'+':'+'"'+"$SubTerminalProcessId"+'"'+','+'"'+'Status'+'"'+':'+'"'+'run'+'"'+'}'+']'
                    $ProcessJson  = $processDetail | ConvertTo-Json
                    $NewFile      = New-Item -ItemType File ("$RunspaceUniquePath"+'terminal\'+'terminal'+'.json') -Force
                    $SaveContent  = Set-Content ("$RunspaceUniquePath"+'terminal\'+'terminal'+'.json') -Value $TerminalJson -Force
                    $NewFile      = New-Item -ItemType File ("$RunspaceUniquePath"+'terminal\'+'terminalProcessDetails'+'.json') -Force
                    $SaveContent  = Set-Content ("$RunspaceUniquePath"+'terminal\'+'terminalProcessDetails'+'.json') -Value $ProcessJson -Force
                    write-host ('Runspace process CREATED: '+"$QueueDataConfigId")
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
                    write-host ('Runspace directories EXIST: '+"$QueueDataConfigId")
                }
            }
            elseif($QueueDataConfigType -eq 'runspace_validate'){

            }
            elseif($QueueDataConfigType -eq 'runspace_windowstyle'){

            }
            elseif($QueueDataConfigType -eq 'runspace_task'){

            }
            TIMEOUT /T 3
        }
    }
    else{
        write-host 'Runspace queue is null'
    }
}

$ValidateRunspaceNotificationDataAfterSC = {
    $LocalPId                    = $PID
    $GetProcess                  = Get-Process
    $RunspaceSwitchOnList        = @()
    $RunspaceSwitchOffList       = @()
    $RunspaceNoneInteractionList = @()
    $NewRunspaceNotificationList = @()
    $NewRunspaceList             = @()
    $NewRunspaceQueueList        = @()
    $RunspaceDataNotificationGc       = gc $global:dataRunspaceJsonFilePath
    $RunspaceDataNotificationJson     = $RunspaceDataNotificationGc|ConvertFrom-Json
    $RunspaceDataNotificationStatus   = $RunspaceDataNotificationJson.Status
    $RunspaceDataNotificationTaskList = $RunspaceDataNotificationJson.TaskList
    foreach ($RunspaceDataTask in $RunspaceDataNotificationTaskList) {
        if($RunspaceDataTask.Pid -eq 'null'){
            $RunspaceSwitchOffList += $RunspaceDataTask
            $RunspaceInteraction    = $true
        }
        else{
            foreach ($Process in $GetProcess) {
                if($LocalPId -eq $RunspaceDataTask.Pid -and $Process.Id -eq $RunspaceDataTask.Pid -and $Process.ProcessName -eq $RunspaceDataTask.ProcessName){
                    $RunspaceSwitchOnList += $RunspaceDataTask
                    $RunspaceInteraction   = $true
                }
                elseif($LocalPId -ne $RunspaceDataTask.Pid -and $Process.Id -eq $RunspaceDataTask.Pid -and $Process.ProcessName -eq $RunspaceDataTask.ProcessName){
                    $RunspaceSwitchOnList += $RunspaceDataTask
                    $RunspaceInteraction   = $true
                }
            }
        }

        if($RunspaceInteraction -eq $true){
            $RunspaceInteraction = $null
        }
        else{
            $RunspaceNoneInteractionList += $RunspaceDataTask
            $RunspaceInteraction          = $null
        }
    }

    if($RunspaceSwitchOffList.Count -gt 0 ){
        foreach ($Runspace in $RunspaceSwitchOffList) {
            if($Runspace.Name -eq 'Main-Runspace'){
                $WarningSignal = $true
            }
        }
    }

    if($WarningSignal -eq $true){
        Write-Host 'Warning Signal is TRUE!'
        Write-Host 'All process is stoped!'
    }
    else{
        if($RunspaceList){

            # RUNSPACE SWITCH OFF LIST
            if($RunspaceSwitchOffList.Count -gt 0){
                foreach ($RunspaceItem in $RunspaceSwitchOffList) {
                    $RunspaceItemTaskId = $RunspaceItem.TaskId
                    foreach ($RunspaceInterface in $RunspaceList) {
                        $RunspaceInterfaceId = $RunspaceInterface.Id
                        if($RunspaceItemTaskId -eq $RunspaceInterfaceId){
                            $RunspaceCondition = $true
                            $RunspaceCatchData = $RunspaceInterface
                        }
                    }
                    if($RunspaceCondition -eq $true){
                        $RunspaceId = $RunspaceCatchData.Id
                        write-host ('Runspace is OFF: '+"$RunspaceId")
                        $NewRunspaceNotificationList += $RunspaceItem
                        $NewRunspaceList             += $RunspaceCatchData
                        $RunspaceCondition            = $null
                        $RunspaceCatchData            = $null
                    }
                    else{
                        
                    }
                }
            }
            else{
                $RunspaceSwitchOffList = 'null'
            }

            # RUNSPACE SWITCH ON LIST
            if($RunspaceSwitchOnList.Count -gt 0){
                foreach ($RunspaceItem in $RunspaceSwitchOnList) {
                    $RunspaceItemTaskId = $RunspaceItem.TaskId
                    foreach ($RunspaceInterface in $RunspaceList) {
                        $RunspaceInterfaceId = $RunspaceInterface.Id
                        if($RunspaceItemTaskId -eq $RunspaceInterfaceId){
                            $RunspaceCondition = $true
                            $RunspaceCatchData = $RunspaceInterface
                        }
                    }
                    if($RunspaceCondition -eq $true){
                        $NewRunspaceNotificationList += $RunspaceItem
                        $NewRunspaceList             += $RunspaceCatchData
                        $RunspaceCondition            = $null
                        $RunspaceCatchData            = $null
                    }
                    else{

                    }
                }
            }
            else{
                $RunspaceSwitchOnList = 'null'
            }

            # RUNSPACE NONE INTERACTION LIST
            if($RunspaceNoneInteractionList.Count -gt 0){
                foreach ($RunspaceItem in $RunspaceNoneInteractionList) {
                    $RunspaceItemTaskId = $RunspaceItem.TaskId
                    foreach ($RunspaceInterface in $RunspaceList) {
                        $RunspaceInterfaceId = $RunspaceInterface.Id
                        if($RunspaceItemTaskId -eq $RunspaceInterfaceId){
                            $RunspaceCondition = $true
                            $RunspaceCatchData = $RunspaceInterface
                        }
                    }
                    if($RunspaceCondition -eq $true){
                        $NewRunspaceNotificationList += $RunspaceItem
                        $NewRunspaceList             += $RunspaceCatchData
                        $RunspaceCondition            = $null
                        $RunspaceCatchData            = $null
                    }
                    else{

                    }
                }
            }
            else{
                $RunspaceNoneInteractionList = 'null'
            }

            # ADD MAIN RUNSPACE TERMINAL TO LIST
            foreach ($Runspace in $NewRunspaceNotificationList) {
                if($LocalPID -eq $Runspace.PID){
                    $MainTerminalCondition = $true
                }
            }
            if($MainTerminalCondition -ne $true){
                $MainTerminalCondition = $false
                $GetTicks = (Get-Date).Ticks
                $NewRunspaceNotificationList += [PSCustomObject]@{
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

            # COMPARE NOTIFICATION LIST
            foreach ($OldData in $RunspaceDataNotificationTaskList) {
                foreach ($NewData in $NewRunspaceNotificationList) {
                    if($OldData.TaskId -eq $NewData.TaskId){
                        if($OldData.Pid -eq 'null' -and $NewData.Pid -eq 'null'){

                        }
                        elseif($OldData.Pid -eq $NewData.Pid){
                            foreach ($Process in $GetProcess) {
                                if($Process.Id -eq $OldData.Pid -and $Process.ProcessName -eq $OldData.ProcessName){
                                    $ValidateProcessActivity = $true
                                }
                            }
                            if($ValidateProcessActivity -eq $true){
                                $ValidateProcessActivity = $null
                            }
                            else{
                                # START NEW PROCESS ADD TO QUEUE LIST
                                $NewDataId  = $NewData.TaskId
                                foreach ($Runspace in $NewRunspaceList) {
                                    $RunspaceId = $Runspace.Id
                                    if($RunspaceId -eq $NewDataId){
                                        $NewRunspaceQueueList += $Runspace
                                    }
                                }
                            }
                        }
                        else{
                            foreach ($Process in $GetProcess) {
                                # VALIDATE OLD
                                if($Process.Id -eq $OldData.Pid -and $Process.ProcessName -eq $OldData.ProcessName){
                                    $OldValidateProcessActivity = $true
                                }
                                # VALIDATE NEW
                                if($Process.Id -eq $NewData.Pid -and $Process.ProcessName -eq $NewData.ProcessName){
                                    $NewValidateProcessActivity = $true
                                }
                            }
                            if($OldValidateProcessActivity -eq $true -and $NewValidateProcessActivity -eq $true){
                                TASKKILL /PID $OldData.Pid
                                $OldValidateProcessActivity = $null
                                $NewValidateProcessActivity = $null
                            }
                            elseif($OldValidateProcessActivity -eq $null -and $NewValidateProcessActivity -eq $true){
                                $RunspaceName = $NewData.Name
                                Write-Host ('Warning for runspace: '+"$RunspaceName")
                                Write-Host 'Message: Runspace has a non-standard condition type 1!'
                                $NewValidateProcessActivity = $null
                            }
                            elseif($OldValidateProcessActivity -eq $true -and $NewValidateProcessActivity -eq $null){
                                $RunspaceName = $NewData.Name
                                Write-Host ('Warning for runspace: '+"$RunspaceName")
                                Write-Host 'Message: Runspace has a non-standard condition type 2!'
                                $OldValidateProcessActivity = $null
                            }
                            elseif($OldValidateProcessActivity -eq $null -and $NewValidateProcessActivity -eq $null){
                                if($NewData.Pid -eq 'null'){
                                    $RunspaceName = $NewData.Name
                                    Write-Host ('Warning for runspace: '+"$RunspaceName")
                                    Write-Host 'Message: Runspace has a non-standard condition type 3!'
                                }
                                elseif($OldData.Pid -eq 'null'){
                                    # START NEW PROCESS ADD TO QUEUE LIST
                                    $NewDataId  = $NewData.TaskId
                                    foreach ($Runspace in $NewRunspaceList) {
                                        $RunspaceId = $Runspace.Id
                                        if($RunspaceId -eq $NewDataId){
                                            $NewRunspaceQueueList += $Runspace
                                        }
                                    }
                                }
                                else{
                                    # START NEW PROCESS ADD TO QUEUE LIST
                                    $NewDataId  = $NewData.TaskId
                                    foreach ($Runspace in $NewRunspaceList) {
                                        $RunspaceId = $Runspace.Id
                                        if($RunspaceId -eq $NewDataId){
                                            $NewRunspaceQueueList += $Runspace
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if($NewRunspaceNotificationList){
                $DataRunspacePSCO = [PSCustomObject]@{
                    Status   = '1';
                    TaskList = $NewRunspaceNotificationList;
                }
            }
            else{
                $DataRunspacePSCO = [PSCustomObject]@{
                    Status   = '2';
                    TaskList = '';
                }                    
            }
        }
        else{
            Write-Host 'Runspace task list is null'
            $GetTicks = (Get-Date).Ticks
            $NewRunspaceNotificationList += [PSCustomObject]@{
                Type        = 'Terminal';
                Name        = 'Main-Runspace';
                Ticks       = $GetTicks;
                Credential  = 'Developer';
                TaskId      = $global:TerminalProcessId;
                PID         = $LocalPID;
                ProcessName = 'pwsh';
                ScriptPath  = $global:runspaceMainTerminalScriptFilePath;
            } 
            $DataRunspacePSCO = [PSCustomObject]@{
                Status   = '1';
                TaskList = $NewRunspaceNotificationList;
            }
        }
    }

    if($NewRunspaceQueueList){
        $RunspaceList = $NewRunspaceQueueList
    }
    else{
        $RunspaceList = $null
    }

    # SUB RUNSPACE TASKS
    switch(1,2){
        1 {$GenerateDataToQueueSC|iex}
        2 {$ValidateQueueDataAfterSC|iex}
    }

    # RUNSPACE TASK LIST VALIDATE
    if($DataRunspaceList.Count -gt 0){
        $Num1 = 0
        foreach ($CreatedRunspace in $DataRunspaceList) {
            if(($DataRunspacePSCO.TaskList).Count -gt 0){
                $Num2 = 0
                foreach ($Runspace in $DataRunspacePSCO.TaskList) {
                    if($CreatedRunspace.TaskId -eq $Runspace.TaskId){
                        [array]$IndexPSCOList += [PSCustomObject]@{
                            from = $Num1
                            to   = $Num2
                        }
                    }
                    $Num2++
                }
            }
            else{
                $DataRunspacePSCO = [PSCustomObject]@{
                    Status   = '1';
                    TaskList = $DataRunspaceList;
                }
            }
            $Num1++
        }
        if($IndexPSCOList.Count -gt 0){
            foreach ($IndexPSCO in $IndexPSCOList) {
                ($DataRunspacePSCO.TaskList)[$IndexPSCO.to] = $DataRunspaceList[$IndexPSCO.from]
            }
        }
    }

    # VALIDATE RUNSPACE NOTIFICATION DATA
    if($DataRunspacePSCO.Status -eq 1){
        $AddNewNotificationList = @()
        $AddNotificationList    = @()
        if($InactiveRunspaceList -and $DataRunspaceList){
            foreach ($InactiveRunspace in $InactiveRunspaceList) {
                $InactiveRunspaceId = $InactiveRunspace.Id
                foreach ($DataRunspace in $DataRunspaceList) {
                    $DataRunspaceId = $DataRunspace.TaskId
                    if($InactiveRunspaceId -eq $DataRunspaceId){
                        foreach ($Notificiation in $RunspaceDataNotificationTaskList) {
                            $NotificiationId = $Notificiation.TaskId
                            if($NotificiationId -eq $InactiveRunspaceId){
                                $NotificiationCondition = $true
                            }
                        }
                        if($NotificiationCondition -eq $true){
                            $NotificiationCondition = $null
                        }
                        else{
                            $AddNotificationList += $DataRunspace
                        }
                    }
                }
            }
            if($AddNotificationList.Count -gt 0){
                $DataRunspacePSCOTaskList = $DataRunspacePSCO.TaskList
                $AddNewNotificationList  += $DataRunspacePSCOTaskList
                $AddNewNotificationList  += $AddNotificationList
                $DataRunspacePSCO = [PSCustomObject]@{
                    Status   = '1';
                    TaskList = $AddNewNotificationList;
                }
            }
        }
    }    

    # BATCHING TASKS INTO RUNSPACE QUEUE
    if($DataRunspacePSCO.Status -eq 1){
        foreach ($Runspace in $DataRunspacePSCO.TaskList) {
            $RunspaceId = $Runspace.TaskId
            foreach ($Interface in $NewRunspaceList) {
                $InterfaceId = $Interface.Id
                if($RunspaceId -eq $InterfaceId){
                    $TasksData  = $Interface.Data
                    $ConfigPSCO = [PSCustomObject]@{
                        Id   = $InterfaceId
                        Data = $TasksData
                        Type = 'task-list-data'
                    }
                    $ConfigJson = $ConfigPSCO|ConvertTo-Json -Depth 100
                    $QueuePath  = "$global:dataTaskCenterRunspaceDefaultPath"+"$RunspaceId"+'\'+'queue'+'\'
                    if(Test-Path $QueuePath){
                        $GetTicks = (Get-Date).Ticks
                        $NewDir   = New-Item -ItemType Directory ("$QueuePath"+"$GetTicks"+'\')
                        $NewFile  = New-Item -ItemType File ("$QueuePath"+"$GetTicks"+'\'+'config'+'.json')
                        $SaveData = Set-Content ("$QueuePath"+"$GetTicks"+'\'+'config'+'.json') -Value $ConfigJson
                    }
                }
            }
        }
    }

    # SAVE OLD RUNSPACE DATA NOTIFICATION
    $global:OldRunspaceNotification = $DataRunspacePSCO

    # SAVE RUNSPACE DATA NOTIFICATION TO FILE
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
    if($WindowStyleRequirementGci.Count -gt 0){
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

StartSwitchForPart1

$r = {StartSwitchForPart2;$r|iex}
$r|iex