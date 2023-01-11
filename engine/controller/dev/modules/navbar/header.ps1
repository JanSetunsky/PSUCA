$Cache:RunspaceLoadingProgressUniqueIdList = @{List=@()}

$HeaderContent = {
    
    New-UDContainer -ClassName 'navbar-container-headerpaddingright' -Children {

    
        if($Session:AuthenticationResult -eq $true){
            if($Session:AuthenticationCredential -eq 'Developer'){
                


                    #------------------------------------------------------------------------------#
                    #- TERMINAL -------------------------------------------------------------------#
                    #------------------------------------------------------------------------------#

                    $Session:NavBarDynamicUniqueId = ([guid]::NewGuid()).Guid

                    $Cache:RunspaceLoadingProgressUniqueIdList.List += $Session:NavBarDynamicUniqueId

                    $DynNavbarStatusSC = {

                        [string]$StatusNewTaskItemSC = {
                            New-UDCardBody -ClassName "navbar-status-dropdown-btn-message-layout" -Content {
                                New-UDRow -Columns {
                                    New-UDColumn -Content {
                                        New-UDButton -Text "$TaskItemType" -ClassName "navbar-status-dropdown-btn-message-job"
                                        $RunspaceMenuButton = {
                                            New-UDLink -Id ('Runspace-'+"$TaskItemId") -Children {
                                                New-UDTypography -Text "$TaskItemName" -ClassName 'navbar-status-dropdown-message-title'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text ('Runspace PID: importrunspacepid') -ClassName "task-center-box-btn"
                                                } -Content {
        
                                                } -Footer { New-UDButton -Text "Close" -OnClick {
                                                    Hide-UDModal
                                                } -ClassName "task-center-box-btn"}
                                            }
                                        }
                                        $RunspaceMenuButton|iex
                                        New-UDButton -Text '' -ClassName "navbar-status-dropdown-btn-stop" -Icon (New-UDIcon -Icon 'Stop' -Size 1x -Color 'Gray' -ClassName "navbar-status-dropdown-btn-stop-icon") -onclick {
                                            $GetProcess = Get-Process -Id 'importrunspacepid'
                                            if($GetProcess.ProcessName -eq 'importrunspaceprocessname'){
                                                $TaskKill = TASKKILL /PID importrunspacepid
                                                Show-UDToast -Message 'Process PID: importrunspacepid is killed!' -MessageColor 'Black' -BackgroundColor 'green' -Icon Check -Title 'Success:' -Duration 5000
                                                $GetProcess = Get-Process
                                                $GetDataRunspacePath                   = gc $Cache:TerminalDataRunspacePath
                                                $GetDataRunspacePathJson               = $GetDataRunspacePath | ConvertFrom-Json
                                                $Cache:GetDataRunspacePathJsonStatus   = $GetDataRunspacePathJson.Status
                                                $Cache:GetDataRunspacePathJsonTaskList = $GetDataRunspacePathJson.TaskList
                                                $NewRunspaceList                 = @()
                                                foreach ($Runspace in $Cache:GetDataRunspacePathJsonTaskList) {
                                                    $RunspacePID         = $Runspace.Pid
                                                    $RunspaceProcessName = $Runspace.ProcessName
                                                    if($GetProcess.Id -eq $RunspacePID -and $GetProcess.ProcessName -eq $RunspaceProcessName){
                                                        $NewRunspaceList += $Runspace
                                                    }
                                                }
                            
                                                if($NewRunspaceList.Count -eq 0 -or $null -eq $NewRunspaceList){
                                                    $NewRunspacePSCO = [PSCustomObject]@{
                                                        Status   = '2'
                                                        TaskList = ''
                                                    }
                                                    $Cache:GetDataRunspacePathJsonStatus   = '2'
                                                    $Cache:GetDataRunspacePathJsonTaskList = ''
                                                    $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                                                    $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson    
                                                }
                                                else{
                                                    $NewRunspacePSCO = [PSCustomObject]@{
                                                        Status   = '1'
                                                        TaskList = $NewRunspaceList
                                                    }
                                                    $Cache:GetDataRunspacePathJsonStatus   = '1'
                                                    $Cache:GetDataRunspacePathJsonTaskList = $NewRunspaceList
                                                    $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                                                    $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson
                                                }
                                                Invoke-UDJavaScript -JavaScript '
                                                    function statusDrop() {
                                                        var dropcondition = document.getElementById("navbar-status-dropdown").style.display;
                                                        if (dropcondition == "block") {
                                                            document.getElementById("navbar-status-dropdown").style.display = "none";
                                                        } else {
                                                            document.getElementById("navbar-notification-dropdown").style.display = "none";
                                                            document.getElementById("navbar-auth-dropdown").style.display = "none";
                                                            document.getElementById("navbar-status-dropdown").style.display = "block";
                                                        }
                                                    }
                                                    statusDrop();
                                                '                                                
                                                Sync-UDElement 'importNavBarDynamicUniqueId'
                                                $sleep = sleep 1
                                                Sync-UDElement 'importNavBarDynamicUniqueId'
                                                $sleep = sleep 1
                                                Sync-UDElement 'importNavBarDynamicUniqueId'
                                            }
                                            else{
                                                Show-UDToast -Message 'Process PID: importrunspacepid is not exist!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                            }
                                        }
                                    }
                                }
                                New-UDRow -Columns {
                                    New-UDColumn -Content {
                                        New-UDTypography -Text (New-Object System.DateTime $TaskItemTicks) -ClassName 'navbar-status-dropdown-message-date'
                                        New-UDTypography -Text "$TaskItemCredential" -ClassName 'navbar-status-dropdown-message-user'
                                    }
                                }            
                            }
                        }

                        $GetProcess = Get-Process
                        $GetDataRunspacePath                   = gc $Cache:TerminalDataRunspacePath
                        $GetDataRunspacePathJson               = $GetDataRunspacePath | ConvertFrom-Json
                        $Cache:GetDataRunspacePathJsonStatus   = $GetDataRunspacePathJson.Status
                        $Cache:GetDataRunspacePathJsonTaskList = $GetDataRunspacePathJson.TaskList
                        $NewRunspaceList                       = @()
                        foreach ($Runspace in $Cache:GetDataRunspacePathJsonTaskList) {
                            $RunspacePID         = $Runspace.Pid
                            $RunspaceProcessName = $Runspace.ProcessName
                            if($GetProcess.Id -eq $RunspacePID -and $GetProcess.ProcessName -eq $RunspaceProcessName){
                                $NewRunspaceList += $Runspace
                            }
                            elseif($null -eq $Runspace.Credential -and $null -eq $Runspace.Type -and $null -eq $Runspace.TaskId -and $null -eq $Runspace.ScriptPath -and $null -eq $Runspace.Name -and $null -eq $Runspace.ProcessName -and $null -eq $Runspace.Pid){

                            }
                            else{
                                $GetTicks = (Get-Date).Ticks
                                $NewRunspaceDetailPSCO = [PSCustomObject]@{
                                    Credential  = $Runspace.Credential
                                    Type        = $Runspace.Type
                                    TaskId      = $Runspace.TaskId
                                    ScriptPath  = $Runspace.ScriptPath
                                    Ticks       = $GetTicks
                                    Name        = $Runspace.Name
                                    ProcessName = $Runspace.ProcessName
                                    PID         = 'null'
                                }
                                $NewRunspaceList += $NewRunspaceDetailPSCO
                            }
                        }

                        if(($NewRunspaceList.Count -eq 0 -or $null -eq $NewRunspaceList)){
                            $NewRunspacePSCO = [PSCustomObject]@{
                                Status   = '2'
                                TaskList = ''
                            }
                            $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                            $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson    
                        }
                        else{
                            $NewRunspacePSCO = [PSCustomObject]@{
                                Status   = '1'
                                TaskList = $NewRunspaceList
                            }
                            $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                            $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson
                        }
                        $Cache:GetDataRunspacePathJsonTaskList = $NewRunspaceList

                        if($Cache:LoadingDataRunspaceStatus -eq $true){
                            $Cache:LoadingProgressText = 'Loading'
                            New-UDDynamic -Id 'LoadingBroadCast1-importNavBarDynamicUniqueId' -Content {
                                if($Cache:LoadingProgressContentBroadCastStop -eq $true){
                                    $Cache:LoadingProgressContentBroadCastStop = $false
                                }
                                else{
                                    New-UDBUtton -ClassName 'navbar-btn-statusheader' -Text $Cache:LoadingProgressText -Icon (New-UDIcon -Icon 'DotCircle' -Color 'Yellow' -ClassName 'navbar-btn-statusheadercircle')
                                }
                            }
                       
                            if($Cache:LoadingDataRunspaceFirstRun -eq $true){
                                New-UDDynamic -Id 'LoadingBroadCast2-importNavBarDynamicUniqueId' -Content {
                                    if($Cache:LoadingRunspaceNumber -ge 100){
                                        $Cache:LoadingProgressText = ('Loading: '+"$Cache:LoadingRunspaceNumber"+'%')
                                        $Cache:LoadingDataRunspaceStatus = $false
                                        $Cache:LoadingDataRunspaceFirstRun = $null
                                        Sync-UDElement -Id 'importNavBarDynamicUniqueId'
                                    }
                                    else{
                                        $Cache:LoadingProgressText = ('Loading: '+"$Cache:LoadingRunspaceNumber"+'%')
                                    }
                                }
                            }
                            else{
                                New-UDDynamic -Id 'LoadingProgress-importNavBarDynamicUniqueId' -Content {
                                    $Cache:LoadingRunspaceNumber..100 | ForEach-Object {
                                        $Cache:LoadingProgressText = ('Loading: '+"$Cache:LoadingRunspaceNumber"+'%')
                                        $Cache:LoadingDataRunspaceFirstRun = $true
                                        $UniqueIdList = $Cache:RunspaceLoadingProgressUniqueIdList.List
                                        foreach ($GetId in $UniqueIdList) {
                                            $BroadCastUniqueId1 = ('LoadingBroadCast1-'+"$GetId")
                                            $BroadCastUniqueId2 = ('LoadingBroadCast2-'+"$GetId")
                                            Sync-UDElement -Id $BroadCastUniqueId1 -Broadcast
                                            Sync-UDElement -Id $BroadCastUniqueId2 -Broadcast
                                        }
                                        Sync-UDElement -Id 'LoadingBroadCast2-importNavBarDynamicUniqueId' -Broadcast
                                        if($Cache:LoadingRunspaceNumber -ge 100){
                                            $Cache:LoadingProgressContentBroadCastStop = $true
                                            $Cache:LoadingDataRunspaceStatus           = $false
                                            $Cache:LoadingDataRunspaceFirstRun         = $null
                                            $GetDataRunspacePath                       = gc $Cache:TerminalDataRunspacePath
                                            $GetDataRunspacePathJson                   = $GetDataRunspacePath | ConvertFrom-Json
                                            $Cache:GetDataRunspacePathJsonStatus       = $GetDataRunspacePathJson.Status
                                            $Cache:GetDataRunspacePathJsonTaskList     = $GetDataRunspacePathJson.TaskList
                                            Sync-UDElement -Id 'importNavBarDynamicUniqueId'
                                        }
                                        else{
                                            Start-Sleep -Milli 300
                                            $Cache:LoadingRunspaceNumber++
                                        }
                                    }
                                }
                            }
                        }
                        elseif($Cache:GetDataRunspacePathJsonStatus -eq 1 -and $Cache:GetDataRunspacePathJsonTaskList.Count -gt 0 -and $Cache:LoadingDataRunspaceStatus -ne $true){
                            New-UDButton -Id 'StatusButton-importNavBarDynamicUniqueId' -ClassName 'navbar-btn-statusheader' -Text 'online' -Icon (New-UDIcon -Icon 'DotCircle' -Color 'Green' -ClassName 'navbar-btn-statusheadercircle') -OnClick {
                                $GetProcess = Get-Process
                                $GetDataRunspacePath                   = gc $Cache:TerminalDataRunspacePath
                                $GetDataRunspacePathJson               = $GetDataRunspacePath | ConvertFrom-Json
                                $Cache:GetDataRunspacePathJsonStatus   = $GetDataRunspacePathJson.Status
                                $Cache:GetDataRunspacePathJsonTaskList = $GetDataRunspacePathJson.TaskList
                                $NewRunspaceList                       = @()
                                foreach ($Runspace in $Cache:GetDataRunspacePathJsonTaskList) {
                                    $RunspacePID         = $Runspace.Pid
                                    $RunspaceProcessName = $Runspace.ProcessName
                                    if($GetProcess.Id -eq $RunspacePID -and $GetProcess.ProcessName -eq $RunspaceProcessName){
                                        $NewRunspaceList += $Runspace
                                    }
                                    elseif($null -eq $Runspace.Credential -and $null -eq $Runspace.Type -and $null -eq $Runspace.TaskId -and $null -eq $Runspace.ScriptPath -and $null -eq $Runspace.Name -and $null -eq $Runspace.ProcessName -and $null -eq $Runspace.Pid){

                                    }
                                    else{
                                        $GetTicks = (Get-Date).Ticks
                                        $NewRunspaceDetailPSCO = [PSCustomObject]@{
                                            Credential  = $Runspace.Credential
                                            Type        = $Runspace.Type
                                            TaskId      = $Runspace.TaskId
                                            ScriptPath  = $Runspace.ScriptPath
                                            Ticks       = $GetTicks
                                            Name        = $Runspace.Name
                                            ProcessName = $Runspace.ProcessName
                                            PID         = 'null'
                                        }
                                        $NewRunspaceList += $NewRunspaceDetailPSCO
                                    }                                    
                                }
        
                                if($NewRunspaceList.Count -eq 0 -or $null -eq $NewRunspaceList){
                                    $NewRunspacePSCO = [PSCustomObject]@{
                                        Status   = '2'
                                        TaskList = ''
                                    }
                                    $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                                    $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson    
                                }
                                else{
                                    $NewRunspacePSCO = [PSCustomObject]@{
                                        Status   = '1'
                                        TaskList = $NewRunspaceList
                                    }
                                    $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                                    $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson
                                }
                                $Cache:GetDataRunspacePathJsonTaskList = $NewRunspaceList
                                if($Cache:LoadingDataRunspaceStatus -eq $true){
                                    Sync-UDElement -Id 'importNavBarDynamicUniqueId' -Broadcast
                                }
                                elseif($Cache:GetDataRunspacePathJsonStatus -eq 2 -and $Cache:LoadingDataRunspaceStatus -ne $true){
                                    Sync-UDElement -Id 'importNavBarDynamicUniqueId' -Broadcast
                                }
                                else{
                                    Invoke-UDJavaScript -JavaScript '
                                        function statusDrop() {
                                            var dropcondition = document.getElementById("navbar-status-dropdown").style.display;
                                            if (dropcondition == "block") {
                                                document.getElementById("navbar-status-dropdown").style.display = "none";
                                            } else {
                                                document.getElementById("navbar-notification-dropdown").style.display = "none";
                                                document.getElementById("navbar-auth-dropdown").style.display = "none";
                                                document.getElementById("navbar-status-dropdown").style.display = "block";
                                            }
                                        }
                                        statusDrop();
                                    '
                                }
                                Sync-UDElement -Id 'NavBarStatusDropdownDynamicId-importNavBarDynamicUniqueId' -Broadcast
                            }
                            New-UDDynamic -Id 'NavBarStatusDropdownDynamicId-importNavBarDynamicUniqueId' -Content {
                                New-UDCardBody -Id "navbar-status-dropdown" -Content {
                                    New-UDRow -Columns {
                                        New-UDColumn -Content {
                                            $StopAllProcessSC = {
                                                New-UDButton -Text 'Stop All Process' -ClassName "navbar-status-dropdown-btn-stop-all" -Icon (New-UDIcon -Icon 'Stop' -Size 1x -Color 'DarkRed' -ClassName "navbar-status-dropdown-btn-stop-all-icon") -onclick {
                                                    $GetProcess = Get-Process
                                                    $DataRunspaceTaskList     = 'importdatarunspacejsontasklist'
                                                    $DataRunspaceTaskListJson = $DataRunspaceTaskList|ConvertFrom-Json
                                                    foreach ($TaskItem in $DataRunspaceTaskListJson) {
                                                        $TaskItemPid         = $TaskItem.Pid
                                                        $TaskItemProcessName = $TaskItem.ProcessName
                                                        if($GetProcess.Id -eq $TaskItemPid -and $GetProcess.ProcessName -eq $TaskItemProcessName){
                                                            $TaskKill = TASKKILL /PID $TaskItemPid
                                                            Show-UDToast -Message ('Process PID: '+"$TaskItemPid"+' is killed!') -MessageColor 'Black' -BackgroundColor 'green' -Icon Check -Title 'Success:' -Duration 5000
                                                        }
                                                        else{
                                                            Show-UDToast -Message ('Process PID: '+"$TaskItemPid"+' is not exist!') -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                        }
                                                    }
                                                    $NewRunspacePSCO = [PSCustomObject]@{
                                                        Status   = '2'
                                                        TaskList = ''
                                                    }
                                                    $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                                                    $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson
                                                    Invoke-UDJavaScript -JavaScript '
                                                        function statusDrop() {
                                                            var dropcondition = document.getElementById("navbar-status-dropdown").style.display;
                                                            if (dropcondition == "block") {
                                                                document.getElementById("navbar-status-dropdown").style.display = "none";
                                                            } else {
                                                                document.getElementById("navbar-notification-dropdown").style.display = "none";
                                                                document.getElementById("navbar-auth-dropdown").style.display = "none";
                                                                document.getElementById("navbar-status-dropdown").style.display = "block";
                                                            }
                                                        }
                                                        statusDrop();
                                                    '
                                                    Sync-UDElement -Id 'importNavBarDynamicUniqueId'
                                                }
                                            }
                                            $ConvertToJsonDataRunspacePathJsonTaskList = $Cache:GetDataRunspacePathJsonTaskList|ConvertTo-Json
                                            $ReplaceStopAllProcessSC = $StopAllProcessSC -replace 'importdatarunspacejsontasklist',"$ConvertToJsonDataRunspacePathJsonTaskList"
                                            $ReplaceStopAllProcessSC|iex
                                            $ViewAllProcessSC = {
                                                New-UDButton -Text 'View All' -ClassName "navbar-status-dropdown-btn-eye" -Icon (New-UDIcon -Icon 'Eye' -Size 1x -Color 'Gray' -ClassName "navbar-status-dropdown-btn-eye-icon") -onclick {
    
                                                }
                                            }
                                            $ViewAllProcessSC|iex
                                        }
                                    }
                                    foreach ($TaskItem in $Cache:GetDataRunspacePathJsonTaskList) {
                                        $TaskItemType        = $TaskItem.Type
                                        $TaskItemName        = $TaskItem.Name
                                        $TaskItemTicks       = $TaskItem.Ticks
                                        $TaskItemCredential  = $TaskItem.Credential
                                        $TaskItemPid         = $TaskItem.Pid
                                        $TaskItemId          = $TaskItem.TaskId
                                        $TaskItemProcessName = $TaskItem.ProcessName
                                        $TaskItemScriptPath  = $TaskItem.ScriptPath
                                        
                                        if($TaskItemPid -eq 'null'){
                                            $NewRunspaceItemPlaySC = {
                                                New-UDCardBody -ClassName "navbar-status-dropdown-btn-message-layout" -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -Content {
                                                            New-UDButton -Text "$TaskItemType" -ClassName "navbar-status-dropdown-btn-message-job"
                                                            $RunspaceMenuButton = {
                                                                New-UDLink -Id ('Runspace-'+"$TaskItemId"+'-importrunspacepid') -Children {
                                                                    New-UDTypography -Text "$TaskItemName" -ClassName 'navbar-status-dropdown-message-title'
                                                                } -OnClick {
                                                                    Show-UDModal -Header {
                                                                        New-UDTypography -Text ('Runspace PID: importrunspacepid') -ClassName "task-center-box-inner-title"
                                                                    } -Content {
                            
                                                                    } -Footer { New-UDButton -Text "Close" -OnClick {
                                                                        Hide-UDModal
                                                                    } -ClassName "task-center-box-btn"}
                                                                }
                                                            }
                                                            $RunspaceMenuButton|iex
                                                            New-UDDynamic -Id 'NavBarStatusStartRunspaceDynamicId-importTaskItemDynamicUniqueId' -Content {
                                                                $CreateVariableName     = 'importTaskItemDynamicUniqueId' -replace '-','_'
                                                                $UniqueCacheVariable    = '$Cache:'+"$CreateVariableName"
                                                                $UniqueCacheVariableIex = $UniqueCacheVariable|iex
                                                                $CacheVariableStatus    = $UniqueCacheVariableIex.Status
                                                                if('loading' -eq $CacheVariableStatus){
                                                                    New-UDDynamic -Id 'LoadingBroadCastTaskItem1-importTaskItemDynamicUniqueId' -Content {
                                                                        if($Cache:LoadingProgressContentBroadCastStop -eq $true){
                                                                            $Cache:LoadingProgressContentBroadCastStop = $false
                                                                        }
                                                                        else{
                                                                            $CreateVariableName     = 'importTaskItemDynamicUniqueId' -replace '-','_'
                                                                            $UniqueCacheVariable    = '$Cache:'+"$CreateVariableName"
                                                                            $UniqueCacheVariableIex = $UniqueCacheVariable|iex
                                                                            $CreateButtonText       = ([string]$UniqueCacheVariableIex.LoadingResult)+'%'
                                                                            New-UDButton -Text $CreateButtonText -ClassName "navbar-status-dropdown-btn-loading" -onclick {
                                                                                Show-UDToast -Message 'Runspace NAME: importrunspacename is loading!' -MessageColor 'Black' -BackgroundColor 'green' -Icon Check -Title 'Success:' -Duration 5000
                                                                            }
                                                                        }
                                                                    }
                                                               
                                                                    if($Cache:LoadingDataRunspaceFirstRun -eq $true){
                                                                        New-UDDynamic -Id 'LoadingBroadCastTaskItem2-importTaskItemDynamicUniqueId' -Content {
                                                                            $CreateVariableName     = 'importTaskItemDynamicUniqueId' -replace '-','_'
                                                                            $UniqueCacheVariable    = '$Cache:'+"$CreateVariableName"
                                                                            $UniqueCacheVariableIex = $UniqueCacheVariable|iex
                                                                            if(($UniqueCacheVariableIex.LoadingResult) -ge 100){
                                                                                $Cache:LoadingProgressText = ([string]$UniqueCacheVariableIex.LoadingResult)+'%'
                                                                                $Cache:LoadingDataRunspaceStatus = $false
                                                                                $Cache:LoadingDataRunspaceFirstRun = $null
                                                                                Sync-UDElement -Id 'importNavBarDynamicUniqueId'
                                                                            }
                                                                            else{
                                                                                $Cache:LoadingProgressText = ([string]$UniqueCacheVariableIex.LoadingResult)+'%'
                                                                            }
                                                                        }
                                                                    }
                                                                    else{
                                                                        New-UDDynamic -Id 'LoadingProgressTaskItem-importTaskItemDynamicUniqueId' -Content {
                                                                            ($UniqueCacheVariableIex.LoadingResult)..100 | ForEach-Object {
                                                                                if($Session:MainRunspaceCondition -eq 'STOP'){

                                                                                }
                                                                                else{
                                                                                    $CreateVariableName        = 'importTaskItemDynamicUniqueId' -replace '-','_'
                                                                                    $UniqueCacheVariable       = '$Cache:'+"$CreateVariableName"
                                                                                    $UniqueCacheVariableIex    = $UniqueCacheVariable|iex
                                                                                    $Cache:LoadingProgressText = ([string]$UniqueCacheVariableIex.LoadingResult)+'%'
                                                                                    $Cache:LoadingDataRunspaceFirstRun = $true
                                                                                    Sync-UDElement -Id 'LoadingBroadCastTaskItem1-importTaskItemDynamicUniqueId' -Broadcast
                                                                                    Sync-UDElement -Id 'LoadingBroadCastTaskItem2-importTaskItemDynamicUniqueId' -Broadcast
                                                                                    if(($UniqueCacheVariableIex.LoadingResult) -ge 100){
                                                                                        $Cache:LoadingProgressContentBroadCastStop = $true
                                                                                        $Cache:LoadingDataRunspaceStatus           = $false
                                                                                        $Cache:LoadingDataRunspaceFirstRun         = $null
                                                                                        $UniqueCacheVariableResult                 = ('$Cache:'+"$CreateVariableName"+'='+'@{'+'Status'+'='+"'"+'finish'+"'"+';'+'Condition'+'='+"'"+'stop'+"'"+';'+'LoadingResult'+'='+$UniqueCacheVariableIex.LoadingResult+'}')|iex
                                                                                        Sync-UDElement -Id 'importNavBarDynamicUniqueId'
                                                                                    }
                                                                                    else{
                                                                                        Start-Sleep -Milli 150
                                                                                        $Number = $UniqueCacheVariableIex.LoadingResult
                                                                                        if($Number -eq 1){
                                                                                            $TerminalProcessDetailsFilepath = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\runspace\*\terminal\terminalProcessDetails.json'
                                                                                            $TerminalProcessDetailsGci      = gci $TerminalProcessDetailsFilepath
                                                                                            if($TerminalProcessDetailsGci.Count -gt 0){
                                                                                                $MainRunspaceProcessList = @()
                                                                                                foreach ($TerminalProcessDetail in $TerminalProcessDetailsGci) {
                                                                                                    $TerminalProcessDetailFullName = $TerminalProcessDetail.FullName
                                                                                                    $TerminalProcessDetailGc       = gc $TerminalProcessDetailFullName
                                                                                                    $TerminalProcessDetailJson     = $TerminalProcessDetailGc|ConvertFrom-Json
                                                                                                    if($TerminalProcessDetailJson.ScriptName -eq 'MainRunspaceProcess'){
                                                                                                        $MainRunspaceProcessHash  = @{FullName=$TerminalProcessDetailFullName;Data=$TerminalProcessDetailJson}
                                                                                                        $MainRunspaceProcessList += $MainRunspaceProcessHash
                                                                                                    }
                                                                                                }
                                                                                                if($MainRunspaceProcessList.Count -gt 0){
                                                                                                    if($MainRunspaceProcessList.Count -eq 1){
                                                                                                        $MainRunspaceProcessList = $MainRunspaceProcessList
                                                                                                        $GetProcess              = Get-Process
                                                                                                        foreach ($Process in $GetProcess) {
                                                                                                            if($Process.Id -eq ($MainRunspaceProcessList.Data).ProcessID -and $Process.ProcessName -eq ($MainRunspaceProcessList.Data).ParentProcess){
                                                                                                                $CompareList += $MainRunspaceProcessList
                                                                                                            }                                                                                                            
                                                                                                        }
                                                                                                        if($CompareList.Count -gt 0){
                                                                                                            $CompareListSelect          = $CompareList[0]
                                                                                                            $CompareListSelectFullName  = $CompareListSelect.FullName
                                                                                                            $CompareListSelectReplace   = $CompareListSelectFullName -replace 'terminal\\terminalProcessDetails.json'
                                                                                                            $CompareListSelectQueuePath = "$CompareListSelectReplace"+'queue'+'\'
                                                                                                            $CompareListSelectQueueDir  = "$CompareListSelectQueuePath"+'importTaskItemDynamicUniqueId'+'\'
                                                                                                            $CompareListSelectQueueFile = "$CompareListSelectQueuePath"+'importTaskItemDynamicUniqueId'+'\'+'config'+'.json'
                                                                                                            $ConfigPSCO                 = [PSCustomObject]@{
                                                                                                                Id   = 'importTaskItemDynamicUniqueId'
                                                                                                                Type = 'runspace_new'
                                                                                                                Name = 'importrunspacename'
                                                                                                                Data = 'null'
                                                                                                            }
                                                                                                            $ConfigJson = $ConfigPSCO|ConvertTo-Json
                                                                                                            $New  = New-Item -ItemType Directory $CompareListSelectQueueDir
                                                                                                            $New  = New-Item -ItemType File $CompareListSelectQueueFile
                                                                                                            $Save = Set-Content $CompareListSelectQueueFile -Value $ConfigJson
                                                                                                        }
                                                                                                        else{
                                                                                                            $Session:MainRunspaceCondition = 'STOP'
                                                                                                            Show-UDToast -Message 'Main Runspace is not active!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Check -Title 'Error:' -Duration 5000
                                                                                                        }
                                                                                                    }
                                                                                                    elseif($MainRunspaceProcessList.Count -gt 1){
                                                                                                        $CompareList = @()
                                                                                                        $GetProcess  = Get-Process
                                                                                                        foreach ($RunspaceProcess in $MainRunspaceProcessList) {
                                                                                                            foreach ($Process in $GetProcess) {
                                                                                                                if($Process.Id -eq ($RunspaceProcess.Data).ProcessID -and $Process.ProcessName -eq ($RunspaceProcess.Data).ParentProcess){
                                                                                                                    $CompareList += $RunspaceProcess
                                                                                                                }                                                                                                            
                                                                                                            }
                                                                                                        }
                                                                                                        if($CompareList.Count -gt 0){
                                                                                                            $CompareListSelect          = $CompareList[0]
                                                                                                            $CompareListSelectFullName  = $CompareListSelect.FullName
                                                                                                            $CompareListSelectReplace   = $CompareListSelectFullName -replace 'terminal\\terminalProcessDetails.json'
                                                                                                            $CompareListSelectQueuePath = "$CompareListSelectReplace"+'queue'+'\'
                                                                                                            $CompareListSelectQueueDir  = "$CompareListSelectQueuePath"+'importTaskItemDynamicUniqueId'+'\'
                                                                                                            $CompareListSelectQueueFile = "$CompareListSelectQueuePath"+'importTaskItemDynamicUniqueId'+'\'+'config'+'.json'
                                                                                                            $ConfigPSCO                 = [PSCustomObject]@{
                                                                                                                Id   = 'importTaskItemDynamicUniqueId'
                                                                                                                Type = 'runspace_new'
                                                                                                                Name = 'importrunspacename'
                                                                                                                Data = 'null'
                                                                                                            }
                                                                                                            $ConfigJson = $ConfigPSCO|ConvertTo-Json
                                                                                                            $New  = New-Item -ItemType Directory $CompareListSelectQueueDir
                                                                                                            $New  = New-Item -ItemType File $CompareListSelectQueueFile
                                                                                                            $Save = Set-Content $CompareListSelectQueueFile -Value $ConfigJson
                                                                                                        }
                                                                                                        else{
                                                                                                            $Session:MainRunspaceCondition = 'STOP'
                                                                                                            Show-UDToast -Message 'Main Runspace is not active!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Check -Title 'Error:' -Duration 5000
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                else{
                                                                                                    $Session:MainRunspaceCondition = 'STOP'
                                                                                                    Show-UDToast -Message 'Main Runspace is not active!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Check -Title 'Error:' -Duration 5000
                                                                                                }
                                                                                            }
                                                                                            else{
                                                                                                $Session:MainRunspaceCondition = 'STOP'
                                                                                                Show-UDToast -Message 'Main Runspace is not active!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Check -Title 'Error:' -Duration 5000
                                                                                            }
                                                                                        }
                                                                                        $Number++
                                                                                        $UniqueCacheVariableResult = ('$Cache:'+"$CreateVariableName"+'='+'@{'+'Status'+'='+"'"+'loading'+"'"+';'+'Condition'+'='+"'"+'run'+"'"+';'+'LoadingResult'+'='+"$Number"+'}')|iex
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                                else{
                                                                    New-UDButton -Text '' -ClassName "navbar-status-dropdown-btn-play" -Icon (New-UDIcon -Icon 'Play' -Size 1x -Color 'Gray' -ClassName "navbar-status-dropdown-btn-play-icon") -onclick {
                                                                        if($Cache:LoadingDataRunspaceStatus -eq $true){
                                                                            Show-UDToast -Message 'Cannot start another runspace because one runspace process is already running!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Check -Title 'Error:' -Duration 5000
                                                                        }
                                                                        else{
                                                                            Show-UDToast -Message 'Runspace NAME: importrunspacename is imported to queue!' -MessageColor 'Black' -BackgroundColor 'green' -Icon Check -Title 'Success:' -Duration 5000
                                                                            $Session:CreateUniqueProcessId = ([guid]::NewGuid()).Guid
                                                                            $CreateVariableName            = 'importTaskItemDynamicUniqueId' -replace '-','_'
                                                                            $UniqueCacheVariableResult     = ('$Cache:'+"$CreateVariableName"+'='+'@{'+'Status'+'='+"'"+'loading'+"'"+';'+'Condition'+'='+"'"+''+"'"+';'+'LoadingResult'+'='+'1'+'}')|iex
                                                                            Sync-UDElement -Id 'NavBarStatusStartRunspaceDynamicId-importTaskItemDynamicUniqueId'
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                    New-UDRow -Columns {
                                                        New-UDColumn -Content {
                                                            New-UDTypography -Text (New-Object System.DateTime $TaskItemTicks) -ClassName 'navbar-status-dropdown-message-date'
                                                            New-UDTypography -Text "$TaskItemCredential" -ClassName 'navbar-status-dropdown-message-user'
                                                        }
                                                    }            
                                                }
                                            } -replace 'importrunspacepid',"$TaskItemPid" -replace 'importrunspaceprocessname',"$TaskItemProcessName" -replace 'importrunspacename',"$TaskItemName" -replace 'importTaskItemDynamicUniqueId',"$TaskItemId"
                                            $NewRunspaceItemPlaySC|iex
                                        }
                                        else{
                                            $NewRunspaceItemStopSC = {
                                                New-UDCardBody -ClassName "navbar-status-dropdown-btn-message-layout" -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -Content {
                                                            New-UDButton -Text "$TaskItemType" -ClassName "navbar-status-dropdown-btn-message-job"
                                                            $RunspaceMenuButton = {
                                                                New-UDLink -Id ('Runspace-'+"$TaskItemId"+'-importrunspacepid') -Children {
                                                                    New-UDTypography -Text "$TaskItemName" -ClassName 'navbar-status-dropdown-message-title'
                                                                } -OnClick {
                                                                    Show-UDModal -Header {
                                                                        New-UDTypography -Text ('Runspace PID: importrunspacepid') -ClassName "task-center-box-inner-title"
                                                                    } -Content {
                            
                                                                    } -Footer { New-UDButton -Text "Close" -OnClick {
                                                                        Hide-UDModal
                                                                    } -ClassName "task-center-box-btn"}
                                                                }
                                                            }
                                                            $RunspaceMenuButton|iex
                                                            New-UDButton -Text '' -ClassName "navbar-status-dropdown-btn-stop" -Icon (New-UDIcon -Icon 'Stop' -Size 1x -Color 'Gray' -ClassName "navbar-status-dropdown-btn-stop-icon") -onclick {
                                                                $GetProcess = Get-Process -Id 'importrunspacepid'
                                                                if('Main-Runspace' -eq 'importrunspacetaskname' -and $GetProcess.ProcessName -eq 'importrunspaceprocessname'){
                                                                    Show-UDModal -Header {
                                                                        New-UDTypography -Text 'This is the main terminal that terminates all runtimes' -ClassName "task-center-box-inner-title"
                                                                    } -Content {
                                                                        New-UDButton -Text "Yes stop all runspaces" -OnClick {
                                                                            $GetProcess = Get-Process
                                                                            $DataRunspaceTaskListGc   = gc $Cache:TerminalDataRunspacePath
                                                                            $DataRunspaceTaskListJson = ($DataRunspaceTaskListGc|ConvertFrom-Json).TaskList
                                                                            foreach ($TaskItem in $DataRunspaceTaskListJson) {
                                                                                $TaskItemPid         = $TaskItem.Pid
                                                                                $TaskItemProcessName = $TaskItem.ProcessName
                                                                                if($GetProcess.Id -eq $TaskItemPid -and $GetProcess.ProcessName -eq $TaskItemProcessName){
                                                                                    $TaskKill = TASKKILL /PID $TaskItemPid
                                                                                    Show-UDToast -Message ('Process PID: '+"$TaskItemPid"+' is killed!') -MessageColor 'Black' -BackgroundColor 'green' -Icon Check -Title 'Success:' -Duration 5000
                                                                                }
                                                                                else{
                                                                                    Show-UDToast -Message ('Process PID: '+"$TaskItemPid"+' is not exist!') -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                                }
                                                                            }
                                                                            $NewRunspacePSCO = [PSCustomObject]@{
                                                                                Status   = '2'
                                                                                TaskList = ''
                                                                            }
                                                                            $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                                                                            $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson
                                                                            Invoke-UDJavaScript -JavaScript '
                                                                                function statusDrop() {
                                                                                    var dropcondition = document.getElementById("navbar-status-dropdown").style.display;
                                                                                    if (dropcondition == "block") {
                                                                                        document.getElementById("navbar-status-dropdown").style.display = "none";
                                                                                    } else {
                                                                                        document.getElementById("navbar-notification-dropdown").style.display = "none";
                                                                                        document.getElementById("navbar-auth-dropdown").style.display = "none";
                                                                                        document.getElementById("navbar-status-dropdown").style.display = "block";
                                                                                    }
                                                                                }
                                                                                statusDrop();
                                                                            '
                                                                            Sync-UDElement -Id 'importNavBarDynamicUniqueId'
                                                                            Hide-UDModal
                                                                        } -ClassName "task-center-box-btn"
                                                                    } -Footer { New-UDButton -Text "Close" -OnClick {
                                                                        Hide-UDModal
                                                                    } -ClassName "task-center-box-btn"}
                                                                }
                                                                elseif($GetProcess.ProcessName -eq 'importrunspaceprocessname'){
                                                                    $TaskKill = TASKKILL /PID importrunspacepid
                                                                    Show-UDToast -Message 'Process PID: importrunspacepid is killed!' -MessageColor 'Black' -BackgroundColor 'green' -Icon Check -Title 'Success:' -Duration 5000
                                                                    $GetProcess = Get-Process
                                                                    $GetDataRunspacePath                   = gc $Cache:TerminalDataRunspacePath
                                                                    $GetDataRunspacePathJson               = $GetDataRunspacePath | ConvertFrom-Json
                                                                    $Cache:GetDataRunspacePathJsonStatus   = $GetDataRunspacePathJson.Status
                                                                    $Cache:GetDataRunspacePathJsonTaskList = $GetDataRunspacePathJson.TaskList
                                                                    $NewRunspaceList                       = @()
                                                                    foreach ($Runspace in $Cache:GetDataRunspacePathJsonTaskList) {
                                                                        $RunspacePID         = $Runspace.Pid
                                                                        $RunspaceProcessName = $Runspace.ProcessName
                                                                        if($GetProcess.Id -eq $RunspacePID -and $GetProcess.ProcessName -eq $RunspaceProcessName){
                                                                            $NewRunspaceList += $Runspace
                                                                        }
                                                                        elseif($null -eq $Runspace.Credential -and $null -eq $Runspace.Type -and $null -eq $Runspace.TaskId -and $null -eq $Runspace.ScriptPath -and $null -eq $Runspace.Name -and $null -eq $Runspace.ProcessName -and $null -eq $Runspace.Pid){

                                                                        }
                                                                        else{
                                                                            $GetTicks = (Get-Date).Ticks
                                                                            $NewRunspaceDetailPSCO = [PSCustomObject]@{
                                                                                Credential  = $Runspace.Credential
                                                                                Type        = $Runspace.Type
                                                                                TaskId      = $Runspace.TaskId
                                                                                ScriptPath  = $Runspace.ScriptPath
                                                                                Ticks       = $GetTicks
                                                                                Name        = $Runspace.Name
                                                                                ProcessName = $Runspace.ProcessName
                                                                                PID         = 'null'
                                                                            }
                                                                            $NewRunspaceList += $NewRunspaceDetailPSCO
                                                                        }
                                                                    }
                                                
                                                                    if($NewRunspaceList.Count -eq 0 -or $null -eq $NewRunspaceList){
                                                                        $NewRunspacePSCO = [PSCustomObject]@{
                                                                            Status   = '2'
                                                                            TaskList = ''
                                                                        }
                                                                        $Cache:GetDataRunspacePathJsonStatus   = '2'
                                                                        $Cache:GetDataRunspacePathJsonTaskList = ''
                                                                        $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                                                                        $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson    
                                                                    }
                                                                    else{
                                                                        $NewRunspacePSCO = [PSCustomObject]@{
                                                                            Status   = '1'
                                                                            TaskList = $NewRunspaceList
                                                                        }
                                                                        $Cache:GetDataRunspacePathJsonStatus   = '1'
                                                                        $Cache:GetDataRunspacePathJsonTaskList = $NewRunspaceList
                                                                        $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                                                                        $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson
                                                                    }
                                                                    Invoke-UDJavaScript -JavaScript '
                                                                        function statusDrop() {
                                                                            var dropcondition = document.getElementById("navbar-status-dropdown").style.display;
                                                                            if (dropcondition == "block") {
                                                                                document.getElementById("navbar-status-dropdown").style.display = "none";
                                                                            } else {
                                                                                document.getElementById("navbar-notification-dropdown").style.display = "none";
                                                                                document.getElementById("navbar-auth-dropdown").style.display = "none";
                                                                                document.getElementById("navbar-status-dropdown").style.display = "block";
                                                                            }
                                                                        }
                                                                        statusDrop();
                                                                    '                                                
                                                                    Sync-UDElement 'importNavBarDynamicUniqueId'
                                                                    $sleep = sleep 1
                                                                    Sync-UDElement 'importNavBarDynamicUniqueId'
                                                                    $sleep = sleep 1
                                                                    Sync-UDElement 'importNavBarDynamicUniqueId'
                                                                }                                                                
                                                                else{
                                                                    Show-UDToast -Message 'Process PID: importrunspacepid is not exist!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                }
                                                            }
                                                        }
                                                    }
                                                    New-UDRow -Columns {
                                                        New-UDColumn -Content {
                                                            New-UDTypography -Text (New-Object System.DateTime $TaskItemTicks) -ClassName 'navbar-status-dropdown-message-date'
                                                            New-UDTypography -Text "$TaskItemCredential" -ClassName 'navbar-status-dropdown-message-user'
                                                        }
                                                    }            
                                                }
                                            } -replace 'importrunspacepid',"$TaskItemPid" -replace 'importrunspaceprocessname',"$TaskItemProcessName" -replace 'importrunspacetaskname',"$TaskItemName"
                                            $NewRunspaceItemStopSC|iex
                                        }
                                    }
                                    New-UDCardBody -ClassName "navbar-status-dropdown-btn-message-layout-footer" -Content {}
                                }
                            }
                        }
                        elseif($Cache:GetDataRunspacePathJsonStatus -eq 2 -and $Cache:LoadingDataRunspaceStatus -ne $true){
                            New-UDBUtton -Id 'StatusButton-importNavBarDynamicUniqueId' -ClassName 'navbar-btn-statusheader' -Text 'Offline' -Icon (New-UDIcon -Icon 'DotCircle' -Color 'DarkRed' -ClassName 'navbar-btn-statusheadercircle') -OnClick {
                                $GetProcess = Get-Process
                                $GetDataRunspacePath                   = gc $Cache:TerminalDataRunspacePath
                                $GetDataRunspacePathJson               = $GetDataRunspacePath | ConvertFrom-Json
                                $Cache:GetDataRunspacePathJsonStatus   = $GetDataRunspacePathJson.Status
                                $Cache:GetDataRunspacePathJsonTaskList = $GetDataRunspacePathJson.TaskList
                                $NewRunspaceList                 = @()
                                foreach ($Runspace in $Cache:GetDataRunspacePathJsonTaskList) {
                                    $RunspacePID         = $Runspace.Pid
                                    $RunspaceProcessName = $Runspace.ProcessName
                                    if($GetProcess.Id -eq $RunspacePID -and $GetProcess.ProcessName -eq $RunspaceProcessName){
                                        $NewRunspaceList += $Runspace
                                    }
                                    elseif($null -eq $Runspace.Credential -and $null -eq $Runspace.Type -and $null -eq $Runspace.TaskId -and $null -eq $Runspace.ScriptPath -and $null -eq $Runspace.Name -and $null -eq $Runspace.ProcessName -and $null -eq $Runspace.Pid){

                                    }
                                    else{
                                        $GetTicks = (Get-Date).Ticks
                                        $NewRunspaceDetailPSCO = [PSCustomObject]@{
                                            Credential  = $Runspace.Credential
                                            Type        = $Runspace.Type
                                            TaskId      = $Runspace.TaskId
                                            ScriptPath  = $Runspace.ScriptPath
                                            Ticks       = $GetTicks
                                            Name        = $Runspace.Name
                                            ProcessName = $Runspace.ProcessName
                                            PID         = 'null'
                                        }
                                        $NewRunspaceList += $NewRunspaceDetailPSCO
                                    }
                                }
        
                                if($NewRunspaceList.Count -eq 0 -or $null -eq $NewRunspaceList){
                                    $NewRunspacePSCO = [PSCustomObject]@{
                                        Status   = '2'
                                        TaskList = ''
                                    }
                                    $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                                    $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson    
                                }
                                else{
                                    $NewRunspacePSCO = [PSCustomObject]@{
                                        Status   = '1'
                                        TaskList = $NewRunspaceList
                                    }
                                    $NewRunspacePSCOToJson = $NewRunspacePSCO|ConvertTo-Json
                                    $Save = Set-Content $Cache:TerminalDataRunspacePath -Value $NewRunspacePSCOToJson
                                }
                                $Cache:GetDataRunspacePathJsonTaskList = $NewRunspaceList

                                if($Cache:LoadingDataRunspaceStatus -eq $true){
                                    Sync-UDElement -Id 'importNavBarDynamicUniqueId' -Broadcast
                                }
                                elseif($Cache:GetDataRunspacePathJsonStatus -eq 1 -and $Cache:GetDataRunspacePathJsonTaskList.Count -gt 0 -and $Cache:LoadingDataRunspaceStatus -ne $true){
                                    Sync-UDElement -Id 'importNavBarDynamicUniqueId' -Broadcast
                                }
                                else{
                                    Invoke-UDJavaScript -JavaScript '
                                        function statusDrop() {
                                            var dropcondition = document.getElementById("navbar-status-dropdown").style.display;
                                            if (dropcondition == "block") {
                                                document.getElementById("navbar-status-dropdown").style.display = "none";
                                            } else {
                                                document.getElementById("navbar-notification-dropdown").style.display = "none";
                                                document.getElementById("navbar-auth-dropdown").style.display = "none";
                                                document.getElementById("navbar-status-dropdown").style.display = "block";
                                            }
                                        }
                                        statusDrop();
                                    '
                                }
                            }
                            New-UDCardBody -Id "navbar-status-dropdown" -Content {
                                New-UDRow -Columns {
                                    New-UDColumn -Content {
                                        New-UDButton -Text 'Start Terminal' -ClassName "navbar-status-dropdown-btn-start-all" -onclick {
                                            Show-UDModal -Header {New-UDTypography -Variant 'Subtitle1' -Text 'Terminal Launcher'} -Content {
                                                New-UDElement -Tag 'table' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDElement -Tag 'td' -Content {
                                                            New-UDButton -Text 'Start Hidden' -ClassName "navbar-status-dropdown-btn-eye" -OnClick {
                                                                $Cache:LoadingRunspaceNumber = 1
                                                                $Cache:LoadingDataRunspaceStatus = $true
                                                                $MainMenuDashboardTaskCenterTaskManagerTerminalConsoleStartSC = {
                                                                    $global:terminalWindowStyle = 'hidden'
                                                                    [string]$uniqueId = [guid]::NewGuid().Guid
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
'@ -replace 'importterminalscriptpath','importCacheTerminalScriptPath' -replace 'transcriptFilePath','importCacheTerminalTranscriptPath' -replace 'importrootappdirectory','importCacheRootAppDirectory' -replace 'importrootcontrollertype','importCacheRootControllerType') -replace 'uniqueid',"$uniqueId"
                                                                    $bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
                                                                    $encodedCommand = [Convert]::ToBase64String($bytes)
                                                                    $arg = "-NoExit", "-WindowStyle $terminalWindowStyle", "-encodedCommand $encodedCommand"
                                                                    $proc = Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -argumentlist $arg -PassThru
                                                                    $procPID = $proc.Id
                                                                    
                                                                    $TerminalProcessId = $uniqueId
                                                                    
                                                                    $terminalProcessDetail = {
                                                                        $items = Get-CimInstance -ClassName win32_process -filter "ProcessId = `'$procPID`'"
                                                                        $dataTranscriptFilePath = 'importCacheTerminalRunspaceTranscriptPath'
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
                                                                                ScriptName      = 'MainRunspaceProcess'
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
                                                                    $terminalProcessDetail|iex
                                                                    
                                                                    $dataTaskCenterRunspaceTerminalFilePath = 'importCacheTerminalRunspacePath'+"$uniqueId"+'\'
                                                                    $uniqueId = $null
                                                                    if($dataTaskCenterRunspaceTerminalFilePath){
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'controller\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'denied\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'history\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'processing\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'queue\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'windowstyle\requirement\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'windowstyle\result\') -Force

                                                                        $TerminalJson = '['+'{'+'"'+'pid'+'"'+':'+'"'+"$procPID"+'"'+','+'"'+'Windowstyle'+'"'+':'+'"'+"$terminalWindowStyle"+'"'+','+'"'+'UniqueId'+'"'+':'+'"'+"$TerminalProcessId"+'"'+','+'"'+'Status'+'"'+':'+'"'+'run'+'"'+'}'+']'
                                                                        $ProcessJson  = $processDetail | ConvertTo-Json
                                                                        $NewFile      = New-Item -ItemType File ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminal'+'.json') -Force
                                                                        $SaveContent  = Set-Content ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminal'+'.json') -Value $TerminalJson -Force
                                                                        $NewFile      = New-Item -ItemType File ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminalProcessDetails'+'.json') -Force
                                                                        $SaveContent  = Set-Content ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminalProcessDetails'+'.json') -Value $ProcessJson -Force
                                                                    }
                                                                } -replace 'importCacheTerminalScriptPath',"$Cache:MainTerminalScriptPath" -replace 'importCacheTerminalTranscriptPath',"$Cache:TerminalTranscriptPath" -replace 'importCacheRootAppDirectory',"$Cache:RootAppDirectory" -replace 'importCacheRootControllerType',"$Cache:RootControllerType" -replace 'importCacheTerminalRunspaceTranscriptPath',"$Cache:TerminalRunspaceTranscriptPath" -replace 'importCacheTerminalRunspacePath',"$Cache:TerminalRunspacePath"
                                                                $GetTicks = (Get-Date).Ticks
                                                                $CreateNewItem = New-Item -ItemType File ("$Cache:TerminalCollectorPath"+"$GetTicks"+'.ps1') -Value $MainMenuDashboardTaskCenterTaskManagerTerminalConsoleStartSC
                                                                Invoke-UDJavaScript -JavaScript '
                                                                    function statusDrop() {
                                                                        var dropcondition = document.getElementById("navbar-status-dropdown").style.display;
                                                                        if (dropcondition == "block") {
                                                                            document.getElementById("navbar-status-dropdown").style.display = "none";
                                                                        } else {
                                                                            document.getElementById("navbar-notification-dropdown").style.display = "none";
                                                                            document.getElementById("navbar-auth-dropdown").style.display = "none";
                                                                            document.getElementById("navbar-status-dropdown").style.display = "block";
                                                                        }
                                                                    }
                                                                    statusDrop();
                                                                '                                                                
                                                                Hide-UDModal
                                                                Sync-UDElement -Id 'importNavBarDynamicUniqueId'
                                                            } -Icon (New-UDIcon -Icon 'EyeSlash' -Size 1x -Color 'Gray' -ClassName "navbar-status-dropdown-btn-eye-icon")                                        
                                                        }
                                                        New-UDElement -Tag 'td' -Content {}
                                                        New-UDElement -Tag 'td' -Content {
                                                            New-UDButton -Text 'Start Normal' -ClassName "navbar-status-dropdown-btn-eye" -OnClick {
                                                                $Cache:LoadingRunspaceNumber = 1
                                                                $Cache:LoadingDataRunspaceStatus = $true
                                                                $MainMenuDashboardTaskCenterTaskManagerTerminalConsoleStartSC = {
                                                                    $global:terminalWindowStyle = 'normal'
                                                                    [string]$uniqueId = [guid]::NewGuid().Guid
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
'@ -replace 'importterminalscriptpath','importCacheTerminalScriptPath' -replace 'transcriptFilePath','importCacheTerminalTranscriptPath' -replace 'importrootappdirectory','importCacheRootAppDirectory' -replace 'importrootcontrollertype','importCacheRootControllerType') -replace 'uniqueid',"$uniqueId"
                                                                    $bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
                                                                    $encodedCommand = [Convert]::ToBase64String($bytes)
                                                                    $arg = "-NoExit", "-WindowStyle $terminalWindowStyle", "-encodedCommand $encodedCommand"
                                                                    $proc = Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -argumentlist $arg -PassThru
                                                                    $procPID = $proc.Id
                                                                    
                                                                    $TerminalProcessId = $uniqueId
                                                                    
                                                                    $terminalProcessDetail = {
                                                                        $items = Get-CimInstance -ClassName win32_process -filter "ProcessId = `'$procPID`'"
                                                                        $dataTranscriptFilePath = 'importCacheTerminalRunspaceTranscriptPath'
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
                                                                                ScriptName      = 'MainRunspaceProcess'
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
                                                                    $terminalProcessDetail|iex

                                                                    $dataTaskCenterRunspaceTerminalFilePath = 'importCacheTerminalRunspacePath'+"$uniqueId"+'\'
                                                                    $uniqueId = $null
                                                                    if($dataTaskCenterRunspaceTerminalFilePath){
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'controller\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'denied\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'history\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'processing\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'queue\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'windowstyle\requirement\') -Force
                                                                        $NewDirectory = New-Item -ItemType Directory ("$dataTaskCenterRunspaceTerminalFilePath"+'windowstyle\result\') -Force

                                                                        $TerminalJson = '['+'{'+'"'+'pid'+'"'+':'+'"'+"$procPID"+'"'+','+'"'+'Windowstyle'+'"'+':'+'"'+"$terminalWindowStyle"+'"'+','+'"'+'UniqueId'+'"'+':'+'"'+"$TerminalProcessId"+'"'+','+'"'+'Status'+'"'+':'+'"'+'run'+'"'+'}'+']'
                                                                        $ProcessJson  = $processDetail | ConvertTo-Json
                                                                        $NewFile      = New-Item -ItemType File ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminal'+'.json') -Force
                                                                        $SaveContent  = Set-Content ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminal'+'.json') -Value $TerminalJson -Force
                                                                        $NewFile      = New-Item -ItemType File ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminalProcessDetails'+'.json') -Force
                                                                        $SaveContent  = Set-Content ("$dataTaskCenterRunspaceTerminalFilePath"+'terminal\'+'terminalProcessDetails'+'.json') -Value $ProcessJson -Force
                                                                    }
                                                                } -replace 'importCacheTerminalScriptPath',"$Cache:MainTerminalScriptPath" -replace 'importCacheTerminalTranscriptPath',"$Cache:TerminalTranscriptPath" -replace 'importCacheRootAppDirectory',"$Cache:RootAppDirectory" -replace 'importCacheRootControllerType',"$Cache:RootControllerType" -replace 'importCacheTerminalRunspaceTranscriptPath',"$Cache:TerminalRunspaceTranscriptPath" -replace 'importCacheTerminalRunspacePath',"$Cache:TerminalRunspacePath"
                                                                $GetTicks = (Get-Date).Ticks
                                                                $CreateNewItem = New-Item -ItemType File ("$Cache:TerminalCollectorPath"+"$GetTicks"+'.ps1') -Value $MainMenuDashboardTaskCenterTaskManagerTerminalConsoleStartSC
                                                                Invoke-UDJavaScript -JavaScript '
                                                                    function statusDrop() {
                                                                        var dropcondition = document.getElementById("navbar-status-dropdown").style.display;
                                                                        if (dropcondition == "block") {
                                                                            document.getElementById("navbar-status-dropdown").style.display = "none";
                                                                        } else {
                                                                            document.getElementById("navbar-notification-dropdown").style.display = "none";
                                                                            document.getElementById("navbar-auth-dropdown").style.display = "none";
                                                                            document.getElementById("navbar-status-dropdown").style.display = "block";
                                                                        }
                                                                    }
                                                                    statusDrop();
                                                                '
                                                                Hide-UDModal
                                                                Sync-UDElement -Id 'importNavBarDynamicUniqueId'
                                                            } -Icon (New-UDIcon -Icon 'Eye' -Size 1x -Color 'Gray' -ClassName "navbar-status-dropdown-btn-eye-icon")                                       
                                                        }                                            
                                                    }                                        
                                                }
                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "exchange-info-box-btn"}
                                        } -Icon (New-UDIcon -Icon 'PowerOff' -Size 1x -Color 'DarkGreen' -ClassName "navbar-status-dropdown-btn-start-all-icon")
                                        New-UDButton -Text 'Get Task List' -ClassName "navbar-status-dropdown-btn-eye" -Icon (New-UDIcon -Icon 'Eye' -Size 1x -Color 'Gray' -ClassName "navbar-status-dropdown-btn-eye-icon") -onclick {
                                            Invoke-UDRedirect -Url '/gettasklist'
                                        }
                                    }
                                }
                                New-UDCardBody -ClassName "navbar-status-dropdown-btn-message-layout-footer" -Content {}
                            }
                        }                        

                    } -replace 'importNavBarDynamicUniqueId',"$Session:NavBarDynamicUniqueId"

                    $DynNavbarStatusSCDynamicProcess = {
                        New-UDDynamic -Id 'importNavBarDynamicUniqueId' -Content {
                            {importNavBarDynamicUScriptBlock}|iex
                        }
                        Sync-UDElement -Id 'importNavBarDynamicUniqueId' -Broadcast
                    } -replace 'importNavBarDynamicUniqueId',"$Session:NavBarDynamicUniqueId" -replace 'importNavBarDynamicUScriptBlock',"$DynNavbarStatusSC"

                    $DynNavbarStatusSCDynamicProcess|iex
                    
                    #------------------------------------------------------------------------------#
                    #- NOTIFICATION ---------------------------------------------------------------#
                    #------------------------------------------------------------------------------#
                    
                    $NotificationNewItemSC = {
                        New-UDCardBody -ClassName "navbar-notification-dropdown-btn-message-layout" -Content {
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDButton -Text '' -ClassName "navbar-notification-dropdown-btn-delete" -Icon (New-UDIcon -Icon 'TrashAlt' -Size 1x -Color 'Gray' -ClassName "navbar-notification-dropdown-btn-delete-icon")  
                                    New-UDButton -Text "$NotificationItemType" -ClassName "navbar-notification-dropdown-btn-message-info"
                                    New-UDTypography -Text "$NotificationItemName" -ClassName 'navbar-notification-dropdown-message-title'
                                }
                            }
                            New-UDRow -Columns {
                                New-UDColumn -SmallSize 10 -MediumSize 10 -LargeSize 10 -Content {
                                    New-UDTypography -Text "$NotificationItemName" -ClassName 'navbar-notification-dropdown-message-text'
                                }
                            }
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDTypography -Text (New-Object System.DateTime $NotificationItemTicks) -ClassName 'navbar-notification-dropdown-message-date'
                                    New-UDTypography -Text $NotificationItemCredential -ClassName 'navbar-notification-dropdown-message-user'
                                }
                            }            
                        }
                    }

                    New-UDDynamic -Content {
                        $GetDataNotificationPathPath       = gc $Cache:NotificationDataPath
                        $GetDataNotificationPathJson       = $GetDataNotificationPathPath | ConvertFrom-Json
                        $GetDataNotificationPathJsonList   = $GetDataNotificationPathJson.NotificationList
                        $GetDataNotificationPathJsonCount  = $GetDataNotificationPathJsonList.Count
                        New-UDLink -Children {
                            New-UDBadge -BadgeContent { $GetDataNotificationPathJsonCount }  -Children {
                                New-UdIcon -Icon 'Bell' -Size 1x -ClassName 'navbar-notification-color'
                            } -Color Info -Id 'navbar-btn-header-bell'
                        } -OnClick { Invoke-UDJavaScript -JavaScript '
                            function notificationDrop() {
                                var dropcondition = document.getElementById("navbar-notification-dropdown").style.display;
                                if (dropcondition == "block") {
                                    document.getElementById("navbar-notification-dropdown").style.display = "none";
                                } else {
                                    document.getElementById("navbar-status-dropdown").style.display = "none";
                                    document.getElementById("navbar-auth-dropdown").style.display = "none";
                                    document.getElementById("navbar-notification-dropdown").style.display = "block";
                                }
                            }
                            notificationDrop();        
                        ' 
                        }

                        if($GetDataNotificationPathJsonCount -gt 0){
                            New-UDCardBody -Id "navbar-notification-dropdown" -Content {
                                New-UDRow -Columns {
                                    New-UDColumn -Content {
                                        New-UDButton -Text 'Clear All Notifications' -ClassName "navbar-notification-dropdown-btn-trash" -Icon (New-UDIcon -Icon 'TrashAlt' -Size 1x -Color 'DarkRed' -ClassName "navbar-notification-dropdown-btn-trash-icon")
                                        New-UDButton -Text 'View All' -ClassName "navbar-notification-dropdown-btn-eye" -Icon (New-UDIcon -Icon 'Eye' -Size 1x -Color 'Gray' -ClassName "navbar-notification-dropdown-btn-eye-icon")
                                    }
                                }
                                foreach ($NotificationItem in $GetDataNotificationPathJsonList) {
                                    $NotificationItemType       = $NotificationItem.Type
                                    $NotificationItemName       = $NotificationItem.Name
                                    $NotificationItemDesc       = $NotificationItem.Desc
                                    $NotificationItemTicks      = $NotificationItem.Ticks
                                    $NotificationItemCredential = $NotificationItem.Credential
                                    $NotificationItemPath       = $NotificationItem.Path
                                    $NotificationNewItemSC|iex
                                }
                                New-UDCardBody -ClassName "navbar-notification-dropdown-btn-message-layout-footer" -Content {}
                            }
                        }
                        

                    } -AutoRefresh -AutoRefreshInterval 10


                    #------------------------------------------------------------------------------#
                    #- AUTHENTICATION -------------------------------------------------------------#
                    #------------------------------------------------------------------------------#

                    $AuthenticationNewItemSC = {
                        New-UDElement -Tag 'div' -Content {
                            New-UDLink -Children {
                                New-UdIcon -Id 'navbar-btn-header-auth' -Icon 'UserCircle' -Size 1x -ClassName 'navbar-auth-color'
                            } -OnClick { Invoke-UDJavaScript -JavaScript '
                                function authDrop() {
                                    var dropcondition = document.getElementById("navbar-auth-dropdown").style.display;
                                    if (dropcondition == "block") {
                                        document.getElementById("navbar-auth-dropdown").style.display = "none";
                                    } else {
                                        document.getElementById("navbar-status-dropdown").style.display = "none";
                                        document.getElementById("navbar-notification-dropdown").style.display = "none";
                                        document.getElementById("navbar-auth-dropdown").style.display = "block";
                                    }
                                }
                                authDrop();        
                            '
                    
                            }
                        } -Id 'navbar-btn-header-auth-div'
                        New-UDCardBody -Id "navbar-auth-dropdown" -Content {
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDElement -Tag 'div' -Content {
                                        New-UDLink -Children {
                                            New-UDImage -Url '/assets/img/blank-user-img.png' -Width 30 -Height 30
                                        } -OnClick {} -ClassName 'navbar-auth-dropdown-btn-account-user-img-link'
                                    } -Id 'navbar-auth-dropdown-btn-account-user-img'
                                }
                            }
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDLink -Children {
                                        New-UDTypography -Text $Session:AuthenticationLoginEmail -ClassName "navbar-auth-dropdown-btn-account-email"
                                    } -OnClick {}
                                }
                            }
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDButton -Text 'Account Settings' -ClassName "navbar-auth-dropdown-btn-account-settings" -Icon (New-UDIcon -Icon 'UserCog' -Size 1x -Color 'Gray' -ClassName "navbar-auth-dropdown-btn-account-settings-icon") -OnClick {
    
                                    }
                                }
                            }
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDButton -Text 'Sign Out' -ClassName "navbar-auth-dropdown-btn-sign-out" -Icon (New-UDIcon -Icon 'SignOutAlt' -Size 1x -Color 'Gray' -ClassName "navbar-auth-dropdown-btn-sign-out-icon") -OnClick {
                                        $Session:AuthenticationResult = $null
                                        Invoke-UDJavaScript -JavaScript '
                                            function ReloadPage() {
                                                window.location.reload();
                                            }
                                            ReloadPage();
                                        '
                                    }
                                }
                            }
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                
                                    } 
                                }                
                            }
                            New-UDCardBody -ClassName "navbar-auth-dropdown-btn-message-layout-footer" -Content {}
                        }
                    }

                    $AuthenticationNewItemSC|iex

            }
        }
    }
}




