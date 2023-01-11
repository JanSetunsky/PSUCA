$Cache:RootAppDirectory    = 'd:\PSUCA\'
$Cache:RootControllerType  = 'dev'
$Cache:ServerUrlAdress     = 'http://localhost:5000/'
$Cache:GlobalAdminAppToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9oYXNoIjoiNDA2YTlkODctMzEyOS00NmNhLTgxNjAtYWY3OWM1YzlmN2Q0Iiwic3ViIjoiUG93ZXJTaGVsbFVuaXZlcnNhbCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkbWluaXN0cmF0b3IiLCJuYmYiOjE2NTg1MjA2ODAsImV4cCI6MjExNjQ0NDI2MCwiaXNzIjoiSXJvbm1hblNvZnR3YXJlIiwiYXVkIjoiUG93ZXJTaGVsbFVuaXZlcnNhbCJ9.OTk1EDJ0wURQpYsPOx3TRzXYfT9O077N6eR9GjeyMV0'
$Cache:GlobalApiAppToken    = 'testapiapptoken'
connect-PSUServer -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken
#region PART PARAMETERS
#.("$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\path-list.ps1')
.("$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\theme\theme.ps1')
.("$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\navbar\header.ps1')
.("$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\navbar\nav.ps1')
$Cache:LogoFilePath = '\assets\img\CustomizePSUCA-extra-small.png'
#endregion PART PARAMETERS

# DASHBOARD REPOSITORY PATH
$Cache:DashboardRepositoryUniversalDashboardPath = "$Cache:RootAppDirectory"+'engine\psudata\UniversalAutomation\repository\.universal\dashboards.ps1'

# DASHBOARD REPOSITORY PATH
$Cache:DashboardRepositoryPath = "$Cache:RootAppDirectory"+'engine\psudata\UniversalAutomation\repository\dashboards\'
$Cache:DashboardRepositoryList = gci $Cache:DashboardRepositoryPath

# DASHBOARD ROOT CONTROLLER PATH
$Cache:DashboardRootControllerPath = "$Cache:RootAppDirectory"+'engine\controller\'
$Cache:DashboardRootControllerList = gci $Cache:DashboardRootControllerPath

# DASHBOARD ROOT DATABASE PATH
$Cache:DashboardRootDatabasePath = "$Cache:RootAppDirectory"+'database\'
$Cache:DashboardRootDatabaseList = gci $Cache:DashboardRootDatabasePath

#region PART PAGES
# PAGE - AUTHENTICATION
$Cache:PageAuthentication              = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\authentication\pages\authentication.ps1'+'"'
# PAGE - INTERFACE 
$Cache:PageInterface                   = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\interface\pages\interface.ps1'+'"'
# PAGE - INTERFACE - NEW SERVER 
$Cache:PageInterfaceNewServer          = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\interface\pages\interface-new-server.ps1'+'"'
# PAGE - INTERFACE - NEW COMPONENTS 
$Cache:PageInterfaceNewComponents      = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\interface\pages\interface-new-components.ps1'+'"'
# PAGE - INTERFACE - NEW PSUCA CONTROLLER 
$Cache:PageInterfaceNewPsucaController = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\interface\pages\interface-new-psuca-controller.ps1'+'"'
# PAGE - INTERFACE - NEW PSUCA DASHBOARD 
$Cache:PageInterfaceNewPsucaDashboard  = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\interface\pages\interface-new-psuca-dashboard.ps1'+'"'
# PAGE - TASK LIST
$Cache:PageGetTaskList                 = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\pages\task-center-get-task-list.ps1'+'"'
# PAGE - TASK GROUP
$Cache:PageNewTaskGroup                = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\pages\task-center-create-new-task-group.ps1'+'"'
# PAGE - TASK TYPE
$Cache:PageNewTaskType                 = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\pages\task-center-create-new-task-type.ps1'+'"'
# PAGE - NEW TASK
$Cache:PageNewTask                     = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\pages\task-center-create-new-task.ps1'+'"'
# PAGE - NEW ENTITY MODEL
$Cache:PageNewEntityModel              = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\entitycenter\pages\entity-center-create-new-entity-model.ps1'+'"'
# PAGE - NEW MUTUAL TIES
$Cache:PageNewMutualTies               = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\mutualties\pages\mutual-ties-create-new-ties.ps1'+'"'
# PAGE - OVERVIEW OF MUTUAL RELATIONS
$Cache:PageOverviewMutualRelations     = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\mutualties\pages\mutual-ties-overview-mutual-relations.ps1'+'"'
#endregion PART PAGES


#region PART PROCESSES
$Session:UniqueServerId = ([guid]::NewGuid()).Guid
$ServerPublicIP = (Invoke-WebRequest -uri "https://api.ipify.org/").content
$Cache:ServerPublicIp = $ServerPublicIP

# TASK LIST CACHE CONFIGURATIONS
$Cache:TaskListConfigurationsSC = {
    $Cache:TaskListConfigurationDatabasePath = ("$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\list\')
    if(Test-Path $Cache:TaskListConfigurationDatabasePath){
        $Cache:TaskListConfiguration = gci $Cache:TaskListConfigurationDatabasePath
    }
    else{
        $New = New-Item -ItemType Directory $Cache:TaskListConfigurationDatabasePath
        $Cache:TaskListConfiguration = gci $Cache:TaskListConfigurationDatabasePath
    }
}
$Cache:TaskListConfigurationsSC|iex

# TASK GROUP CACHE SCRIPTBLOCK
$Cache:TaskGroupSC = {
    $Cache:TaskGroupDatabasePath = ("$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\group\')
    if(Test-Path $Cache:TaskGroupDatabasePath){
        $Cache:TaskGroupList = gci $Cache:TaskGroupDatabasePath
    }
    else{
        $New = New-Item -ItemType Directory $Cache:TaskGroupDatabasePath
        $Cache:TaskGroupList = gci $Cache:TaskGroupDatabasePath
    }
}
$Cache:TaskGroupSC|iex

# TASK TYPE CACHE SCRIPTBLOCK
$Cache:TaskTypeSC = {
    $Cache:TaskTypeDatabasePath = ("$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\type\')
    if(Test-Path $Cache:TaskTypeDatabasePath){
        $Cache:TaskTypeList = gci $Cache:TaskTypeDatabasePath
    }
    else{
        $New = New-Item -ItemType Directory $Cache:TaskTypeDatabasePath
        $Cache:TaskTypeList = gci $Cache:TaskTypeDatabasePath
    }
}
$Cache:TaskTypeSC|iex

# TASK CACHE EDITOR DATA PATH NODE JS
$TaskEditorDataPathNodeJS = "$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\package\nodejs\node.exe'
if(Test-Path $TaskEditorDataPathNodeJS){
    $Cache:TaskEditorDataExePathNodeJS = $TaskEditorDataPathNodeJS
}
else{
    $Cache:TaskEditorDataExePathNodeJS = $null
}
# TASK CACHE EDITOR DATA PATH PYTHON
$TaskEditorDataPathPythonPY = "$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\package\python37\python.exe'
if(Test-Path $TaskEditorDataPathPythonPY){
    $Cache:TaskEditorDataExePathPythonPY = $TaskEditorDataPathPythonPY
}
else{
    $Cache:TaskEditorDataExePathPythonPY = $null
}


# TASK CACHE EDITOR SCRIPT DATA PATH JS PROCESS
$TaskEditorScriptDataPathJS = "$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\editor\test.js'
if(Test-Path $TaskEditorScriptDataPathJS){
    $Cache:TaskEditorScriptDataPathJS = $TaskEditorScriptDataPathJS
}
else{
    $Cache:TaskEditorScriptDataPathJS = $null
}
# TASK CACHE EDITOR SCRIPT DATA PATH PS PROCESS
$TaskEditorScriptDataPathPS = "$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\editor\test.ps1'
if(Test-Path $TaskEditorScriptDataPathPS){
    $Cache:TaskEditorScriptDataPathPS = $TaskEditorScriptDataPathPS
}
else{
    $Cache:TaskEditorScriptDataPathPS = $null
}
# TASK CACHE EDITOR SCRIPT DATA PATH PY PROCESS
$TaskEditorScriptDataPathPY = "$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\editor\test.py'
if(Test-Path $TaskEditorScriptDataPathPY){
    $Cache:TaskEditorScriptDataPathPY = $TaskEditorScriptDataPathPY
}
else{
    $Cache:TaskEditorScriptDataPathPY = $null
}




# TASK CACHE EDITOR SCRIPT RETRIEVE DATA PATH JS PROCESS
$TaskEditorScriptRetrieveDataPathJS = "$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\editor\retrieve.js'
if(Test-Path $TaskEditorScriptRetrieveDataPathJS){
    $Cache:TaskEditorScriptRetrieveDataPathJS = $TaskEditorScriptRetrieveDataPathJS
}
else{
    $Cache:TaskEditorScriptRetrieveDataPathJS = $null
}
# TASK CACHE EDITOR SCRIPT RETRIEVE DATA PATH PS PROCESS
$TaskEditorScriptRetrieveDataPathPS = "$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\editor\retrieve.ps1'
if(Test-Path $TaskEditorScriptRetrieveDataPathPS){
    $Cache:TaskEditorScriptRetrieveDataPathPS = $TaskEditorScriptRetrieveDataPathPS
}
else{
    $Cache:TaskEditorScriptRetrieveDataPathPS = $null
}
# TASK CACHE EDITOR SCRIPT RETRIEVE DATA PATH PY PROCESS
$TaskEditorScriptRetrieveDataPathPY = "$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\editor\retrieve.py'
if(Test-Path $TaskEditorScriptRetrieveDataPathPY){
    $Cache:TaskEditorScriptRetrieveDataPathPY = $TaskEditorScriptRetrieveDataPathPY
}
else{
    $Cache:TaskEditorScriptRetrieveDataPathPY = $null
}





# TASK CACHE SCRIPT DATA PATH JS PROCESS
$Cache:TaskCacheScriptDataProcessJS = {
    $Cache:TaskScriptDataPathJS = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\scripts\js\'
    if(Test-Path $Cache:TaskScriptDataPathJS){
        $TaskScriptDataGciJS = gci $Cache:TaskScriptDataPathJS
        $TaskScriptDataGciJSPSCO = @()
        if($null -ne $($TaskScriptDataGciJS.Mode -match '-a---')){
            $TaskScriptDataGciJSPSCO += [PSCustomObject]@{
                Dir   = ($TaskScriptDataGciJS.Directory[0]).Name
                Files = $TaskScriptDataGciJS | ? {$_.Mode -eq '-a---'} | select Name,FullName | ConvertTo-Json -Depth 5
            }
        }
        if($null -ne $($TaskScriptDataGciJS.Mode -match 'd----')){
            foreach ($currentDirItem in ($TaskScriptDataGciJS | ? {$_.Mode -eq 'd----'})) {
                $TaskScriptDataGciJSPSCO += [PSCustomObject]@{
                    Dir   = $currentDirItem.Name
                    Files = gci $currentDirItem.FullName | ? {$_.Mode -eq '-a---'} | select Name,FullName | ConvertTo-Json -Depth 5
                }
            }
    
        }
        $Cache:TaskScriptDataSaveJS = $TaskScriptDataGciJSPSCO
    }
    else{
        $Cache:TaskScriptDataPathJS = $null
    }
}
$Cache:TaskCacheScriptDataProcessJS|iex

# TASK CACHE SCRIPT DATA PATH PS PROCESS
$Cache:TaskCacheScriptDataProcessPS = {
    $Cache:TaskScriptDataPathPS = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\scripts\ps\'
    if(Test-Path $Cache:TaskScriptDataPathPS){
        $TaskScriptDataGciPS = gci $Cache:TaskScriptDataPathPS
        $TaskScriptDataGciPSPSCO = @()
        if($null -ne $($TaskScriptDataGciPS.Mode -match '-a---')){
            $TaskScriptDataGciPSPSCO += [PSCustomObject]@{
                Dir   = ($TaskScriptDataGciPS.Directory[0]).Name
                Files = $TaskScriptDataGciPS | ? {$_.Mode -eq '-a---'} | select Name,FullName | ConvertTo-Json -Depth 5
            }
        }
        if($null -ne $($TaskScriptDataGciPS.Mode -match 'd----')){
            foreach ($currentDirItem in ($TaskScriptDataGciPS | ? {$_.Mode -eq 'd----'})) {
                $TaskScriptDataGciPSPSCO += [PSCustomObject]@{
                    Dir   = $currentDirItem.Name
                    Files = gci $currentDirItem.FullName | ? {$_.Mode -eq '-a---'} | select Name,FullName | ConvertTo-Json -Depth 5
                }
            }
    
        }
        $Cache:TaskScriptDataSavePS = $TaskScriptDataGciPSPSCO
    }
    else{
        $Cache:TaskScriptDataPathPS = $null
    }
}
$Cache:TaskCacheScriptDataProcessPS|iex

# TASK CACHE SCRIPT DATA PATH PY PROCESS
$Cache:TaskCacheScriptDataProcessPY = {
    $Cache:TaskScriptDataPathPY = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\scripts\py\'
    if(Test-Path $Cache:TaskScriptDataPathPY){
        $TaskScriptDataGciPY = gci $Cache:TaskScriptDataPathPY
        $TaskScriptDataGciPYPSCO = @()
        if($null -ne $($TaskScriptDataGciPY.Mode -match '-a---')){
            $TaskScriptDataGciPYPSCO += [PSCustomObject]@{
                Dir   = ($TaskScriptDataGciPY.Directory[0]).Name
                Files = $TaskScriptDataGciPY | ? {$_.Mode -eq '-a---'} | select Name,FullName | ConvertTo-Json -Depth 5
            }
        }
        if($null -ne $($TaskScriptDataGciPY.Mode -match 'd----')){
            foreach ($currentDirItem in ($TaskScriptDataGciPY | ? {$_.Mode -eq 'd----'})) {
                $TaskScriptDataGciPYPSCO += [PSCustomObject]@{
                    Dir   = $currentDirItem.Name
                    Files = gci $currentDirItem.FullName | ? {$_.Mode -eq '-a---'} | select Name,FullName | ConvertTo-Json -Depth 5
                }
            }
    
        }
        $Cache:TaskScriptDataSavePY = $TaskScriptDataGciPYPSCO
    }
    else{
        $Cache:TaskScriptDataPathPY = $null
    }
}
$Cache:TaskCacheScriptDataProcessPY|iex


# INTERFACE CACHE DATA
#INTERFACE BLOCK FUNCTIONS 
$Cache:DataFunctionSelectListSC = {
    New-UDSelectOption -Name "None" -Value 1
    New-UDSelectOption -Name "Dashboard Power" -Value 2
    New-UDSelectOption -Name "Dashboard Configuration" -Value 3
    New-UDSelectOption -Name "Dashboard Viewer" -Value 4
    New-UDSelectOption -Name "SQL Configuration" -Value 5
    New-UDSelectOption -Name "Mutual Ties" -Value 6
}
$Cache:DataInvokeFunctionsResultSC = {
    if(    $EventData -eq 1){
        # SCRIPTBLOCK
        $ScriptBlockImportFormat = {

        }

        # INPUT DATA
        Show-UDModal -Content {

        } -Footer { New-UDButton -Text "Close" -OnClick {
            Sync-UDElement 'GenerateButtonsPscoIdDynamic'
            Hide-UDModal
        } -ClassName "interface-box-btn" } -Persistent
    }
    elseif($EventData -eq 2){
        # DASHBOARD POWER

        # SCRIPTBLOCK
        $ScriptBlockImportFormat = {
            New-UDButton -Text "Stop Dashobard" -OnClick {
                $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq 'importdashboardname'
                if($Dashboard.Status -eq 'Stopped'){
                    Show-UDToast -Message 'Dashboard is stopped, cannot be stopped'
                }
                elseif($Dashboard.Status -eq 'Started'){
                    $Dashboard | Stop-PSUDashBoard
                    Show-UDToast -Message 'Dashboard is stopped'
                }
                Hide-UDModal
            } -ClassName "interface-box-btn"
            New-UDButton -Text "Start Dashboard" -OnClick {
                $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq 'importdashboardname'
                if($Dashboard.Status -eq 'Stopped'){
                    $Dashboard | Start-PSUDashBoard
                    Show-UDToast -Message 'Dashboard is started'
                }
                elseif($Dashboard.Status -eq 'Started'){
                    Show-UDToast -Message 'Dashboard is started, cannot be started'
                }
                Hide-UDModal
            } -ClassName "interface-box-btn"
        }

        # INPUT DATA
        Show-UDModal -Header {
            New-UDTypography -Text 'Parameters' -Variant subtitle1
        } -Content {
            $Session:DashboardCreateNewNameCondition = $False
            New-UDDynamic -Id ("$SelectorIdString"+'-'+'DashboardPowerDynamicContentId') -Content {
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDTypography -Text 'Dashboard Condition' -ClassName 'interface-box-inner-title'
                            }
                        }
                        New-UDElement -Tag 'td' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDCheckBox -Id ("$SelectorIdString"+'-'+'DashboardCreateNewName') -Label 'New Dashboard Name' -LabelPlacement end -Checked $Session:DashboardCreateNewNameCondition -OnChange {
                                        if($Session:DashboardCreateNewNameCondition -eq $False){
                                            $Session:DashboardCreateNewNameCondition = $True
                                        }
                                        else{
                                            $Session:DashboardCreateNewNameCondition = $False
                                        }
                                        Sync-UDElement -Id ("$SelectorIdString"+'-'+'DashboardPowerDynamicContentConditionId')
                                    }
                                }
                            } -Style '
                            .MuiTypography-root {
                                font-size: 14px !important;
                                margin: 0px;
                                font-family: Roboto, Helvetica, Arial, sans-serif;
                                font-weight: 400;
                                font-size: 1rem;
                                line-height: 0.2;
                                letter-spacing: 0.00938em;
                            }
                            '
                        }
                    }
                    New-UDDynamic -Id ("$SelectorIdString"+'-'+'DashboardPowerDynamicContentConditionId') -Content {
                        $ConditionScriptblock = {

                            if($Session:DashboardCreateNewNameCondition -eq $False){
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Dashboard Name' -ClassName 'interface-box-inner-title'
                                        }
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDStyle -Content {
                                                New-UDSelect -Id ("$SelectorIdString"+'-'+'DashboardListIdSelectBox') -ClassName 'interface-box-dashboard-select' -Option {
                                                    New-UDSelectOption -Name 'None' -Value 'None'
                                                    foreach ($Item in $Cache:DashboardRepositoryList) {
                                                        $ItemName = $Item.Name
                                                        New-UDSelectOption -Name $ItemName -Value $ItemName
                                                    }
                                                } -OnChange {
                                                    $Session:DashboardListSelectBoxResult = $EventData
                                                }
                                            } -Style '
                                                label + .css-1ntzb12 {
                                                    margin-top: 0px;
                                                }
                                            '
                                        }
                                    }
                                }
                            }
                            elseif($Session:DashboardCreateNewNameCondition -eq $True){
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Dashboard Name' -ClassName 'interface-box-inner-title'
                                        }
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTextbox -Id ("$SelectorIdString"+'-'+'DashboardNameIdTextBox') -Type text -ClassName 'interface-box-text'
                                        }
                                    }
                                }
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Dashboard Title' -ClassName 'interface-box-inner-title'
                                        }
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTextbox -Id ("$SelectorIdString"+'-'+'DashboardTitleIdTextBox') -Type text -ClassName 'interface-box-text'
                                        }
                                    }
                                }
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Dashboard Root Type' -ClassName 'interface-box-inner-title'
                                        }
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTextbox -Id ("$SelectorIdString"+'-'+'DashboardRootTypeIdTextBox') -Type text -ClassName 'interface-box-text'
                                        }
                                    }
                                }
                            }
                        
                        }
                        $ConditionScriptblock|iex
                    }
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {

                            }
                        }
                    }
                }
                New-UDButton -Text "Save Function Parameters" -OnClick {
                    if($Session:DashboardCreateNewNameCondition -eq $False){
                        $GetDashboardName = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardListIdSelectBox')).Value
                        $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq $GetDashboardName
                        if($Dashboard){
                            $ScriptBlock = $ScriptBlockImportFormat
                            $ScriptBlock = $ScriptBlock -replace 'importdashboardname',"$GetDashboardName"
                            $ScriptBlockJson = $ScriptBlock | ConvertTo-Json
                            if($SelectorType -eq 'Terminal'){
                                $CreatePSCOString = '('+'$'+'Session:'+'TerminalHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                                $CreatePSCOString|iex
                                $GetSelectDefaultNumber  = (Get-UDElement -Id ('TerminalPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                                $SaveSelectDefaultNumber = ('$'+'Session:'+'TerminalDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                            }
                            elseif($SelectorType -eq 'Main'){
                                $CreatePSCOString = '('+'$'+'Session:'+'MainHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                                $CreatePSCOString|iex
                                $GetSelectDefaultNumber  = (Get-UDElement -Id ('MainPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                                $SaveSelectDefaultNumber = ('$'+'Session:'+'MainDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                            }
                            Show-UDToast -Message 'Dashboard function is saved'
                            Sync-UDElement 'GenerateButtonsPscoIdDynamic'
                            Hide-UDModal
                        }
                        else{
                            Show-UDToast -Message 'Dashboard is not exist'
                        }
                    }
                    elseif($Session:DashboardCreateNewNameCondition -eq $True){

                        $GetDashboardName  = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardNameIdTextBox')).Value
                        $GetDashboardTitle = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardTitleIdTextBox')).Value
                        $GetDashboardRoot  = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardRootTypeIdTextBox')).Value

                        # DASHBOARD NAME
                        if($null -eq $GetDashboardName){
                            Show-UDToast -Message 'Dashboard name must be filled'
                            $DashboardNameValidateCondition = $false
                        }
                        else{
                            if($GetDashboardName -match ' '){
                                Show-UDToast -Message 'Dashboard name contains illegal characters or spaces'
                                $DashboardNameValidateCondition = $false
                            }
                            else{
                                if(Test-Path ("$Cache:DashboardRepositoryPath"+"$GetDashboardName")){
                                    Show-UDToast -Message 'Dashboard name is exist'
                                    $DashboardNameValidateCondition = $false
                                }
                                else{
                                    if($GetDashboardName -match "[^a-z]"){
                                        Show-UDToast -Message 'Dashboard name contains illegal characters'
                                        $DashboardNameValidateCondition = $false
                                    }
                                    else{
                                        $DashboardNameValidateCondition = $true
                                    }
                                }
                            }
                        }

                        # DASHBOARD TITLE
                        if($null -eq $GetDashboardTitle){
                            Show-UDToast -Message 'Dashboard title must be filled'
                            $DashboardTitleValidateCondition = $false
                        }
                        else{
                            if($GetDashboardTitle -match "[^a-z]"){
                                Show-UDToast -Message 'Dashboard title contains illegal characters'
                                $DashboardTitleValidateCondition = $false
                            }
                            else{
                                $DashboardTitleValidateCondition = $true
                            }
                        }

                        # DASHBOARD ROOT
                        if($null -eq $GetDashboardRoot){
                            Show-UDToast -Message 'Dashboard root must be filled'
                            $DashboardRootValidateCondition = $false
                        }
                        else{
                            if($GetDashboardRoot -match ' '){
                                Show-UDToast -Message 'Dashboard root contains illegal characters or spaces'
                            }
                            else{
                                if($GetDashboardRoot -match "[^a-z]"){
                                    Show-UDToast -Message 'Dashboard root contains illegal characters'
                                    $DashboardRootValidateCondition = $false
                                }
                                else{
                                    if(Test-Path ("$Cache:DashboardRootControllerPath"+"$GetDashboardRoot")){
                                        Show-UDToast -Message 'Dashboard root controller is exist'
                                        $DashboardRootValidateCondition = $false
                                    }
                                    else{
                                        if(Test-Path ("$Cache:DashboardRootDatabasePath"+"$GetDashboardRoot")){
                                            Show-UDToast -Message 'Dashboard root database is exist'
                                            $DashboardRootValidateCondition = $false
                                        }
                                        else{
                                            $DashboardRootValidateCondition = $true
                                        }
                                    }
                                }
                            }
                        }
                        
                        if($DashboardNameValidateCondition -eq $true -and $DashboardTitleValidateCondition -eq $true -and $DashboardRootValidateCondition -eq $true){
                            $Session:NewItemDashboardRepositoryPath     = ("$Cache:DashboardRepositoryPath"+"$GetDashboardName")
                            $Session:NewItemDashboardRootControllerPath = ("$Cache:DashboardRootControllerPath"+"$GetDashboardRoot")
                            $Session:NewItemDashboardRootDatabasePath   = ("$Cache:DashboardRootDatabasePath"+"$GetDashboardRoot")
                            $Session:NewItemDashboardName               = $GetDashboardName
                            $Session:NewItemDashboardTitle              = $GetDashboardTitle
                            $Session:NewItemDashboardRootName           = $GetDashboardRoot
                            $Session:DashboardCreatorSC = {
                                New-Item -ItemType Directory $Session:NewItemDashboardRepositoryPath
                                [string]$NewDashboardRunnerStringSC = {
New-UDDashboard -Title 'importdashboardtitlename' -Content {
    
}
                                } -replace 'importdashboardtitlename',"$Session:NewItemDashboardTitle"
                                New-Item -ItemType File ("$Session:NewItemDashboardRepositoryPath"+'\'+"$Session:NewItemDashboardName"+'.ps1') -Value $NewDashboardRunnerStringSC

                                New-Item -ItemType Directory $Session:NewItemDashboardRootControllerPath
                                New-Item -ItemType Directory $Session:NewItemDashboardRootDatabasePath
                                New-Item -ItemType Directory ("$Session:NewItemDashboardRootDatabasePath"+'\'+'addons')
                                New-Item -ItemType Directory ("$Session:NewItemDashboardRootDatabasePath"+'\'+'modules')
                                
                                [string]$NewDashboardRunnerStringSC = {
New-PSUDashboard -Name "importdashboardname" -FilePath ("dashboards\importdashboardname\importdashboardname.ps1") -BaseUrl "/app/importdashboardrootname" -Framework "UniversalDashboard:Latest" -SessionTimeout 0 -AutoDeploy -Description "importdashboardname" -Credential "Default"
                                } -replace 'importdashboardrootname',"$Session:NewItemDashboardRootName" -replace 'importdashboardname',"$Session:NewItemDashboardName"

                                Add-Content $Cache:DashboardRepositoryUniversalDashboardPath -Value $NewDashboardRunnerStringSC

                                $ScriptBlock = $ScriptBlockImportFormat
                                $ScriptBlock = $ScriptBlock -replace 'importdashboardname',"$Session:NewItemDashboardName"
                                $ScriptBlockJson = $ScriptBlock | ConvertTo-Json
                                if($SelectorType -eq 'Terminal'){
                                    $CreatePSCOString = '('+'$'+'Session:'+'TerminalHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                                    $CreatePSCOString|iex
                                    $GetSelectDefaultNumber  = (Get-UDElement -Id ('TerminalPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                                    $SaveSelectDefaultNumber = ('$'+'Session:'+'TerminalDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                                }
                                elseif($SelectorType -eq 'Main'){
                                    $CreatePSCOString = '('+'$'+'Session:'+'MainHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                                    $CreatePSCOString|iex
                                    $GetSelectDefaultNumber  = (Get-UDElement -Id ('MainPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                                    $SaveSelectDefaultNumber = ('$'+'Session:'+'MainDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                                }
                                Show-UDToast -Message 'Dashboard function is saved'
                                Sync-UDElement 'GenerateButtonsPscoIdDynamic'
                                Hide-UDModal
                            }
                        }
                        else{
                            Show-UDToast -Message 'Dashboard data is not valid'
                        }
                    }
                    
                } -ClassName "interface-box-btn" 
            }
        } -Footer { New-UDButton -Text "Close" -OnClick {
            Sync-UDElement 'GenerateButtonsPscoIdDynamic'
            Hide-UDModal
        } -ClassName "interface-box-btn" } -Persistent
    }
    elseif($EventData -eq 3){
        # DASHBOARD CONFIGURATION

        # AFTER DATA
        $ScriptBlockImportFormat = {
            if($Session:ButtonDataSetCondition -eq 'null' -or $Session:ButtonDataSetCondition -eq "null" -or $Session:ButtonDataSetCondition -eq $null){
                $PSCOJson = '['+'importpscoimport'+']'
            }
            else{
                $PSCOJson = $Session:ButtonDataSet
            }
            $Session:PSCOFromJson    = $PSCOJson | ConvertFrom-Json -Depth 100
            $Session:PSCOMemberTypes = ($Session:PSCOFromJson | gm | ? {$_.MemberType -eq 'NoteProperty'})
            New-UDElement -Tag 'table' -Content {
                if($null -ne $Session:PSCOMemberTypes){
                    foreach ($Item in $Session:PSCOMemberTypes) {
                        $MemberName          = $Item.Name
                        $InvokeItemCondition = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                        $InvokeItemTitle     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                        $InvokeItemValue     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'value'|iex)
                        if($InvokeItemCondition -eq $true){
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text $InvokeItemTitle -ClassName 'interface-box-inner-title'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        if($MemberName -eq 'DashboardAuthentication' -or $MemberName -eq 'DashboardAutoDeploy' -or $MemberName -eq 'DashboardAutoStart'){
                                            if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 0
                                            }
                                            else{
                                                New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 1
                                            }
                                        }
                                        else{
                                            New-UDTextbox -Id (($Item.Name)+'IdTextBox') -Value $InvokeItemValue -Type text -ClassName 'interface-box-text'
                                        }
                                    }
                                }
                            }
                        }
                        elseif($InvokeItemCondition -eq $false){

                        }
                    }
                }
            }
            New-UDButton -Text "Save Parameters" -OnClick {
                foreach ($Item in $Session:PSCOMemberTypes) {
                    $MemberName           = $Item.Name
                    $InvokeItemCondition  = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                    $InvokeItemTitle      = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                    if($MemberName -eq 'DashboardAutoDeploy' -or $MemberName -eq 'DashboardAutoStart'){
                        $GetVariableItemValue = (Get-UDElement -Id (($Item.Name)+'IdSwitchBox')).Checked
                    }
                    else{
                        $GetVariableItemValue = (Get-UDElement -Id (($Item.Name)+'IdTextBox')).Value
                    }
                    '$'+"$MemberName"+'='+'@'+'{'+'condition'+'='+'$'+'InvokeItemCondition'+';'+'title'+'='+"'"+"$InvokeItemTitle"+"'"+';'+'value'+'='+"'"+"$GetVariableItemValue"+"'"+'}'|iex
                }
                $PSCOTable = [PSCustomObject]@{
                    DashboardAuthentication       = $DashboardAuthentication
                    DashboardAutoDeploy           = $DashboardAutoDeploy
                    DashboardAutoStart            = $DashboardAutoStart
                    DashboardRootControllerChange = $DashboardRootControllerChange
                    DashboardTitleChange          = $DashboardTitleChange
                    DashboardUrlChange            = $DashboardUrlChange
                    DashboardVariableNameChange   = $DashboardVariableNameChange
                }
                $Session:PSCOJson = $PSCOTable
                
                $BlockIdJson         = $Session:BlockId
                $BlockIdJsonId       = $BlockIdJson.Id
                $BlockIdJsonBlock    = $BlockIdJson.Path
                $BlockIdJsonProvider = $BlockIdJson.Provider
                if($BlockIdJsonBlock -eq 'ServerBlock'){
                    $CreateFilePath  = "$Cache:InterfaceServerBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                }
                elseif($BlockIdJsonBlock -eq 'ComponentsBlock'){
                    $CreateFilePath  = "$Cache:InterfaceComponentsBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                }
                elseif($BlockIdJsonBlock -eq 'PsucaControllerBlock'){
                    $CreateFilePath  = "$Cache:InterfacePsucaControllerBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                }
                elseif($BlockIdJsonBlock -eq 'PsucaDashboardBlock'){
                    $CreateFilePath  = "$Cache:InterfacePsucaDashboardBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                }
                
                
                

                if(Test-Path $CreateFilePath){
                    $FilePathGc         = gc $CreateFilePath
                    $FilePathJson       = $FilePathGc | ConvertFrom-Json
                    
                    ((((($FilePathJson.Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                    $FilePathToJson     = $FilePathJson | ConvertTo-Json -Depth 100
                    Set-Content $CreateFilePath -Value $FilePathToJson
                    Show-UDToast -Message $CreateFilePath -Duration 50000

                    if($BlockIdJsonBlock -eq 'ServerBlock'){
                        (((((($Cache:ServerBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                    }
                    elseif($BlockIdJsonBlock -eq 'ComponentsBlock'){
                        (((((($Cache:ComponentsBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                    }
                    elseif($BlockIdJsonBlock -eq 'PsucaControllerBlock'){
                        (((((($Cache:PsucaControllerBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                    }
                    elseif($BlockIdJsonBlock -eq 'PsucaDashboardBlock'){
                        (((((($Cache:PsucaDashboardBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                    }
                    
                    Show-UDToast -Message 'Parameters is saved' -Duration 50000
                }

                #$Cache:InterfaceBlockDatabaseSC|iex
                Sync-UDElement -Id 'InterfaceServersBlockInvokeContentDynamicId'
                Hide-UDModal
            } -ClassName "interface-box-btn"

        }

        # BEFORE DATA
        Show-UDModal -Header {
            New-UDTypography -Text 'Parameters' -Variant subtitle1
        } -Content {
            New-UDDynamic -Content {
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDDynamic -Id ("$SelectorIdString"+'-'+'DashboardConfigurationDynamicId') -Content {
                                New-UDStyle -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'DashboardAuthentication') -Label 'Authentication' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'DashboardAutoDeploy') -Label 'Auto deploy' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'DashboardAutoStart') -Label 'Auto start' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'DashboardRootControllerChange') -Label 'Root Controller change' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'DashboardTitleChange') -Label 'Title change' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'DashboardUrlChange') -Label 'Url change' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'DashboardVariableNameChange') -Label 'Variable name change' -LabelPlacement end -Checked $False
                                    }
                                } -Style '
                                .MuiTypography-root {
                                    font-size: 14px !important;
                                    margin: 0px;
                                    font-family: Roboto, Helvetica, Arial, sans-serif;
                                    font-weight: 400;
                                    font-size: 1rem;
                                    line-height: 0.2;
                                    letter-spacing: 0.00938em;
                                }
                                '
                            }                            
                        }
                    }
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {

                            }
                        }
                    }
                }
                New-UDButton -Text "Save Function Parameters" -OnClick {
                    $DashboardAuthenticationId       = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardAuthentication')).Checked
                    $DashboardAutoDeployId           = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardAutoDeploy')).Checked
                    $DashboardAutoStartId            = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardAutoStart')).Checked
                    $DashboardRootControllerChangeId = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardRootControllerChange')).Checked
                    $DashboardTitleChangeId          = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardTitleChange')).Checked
                    $DashboardUrlChangeId            = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardUrlChange')).Checked
                    $DashboardVariableNameChangeId   = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardVariableNameChange')).Checked

                    if(($DashboardAuthenticationId -eq $true -or $DashboardAuthenticationId -eq $false) -and ($DashboardAutoDeployId -eq $true -or $DashboardAutoDeployId -eq $false) -and ($DashboardAutoStartId -eq $true -or $DashboardAutoStartId -eq $false) -and ($DashboardRootControllerChangeId -eq $true -or $DashboardRootControllerChangeId -eq $false) -and ($DashboardTitleChangeId -eq $true -or $DashboardTitleChangeId -eq $false) -and ($DashboardUrlChangeId -eq $true -or $DashboardUrlChangeId -eq $false) -and ($DashboardVariableNameChangeId -eq $true -or $DashboardVariableNameChangeId -eq $false)){
                        $PSCOTable = [PSCustomObject]@{
                            DashboardAuthentication       = @{condition=$DashboardAuthenticationId;title='Authentication';value=$null}
                            DashboardAutoDeploy           = @{condition=$DashboardAutoDeployId;title='Auto deploy';value=$null}
                            DashboardAutoStart            = @{condition=$DashboardAutoStartId;title='Auto start';value=$null}
                            DashboardRootControllerChange = @{condition=$DashboardRootControllerChangeId;title='Root Controller';value=$null}
                            DashboardTitleChange          = @{condition=$DashboardTitleChangeId;title='Title';value=$null}
                            DashboardUrlChange            = @{condition=$DashboardUrlChangeId;title='Url';value=$null}
                            DashboardVariableNameChange   = @{condition=$DashboardVariableNameChangeId;title='Variable name';value=$null}
                        }
                        $PSCOJson        = $PSCOTable | ConvertTo-Json
                        $ScriptBlock     = $ScriptBlockImportFormat
                        $ScriptBlock     = $ScriptBlock -replace 'importpscoimport',"$PSCOJson"
                        $ScriptBlockJson = $ScriptBlock | ConvertTo-Json
                        if($SelectorType -eq 'Terminal'){
                            $CreatePSCOString = '('+'$'+'Session:'+'TerminalHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                            $CreatePSCOString|iex
                            $GetSelectDefaultNumber  = (Get-UDElement -Id ('TerminalPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                            $SaveSelectDefaultNumber = ('$'+'Session:'+'TerminalDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                        }
                        elseif($SelectorType -eq 'Main'){
                            $CreatePSCOString = '('+'$'+'Session:'+'MainHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                            $CreatePSCOString|iex
                            $GetSelectDefaultNumber  = (Get-UDElement -Id ('MainPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                            $SaveSelectDefaultNumber = ('$'+'Session:'+'MainDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                        }
                        Show-UDToast -Message 'Function parameters is saved'
                        Sync-UDElement 'GenerateButtonsPscoIdDynamic'
                        Hide-UDModal
                    }
                    else{
                        Show-UDToast -Message 'Function data is not valid'
                    }
                } -ClassName "interface-box-btn" 
            }
        } -Footer { New-UDButton -Text "Close" -OnClick {
            Sync-UDElement 'GenerateButtonsPscoIdDynamic'
            Hide-UDModal
        } -ClassName "interface-box-btn" } -Persistent
    }
    elseif($EventData -eq 4){
        # DASHBOARD PAGE VIEWER

        # AFTER DATA
        $ScriptBlockImportFormat = {
            $Session:DashboardEditUrlDynamicScriptblock = $False

            if($Session:ButtonDataSetCondition -eq 'null' -or $Session:ButtonDataSetCondition -eq "null" -or $Session:ButtonDataSetCondition -eq $null){
                $PSCOJson = '['+'importpscoimport'+']'
            }
            else{
                $PSCOJson = $Session:ButtonDataSet
            }
            $Session:PSCOFromJson    = $PSCOJson | ConvertFrom-Json -Depth 100
            $Session:PSCOMemberTypes = ($Session:PSCOFromJson | gm | ? {$_.MemberType -eq 'NoteProperty'})
            if($null -ne $Session:PSCOMemberTypes){
                foreach ($Item in $Session:PSCOMemberTypes) {
                    $MemberName          = $Item.Name
                    $InvokeItemCondition = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                    $InvokeItemTitle     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                    $InvokeItemValue     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'value'|iex)
                    if($InvokeItemCondition -eq $true){
                        if($MemberName -eq 'DashboardUrlAddress'){
                            $Session:DashboardUrlAddressCreator = $InvokeItemValue
                        }
                        elseif($MemberName -eq 'DashboardUrl'){
                            $Session:DashboardUrlCreator = $InvokeItemValue
                        }
                    }
                    if($InvokeItemCondition -eq $false){

                    }
                }
            }
            $Session:CompositeDashboardUrl = "$Session:DashboardUrlAddressCreator"+"$Session:DashboardUrlCreator"
            New-UDDynamic -Id 'DashboardEditUrlDynamicId' -Content {
                if($Session:DashboardEditUrlDynamicScriptblock -eq $True){
                    if($Session:ButtonDataSetCondition -eq 'null' -or $Session:ButtonDataSetCondition -eq "null" -or $Session:ButtonDataSetCondition -eq $null){
                        $PSCOJson = '['+'importpscoimport'+']'
                    }
                    else{
                        $PSCOJson = $Session:ButtonDataSet
                    }
                    $Session:PSCOFromJson    = $PSCOJson | ConvertFrom-Json -Depth 100
                    $Session:PSCOMemberTypes = ($Session:PSCOFromJson | gm | ? {$_.MemberType -eq 'NoteProperty'})
                    New-UDElement -Tag 'table' -Content {
                        if($null -ne $Session:PSCOMemberTypes){
                            foreach ($Item in $Session:PSCOMemberTypes) {
                                $MemberName          = $Item.Name
                                $InvokeItemCondition = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                                $InvokeItemTitle     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                                $InvokeItemValue     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'value'|iex)
                                if($InvokeItemCondition -eq $true){
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text $InvokeItemTitle -ClassName 'interface-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTextbox -Id (($Item.Name)+'IdTextBox') -Value $InvokeItemValue -Type text -ClassName 'interface-box-text'
                                            }
                                        }
                                    }
                                    if($MemberName -eq 'DashboardUrlAddress'){
                                        $Session:DashboardUrlAddressCreator = $InvokeItemValue
                                    }
                                    elseif($MemberName -eq 'DashboardUrl'){
                                        $Session:DashboardUrlCreator = $InvokeItemValue
                                    }
                                }
                                elseif($InvokeItemCondition -eq $false){
        
                                }
                            }
                        }
                    }
                    New-UDButton -Text "Save Parameters" -OnClick {
                        $Session:CompositeDashboardUrl = "$Session:DashboardUrlAddressCreator"+"$Session:DashboardUrlCreator"
                        foreach ($Item in $Session:PSCOMemberTypes) {
                            $MemberName           = $Item.Name
                            $InvokeItemCondition  = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                            $InvokeItemTitle      = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                            $GetVariableItemValue = (Get-UDElement -Id (($Item.Name)+'IdTextBox')).Value
                            '$'+"$MemberName"+'='+'@'+'{'+'condition'+'='+'$'+'InvokeItemCondition'+';'+'title'+'='+"'"+"$InvokeItemTitle"+"'"+';'+'value'+'='+"'"+"$GetVariableItemValue"+"'"+'}'|iex
                        }
                        $PSCOTable = [PSCustomObject]@{
                            DashboardUrlAddress = $DashboardUrlAddress
                            DashboardUrl        = $DashboardUrl
                        }
                        $Session:PSCOJson = $PSCOTable
                        
                        $BlockIdJson         = $Session:BlockId
                        $BlockIdJsonId       = $BlockIdJson.Id
                        $BlockIdJsonBlock    = $BlockIdJson.Path
                        $BlockIdJsonProvider = $BlockIdJson.Provider
                        if($BlockIdJsonBlock -eq 'ServerBlock'){
                            $CreateFilePath  = "$Cache:InterfaceServerBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                        }
                        elseif($BlockIdJsonBlock -eq 'ComponentsBlock'){
                            $CreateFilePath  = "$Cache:InterfaceComponentsBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                        }
                        elseif($BlockIdJsonBlock -eq 'PsucaControllerBlock'){
                            $CreateFilePath  = "$Cache:InterfacePsucaControllerBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                        }
                        elseif($BlockIdJsonBlock -eq 'PsucaDashboardBlock'){
                            $CreateFilePath  = "$Cache:InterfacePsucaDashboardBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                        }
                        
                        
                        
        
                        if(Test-Path $CreateFilePath){
                            $FilePathGc         = gc $CreateFilePath
                            $FilePathJson       = $FilePathGc | ConvertFrom-Json
                            
                            ((((($FilePathJson.Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                            $FilePathToJson     = $FilePathJson | ConvertTo-Json -Depth 100
                            Set-Content $CreateFilePath -Value $FilePathToJson
                            Show-UDToast -Message $CreateFilePath -Duration 50000
        
                            if($BlockIdJsonBlock -eq 'ServerBlock'){
                                (((((($Cache:ServerBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                            }
                            elseif($BlockIdJsonBlock -eq 'ComponentsBlock'){
                                (((((($Cache:ComponentsBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                            }
                            elseif($BlockIdJsonBlock -eq 'PsucaControllerBlock'){
                                (((((($Cache:PsucaControllerBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                            }
                            elseif($BlockIdJsonBlock -eq 'PsucaDashboardBlock'){
                                (((((($Cache:PsucaDashboardBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                            }
                            
                            Show-UDToast -Message 'Parameters is saved' -Duration 50000
                        }
                        $Session:DashboardEditUrlDynamicScriptblock = $False
                        Sync-UDElement -Id 'DashboardEditUrlDynamicId'
                        Sync-UDElement -Id 'InterfaceServersBlockInvokeContentDynamicId'
                        Hide-UDModal
                    } -ClassName "interface-box-btn"
                }
                elseif($Session:DashboardEditUrlDynamicScriptblock -eq $False){
                    New-UDButton -Text "New Tab" -OnClick {
                        Invoke-UDRedirect -Url ("$Session:CompositeDashboardUrl") -OpenInNewWindow
                        Hide-UDModal
                    } -ClassName "interface-box-btn"
                    New-UDButton -Text "Open here" -OnClick {
                        Invoke-UDRedirect -Url ("$Session:CompositeDashboardUrl")
                    } -ClassName "interface-box-btn"
                    New-UDButton -Text "Edit url" -OnClick {
                        $Session:DashboardEditUrlDynamicScriptblock = $True
                        Sync-UDElement -Id 'DashboardEditUrlDynamicId'
                    } -ClassName "interface-box-btn"
                }
            }






        }

        # BEFORE DATA
        Show-UDModal -Header {
            New-UDTypography -Text 'Parameters' -Variant subtitle1
        } -Content {
            New-UDDynamic -Content {
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDTypography -Text 'Dashboard Url Title' -ClassName 'interface-box-inner-title'
                            }
                        }
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDTextbox -Id ("$SelectorIdString"+'-'+'DashboardUrlAddressIdTextBox') -Type text -ClassName 'interface-box-text' -Value "$Cache:ServerUrlAdress"
                            }
                        }
                    }
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDTypography -Text 'Dashboard Url' -ClassName 'interface-box-inner-title'
                            }
                        }
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDTextbox -Id ("$SelectorIdString"+'-'+'DashboardUrlIdTextBox') -Type text -ClassName 'interface-box-text'
                            }
                        }
                    }
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {

                            }
                        }
                    }
                }
                New-UDButton -Text "Save Function Parameters" -OnClick {
                    $GetDashboardUrlAddress = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardUrlAddressIdTextBox')).Value
                    $GetDashboardUrl     = (Get-UDElement -Id ("$SelectorIdString"+'-'+'DashboardUrlIdTextBox')).Value
                    if($GetDashboardUrl -and $GetDashboardUrlAddress){
                        $PSCOTable = [PSCustomObject]@{
                            DashboardUrlAddress = @{condition=$True;title='Url Address';value=$GetDashboardUrlAddress}
                            DashboardUrl        = @{condition=$True;title='Url';value=$GetDashboardUrl}
                        }
                        $PSCOJson        = $PSCOTable | ConvertTo-Json
                        $ScriptBlock     = $ScriptBlockImportFormat
                        $ScriptBlock     = $ScriptBlock -replace 'importpscoimport',"$PSCOJson"
                        $ScriptBlockJson = $ScriptBlock | ConvertTo-Json
                        if($SelectorType -eq 'Terminal'){
                            $CreatePSCOString = '('+'$'+'Session:'+'TerminalHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                            $CreatePSCOString|iex
                            $GetSelectDefaultNumber  = (Get-UDElement -Id ('TerminalPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                            $SaveSelectDefaultNumber = ('$'+'Session:'+'TerminalDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                        }
                        elseif($SelectorType -eq 'Main'){
                            $CreatePSCOString = '('+'$'+'Session:'+'MainHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                            $CreatePSCOString|iex
                            $GetSelectDefaultNumber  = (Get-UDElement -Id ('MainPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                            $SaveSelectDefaultNumber = ('$'+'Session:'+'MainDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                        }
                        Show-UDToast -Message 'Function parameters is saved'
                        Sync-UDElement 'GenerateButtonsPscoIdDynamic'
                        Hide-UDModal
                    }
                    else{
                        Show-UDToast -Message 'Function data is not valid'
                    }
                } -ClassName "interface-box-btn" 
            }
        } -Footer { New-UDButton -Text "Close" -OnClick {
            $Session:EditUrlDynamicScriptblock = $False
            Sync-UDElement -Id 'DashboardEditUrlDynamicId'
            Sync-UDElement 'GenerateButtonsPscoIdDynamic'
            Hide-UDModal
        } -ClassName "interface-box-btn" } -Persistent
    }
    elseif($EventData -eq 5){
        # SQL CONFIGURATION

        # AFTER DATA
        $ScriptBlockImportFormat = {
            if($Session:ButtonDataSetCondition -eq 'null' -or $Session:ButtonDataSetCondition -eq "null" -or $Session:ButtonDataSetCondition -eq $null){
                $PSCOJson = '['+'importpscoimport'+']'
            }
            else{
                $PSCOJson = $Session:ButtonDataSet
            }
            $Session:PSCOFromJson    = $PSCOJson | ConvertFrom-Json -Depth 100
            $Session:PSCOMemberTypes = ($Session:PSCOFromJson | gm | ? {$_.MemberType -eq 'NoteProperty'})
            New-UDElement -Tag 'table' -Content {
                if($null -ne $Session:PSCOMemberTypes){
                    foreach ($Item in $Session:PSCOMemberTypes) {
                        $MemberName          = $Item.Name
                        $InvokeItemCondition = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                        $InvokeItemTitle     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                        $InvokeItemValue     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'value'|iex)
                        if($InvokeItemCondition -eq $true){
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text $InvokeItemTitle -ClassName 'interface-box-inner-title'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTextbox -Id (($Item.Name)+'IdTextBox') -Value $InvokeItemValue -Type text -ClassName 'interface-box-text'
                                    }
                                }
                            }
                        }
                        elseif($InvokeItemCondition -eq $false){

                        }
                    }
                }
            }
            New-UDButton -Text "Save Parameters" -OnClick {
                foreach ($Item in $Session:PSCOMemberTypes) {
                    $MemberName           = $Item.Name
                    $InvokeItemCondition  = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                    $InvokeItemTitle      = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                    $GetVariableItemValue = (Get-UDElement -Id (($Item.Name)+'IdTextBox')).Value
                    '$'+"$MemberName"+'='+'@'+'{'+'condition'+'='+'$'+'InvokeItemCondition'+';'+'title'+'='+"'"+"$InvokeItemTitle"+"'"+';'+'value'+'='+"'"+"$GetVariableItemValue"+"'"+'}'|iex
                }
                $PSCOTable = [PSCustomObject]@{
                    ConnectionString           = $ConnectionString
                    EnableCustomDatabaseModel  = $EnableCustomDatabaseModel
                    UrlAddress                 = $UrlAddress
                    UseLocalServer             = $UseLocalServer
                    UseCloudServer             = $UseCloudServer
                }
                $Session:PSCOJson = $PSCOTable
                
                $BlockIdJson         = $Session:BlockId
                $BlockIdJsonId       = $BlockIdJson.Id
                $BlockIdJsonBlock    = $BlockIdJson.Path
                $BlockIdJsonProvider = $BlockIdJson.Provider
                if($BlockIdJsonBlock -eq 'ServerBlock'){
                    $CreateFilePath  = "$Cache:InterfaceServerBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                }
                elseif($BlockIdJsonBlock -eq 'ComponentsBlock'){
                    $CreateFilePath  = "$Cache:InterfaceComponentsBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                }
                elseif($BlockIdJsonBlock -eq 'PsucaControllerBlock'){
                    $CreateFilePath  = "$Cache:InterfacePsucaControllerBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                }
                elseif($BlockIdJsonBlock -eq 'PsucaDashboardBlock'){
                    $CreateFilePath  = "$Cache:InterfacePsucaDashboardBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                }
                
                
                

                if(Test-Path $CreateFilePath){
                    $FilePathGc         = gc $CreateFilePath
                    $FilePathJson       = $FilePathGc | ConvertFrom-Json
                    
                    ((((($FilePathJson.Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                    $FilePathToJson     = $FilePathJson | ConvertTo-Json -Depth 100
                    Set-Content $CreateFilePath -Value $FilePathToJson
                    Show-UDToast -Message $CreateFilePath -Duration 50000

                    if($BlockIdJsonBlock -eq 'ServerBlock'){
                        (((((($Cache:ServerBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                    }
                    elseif($BlockIdJsonBlock -eq 'ComponentsBlock'){
                        (((((($Cache:ComponentsBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                    }
                    elseif($BlockIdJsonBlock -eq 'PsucaControllerBlock'){
                        (((((($Cache:PsucaControllerBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                    }
                    elseif($BlockIdJsonBlock -eq 'PsucaDashboardBlock'){
                        (((((($Cache:PsucaDashboardBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                    }
                    
                    Show-UDToast -Message 'Parameters is saved' -Duration 50000
                }

                #$Cache:InterfaceBlockDatabaseSC|iex
                Sync-UDElement -Id 'InterfaceServersBlockInvokeContentDynamicId'
                Hide-UDModal
            } -ClassName "interface-box-btn"

        }

        # BEFORE DATA
        Show-UDModal -Header {
            New-UDTypography -Text 'Parameters' -Variant subtitle1
        } -Content {
            New-UDDynamic -Content {
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            '$'+'Session:'+"$SelectorIdString"+'SQLUseCloudServerId'+'='+'$'+'False'|iex
                            '$'+'Session:'+"$SelectorIdString"+'SQLUseLocalServerId'+'='+'$'+'False'|iex
                            New-UDDynamic -Id ("$SelectorIdString"+'-'+'SQLConfigurationDynamicId') -Content {
                                New-UDStyle -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'SQLConnectionStringId') -Label 'Connection string' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'SQLEnableCustomDatabaseModel') -Label 'Enable custom database model' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'SQLUrlAddressId') -Label 'Url address' -LabelPlacement end -Checked $False
                                    }
                                    New-UDDynamic -Id ("$SelectorIdString"+'-'+'SQLConfigurationCloudLocalDynamicId') -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDCheckBox -Id ("$SelectorIdString"+'-'+'SQLUseLocalServerId') -Label 'Use local server' -LabelPlacement end -Checked (('$'+'Session:'+"$SelectorIdString"+'SQLUseLocalServerId')|iex) -OnChange {
                                                '$'+'Session:'+"$SelectorIdString"+'SQLUseCloudServerId'+'='+'$'+'False'|iex
                                                '$'+'Session:'+"$SelectorIdString"+'SQLUseLocalServerId'+'='+'$'+'true'|iex
                                                Sync-UDElement -Id ("$SelectorIdString"+'-'+'SQLConfigurationCloudLocalDynamicId')
                                            }
                                        }
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDCheckBox -Id ("$SelectorIdString"+'-'+'SQLUseCloudServerId') -Label 'Use cloud server' -LabelPlacement end -Checked (('$'+'Session:'+"$SelectorIdString"+'SQLUseCloudServerId')|iex) -OnChange {
                                                '$'+'Session:'+"$SelectorIdString"+'SQLUseLocalServerId'+'='+'$'+'False'|iex
                                                '$'+'Session:'+"$SelectorIdString"+'SQLUseCloudServerId'+'='+'$'+'true'|iex
                                                Sync-UDElement -Id ("$SelectorIdString"+'-'+'SQLConfigurationCloudLocalDynamicId')
                                            }
                                        }
                                    }
                                } -Style '
                                .MuiTypography-root {
                                    font-size: 14px !important;
                                    margin: 0px;
                                    font-family: Roboto, Helvetica, Arial, sans-serif;
                                    font-weight: 400;
                                    font-size: 1rem;
                                    line-height: 0.2;
                                    letter-spacing: 0.00938em;
                                }
                                '
                            }                            
                        }
                    }
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {

                            }
                        }
                    }
                }
                New-UDButton -Text "Save Function Parameters" -OnClick {
                    $ConnectionStringId           = (Get-UDElement -Id ("$SelectorIdString"+'-'+'SQLConnectionStringId')).Checked
                    $EnableCustomDatabaseModelId  = (Get-UDElement -Id ("$SelectorIdString"+'-'+'SQLEnableCustomDatabaseModel')).Checked
                    $UrlAddressId                 = (Get-UDElement -Id ("$SelectorIdString"+'-'+'SQLUrlAddressId')).Checked
                    $UseLocalServerId             = (Get-UDElement -Id ("$SelectorIdString"+'-'+'SQLUseLocalServerId')).Checked
                    $UseCloudServerId             = (Get-UDElement -Id ("$SelectorIdString"+'-'+'SQLUseCloudServerId')).Checked

                    if(($ConnectionStringId -eq $true -or $ConnectionStringId -eq $false) -and ($EnableCustomDatabaseModelId -eq $true -or $EnableCustomDatabaseModelId -eq $false) -and ($UrlAddressId -eq $true -or $UrlAddressId -eq $false) -and ($UseLocalServerId -eq $true -or $UseLocalServerId -eq $false) -and ($UseCloudServerId -eq $true -or $UseCloudServerId -eq $false)){
                        $PSCOTable = [PSCustomObject]@{
                            ConnectionString           = @{condition=$ConnectionStringId;title='Connection String';value=$null}
                            EnableCustomDatabaseModel  = @{condition=$EnableCustomDatabaseModelId;title='Enable Custom Database Model';value=$null}
                            UrlAddress                 = @{condition=$UrlAddressId;title='Url Address';value=$null}
                            UseLocalServer             = @{condition=$UseLocalServerId;title='Use Local Server';value=$null}
                            UseCloudServer             = @{condition=$UseCloudServerId;title='Use Cloud Server';value=$null}
                        }
                        $PSCOJson        = $PSCOTable | ConvertTo-Json
                        $ScriptBlock     = $ScriptBlockImportFormat
                        $ScriptBlock     = $ScriptBlock -replace 'importpscoimport',"$PSCOJson"
                        $ScriptBlockJson = $ScriptBlock | ConvertTo-Json
                        if($SelectorType -eq 'Terminal'){
                            $CreatePSCOString = '('+'$'+'Session:'+'TerminalHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                            $CreatePSCOString|iex
                            $GetSelectDefaultNumber  = (Get-UDElement -Id ('TerminalPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                            $SaveSelectDefaultNumber = ('$'+'Session:'+'TerminalDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                        }
                        elseif($SelectorType -eq 'Main'){
                            $CreatePSCOString = '('+'$'+'Session:'+'MainHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                            $CreatePSCOString|iex
                            $GetSelectDefaultNumber  = (Get-UDElement -Id ('MainPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                            $SaveSelectDefaultNumber = ('$'+'Session:'+'MainDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                        }
                        Show-UDToast -Message 'Function parameters is saved'
                        Sync-UDElement 'GenerateButtonsPscoIdDynamic'
                        Hide-UDModal
                    }
                    else{
                        Show-UDToast -Message 'Function data is not valid'
                    }
                } -ClassName "interface-box-btn" 
            }
        } -Footer { New-UDButton -Text "Close" -OnClick {
            Sync-UDElement 'GenerateButtonsPscoIdDynamic'
            Hide-UDModal
        } -ClassName "interface-box-btn" } -Persistent
    }
    elseif($EventData -eq 6){
        # MUTUAL TIES

        # AFTER DATA
        $ScriptBlockImportFormat = {
            $Session:MutualTiesParametersCondition = $false
            $Session:MutualTiesParametersContentCondition = $false
            New-UDDynamic -Id 'MutualTiesContentDynamicId' -Content {
                if($Session:ButtonDataSetCondition -eq 'null' -or $Session:ButtonDataSetCondition -eq "null" -or $Session:ButtonDataSetCondition -eq $null){
                    $PSCOJson = '['+'importpscoimport'+']'
                }
                else{
                    $PSCOJson = $Session:ButtonDataSet
                }
                $BlockIdJson         = $Session:BlockId
                $BlockIdJsonId       = $BlockIdJson.Id
                $BlockIdJsonBlock    = $BlockIdJson.Path
                $BlockIdJsonProvider = $BlockIdJson.Provider
                $Session:MutualTiesBlockId       = $BlockIdJsonId
                $Session:MutualTiesBlockPath     = $BlockIdJsonBlock
                $Session:MutualTiesBlockProvider = $BlockIdJsonProvider
                $Session:ExistMutualTiesFilePath = "$Cache:MutualTieskDatabaseDatasetPath"+"$BlockIdJsonId"+'\'+"$BlockIdJsonProvider"+'.json'
                if(Test-Path $Session:ExistMutualTiesFilePath){
                    # CREATE NEW MUTUAL TIES LIST
                    if($Session:MutualTiesParametersCondition -eq $true){}
                    else{
                        New-UDButton -Text "Parameters" -OnClick {
                            $Session:MutualTiesParametersCondition = $true
                            $Session:MutualTiesParametersContentCondition = $true
                            Sync-UDElement -Id 'MutualTiesContentDynamicId'
                        } -ClassName "interface-box-btn"
                    }

                    if($Session:MutualTiesParametersContentCondition -eq $true){
                        $Session:PSCOFromJson    = $PSCOJson | ConvertFrom-Json -Depth 100
                        $Session:PSCOMemberTypes = ($Session:PSCOFromJson | gm | ? {$_.MemberType -eq 'NoteProperty'})
                        New-UDElement -Tag 'table' -Content {
                            if($null -ne $Session:PSCOMemberTypes){
                                foreach ($Item in $Session:PSCOMemberTypes) {
                                    $MemberName          = $Item.Name
                                    $InvokeItemCondition = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                                    $InvokeItemTitle     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                                    $InvokeItemValue     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'value'|iex)
                                    if($InvokeItemCondition -eq $true){
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDElement -Tag 'td' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDTypography -Text $InvokeItemTitle -ClassName 'interface-box-inner-title'
                                                }
                                            }
                                            New-UDElement -Tag 'td' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    if($MemberName -eq 'ServerBlockList'){
                                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 0
                                                            $Session:ServerBlockListCondition = $False
                                                        }
                                                        else{
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 1
                                                            $Session:ServerBlockListCondition = $True
                                                        }
                                                    }
                                                    elseif($MemberName -eq 'ComponentsBlockList'){
                                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 0
                                                            $Session:ComponentsBlockListCondition = $False
                                                        }
                                                        else{
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 1
                                                            $Session:ComponentsBlockListCondition = $True
                                                        }
                                                    }
                                                    elseif($MemberName -eq 'PsucaControllerBlockList'){
                                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 0
                                                            $Session:PsucaControllerBlockListCondition = $False
                                                        }
                                                        else{
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 1
                                                            $Session:PsucaControllerBlockListCondition = $True
                                                        }
                                                    }
                                                    elseif($MemberName -eq 'PsucaDashboardBlockList'){
                                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 0
                                                            $Session:PsucaDashboardBlockListCondition = $False
                                                        }
                                                        else{
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 1
                                                            $Session:PsucaDashboardBlockListCondition = $True
                                                        }
                                                    }
                                                    else{
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($InvokeItemCondition -eq $false){
            
                                    }
                                }
                            }
                        }
                        New-UDButton -Text "Save Parameters" -OnClick {
                            foreach ($Item in $Session:PSCOMemberTypes) {
                                $MemberName           = $Item.Name
                                $InvokeItemCondition  = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                                $InvokeItemTitle      = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                                if($MemberName -eq 'ServerBlockList' -or $MemberName -eq 'ComponentsBlockList' -or $MemberName -eq 'PsucaControllerBlockList' -or $MemberName -eq 'PsucaDashboardBlockList'){
                                    $GetVariableItemValue = (Get-UDElement -Id (($Item.Name)+'IdSwitchBox')).Checked
                                }
                                else{
                                    $GetVariableItemValue = (Get-UDElement -Id (($Item.Name)+'IdTextBox')).Value
                                }
                                '$'+"$MemberName"+'='+'@'+'{'+'condition'+'='+'$'+'InvokeItemCondition'+';'+'title'+'='+"'"+"$InvokeItemTitle"+"'"+';'+'value'+'='+"'"+"$GetVariableItemValue"+"'"+'}'|iex
                            }
                            $PSCOTable = [PSCustomObject]@{
                                ServerBlockList          = $ServerBlockList
                                ComponentsBlockList      = $ComponentsBlockList
                                PsucaControllerBlockList = $PsucaControllerBlockList
                                PsucaDashboardBlockList  = $PsucaDashboardBlockList
                            }
                            $Session:PSCOJson = $PSCOTable
                            
                            $BlockIdJson         = $Session:BlockId
                            $BlockIdJsonId       = $BlockIdJson.Id
                            $BlockIdJsonBlock    = $BlockIdJson.Path
                            $BlockIdJsonProvider = $BlockIdJson.Provider
                            if($BlockIdJsonBlock -eq 'ServerBlock'){
                                $CreateFilePath  = "$Cache:InterfaceServerBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                            }
                            elseif($BlockIdJsonBlock -eq 'ComponentsBlock'){
                                $CreateFilePath  = "$Cache:InterfaceComponentsBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                            }
                            elseif($BlockIdJsonBlock -eq 'PsucaControllerBlock'){
                                $CreateFilePath  = "$Cache:InterfacePsucaControllerBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                            }
                            elseif($BlockIdJsonBlock -eq 'PsucaDashboardBlock'){
                                $CreateFilePath  = "$Cache:InterfacePsucaDashboardBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                            }
                            
                            
                            
            
                            if(Test-Path $CreateFilePath){
                                $FilePathGc         = gc $CreateFilePath
                                $FilePathJson       = $FilePathGc | ConvertFrom-Json
                                
                                ((((($FilePathJson.Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                                $FilePathToJson     = $FilePathJson | ConvertTo-Json -Depth 100
                                Set-Content $CreateFilePath -Value $FilePathToJson
                                Show-UDToast -Message $CreateFilePath -Duration 50000
            
                                if($BlockIdJsonBlock -eq 'ServerBlock'){
                                    (((((($Cache:ServerBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                                    $Session:ButtonDataSet = $Session:PSCOJson | ConvertTo-Json -Depth 100
                                }
                                elseif($BlockIdJsonBlock -eq 'ComponentsBlock'){
                                    (((((($Cache:ComponentsBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                                    $Session:ButtonDataSet = $Session:PSCOJson | ConvertTo-Json -Depth 100
                                }
                                elseif($BlockIdJsonBlock -eq 'PsucaControllerBlock'){
                                    (((((($Cache:PsucaControllerBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                                    $Session:ButtonDataSet = $Session:PSCOJson | ConvertTo-Json -Depth 100
                                }
                                elseif($BlockIdJsonBlock -eq 'PsucaDashboardBlock'){
                                    (((((($Cache:PsucaDashboardBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                                    $Session:ButtonDataSet = $Session:PSCOJson | ConvertTo-Json -Depth 100
                                }
                                $Session:ButtonDataSetCondition = 'save'
                                Show-UDToast -Message 'Parameters is saved' -Duration 50000
                            }
            
                            #$Cache:InterfaceBlockDatabaseSC|iex
                            $Session:MutualTiesParametersCondition = $false
                            $Session:MutualTiesPArametersContentCondition = $false
                            Sync-UDElement -Id 'InterfaceServersBlockInvokeContentDynamicId'
                            Sync-UDElement -Id 'InterfaceComponentsBlockInvokeContentDynamicId'
                            Sync-UDElement -Id 'InterfacePsucaControllerBlockInvokeContentDynamicId'
                            Sync-UDElement -Id 'InterfacePsucaDashboardBlockInvokeContentDynamicId'
                            Sync-UDElement -Id 'MutualTiesContentDynamicId'
                        } -ClassName "interface-box-btn"
                    }
                    # OVERVIEW OF MUTUAL RELATIONS
                    New-UDButton -Text "Overview Mutual Relations" -OnClick {
                        $Session:PSCOFromJson    = $PSCOJson | ConvertFrom-Json -Depth 100
                        $Session:PSCOMemberTypes = ($Session:PSCOFromJson | gm | ? {$_.MemberType -eq 'NoteProperty'})

                        if($null -ne $Session:PSCOMemberTypes){
                            foreach ($Item in $Session:PSCOMemberTypes) {
                                $MemberName          = $Item.Name
                                $InvokeItemCondition = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                                $InvokeItemTitle     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                                $InvokeItemValue     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'value'|iex)
                                if($InvokeItemCondition -eq $true){
                                    if($MemberName -eq 'ServerBlockList'){
                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                            $Session:ServerBlockListCondition = $False
                                        }
                                        else{
                                            $Session:ServerBlockListCondition = $True
                                        }
                                    }
                                    elseif($MemberName -eq 'ComponentsBlockList'){
                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                            $Session:ComponentsBlockListCondition = $False
                                        }
                                        else{
                                            $Session:ComponentsBlockListCondition = $True
                                        }
                                    }
                                    elseif($MemberName -eq 'PsucaControllerBlockList'){
                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                            $Session:PsucaControllerBlockListCondition = $False
                                        }
                                        else{
                                            $Session:PsucaControllerBlockListCondition = $True
                                        }
                                    }
                                    elseif($MemberName -eq 'PsucaDashboardBlockList'){
                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                            $Session:PsucaDashboardBlockListCondition = $False
                                        }
                                        else{
                                            $Session:PsucaDashboardBlockListCondition = $True
                                        }
                                    }
                                    else{
                                        
                                    }
                                }
                                elseif($InvokeItemCondition -eq $false){
        
                                }
                            }
                        }

                        $LoadingMutualTiesDataset              = gc $Session:ExistMutualTiesFilePath
                        $Session:LoadingMutualTiesDatasetJson  = $LoadingMutualTiesDataset | ConvertFrom-Json -Depth 100
                        Show-UDToast -Message $Session:MutualTiesBlockId
                        Show-UDToast -Message $Session:MutualTiesBlockPath
                        Show-UDToast -Message $Session:MutualTiesBlockProvider
                        Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+'app/dev/overviewmutualrelations')
                    } -ClassName "interface-box-btn"
                }
                else{
                    # CREATE NEW MUTUAL TIES LIST
                    if($Session:MutualTiesParametersCondition -eq $true){}
                    else{
                        New-UDButton -Text "Parameters" -OnClick {
                            $Session:MutualTiesParametersCondition = $true
                            $Session:MutualTiesParametersContentCondition = $true
                            Sync-UDElement -Id 'MutualTiesContentDynamicId'
                        } -ClassName "interface-box-btn"
                    }

                    if($Session:MutualTiesParametersContentCondition -eq $true){
                        $Session:PSCOFromJson    = $PSCOJson | ConvertFrom-Json -Depth 100
                        $Session:PSCOMemberTypes = ($Session:PSCOFromJson | gm | ? {$_.MemberType -eq 'NoteProperty'})
                        New-UDElement -Tag 'table' -Content {
                            if($null -ne $Session:PSCOMemberTypes){
                                foreach ($Item in $Session:PSCOMemberTypes) {
                                    $MemberName          = $Item.Name
                                    $InvokeItemCondition = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                                    $InvokeItemTitle     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                                    $InvokeItemValue     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'value'|iex)
                                    if($InvokeItemCondition -eq $true){
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDElement -Tag 'td' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDTypography -Text $InvokeItemTitle -ClassName 'interface-box-inner-title'
                                                }
                                            }
                                            New-UDElement -Tag 'td' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    if($MemberName -eq 'ServerBlockList'){
                                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 0
                                                            $Session:ServerBlockListCondition = $False
                                                        }
                                                        else{
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 1
                                                            $Session:ServerBlockListCondition = $True
                                                        }
                                                    }
                                                    elseif($MemberName -eq 'ComponentsBlockList'){
                                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 0
                                                            $Session:ComponentsBlockListCondition = $False
                                                        }
                                                        else{
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 1
                                                            $Session:ComponentsBlockListCondition = $True
                                                        }
                                                    }
                                                    elseif($MemberName -eq 'PsucaControllerBlockList'){
                                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 0
                                                            $Session:PsucaControllerBlockListCondition = $False
                                                        }
                                                        else{
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 1
                                                            $Session:PsucaControllerBlockListCondition = $True
                                                        }
                                                    }
                                                    elseif($MemberName -eq 'PsucaDashboardBlockList'){
                                                        if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 0
                                                            $Session:PsucaDashboardBlockListCondition = $False
                                                        }
                                                        else{
                                                            New-UDSwitch -Id (($Item.Name)+'IdSwitchBox') -Checked 1
                                                            $Session:PsucaDashboardBlockListCondition = $True
                                                        }
                                                    }
                                                    else{
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($InvokeItemCondition -eq $false){
            
                                    }
                                }
                            }
                        }
                        New-UDButton -Text "Save Parameters" -OnClick {
                            foreach ($Item in $Session:PSCOMemberTypes) {
                                $MemberName           = $Item.Name
                                $InvokeItemCondition  = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                                $InvokeItemTitle      = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                                if($MemberName -eq 'ServerBlockList' -or $MemberName -eq 'ComponentsBlockList' -or $MemberName -eq 'PsucaControllerBlockList' -or $MemberName -eq 'PsucaDashboardBlockList'){
                                    $GetVariableItemValue = (Get-UDElement -Id (($Item.Name)+'IdSwitchBox')).Checked
                                }
                                else{
                                    $GetVariableItemValue = (Get-UDElement -Id (($Item.Name)+'IdTextBox')).Value
                                }
                                '$'+"$MemberName"+'='+'@'+'{'+'condition'+'='+'$'+'InvokeItemCondition'+';'+'title'+'='+"'"+"$InvokeItemTitle"+"'"+';'+'value'+'='+"'"+"$GetVariableItemValue"+"'"+'}'|iex
                            }
                            $PSCOTable = [PSCustomObject]@{
                                ServerBlockList          = $ServerBlockList
                                ComponentsBlockList      = $ComponentsBlockList
                                PsucaControllerBlockList = $PsucaControllerBlockList
                                PsucaDashboardBlockList  = $PsucaDashboardBlockList
                            }
                            $Session:PSCOJson = $PSCOTable
                            
                            $BlockIdJson         = $Session:BlockId
                            $BlockIdJsonId       = $BlockIdJson.Id
                            $BlockIdJsonBlock    = $BlockIdJson.Path
                            $BlockIdJsonProvider = $BlockIdJson.Provider
                            if($BlockIdJsonBlock -eq 'ServerBlock'){
                                $CreateFilePath  = "$Cache:InterfaceServerBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                            }
                            elseif($BlockIdJsonBlock -eq 'ComponentsBlock'){
                                $CreateFilePath  = "$Cache:InterfaceComponentsBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                            }
                            elseif($BlockIdJsonBlock -eq 'PsucaControllerBlock'){
                                $CreateFilePath  = "$Cache:InterfacePsucaControllerBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                            }
                            elseif($BlockIdJsonBlock -eq 'PsucaDashboardBlock'){
                                $CreateFilePath  = "$Cache:InterfacePsucaDashboardBlockDatabasePath"+"$BlockIdJsonId"+'.json'
                            }
                            
                            
                            
            
                            if(Test-Path $CreateFilePath){
                                $FilePathGc         = gc $CreateFilePath
                                $FilePathJson       = $FilePathGc | ConvertFrom-Json
                                
                                ((((($FilePathJson.Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                                $FilePathToJson     = $FilePathJson | ConvertTo-Json -Depth 100
                                Set-Content $CreateFilePath -Value $FilePathToJson
                                Show-UDToast -Message $CreateFilePath -Duration 50000
            
                                if($BlockIdJsonBlock -eq 'ServerBlock'){
                                    (((((($Cache:ServerBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                                    $Session:ButtonDataSet = $Session:PSCOJson | ConvertTo-Json -Depth 100
                                }
                                elseif($BlockIdJsonBlock -eq 'ComponentsBlock'){
                                    (((((($Cache:ComponentsBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                                    $Session:ButtonDataSet = $Session:PSCOJson | ConvertTo-Json -Depth 100
                                }
                                elseif($BlockIdJsonBlock -eq 'PsucaControllerBlock'){
                                    (((((($Cache:PsucaControllerBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                                    $Session:ButtonDataSet = $Session:PSCOJson | ConvertTo-Json -Depth 100
                                }
                                elseif($BlockIdJsonBlock -eq 'PsucaDashboardBlock'){
                                    (((((($Cache:PsucaDashboardBlockData[$ItemNumber]).Selections).$BlockIdJsonProvider).Items).Buttons)[$Session:ButtonCounter]).DataSet = $Session:PSCOJson
                                    $Session:ButtonDataSet = $Session:PSCOJson | ConvertTo-Json -Depth 100
                                }
                                $Session:ButtonDataSetCondition = 'save'
                                Show-UDToast -Message 'Parameters is saved' -Duration 50000
                            }
            
                            #$Cache:InterfaceBlockDatabaseSC|iex
                            $Session:MutualTiesParametersCondition = $false
                            $Session:MutualTiesPArametersContentCondition = $false
                            Sync-UDElement -Id 'InterfaceServersBlockInvokeContentDynamicId'
                            Sync-UDElement -Id 'InterfaceComponentsBlockInvokeContentDynamicId'
                            Sync-UDElement -Id 'InterfacePsucaControllerBlockInvokeContentDynamicId'
                            Sync-UDElement -Id 'InterfacePsucaDashboardBlockInvokeContentDynamicId'
                            Sync-UDElement -Id 'MutualTiesContentDynamicId'
                        } -ClassName "interface-box-btn"
                    }
                    else{
                        New-UDButton -Text "Create Mutual Ties" -OnClick {
                            $Session:PSCOFromJson    = $PSCOJson | ConvertFrom-Json -Depth 100
                            $Session:PSCOMemberTypes = ($Session:PSCOFromJson | gm | ? {$_.MemberType -eq 'NoteProperty'})

                            if($null -ne $Session:PSCOMemberTypes){
                                foreach ($Item in $Session:PSCOMemberTypes) {
                                    $MemberName          = $Item.Name
                                    $InvokeItemCondition = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'condition'|iex)
                                    $InvokeItemTitle     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'title'|iex)
                                    $InvokeItemValue     = (('$'+'Session:'+'PSCOFromJson'+'.'+"$MemberName")+'.'+'value'|iex)
                                    if($InvokeItemCondition -eq $true){
                                        if($MemberName -eq 'ServerBlockList'){
                                            if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                $Session:ServerBlockListCondition = $False
                                            }
                                            else{
                                                $Session:ServerBlockListCondition = $True
                                            }
                                        }
                                        elseif($MemberName -eq 'ComponentsBlockList'){
                                            if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                $Session:ComponentsBlockListCondition = $False
                                            }
                                            else{
                                                $Session:ComponentsBlockListCondition = $True
                                            }
                                        }
                                        elseif($MemberName -eq 'PsucaControllerBlockList'){
                                            if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                $Session:PsucaControllerBlockListCondition = $False
                                            }
                                            else{
                                                $Session:PsucaControllerBlockListCondition = $True
                                            }
                                        }
                                        elseif($MemberName -eq 'PsucaDashboardBlockList'){
                                            if($InvokeItemValue -eq $null -or $InvokeItemValue -eq 0 -or $InvokeItemValue -eq $false){
                                                $Session:PsucaDashboardBlockListCondition = $False
                                            }
                                            else{
                                                $Session:PsucaDashboardBlockListCondition = $True
                                            }
                                        }
                                        else{
                                            
                                        }
                                    }
                                    elseif($InvokeItemCondition -eq $false){
            
                                    }
                                }
                            }

                            $BlockIdJson         = $Session:BlockId
                            $BlockIdJsonId       = $BlockIdJson.Id
                            $BlockIdJsonBlock    = $BlockIdJson.Path
                            $BlockIdJsonProvider = $BlockIdJson.Provider
                            $Session:MutualTiesBlockId       = $BlockIdJsonId
                            $Session:MutualTiesBlockPath     = $BlockIdJsonBlock
                            $Session:MutualTiesBlockProvider = $BlockIdJsonProvider
                            Show-UDToast -Message $Session:MutualTiesBlockId
                            Show-UDToast -Message $Session:MutualTiesBlockPath
                            Show-UDToast -Message $Session:MutualTiesBlockProvider
                            Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+'app/dev/createnewmutualties')
                        } -ClassName "interface-box-btn"
                    }
                }
                $Session:MutualTiesParametersCondition = $false
            }

        }

        # BEFORE DATA
        Show-UDModal -Header {
            New-UDTypography -Text 'Parameters' -Variant subtitle1
        } -Content {
            New-UDDynamic -Content {
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDDynamic -Id ("$SelectorIdString"+'-'+'DashboardConfigurationDynamicId') -Content {
                                New-UDStyle -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'ServerBlockList') -Label 'Server Block List' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'ComponentsBlockList') -Label 'Components Block List' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'PsucaControllerBlockList') -Label 'Psuca Controller Block List' -LabelPlacement end -Checked $False
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDCheckBox -Id ("$SelectorIdString"+'-'+'PsucaDashboardBlockList') -Label 'Psuca Dashboard Block List' -LabelPlacement end -Checked $False
                                    }
                                } -Style '
                                .MuiTypography-root {
                                    font-size: 14px !important;
                                    margin: 0px;
                                    font-family: Roboto, Helvetica, Arial, sans-serif;
                                    font-weight: 400;
                                    font-size: 1rem;
                                    line-height: 0.2;
                                    letter-spacing: 0.00938em;
                                }
                                '
                            }                            
                        }
                    }
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {

                            }
                        }
                    }
                }
                New-UDButton -Text "Save Function Parameters" -OnClick {
                    $ServerBlockListId          = (Get-UDElement -Id ("$SelectorIdString"+'-'+'ServerBlockList')).Checked
                    $ComponentsBlockListId      = (Get-UDElement -Id ("$SelectorIdString"+'-'+'ComponentsBlockList')).Checked
                    $PsucaControllerBlockListId = (Get-UDElement -Id ("$SelectorIdString"+'-'+'PsucaControllerBlockList')).Checked
                    $PsucaDashboardBlockListId  = (Get-UDElement -Id ("$SelectorIdString"+'-'+'PsucaDashboardBlockList')).Checked

                    if(($ServerBlockListId -eq $true -or $ServerBlockListId -eq $false) -and ($ComponentsBlockListId -eq $true -or $ComponentsBlockListId -eq $false) -and ($PsucaControllerBlockListId -eq $true -or $PsucaControllerBlockListId -eq $false) -and ($PsucaDashboardBlockListId -eq $true -or $PsucaDashboardBlockListId -eq $false)){
                        $PSCOTable = [PSCustomObject]@{
                            ServerBlockList          = @{condition=$ServerBlockListId;title='Server Block List';value=$null}
                            ComponentsBlockList      = @{condition=$ComponentsBlockListId;title='Components Block List';value=$null}
                            PsucaControllerBlockList = @{condition=$PsucaControllerBlockListId;title='Psuca Controller Block List';value=$null}
                            PsucaDashboardBlockList  = @{condition=$PsucaDashboardBlockListId;title='Psuca Dashboard Block List';value=$null}
                        }
                        $PSCOJson        = $PSCOTable | ConvertTo-Json
                        $ScriptBlock     = $ScriptBlockImportFormat
                        $ScriptBlock     = $ScriptBlock -replace 'importpscoimport',"$PSCOJson"
                        $ScriptBlockJson = $ScriptBlock | ConvertTo-Json
                        if($SelectorType -eq 'Terminal'){
                            $CreatePSCOString = '('+'$'+'Session:'+'TerminalHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                            $CreatePSCOString|iex
                            $GetSelectDefaultNumber  = (Get-UDElement -Id ('TerminalPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                            $SaveSelectDefaultNumber = ('$'+'Session:'+'TerminalDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                        }
                        elseif($SelectorType -eq 'Main'){
                            $CreatePSCOString = '('+'$'+'Session:'+'MainHashPSCO'+'.'+'button'+"$SelectorIdNum"+')'+'.'+'function'+'='+'$'+'ScriptBlockJson'
                            $CreatePSCOString|iex
                            $GetSelectDefaultNumber  = (Get-UDElement -Id ('MainPSCOItemScriptblockIdSelectBox'+"$SelectorIdNum")).Value
                            $SaveSelectDefaultNumber = ('$'+'Session:'+'MainDefaultSelectValue'+"$SelectorIdNum"+'='+"$GetSelectDefaultNumber") | iex
                        }
                        Show-UDToast -Message 'Function parameters is saved'
                        Sync-UDElement 'GenerateButtonsPscoIdDynamic'
                        Hide-UDModal
                    }
                    else{
                        Show-UDToast -Message 'Function data is not valid'
                    }
                } -ClassName "interface-box-btn" 
            }
        } -Footer { New-UDButton -Text "Close" -OnClick {
            Sync-UDElement 'GenerateButtonsPscoIdDynamic'
            Hide-UDModal
        } -ClassName "interface-box-btn" } -Persistent
    }
}

# INTERFACE ICONS
$LoadAllIconsSC = {
                                        
    $Path1 = 'd:\PSUCA\engine\controller\dev\theme\assets\icon\fontawesome.brands.txt'
    $Path2 = 'd:\PSUCA\engine\controller\dev\theme\assets\icon\fontawesome.regular.txt'
    $Path3 = 'd:\PSUCA\engine\controller\dev\theme\assets\icon\fontawesome.solid.txt'
    $collectionPath1 = gc $Path1
    $collectionPath2 = gc $Path2
    $collectionPath3 = gc $Path3

    New-UDTypography -Text 'Brands'

    New-UDElement -Tag 'table' -Content {
        New-UDElement -Tag 'tr' -Content {
            New-UDElement -Tag 'td' -Content {
                $Path1Num = 0
                foreach ($Item in $collectionPath1) {
                    $IconString = $Item
                    New-UDLink -Children {
                        New-UDIcon -Icon $Item -Size '1x' -Border -ClassName 'interface-box-logo'
                    } -OnClick {
                        Hide-UDModal
                        Show-UDModal -Header {
                            New-UDTypography -Text 'Title' -ClassName 'interface-box-inner-title'
                        } -Content {
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDIcon -Icon $IconString -Size '1x' -Border -ClassName 'interface-box-logo'
                                        }
                                    }
                                }
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Title' -ClassName 'interface-box-inner-title'
                                        }
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTextbox -Id 'IconTitleIdTextBox' -Type text -ClassName 'interface-box-text'
                                        }
                                    }
                                }
                            }
                            New-UDButton -Text "Add" -OnClick {
                                $GetTitle = (Get-UDElement -Id 'IconTitleIdTextBox').Value
                                $CreateButtonVariableHashTable = '$'+'Session:'+'MainHash'+"$Session:VariableValueNumber"+'='+'@'+'{'+'icon'+'='+"'"+"$IconString"+"'"+';'+'title'+'='+"'"+"$GetTitle"+"'"+';'+'variablenumber'+'='+"$Session:VariableValueNumber"+';'+'function'+'='+"'"+'null'+"'"+'}'
                                Show-UDToast -Message $CreateButtonVariableHashTable
                                $CreateButtonVariableHashTable|iex
                                Sync-UDElement -Id 'GenerateButtonsPscoIdDynamic'
                                $Session:DefaultIconName = $IconString
                                Sync-UDElement -Id ('VariableIconDynamicId'+"$Session:VariableValueNumber")
                                $CreateButtonVariableConditionSC = '$'+'session:'+'ElementVariableId'+"$Session:VariableValueNumber"+'='+'$'+'false'
                                $CreateButtonVariableConditionSC|iex
                                $testtt = '$'+'session:'+'ElementVariableId'+"$Session:VariableValueNumber"
                                Show-UDToast -Message ($testtt)
                                $Session:VariableValueNumber = $null
                                Hide-UDModal 
                            } -ClassName "interface-box-btn"
                        } -Footer {
                            New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn"
                        }
                    }
                    $Path1Num++
                }
            }
        }
    }

    New-UDTypography -Text 'Regular'

    New-UDElement -Tag 'table' -Content {
        New-UDElement -Tag 'tr' -Content {
            New-UDElement -Tag 'td' -Content {
                $Path2Num = 0
                foreach ($Item in $collectionPath2) {
                    $IconString = $Item
                    New-UDLink -Children {
                        New-UDIcon -Icon $Item -Size '1x' -Border -ClassName 'interface-box-logo'
                    } -OnClick {
                        Show-UDModal -Header {
                            New-UDTypography -Text 'Icon' -Variant subtitle1
                        } -Content {
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDIcon -Icon $IconString -Size '1x' -Border -ClassName 'interface-box-logo'
                                        }
                                    }
                                }
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Title' -ClassName 'interface-box-inner-title'
                                        }
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTextbox -Id 'IconTitleIdTextBox' -Type text -ClassName 'interface-box-text'
                                        }
                                    }
                                }
                            }
                            New-UDButton -Text "Add" -OnClick {
                                $GetTitle = (Get-UDElement -Id 'IconTitleIdTextBox').Value
                                $CreateButtonVariableHashTable = '$'+'Session:'+'MainHash'+"$Session:VariableValueNumber"+'='+'@'+'{'+'icon'+'='+"'"+"$IconString"+"'"+';'+'title'+'='+"'"+"$GetTitle"+"'"+';'+'variablenumber'+'='+"$Session:VariableValueNumber"+';'+'function'+'='+"'"+'null'+"'"+'}'
                                Show-UDToast -Message $CreateButtonVariableHashTable
                                $CreateButtonVariableHashTable|iex
                                Sync-UDElement -Id 'GenerateButtonsPscoIdDynamic'
                                $Session:DefaultIconName = $IconString
                                Sync-UDElement -Id ('VariableIconDynamicId'+"$Session:VariableValueNumber")
                                $CreateButtonVariableConditionSC = '$'+'session:'+'ElementVariableId'+"$Session:VariableValueNumber"+'='+'$'+'false'
                                $CreateButtonVariableConditionSC|iex
                                $testtt = '$'+'session:'+'ElementVariableId'+"$Session:VariableValueNumber"
                                Show-UDToast -Message ($testtt)
                                $Session:VariableValueNumber = $null
                                Hide-UDModal 
                            } -ClassName "interface-box-btn"
                        } -Footer {
                            New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn"
                        }
                    }
                    $Path2Num++
                }
            }
        }
    }

    New-UDTypography -Text 'Solid'

    New-UDElement -Tag 'table' -Content {
        New-UDElement -Tag 'tr' -Content {
            New-UDElement -Tag 'td' -Content {
                $Path3Num = 0
                foreach ($Item in $collectionPath3) {
                    $IconString = $Item
                    New-UDLink -Children {
                        New-UDIcon -Icon $Item -Size '1x' -Border -ClassName 'interface-box-logo'
                    } -OnClick {
                        Show-UDModal -Header {
                            New-UDTypography -Text 'Icon' -Variant subtitle1
                        } -Content {
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDIcon -Icon $IconString -Size '1x' -Border -ClassName 'interface-box-logo'
                                        }
                                    }
                                }
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Title' -ClassName 'interface-box-inner-title'
                                        }
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTextbox -Id 'IconTitleIdTextBox' -Type text -ClassName 'interface-box-text'
                                        }
                                    }
                                }
                            }
                            New-UDButton -Text "Add" -OnClick {
                                $GetTitle = (Get-UDElement -Id 'IconTitleIdTextBox').Value
                                $CreateButtonVariableHashTable = '$'+'Session:'+'MainHash'+"$Session:VariableValueNumber"+'='+'@'+'{'+'icon'+'='+"'"+"$IconString"+"'"+';'+'title'+'='+"'"+"$GetTitle"+"'"+';'+'variablenumber'+'='+"$Session:VariableValueNumber"+';'+'function'+'='+"'"+'null'+"'"+'}'
                                Show-UDToast -Message $CreateButtonVariableHashTable
                                $CreateButtonVariableHashTable|iex
                                Sync-UDElement -Id 'GenerateButtonsPscoIdDynamic'
                                $Session:DefaultIconName = $IconString
                                Sync-UDElement -Id ('VariableIconDynamicId'+"$Session:VariableValueNumber")
                                $CreateButtonVariableConditionSC = '$'+'session:'+'ElementVariableId'+"$Session:VariableValueNumber"+'='+'$'+'false'
                                $CreateButtonVariableConditionSC|iex
                                $testtt = '$'+'session:'+'ElementVariableId'+"$Session:VariableValueNumber"
                                Show-UDToast -Message ($testtt)
                                $Session:VariableValueNumber = $null
                                Hide-UDModal 
                            } -ClassName "interface-box-btn"
                        } -Footer {
                            New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn"
                        }
                    }
                    $Path3Num++
                }
            }
        }
    }
}
$Cache:LoadAllIconsCache = $LoadAllIconsSC|iex
$LoadTerminalAllIconsSC = {
    
    $Path1 = 'd:\PSUCA\engine\controller\dev\theme\assets\icon\fontawesome.brands.txt'
    $Path2 = 'd:\PSUCA\engine\controller\dev\theme\assets\icon\fontawesome.regular.txt'
    $Path3 = 'd:\PSUCA\engine\controller\dev\theme\assets\icon\fontawesome.solid.txt'
    $collectionPath1 = gc $Path1
    $collectionPath2 = gc $Path2
    $collectionPath3 = gc $Path3

    New-UDTypography -Text 'Brands'

    New-UDElement -Tag 'table' -Content {
        New-UDElement -Tag 'tr' -Content {
            New-UDElement -Tag 'td' -Content {
                $Path1Num = 0
                foreach ($Item in $collectionPath1) {
                    $IconString = $Item
                    New-UDLink -Children {
                        New-UDIcon -Icon $Item -Size '1x' -Border -ClassName 'interface-box-logo'
                    } -OnClick {
                        Hide-UDModal
                        Show-UDModal -Header {
                            New-UDTypography -Text 'Title' -ClassName 'interface-box-inner-title'
                        } -Content {
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDIcon -Icon $IconString -Size '1x' -Border -ClassName 'interface-box-logo'
                                        }
                                    }
                                }
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Title' -ClassName 'interface-box-inner-title'
                                        }
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTextbox -Id 'IconTitleIdTextBox' -Type text -ClassName 'interface-box-text'
                                        }
                                    }
                                }
                            }
                            New-UDButton -Text "Add" -OnClick {
                                $GetTitle = (Get-UDElement -Id 'IconTitleIdTextBox').Value
                                $CreateButtonVariableHashTable = '$'+'Session:'+'TerminalHash'+"$Session:VariableValueNumber"+'='+'@'+'{'+'icon'+'='+"'"+"$IconString"+"'"+';'+'title'+'='+"'"+"$GetTitle"+"'"+';'+'variablenumber'+'='+"$Session:VariableValueNumber"+';'+'function'+'='+"'"+'null'+"'"+'}'
                                Show-UDToast -Message $CreateButtonVariableHashTable
                                $CreateButtonVariableHashTable|iex
                                Sync-UDElement -Id 'GenerateButtonsPscoIdDynamic'
                                $Session:DefaultIconName = $IconString
                                Sync-UDElement -Id ('TerminalVariableIconDynamicId'+"$Session:VariableValueNumber")
                                $CreateButtonVariableConditionSC = '$'+'session:'+'TerminalElementVariableId'+"$Session:VariableValueNumber"+'='+'$'+'false'
                                $CreateButtonVariableConditionSC|iex
                                $testtt = '$'+'session:'+'TerminalElementVariableId'+"$Session:VariableValueNumber"
                                Show-UDToast -Message ($testtt)
                                $Session:VariableValueNumber = $null
                                Hide-UDModal 
                            } -ClassName "interface-box-btn"
                        } -Footer {
                            New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn"
                        }
                    }
                    $Path1Num++
                }
            }
        }
    }

    New-UDTypography -Text 'Regular'

    New-UDElement -Tag 'table' -Content {
        New-UDElement -Tag 'tr' -Content {
            New-UDElement -Tag 'td' -Content {
                $Path2Num = 0
                foreach ($Item in $collectionPath2) {
                    $IconString = $Item
                    New-UDLink -Children {
                        New-UDIcon -Icon $Item -Size '1x' -Border -ClassName 'interface-box-logo'
                    } -OnClick {
                        Show-UDModal -Header {
                            New-UDTypography -Text 'Icon' -Variant subtitle1
                        } -Content {
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDIcon -Icon $IconString -Size '1x' -Border -ClassName 'interface-box-logo'
                                        }
                                    }
                                }
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Title' -ClassName 'interface-box-inner-title'
                                        }
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTextbox -Id 'IconTitleIdTextBox' -Type text -ClassName 'interface-box-text'
                                        }
                                    }
                                }
                            }
                            New-UDButton -Text "Add" -OnClick {
                                $GetTitle = (Get-UDElement -Id 'IconTitleIdTextBox').Value
                                $CreateButtonVariableHashTable = '$'+'Session:'+'TerminalHash'+"$Session:VariableValueNumber"+'='+'@'+'{'+'icon'+'='+"'"+"$IconString"+"'"+';'+'title'+'='+"'"+"$GetTitle"+"'"+';'+'variablenumber'+'='+"$Session:VariableValueNumber"+';'+'function'+'='+"'"+'null'+"'"+'}'
                                Show-UDToast -Message $CreateButtonVariableHashTable
                                $CreateButtonVariableHashTable|iex
                                Sync-UDElement -Id 'GenerateButtonsPscoIdDynamic'
                                $Session:DefaultIconName = $IconString
                                Sync-UDElement -Id ('TerminalVariableIconDynamicId'+"$Session:VariableValueNumber")
                                $CreateButtonVariableConditionSC = '$'+'session:'+'TerminalElementVariableId'+"$Session:VariableValueNumber"+'='+'$'+'false'
                                $CreateButtonVariableConditionSC|iex
                                $testtt = '$'+'session:'+'TerminalElementVariableId'+"$Session:VariableValueNumber"
                                Show-UDToast -Message ($testtt)
                                $Session:VariableValueNumber = $null
                                Hide-UDModal 
                            } -ClassName "interface-box-btn"
                        } -Footer {
                            New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn"
                        }
                    }
                    $Path2Num++
                }
            }
        }
    }

    New-UDTypography -Text 'Solid'

    New-UDElement -Tag 'table' -Content {
        New-UDElement -Tag 'tr' -Content {
            New-UDElement -Tag 'td' -Content {
                $Path3Num = 0
                foreach ($Item in $collectionPath3) {
                    $IconString = $Item
                    New-UDLink -Children {
                        New-UDIcon -Icon $Item -Size '1x' -Border -ClassName 'interface-box-logo'
                    } -OnClick {
                        Show-UDModal -Header {
                            New-UDTypography -Text 'Icon' -Variant subtitle1
                        } -Content {
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDIcon -Icon $IconString -Size '1x' -Border -ClassName 'interface-box-logo'
                                        }
                                    }
                                }
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Title' -ClassName 'interface-box-inner-title'
                                        }
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTextbox -Id 'IconTitleIdTextBox' -Type text -ClassName 'interface-box-text'
                                        }
                                    }
                                }
                            }
                            New-UDButton -Text "Add" -OnClick {
                                $GetTitle = (Get-UDElement -Id 'IconTitleIdTextBox').Value
                                $CreateButtonVariableHashTable = '$'+'Session:'+'TerminalHash'+"$Session:VariableValueNumber"+'='+'@'+'{'+'icon'+'='+"'"+"$IconString"+"'"+';'+'title'+'='+"'"+"$GetTitle"+"'"+';'+'variablenumber'+'='+"$Session:VariableValueNumber"+';'+'function'+'='+"'"+'null'+"'"+'}'
                                Show-UDToast -Message $CreateButtonVariableHashTable
                                $CreateButtonVariableHashTable|iex
                                Sync-UDElement -Id 'GenerateButtonsPscoIdDynamic'
                                $Session:DefaultIconName = $IconString
                                Sync-UDElement -Id ('TerminalVariableIconDynamicId'+"$Session:VariableValueNumber")
                                $CreateButtonVariableConditionSC = '$'+'session:'+'TerminalElementVariableId'+"$Session:VariableValueNumber"+'='+'$'+'false'
                                $CreateButtonVariableConditionSC|iex
                                $testtt = '$'+'session:'+'TerminalElementVariableId'+"$Session:VariableValueNumber"
                                Show-UDToast -Message ($testtt)
                                $Session:VariableValueNumber = $null
                                Hide-UDModal 
                            } -ClassName "interface-box-btn"
                        } -Footer {
                            New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn"
                        }
                    }
                    $Path3Num++
                }
            }
        }
    }
}
$Cache:LoadTerminalAllIconsCache = $LoadTerminalAllIconsSC|iex

# INTERFACE BLOCKS
$Cache:InterfaceBlockDatabaseSC = {
    # SERVER BLOCK
    $Cache:InterfaceServerBlockDatabasePath = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\interface\serverblock\'
    $LoadingInterfaceBlockGci = gci $Cache:InterfaceServerBlockDatabasePath
    $BlockData                = @()
    foreach ($Item in $LoadingInterfaceBlockGci) {
        $ItemGc     = gc $Item.FullName
        $BlockData += $ItemGc | ConvertFrom-Json -Depth 100
    }
    $Cache:ServerBlockData = $BlockData

    # COMPONENTS BLOCK
    $Cache:InterfaceComponentsBlockDatabasePath = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\interface\componentsblock\'
    $LoadingInterfaceBlockGci = gci $Cache:InterfaceComponentsBlockDatabasePath
    $BlockData                = @()
    foreach ($Item in $LoadingInterfaceBlockGci) {
        $ItemGc     = gc $Item.FullName
        $BlockData += $ItemGc | ConvertFrom-Json -Depth 100
    }
    $Cache:ComponentsBlockData = $BlockData

    # PSUCA CONTROLLER BLOCK
    $Cache:InterfacePsucaControllerBlockDatabasePath = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\interface\psucacontrollerblock\'
    $LoadingInterfaceBlockGci = gci $Cache:InterfacePsucaControllerBlockDatabasePath
    $BlockData                = @()
    foreach ($Item in $LoadingInterfaceBlockGci) {
        $ItemGc     = gc $Item.FullName
        $BlockData += $ItemGc | ConvertFrom-Json -Depth 100
    }
    $Cache:PsucaControllerBlockData = $BlockData

    # PSUCA DASHBOARD BLOCK
    $Cache:InterfacePsucaDashboardBlockDatabasePath = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\interface\psucadashboardblock\'
    $LoadingInterfaceBlockGci = gci $Cache:InterfacePsucaDashboardBlockDatabasePath
    $BlockData                = @()
    foreach ($Item in $LoadingInterfaceBlockGci) {
        $ItemGc     = gc $Item.FullName
        $BlockData += $ItemGc | ConvertFrom-Json -Depth 100
    }
    $Cache:PsucaDashboardBlockData = $BlockData
}
$Cache:InterfaceBlockDatabaseSC|iex

# MUTUAL TIES
$Cache:MutualTieskDatabaseSC = {
    # MUTUAL TIES
    $Cache:MutualTieskDatabaseArchivePath = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\mutualties\archive\'
    $Cache:MutualTieskDatabaseDatasetPath = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\mutualties\dataset\'
    $LoadingMutualTieskDatabaseGci = gci $Cache:MutualTieskDatabaseDatasetPath
    $BlockData                     = @()
    foreach ($DirectoryItem in $LoadingMutualTieskDatabaseGci) {
        foreach ($Item in $DirectoryItem) {
            $ItemGc     = gc $Item.FullName
            $BlockData += $ItemGc | ConvertFrom-Json -Depth 100
        }
    }
    $Cache:MutualTieskDatabaseData = $BlockData
}
$Cache:MutualTieskDatabaseSC|iex

# ENTITY CENTER MODEL
$Cache:EntityCenterModelDatabaseSC = {
    # MUTUAL TIES
    $Cache:EntityCenterModelDatabaseListPath = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\entitycenter\list\'
    if(Test-Path $Cache:EntityCenterModelDatabaseListPath){}
    else{
        $New = New-Item -ItemType Directory $Cache:EntityCenterModelDatabaseListPath
    }
    $LoadingEntityCenterModelDatabaseListGci = gci $Cache:EntityCenterModelDatabaseListPath

    $ListData      = @()
    $ListGroupData = @()
    foreach ($DirectoryItem in $LoadingEntityCenterModelDatabaseListGci) {
        $DirectoryName = $DirectoryItem.Name
        $DirectoryPath = $DirectoryItem.FullName
        $ListGroupDataPSCO = [PSCustomObject]@{
            DirName = $DirectoryName
            DirPath = $DirectoryPath
        }
        $DirectoryGci  = gci $DirectoryPath
        foreach ($Dataset in $DirectoryGci) {
            $DatasetName     = $Dataset.Name
            $DatasetFullName = $Dataset.FullName
            $ListDataPSCO    = [PSCustomObject]@{
                DirName      = $DirectoryName
                DirPath      = $DirectoryPath
                Dataset      = $DatasetName
                DatasetPath  = $DatasetFullName
            }
            $ListData += $ListDataPSCO
        }
        $ListGroupData += $ListGroupDataPSCO
    }
    $Cache:EntityCenterModelDatabaseList      = $ListData
    $Cache:EntityCenterModelDatabaseGroupList = $ListGroupData
}
$Cache:EntityCenterModelDatabaseSC|iex



# AUTHENTICATION CACHE PROCESS
$AuthenticationDataPath   = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\authentication\accounts.json'
$AuthenticationDataGc     = gc $AuthenticationDataPath
$AuthenticationDataJson   = $AuthenticationDataGc | ConvertFrom-Json
$Cache:AuthenticationData = $AuthenticationDataJson



# TASKCENTER MAIN TERMINAL PROCESS SCRIPT
$Cache:MainTerminalScriptPath         = "$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\scripts\main-terminal.ps1'
# TASKCENTER SUB TERMINAL PROCESS SCRIPT
$Cache:SubTerminalScriptPath          = "$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\modules\taskcenter\scripts\sub-terminal.ps1'
# TASKCENTER TERMINAL COLLECTOR
$Cache:TerminalCollectorPath          = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\collector\collector_data\'
# TASKCENTER TERMINAL TRANSCRIPT FILEPATH
$Cache:TerminalTranscriptPath         = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\transcript\terminal\'
# TASKCENTER TERMINAL TRANSCRIPT FILEPATH
$Cache:TerminalRunspaceTranscriptPath = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\transcript\runspace\'
# TASKCENTER TERMINAL RUNSPACE
$Cache:TerminalRunspacePath           = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\runspace\'
# TASKCENTER TERMINAL CACHE RUNSPACE
$Cache:TerminalDataRunspacePath       = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\data\data-runspace.json'
# TASKCENTER TERMINAL CACHE NOTIFICATION
$Cache:NotificationDataPath           = "$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\taskcenter\data\data-notification.json'

#endregion PART PROCESSES




#region PART DASHBOARD
New-UDDashboard -Title "Dev Dashboard" -Theme $Theme -Logo "$Cache:LogoFilePath" -Pages @(

    #region ADMIN PAGES
    New-UDPage -Id 'AuthenticationPage' -Name 'Authentication' -Url '/authentication' -Title 'Authentication' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            Invoke-UDRedirect -Url '/interface'
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            $Cache:PageAuthentication|iex
        }
        
    }
    New-UDPage -DefaultHomePage -Id 'InterfacePage' -Name 'Interface' -Url '/interface' -Title 'Interface' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageInterface|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            $Cache:PageInterface|iex
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'InterfaceNewServerPage' -Name 'Interface New Server Block Item' -Url '/interface/newserverblockitem' -Title 'Interface New Server Block Item' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageInterfaceNewServer|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'InterfaceNewComponentsPage' -Name 'Interface New Components Block Item' -Url '/interface/newcomponentsblockitem' -Title 'Interface New Components Block Item' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageInterfaceNewComponents|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'InterfaceNewPsucaControllerPage' -Name 'Interface New Psuca Controller Block Item' -Url '/interface/newpsucacontrollerblockitem' -Title 'Interface New Psuca Controller Block Item' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageInterfaceNewPsucaController|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'InterfaceNewPsucaDashboardPage' -Name 'Interface New Psuca Dashboard Block Item' -Url '/interface/newpsucadashboardblockitem' -Title 'Interface New Psuca Dashboard Block Item' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageInterfaceNewPsucaDashboard|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'CreateNewTaskListPage' -Name 'Task List' -Url '/tasklist' -Title 'Task List' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageGetTaskList|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'CreateNewTaskGroupPage' -Name 'Create New Task Group' -Url '/createnewtaskgroup' -Title 'Create New Task Group' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageNewTaskGroup|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'CreateNewTaskTypePage' -Name 'Create New Task Type' -Url '/createnewtasktype' -Title 'Create New Task Type' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageNewTaskType|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'CreateNewTaskPage' -Name 'Create New Task' -Url '/createnewtask' -Title 'Create New Task' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageNewTask|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'CreateEntityCreateEntityModelPage' -Name 'Create New Entity Model' -Url '/createnewentitymodel' -Title 'Create New Entity Model' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageNewEntityModel|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'CreateNewMutualTiesPage' -Name 'Create New Mutual Ties' -Url '/createnewmutualties' -Title 'Create New Mutual Ties' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageNewMutualTies|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    New-UDPage -Id 'OverviewMutualRelations' -Name 'Overview Mutual Relations' -Url '/overviewmutualrelations' -Title 'Overview Mutual Relations' -Logo "$Cache:LogoFilePath" -Content {
        if($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'Developer')){
            $Cache:PageOverviewMutualRelations|iex
        }
        elseif($Session:AuthenticationResult -eq $true -and ($Session:AuthenticationCredential -eq 'EmployeeAdministrator')){
            
        }
        else{
            Invoke-UDRedirect -Url '/authentication'
        }
    }
    #endregion ADMIN PAGES





    New-UDPage -Id 'PermissionDeniedPage' -Name 'Permission Denied' -Url '/permissiondenied' -Title 'Create New Task' -Logo "$Cache:LogoFilePath" -Content {
        New-UDTypography -Align center -Text 'PERMISSION IS DENIED'
    }
) -Navigation $Nav -HeaderContent $HeaderContent -Scripts @("\assets\js\fun.js") -Stylesheets @("\assets\css\theme.css")
#endregion PART DASHBOARD





