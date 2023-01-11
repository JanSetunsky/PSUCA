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


    # TASK CACHE EDITOR DATA PATH NODE JS
    $global:NodeJSPath = "$Global:RootAppDirectory"+'engine\controller\'+"$Global:RootControllerType"+'\package\nodejs\node.exe'

    # TASK CACHE EDITOR DATA PATH PYTHON
    $global:PythonPYPath = "$Global:RootAppDirectory"+'engine\controller\'+"$Global:RootControllerType"+'\package\python37\python.exe'

}

$RunspaceParameters = {
    $ParamPSCO = [PSCustomObject]@{
        ElapsedTime = $TerminalElapsedTime
        Timeout     = '5'
        LastAccess  = (Get-Date)
        WindowStyle = 'Normal'
    }
    Write-Host ''
    Write-Host -f Green  ('_________________________________________________________________')
    Write-Host -f Green  ('|[ Runspace Details ][ :::::::::::::::::::::::::::::::::::::::: ]')
    Write-Host -f Green  ('|´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
    Write-Host -f Green  ('|   _____________________________________________________________')
    Write-Host -f Green  ('|   | Id           : ') -NoNewLine; Write-Host $TerminalProcessId
    Write-Host -f Green  ('|   | Controller   : ') -NoNewLine; Write-Host $RootControllerType
    Write-Host -f Green  ('|   | Elapsed Time : ') -NoNewLine; Write-Host ($ParamPSCO.ElapsedTime).Elapsed
    Write-Host -f Green  ('|   | Last Access  : ') -NoNewLine; Write-Host $ParamPSCO.LastAccess
    Write-Host -f Green  ('|   | Window Style : ') -NoNewLine; Write-Host $ParamPSCO.WindowStyle
    Write-Host -f Green  ('|   ´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')

    if($JobList.Count -gt 0 -and $TaskConfigurationList.Count -gt 0){
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   _____________________________________________________________')
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Repeats : ') -NoNewLine; Write-Host $RepeatNum
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Jobs    : ') -NoNewLine; Write-Host $JobList.Count
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Tasks   : ') -NoNewLine; Write-Host $TaskConfigurationList.Count
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   ´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
        Write-Host -f Green ('|________________________________________________________________')
        Write-Host ''
    }
    elseif($JobList.Count -eq 0 -and $TaskConfigurationList.Count -gt 0){
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   _____________________________________________________________')
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Repeats : ') -NoNewLine; Write-Host $RepeatNum
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Jobs    : ') -NoNewLine; Write-Host '0'
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Tasks   : ') -NoNewLine; Write-Host $TaskConfigurationList.Count
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   ´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
        Write-Host -f Green ('|________________________________________________________________')
        Write-Host ''
    }
    elseif($JobList.Count -gt 0 -and $TaskConfigurationList.Count -eq 0){
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   _____________________________________________________________')
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Repeats : ') -NoNewLine; Write-Host $RepeatNum
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Jobs    : ') -NoNewLine; Write-Host $JobList.Count
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Tasks   : ') -NoNewLine; Write-Host '0'
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   ´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
        Write-Host -f Green ('|________________________________________________________________')
        Write-Host ''
    }    
    else{
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   _____________________________________________________________')
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Repeats : ') -NoNewLine; Write-Host $RepeatNum
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Jobs    : ') -NoNewLine; Write-Host '0'
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   | Total Tasks   : ') -NoNewLine; Write-Host '0'
        Write-Host -f Green ('|') -NoNewline;Write-Host -f Yellow ('   ´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
        Write-Host -f Green ('|________________________________________________________________')
        Write-Host ''
    }
}

$ValidateQueueData = {
    $QueueDataList = gci $global:dataTaskCenterRunspaceQueueFilePath
    $TaskList      = @()
    if($QueueDataList.Count -gt 0){
        foreach ($QueueData in $QueueDataList) {
            $QueueDataFullName          = $QueueData.FullName
            $QueueDataConfig            = "$QueueDataFullName"+'\'+'config'+'.json'
            if(Test-Path $QueueDataConfig){
                $QueueDataConfigGci         = gci $QueueDataConfig
                $QueueDataConfigLastAccess  = $QueueDataConfigGci.LastAccessTime
                $QueueDataConfigLastWrite   = $QueueDataConfigGci.LastWriteTime
                $QueueDataConfigGc          = gc $QueueDataConfig
                $QueueDataConfigJson        = $QueueDataConfigGc|ConvertFrom-Json -ErrorAction SilentlyContinue
                if($QueueDataConfigJson){
                    $QueueDataConfigType        = $QueueDataConfigJson.Type
                    if($QueueDataConfigType -eq 'task-list-data'){
                        $QueueDataConfigDetailData  = $QueueDataConfigJson.Data
                        if($QueueDataConfigDetailData.Count -eq 1){
                            $TaskType      = $QueueDataConfigType
                            $TaskName      = $QueueDataConfigDetailData.Name
                            $TaskInterface = $QueueDataConfigDetailData.Interface
                            $TaskId        = $QueueDataConfigDetailData.TaskId
                            $TaskPath      = $QueueDataConfigDetailData.Path
                            $TaskList     += @{Id=$TaskId;Path=$TaskPath;LastWrite=$QueueDataConfigLastWrite;Type=$TaskType}
                        }
                        elseif($QueueDataConfigDetailData.Count -gt 1){
                            foreach ($TaskData in $QueueDataConfigDetailData) {
                                $TaskType      = $QueueDataConfigType
                                $TaskName      = $TaskData.Name
                                $TaskInterface = $TaskData.Interface
                                $TaskId        = $TaskData.TaskId
                                $TaskPath      = $TaskData.Path
                                $TaskList     += @{Id=$TaskId;Path=$TaskPath;LastWrite=$QueueDataConfigLastWrite;Type=$TaskType}
                            }
                        }
                        else{
                            Write-Host 'Task data is null!'
                        }
                    }
                }
            }
            $MoveToHistory = Move-Item $QueueDataFullName $dataTaskCenterRunspaceHistoryFilePath -Force -ErrorAction SilentlyContinue
        }
    }
    else{
        Write-Host 'Queue data list is null!'
    }
}

$AnalysisTaskListData = {
    $UsedTaskList = @()
    if($TaskList.Count -gt 0){
        foreach ($Task in $TaskList) {
            if($Task.Type -eq 'task-list-data'){
                # LATEST TASK DATA FILTERING
                $TaskId = $Task.Id
                if(($true -eq $($TaskList.Id -match $TaskId)) -and ($true -ne $($UsedTaskList -match $TaskId))){
                    $ArrayIndexList = @()
                    $Num            = 0
                    foreach ($SelectTask in $TaskList) {
                        if($TaskId -eq $SelectTask.Id){
                            $ArrayIndexList += $num
                        }
                        $Num++
                    }
                    $ArrayLastWriteList = @()
                    if($ArrayIndexList.Count -gt 0){
                        foreach ($Index in $ArrayIndexList) {
                            $SelectedTask          = $TaskList[$Index]
                            $SelectedTaskLastWrite = $SelectedTask.LastWrite
                            $ArrayLastWriteList   += $SelectedTaskLastWrite
                            foreach ($LastWrite in $ArrayLastWriteList) {
                                if($SelectedTaskLastWrite -ge $LastWrite){
                                    $HighestLastWrite = $SelectedTaskLastWrite
                                    $SavedIndex       = $Index
                                }
                            }
                        }
                        $UsedTaskList    += @{Id=$TaskId;LastWrite=$HighestLastWrite;Index=$SavedIndex}
                        $HighestLastWrite = $null
                        $SavedIndex       = $null
                    }
                }
            }
            else{
                Write-Host 'Task type is not valid!'            
            }
        }
    }
    else{
        Write-Host 'Task list is null!'
    }

    # SELECTED USED TASK LIST BY INDEX
    $TaskConfigurationList = @()
    if($UsedTaskList.Count -gt 0){
        foreach ($UsedTask in $UsedTaskList) {
            $UsedTaskId        = $UsedTask.Id
            $UsedTaskLastWrite = $UsedTask.LastWrite
            $UsedTaskIndex     = $UsedTask.Index
            $SelectedTask      = $TaskList[$UsedTaskIndex]
            $SelectedTaskPath  = $SelectedTask.Path
            if(Test-Path $SelectedTaskPath){
                $SelectedTaskGc   = gc $SelectedTaskPath
                $SelectedTaskJson = $SelectedTaskGc|ConvertFrom-Json -ErrorAction SilentlyContinue
                if($SelectedTaskJson){
                    $TaskConfigurationList += $SelectedTaskJson
                }
            }
            
        }
    }
}

$AddTaskConfigToJobListSC = {
    $Date      = (Get-Date).Date
    $TimeOfDay = (Get-Date).TimeOfDay
    if($TaskConfigurationList.Count -gt 0){
        foreach ($TaskConfig in $TaskConfigurationList) {
            $TaskUniqueId  = $TaskConfig.TaskUniqueId
            $TaskName      = $TaskConfig.TaskNameIdTextBox
            $TaskStartDate = (Get-Date -Year (2000+$TaskConfig.TaskStartDateYearTextBox) -Month $TaskConfig.TaskStartDateMonthTextBox -Day $TaskConfig.TaskStartDateDayTextBox).Date
            $TaskEndDate   = (Get-Date -Year (2000+$TaskConfig.TaskEndDateYearTextBox) -Month $TaskConfig.TaskEndDateMonthTextBox -Day $TaskConfig.TaskEndDateDayTextBox).Date
            $TaskStartTime = (Get-Date -Hour $TaskConfig.TaskStartTimeHourTextBox -Minute $TaskConfig.TaskStartTimeMinuteTextBox -Second $TaskConfig.TaskStartTimeSecondTextBox).TimeOfDay
            $TaskEndTime   = (Get-Date -Hour $TaskConfig.TaskEndTimeHourTextBox -Minute $TaskConfig.TaskEndTimeMinuteTextBox -Second $TaskConfig.TaskEndTimeSecondTextBox).TimeOfDay
            $TaskStatus    = $TaskConfig.TaskStatus
            if($JobList.Count -gt 0){
                if($TaskUniqueId.Length -gt 0 -and ($true -ne @($JobList.TaskUniqueId -match $TaskUniqueId))){
                    if($TaskStatus -eq 'Active'){
                        if($Date -ge $TaskStartDate -and $Date -le $TaskEndDate){
                            if($TimeOfDay -ge $TaskStartTime -and $TimeOfDay -le $TaskEndTime){
                                $JobItem = [PSCustomObject]@{
                                    TaskUniqueId          = $TaskConfig.TaskUniqueId
                                    TaskName              = $TaskConfig.TaskNameIdTextBox
                                    TaskGroup             = $TaskConfig.TaskGroupIdSelectBox
                                    TaskType              = $TaskConfig.TaskTypeIdSelectBox
                                    TaskStartPoint        = $TaskConfig.InterfaceBlocksStartPointIdSelectBox
                                    TaskEndPoint          = $TaskConfig.InterfaceBlocksEndPointIdSelectBox
                                    TaskStartDate         = (Get-Date -Year (2000+$TaskConfig.TaskStartDateYearTextBox) -Month $TaskConfig.TaskStartDateMonthTextBox -Day $TaskConfig.TaskStartDateDayTextBox).Date
                                    TaskEndDate           = (Get-Date -Year (2000+$TaskConfig.TaskEndDateYearTextBox) -Month $TaskConfig.TaskEndDateMonthTextBox -Day $TaskConfig.TaskEndDateDayTextBox).Date
                                    TaskStartTime         = (Get-Date -Hour $TaskConfig.TaskStartTimeHourTextBox -Minute $TaskConfig.TaskStartTimeMinuteTextBox -Second $TaskConfig.TaskStartTimeSecondTextBox).TimeOfDay
                                    TaskEndTime           = (Get-Date -Hour $TaskConfig.TaskEndTimeHourTextBox -Minute $TaskConfig.TaskEndTimeMinuteTextBox -Second $TaskConfig.TaskEndTimeSecondTextBox).TimeOfDay
                                    TaskLimitTime         = (Get-Date -Hour $TaskConfig.TaskLimitTimeHourTextBox -Minute $TaskConfig.TaskLimitTimeMinuteTextBox -Second $TaskConfig.TaskLimitTimeSecondTextBox).TimeOfDay
                                    TaskRepetitionTime    = (Get-Date -Hour $TaskConfig.TaskRepetitionTimeHourTextBox -Minute $TaskConfig.TaskRepetitionTimeMinuteTextBox -Second $TaskConfig.TaskRepetitionTimeSecondTextBox).TimeOfDay
                                    TaskStatus            = $TaskConfig.TaskStatus
                                    TaskScriptWindowStyle = $TaskConfig.TaskWindowStyleIdSelectBox
                                    TaskScriptLanguage    = $TaskConfig.TaskScriptblockLanguageSelectBox
                                    TaskScriptPath        = $TaskConfig.TaskScriptBlockFullName
                                    TaskFirstStart        = Get-Date
                                    TaskTotalElapsedTime  = [system.diagnostics.stopwatch]::StartNew()
                                    TaskRepeatElapsedTime = [system.diagnostics.stopwatch]::StartNew()
                                }
                                if(Test-Path $JobItem.TaskScriptLanguage){
                                    if($JobItem.TaskScriptLanguage -eq 'Javascript'){
                                        .($NodeJSPath) $JobItem.TaskScriptPath
                                    }
                                    elseif($JobItem.TaskScriptLanguage -eq 'Powershell'){
                                        .($JobItem.TaskScriptPath)
                                    }
                                    elseif($JobItem.TaskScriptLanguage -eq 'Python'){
                                        .($PythonPYPath) $JobItem.TaskScriptPath
                                    }
                                }
                                [array]$JobList += $JobItem
                                Write-Host -f Green ('____________________________________________________________')
                                Write-Host -f Green ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                                Write-Host -f Green ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                                Write-Host -f Green ('| Language  | ') -NoNewLine; Write-Host $TaskConfig.TaskScriptblockLanguageSelectBox
                                Write-Host -f Green ('| Display   | ') -NoNewLine; Write-Host $TaskConfig.TaskWindowStyleIdSelectBox
                                Write-Host -f Green ('| Message   | ') -NoNewLine; Write-Host ('Job is successfully imported!')
                                Write-Host -f Green ('| Process   | ') -NoNewLine; Write-Host ('Start execute job!')
                                Write-Host -f Green ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                            }
                            else{
                                Write-Host -f Red ('____________________________________________________________')
                                Write-Host -f Red ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                                Write-Host -f Red ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                                Write-Host -f Red ('| Language  | ') -NoNewLine; Write-Host $TaskConfig.TaskScriptblockLanguageSelectBox
                                Write-Host -f Red ('| Display   | ') -NoNewLine; Write-Host $TaskConfig.TaskWindowStyleIdSelectBox
                                Write-Host -f Red ('| Message   | ') -NoNewLine; Write-Host ('Time is not valid!')
                                Write-Host -f Red ('| Process   | ') -NoNewLine; Write-Host ('Job creation stopped!')
                                Write-Host -f Red ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                            }
                        }
                        else{
                            Write-Host -f Red ('____________________________________________________________')
                            Write-Host -f Red ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                            Write-Host -f Red ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                            Write-Host -f Red ('| Language  | ') -NoNewLine; Write-Host $TaskConfig.TaskScriptblockLanguageSelectBox
                            Write-Host -f Red ('| Display   | ') -NoNewLine; Write-Host $TaskConfig.TaskWindowStyleIdSelectBox
                            Write-Host -f Red ('| Message   | ') -NoNewLine; Write-Host ('Date is not valid!')
                            Write-Host -f Red ('| Process   | ') -NoNewLine; Write-Host ('Job creation stopped!')
                            Write-Host -f Red ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                        }
                    }
                    else{
                        Write-Host -f Red ('____________________________________________________________')
                        Write-Host -f Red ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                        Write-Host -f Red ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                        Write-Host -f Red ('| Language  | ') -NoNewLine; Write-Host $TaskConfig.TaskScriptblockLanguageSelectBox
                        Write-Host -f Red ('| Display   | ') -NoNewLine; Write-Host $TaskConfig.TaskWindowStyleIdSelectBox
                        Write-Host -f Red ('| Message   | ') -NoNewLine; Write-Host ('Task is not actived!')
                        Write-Host -f Red ('| Process   | ') -NoNewLine; Write-Host ('Job creation stopped!')
                        Write-Host -f Red ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                    }
                }
                elseif($TaskUniqueId.Length -gt 0 -and ($true -eq @($JobList.TaskId -match $TaskUniqueId))){
                    Write-Host -f Red ('____________________________________________________________')
                    Write-Host -f Red ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                    Write-Host -f Red ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                    Write-Host -f Red ('| Language  | ') -NoNewLine; Write-Host $TaskConfig.TaskScriptblockLanguageSelectBox
                    Write-Host -f Red ('| Display   | ') -NoNewLine; Write-Host $TaskConfig.TaskWindowStyleIdSelectBox
                    Write-Host -f Red ('| Message   | ') -NoNewLine; Write-Host ('Task id is used!')
                    Write-Host -f Red ('| Process   | ') -NoNewLine; Write-Host ('Job creation stopped!')
                    Write-Host -f Red ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                }
            }
            else{
                if($TaskStatus -eq 'Active'){
                    if($Date -ge $TaskStartDate -and $Date -le $TaskEndDate){
                        if($TimeOfDay -ge $TaskStartTime -and $TimeOfDay -le $TaskEndTime){
                            $JobItem = [PSCustomObject]@{
                                TaskUniqueId          = $TaskConfig.TaskUniqueId
                                TaskName              = $TaskConfig.TaskNameIdTextBox
                                TaskGroup             = $TaskConfig.TaskGroupIdSelectBox
                                TaskType              = $TaskConfig.TaskTypeIdSelectBox
                                TaskStartPoint        = $TaskConfig.InterfaceBlocksStartPointIdSelectBox
                                TaskEndPoint          = $TaskConfig.InterfaceBlocksEndPointIdSelectBox
                                TaskStartDate         = (Get-Date -Year (2000+$TaskConfig.TaskStartDateYearTextBox) -Month $TaskConfig.TaskStartDateMonthTextBox -Day $TaskConfig.TaskStartDateDayTextBox).Date
                                TaskEndDate           = (Get-Date -Year (2000+$TaskConfig.TaskEndDateYearTextBox) -Month $TaskConfig.TaskEndDateMonthTextBox -Day $TaskConfig.TaskEndDateDayTextBox).Date
                                TaskStartTime         = (Get-Date -Hour $TaskConfig.TaskStartTimeHourTextBox -Minute $TaskConfig.TaskStartTimeMinuteTextBox -Second $TaskConfig.TaskStartTimeSecondTextBox).TimeOfDay
                                TaskEndTime           = (Get-Date -Hour $TaskConfig.TaskEndTimeHourTextBox -Minute $TaskConfig.TaskEndTimeMinuteTextBox -Second $TaskConfig.TaskEndTimeSecondTextBox).TimeOfDay
                                TaskLimitTime         = (Get-Date -Hour $TaskConfig.TaskLimitTimeHourTextBox -Minute $TaskConfig.TaskLimitTimeMinuteTextBox -Second $TaskConfig.TaskLimitTimeSecondTextBox).TimeOfDay
                                TaskRepetitionTime    = (Get-Date -Hour $TaskConfig.TaskRepetitionTimeHourTextBox -Minute $TaskConfig.TaskRepetitionTimeMinuteTextBox -Second $TaskConfig.TaskRepetitionTimeSecondTextBox).TimeOfDay
                                TaskStatus            = $TaskConfig.TaskStatus
                                TaskScriptWindowStyle = $TaskConfig.TaskWindowStyleIdSelectBox
                                TaskScriptLanguage    = $TaskConfig.TaskScriptblockLanguageSelectBox
                                TaskScriptPath        = $TaskConfig.TaskScriptBlockFullName
                                TaskFirstStart        = Get-Date
                                TaskTotalElapsedTime  = [system.diagnostics.stopwatch]::StartNew()
                                TaskRepeatElapsedTime = [system.diagnostics.stopwatch]::StartNew()
                            }
                            if(Test-Path $JobItem.TaskScriptLanguage){
                                if($JobItem.TaskScriptLanguage -eq 'Javascript'){
                                    .($NodeJSPath) $JobItem.TaskScriptPath
                                }
                                elseif($JobItem.TaskScriptLanguage -eq 'Powershell'){
                                    .($JobItem.TaskScriptPath)
                                }
                                elseif($JobItem.TaskScriptLanguage -eq 'Python'){
                                    .($PythonPYPath) $JobItem.TaskScriptPath
                                }
                            }
                            [array]$JobList += $JobItem
                            Write-Host -f Green ('____________________________________________________________')
                            Write-Host -f Green ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                            Write-Host -f Green ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                            Write-Host -f Green ('| Language  | ') -NoNewLine; Write-Host $TaskConfig.TaskScriptblockLanguageSelectBox
                            Write-Host -f Green ('| Display   | ') -NoNewLine; Write-Host $TaskConfig.TaskWindowStyleIdSelectBox
                            Write-Host -f Green ('| Message   | ') -NoNewLine; Write-Host ('Job is successfully imported!')
                            Write-Host -f Green ('| Process   | ') -NoNewLine; Write-Host ('Start execute job!')
                            Write-Host -f Green ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                        }
                        else{
                            Write-Host -f Red ('____________________________________________________________')
                            Write-Host -f Red ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                            Write-Host -f Red ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                            Write-Host -f Red ('| Language  | ') -NoNewLine; Write-Host $TaskConfig.TaskScriptblockLanguageSelectBox
                            Write-Host -f Red ('| Display   | ') -NoNewLine; Write-Host $TaskConfig.TaskWindowStyleIdSelectBox
                            Write-Host -f Red ('| Message   | ') -NoNewLine; Write-Host ('Time is not valid!')
                            Write-Host -f Red ('| Process   | ') -NoNewLine; Write-Host ('Job creation stopped!')
                            Write-Host -f Red ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                        }
                    }
                    else{
                        Write-Host -f Red ('____________________________________________________________')
                        Write-Host -f Red ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                        Write-Host -f Red ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                        Write-Host -f Red ('| Language  | ') -NoNewLine; Write-Host $TaskConfig.TaskScriptblockLanguageSelectBox
                        Write-Host -f Red ('| Display   | ') -NoNewLine; Write-Host $TaskConfig.TaskWindowStyleIdSelectBox
                        Write-Host -f Red ('| Message   | ') -NoNewLine; Write-Host ('Date is not valid!')
                        Write-Host -f Red ('| Process   | ') -NoNewLine; Write-Host ('Job creation stopped!')
                        Write-Host -f Red ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                    }
                }
                else{
                    Write-Host -f Red ('____________________________________________________________')
                    Write-Host -f Red ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                    Write-Host -f Red ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                    Write-Host -f Red ('| Language  | ') -NoNewLine; Write-Host $TaskConfig.TaskScriptblockLanguageSelectBox
                    Write-Host -f Red ('| Display   | ') -NoNewLine; Write-Host $TaskConfig.TaskWindowStyleIdSelectBox
                    Write-Host -f Red ('| Message   | ') -NoNewLine; Write-Host ('Task is not actived!')
                    Write-Host -f Red ('| Process   | ') -NoNewLine; Write-Host ('Job creation stopped!')
                    Write-Host -f Red ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                }
            }
        }
    }
}

$ValidateJobItemInJobListSC = {
    $Date      = (Get-Date).Date
    $TimeOfDay = (Get-Date).TimeOfDay
    if($JobList.Count -gt 0){
        $JobIndex = 0
        foreach ($JobItem in $JobList) {
            $TaskUniqueId           = $JobItem.TaskUniqueId
            $TaskName               = $JobItem.TaskName
            $TaskGroup              = $JobItem.TaskGroup
            $TaskType               = $JobItem.TaskType
            $TaskStartPoint         = $JobItem.TaskStartPoint
            $TaskEndPoint           = $JobItem.TaskEndPoint
            $TaskStartDate          = $JobItem.TaskStartDate
            $TaskEndDate            = $JobItem.TaskEndDate
            $TaskStartTime          = $JobItem.TaskStartTime
            $TaskEndTime            = $JobItem.TaskEndTime
            $TaskLimitTime          = $JobItem.TaskLimitTime
            $TaskRepetitionTime     = $JobItem.TaskRepetitionTime
            $TaskStatus             = $JobItem.TaskStatus
            $TaskScriptWindowStyle  = $JobItem.TaskScriptWindowStyle
            $TaskScriptLanguage     = $JobItem.TaskScriptLanguage
            $TaskScriptPath         = $JobItem.TaskScriptPath
            $TaskFirstStart         = $JobItem.TaskFirstStart
            $TaskTotalElapsedTime   = $JobItem.TaskTotalElapsedTime
            $TaskRepeatElapsedTime  = $JobItem.TaskRepeatElapsedTime

            if($TaskStatus -eq 'Active'){
                if($Date -ge $TaskStartDate -and $Date -le $TaskEndDate){
                    if($TimeOfDay -ge $TaskStartTime -and $TimeOfDay -le $TaskEndTime){
                        if(($TaskLimitTime.Hours -eq 0 -and $TaskLimitTime.Minutes -eq 0 -and $TaskLimitTime.Seconds -eq 0) -or $TaskTotalElapsedTime.ElapsedTicks -le $TaskLimitTime.Ticks){
                            if(($TaskRepetitionTime.Hours -eq 0 -and $TaskRepetitionTime.Minutes -eq 0 -and $TaskRepetitionTime.Seconds -eq 0) -or $TaskRepeatElapsedTime.ElapsedTicks -le $TaskRepetitionTime.Ticks){
                                Write-Host -f Green ('____________________________________________________________')
                                Write-Host -f Green ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                                Write-Host -f Green ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                                Write-Host -f Green ('| Language  | ') -NoNewLine; Write-Host ("$TaskScriptLanguage")
                                Write-Host -f Green ('| Display   | ') -NoNewLine; Write-Host ("$TaskScriptWindowStyle")
                                Write-Host -f Green ('| Elapsed   | ') -NoNewLine; Write-Host $TaskTotalElapsedTime.Elapsed
                                Write-Host -f Green ('| Message   | ') -NoNewLine; Write-Host ('Script process is still running!')
                                Write-Host -f Green ('| Process   | ') -NoNewLine; Write-Host ('Executing job!')
                                Write-Host -f Green ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                            }
                            else{
                                Write-Host -f Yellow ('____________________________________________________________')
                                Write-Host -f Yellow ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                                Write-Host -f Yellow ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                                Write-Host -f Yellow ('| Language  | ') -NoNewLine; Write-Host ("$TaskScriptLanguage")
                                Write-Host -f Yellow ('| Display   | ') -NoNewLine; Write-Host ("$TaskScriptWindowStyle")
                                Write-Host -f Yellow ('| Elapsed   | ') -NoNewLine; Write-Host $TaskTotalElapsedTime.Elapsed
                                Write-Host -f Yellow ('| Message   | ') -NoNewLine; Write-Host ('Time repetition limit has passed!')
                                Write-Host -f Yellow ('| Process   | ') -NoNewLine; Write-Host ('Task execution stopped!')
                                Write-Host -f Yellow ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                                (($JobList[$JobIndex]).TaskTotalElapsedTime).Stop()
                                (($JobList[$JobIndex]).TaskRepeatElapsedTime).Stop()
                                $JobList[$JobIndex] = $null
                            }
                        }
                        else{
                            Write-Host -f Yellow ('____________________________________________________________')
                            Write-Host -f Yellow ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                            Write-Host -f Yellow ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                            Write-Host -f Yellow ('| Language  | ') -NoNewLine; Write-Host ("$TaskScriptLanguage")
                            Write-Host -f Yellow ('| Display   | ') -NoNewLine; Write-Host ("$TaskScriptWindowStyle")
                            Write-Host -f Yellow ('| Elapsed   | ') -NoNewLine; Write-Host $TaskTotalElapsedTime.Elapsed
                            Write-Host -f Yellow ('| Message   | ') -NoNewLine; Write-Host ('Time limit has passed!')
                            Write-Host -f Yellow ('| Process   | ') -NoNewLine; Write-Host ('Task execution stopped!')
                            Write-Host -f Yellow ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                            (($JobList[$JobIndex]).TaskTotalElapsedTime).Stop()
                            (($JobList[$JobIndex]).TaskRepeatElapsedTime).Stop()
                            $JobList[$JobIndex] = $null
                        }
                    }
                    else{
                        Write-Host -f Yellow ('____________________________________________________________')
                        Write-Host -f Yellow ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                        Write-Host -f Yellow ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                        Write-Host -f Yellow ('| Language  | ') -NoNewLine; Write-Host ("$TaskScriptLanguage")
                        Write-Host -f Yellow ('| Display   | ') -NoNewLine; Write-Host ("$TaskScriptWindowStyle")
                        Write-Host -f Yellow ('| Elapsed   | ') -NoNewLine; Write-Host $TaskTotalElapsedTime.Elapsed
                        Write-Host -f Yellow ('| Message   | ') -NoNewLine; Write-Host ('Time is not valid!')
                        Write-Host -f Yellow ('| Process   | ') -NoNewLine; Write-Host ('Task execution stopped!')
                        Write-Host -f Yellow ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                        (($JobList[$JobIndex]).TaskTotalElapsedTime).Stop()
                        (($JobList[$JobIndex]).TaskRepeatElapsedTime).Stop()
                        $JobList[$JobIndex] = $null
                    }
                }
                else{
                    Write-Host -f Yellow ('____________________________________________________________')
                    Write-Host -f Yellow ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                    Write-Host -f Yellow ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                    Write-Host -f Yellow ('| Language  | ') -NoNewLine; Write-Host ("$TaskScriptLanguage")
                    Write-Host -f Yellow ('| Display   | ') -NoNewLine; Write-Host ("$TaskScriptWindowStyle")
                    Write-Host -f Yellow ('| Elapsed   | ') -NoNewLine; Write-Host $TaskTotalElapsedTime.Elapsed
                    Write-Host -f Yellow ('| Message   | ') -NoNewLine; Write-Host ('Date is not valid!')
                    Write-Host -f Yellow ('| Process   | ') -NoNewLine; Write-Host ('Task execution stopped!')
                    Write-Host -f Yellow ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                    (($JobList[$JobIndex]).TaskTotalElapsedTime).Stop()
                    (($JobList[$JobIndex]).TaskRepeatElapsedTime).Stop()
                    $JobList[$JobIndex] = $null
                }
            }
            else{
                Write-Host -f Yellow ('____________________________________________________________')
                Write-Host -f Yellow ('| Id        | ') -NoNewLine; Write-Host ("$TaskUniqueId")
                Write-Host -f Yellow ('| Name      | ') -NoNewLine; Write-Host ("$TaskName")
                Write-Host -f Yellow ('| Language  | ') -NoNewLine; Write-Host ("$TaskScriptLanguage")
                Write-Host -f Yellow ('| Display   | ') -NoNewLine; Write-Host ("$TaskScriptWindowStyle")
                Write-Host -f Yellow ('| Elapsed   | ') -NoNewLine; Write-Host $TaskTotalElapsedTime.Elapsed
                Write-Host -f Yellow ('| Message   | ') -NoNewLine; Write-Host ('Task is not actived!')
                Write-Host -f Yellow ('| Process   | ') -NoNewLine; Write-Host ('Task execution stopped!')
                Write-Host -f Yellow ('´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´')
                (($JobList[$JobIndex]).TaskTotalElapsedTime).Stop()
                (($JobList[$JobIndex]).TaskRepeatElapsedTime).Stop()
                $JobList[$JobIndex] = $null
            }
            $JobIndex++
        }
        [array]$JobList = $JobList | ? {$_ -ne $null}
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



$StartSC = {
    switch (1,2,3,4,5,6,7){
        1 {$JobList = @()}
        2 {$TerminalElapsedTime = [system.diagnostics.stopwatch]::StartNew()}
        3 {$RepeatNum = 1}
        4 {GetGlobalFilePaths}
        5 {$WindowStyleProcessSC|iex}
        6 {$RunspaceParameters|iex}
        7 {TIMEOUT /T $ParamPSCO.Timeout}
    }
}
$StartSC|iex

$RepeatSC = {
    switch (1,2,3,4,5,6,7,8,9,10){
        1 {}
        2 {$WindowStyleProcessSC|iex}
        3 {$RunspaceParameters|iex}
        4 {TIMEOUT /T $ParamPSCO.Timeout}
        5 {$ValidateQueueData|iex}
        6 {$AnalysisTaskListData|iex}
        7 {$AddTaskConfigToJobListSC|iex}
        8 {$ValidateJobItemInJobListSC|iex}
        9 {$RepeatNum++}
       10 {$RepeatSC|iex}
    }
}
$RepeatSC|iex