
$MainSC = {
    New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
        New-UDPaper -ClassName "task-center-box-layout" -Square -Content {
            New-UDRow -Columns {
                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                    New-UDElement -Tag 'table' -Content {
                        New-UDElement -Tag 'tr' -Content {
                            New-UDElement -Tag 'td' -Content {
                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'task-center-box-logo'
                            }
                            New-UDElement -Tag 'td' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDTypography -Text 'Task Center Manager' -ClassName 'task-center-box-title'
                                }
                            }
                        }
                    }
                    New-UDDynamic -Id 'TaskCenterGroupListDynamicId' -Content {
                        New-UDElement -Tag 'div' -Content {
                            # DATA FORMAT
                            $Data = @()
    
                            $TaskListConfigurationDataGci = gci $Cache:TaskListConfigurationDatabasePath
                            $TaskGroupList                = @()
                            $Session:DateToday            = Get-Date
                            foreach ($Item in $TaskListConfigurationDataGci) {
                                $ItemFullName   = $Item.FullName
                                $ItemFullNameGc = gc $ItemFullName
                                $ItemJson       = $ItemFullNameGc | ConvertFrom-Json
                                $TaskGroup      = $ItemJson.TaskGroupIdSelectBox
                                if($null -eq $($TaskGroupList.Name -match $TaskGroup) -or $false -eq $($TaskGroupList.Name -match $TaskGroup)){
                                    $TaskContentPSCO = [PSCustomObject]@{
                                        TaskUniqueId       = $ItemJson.TaskUniqueId;
                                        TaskFullName       = $ItemFullName
                                        TaskName           = $ItemJson.TaskNameIdTextBox;
                                        TaskGroup          = $ItemJson.TaskGroupIdSelectBox;
                                        TaskType           = $ItemJson.TaskTypeIdSelectBox;
                                        TaskMethod         = $ItemJson.TaskMethodTypeIdSelectBox;
                                        TaskGetMethod      = $ItemJson.TaskGetMethodIdSelectBox;
                                        TaskGetReturn      = $ItemJson.TaskGetReturnTypeIdSelectBox;
                                        TaskGetExpiration  = $ItemJson.TaskGetExpirationIdSelectBox;
                                        TaskSetMethod      = $ItemJson.TaskSetMethodIdSelectBox;
                                        TaskSetReturn      = $ItemJson.TaskSetReturnTypeIdSelectBox;
                                        TaskSetType        = $ItemJson.TaskSetTypeIdSelectBox;
                                        StartPoint         = $ItemJson.InterfaceBlocksStartPointIdSelectBox;
                                        EndPoint           = $ItemJson.InterfaceBlocksEndPointIdSelectBox;
                                        EntityGroup        = $ItemJson.EntiyGroupIdSelectBox;
                                        EntityModel        = $ItemJson.EntiyModelIdSelectBox;
                                        EntityAttribute    = $ItemJson.EntiyModelAttributeIdSelectBox;
                                        TaskStartDate      = @{day=$ItemJson.TaskStartDateDayTextBox;month=$ItemJson.TaskStartDateMonthTextBox;year=$ItemJson.TaskStartDateYearTextBox};
                                        TaskEndDate        = @{day=$ItemJson.TaskEndDateDayTextBox;month=$ItemJson.TaskEndDateMonthTextBox;year=$ItemJson.TaskEndDateYearTextBox};
                                        TaskStartTime      = @{hour=$ItemJson.TaskStartTimeHourTextBox;minute=$ItemJson.TaskStartTimeMinuteTextBox;second=$ItemJson.TaskStartTimeSecondTextBox};
                                        TaskEndTime        = @{hour=$ItemJson.TaskEndTimeHourTextBox;minute=$ItemJson.TaskEndTimeMinuteTextBox;second=$ItemJson.TaskEndTimeSecondTextBox};
                                        TaskLimitTime      = @{hour=$ItemJson.TaskLimitTimeHourTextBox;minute=$ItemJson.TaskLimitTimeMinuteTextBox;second=$ItemJson.TaskLimitTimeSecondTextBox};
                                        TaskRepetitionTime = @{hour=$ItemJson.TaskRepetitionTimeHourTextBox;minute=$ItemJson.TaskRepetitionTimeMinuteTextBox;second=$ItemJson.TaskRepetitionTimeSecondTextBox};
                                        TaskWindowStyle    = $ItemJson.TaskWindowStyleIdSelectBox;
                                        TaskScriptType     = $ItemJson.TaskSelectScriptTypeBox;
                                        TaskLanguage       = $ItemJson.TaskScriptblockLanguageSelectBox;
                                        TaskScriptPath     = $ItemJson.TaskScriptBlockFullName;
                                        TaskStatus         = $ItemJson.TaskStatus
                                    }
                                    $TaskGroupPSCO = [PSCustomObject]@{
                                        Name       = $TaskGroup
                                        Count      = 1
                                        Active     = 0
                                        Inactive   = 0
                                        Content    = $TaskContentPSCO
                                    }
                                    if($ItemJson.TaskStatus -eq 'Active'){
                                        $TaskGroupPSCO.Active += 1
                                    }
                                    else{
                                        $TaskGroupPSCO.Inactive += 1
                                    }
    
                                    $TaskGroupList += $TaskGroupPSCO
                                }
                                else{
                                    $TaskContentPSCO = [PSCustomObject]@{
                                        TaskUniqueId       = $ItemJson.TaskUniqueId;
                                        TaskFullName       = $ItemFullName
                                        TaskName           = $ItemJson.TaskNameIdTextBox;
                                        TaskGroup          = $ItemJson.TaskGroupIdSelectBox;
                                        TaskType           = $ItemJson.TaskTypeIdSelectBox;
                                        TaskMethod         = $ItemJson.TaskMethodTypeIdSelectBox;
                                        TaskGetMethod      = $ItemJson.TaskGetMethodIdSelectBox;
                                        TaskGetReturn      = $ItemJson.TaskGetReturnTypeIdSelectBox;
                                        TaskGetExpiration  = $ItemJson.TaskGetExpirationIdSelectBox;
                                        TaskSetMethod      = $ItemJson.TaskSetMethodIdSelectBox;
                                        TaskSetReturn      = $ItemJson.TaskSetReturnTypeIdSelectBox;
                                        TaskSetType        = $ItemJson.TaskSetTypeIdSelectBox;
                                        StartPoint         = $ItemJson.InterfaceBlocksStartPointIdSelectBox;
                                        EndPoint           = $ItemJson.InterfaceBlocksEndPointIdSelectBox;
                                        EntityGroup        = $ItemJson.EntiyGroupIdSelectBox;
                                        EntityModel        = $ItemJson.EntiyModelIdSelectBox;
                                        EntityAttribute    = $ItemJson.EntiyModelAttributeIdSelectBox;
                                        TaskStartDate      = @{day=$ItemJson.TaskStartDateDayTextBox;month=$ItemJson.TaskStartDateMonthTextBox;year=$ItemJson.TaskStartDateYearTextBox};
                                        TaskEndDate        = @{day=$ItemJson.TaskEndDateDayTextBox;month=$ItemJson.TaskEndDateMonthTextBox;year=$ItemJson.TaskEndDateYearTextBox};
                                        TaskStartTime      = @{hour=$ItemJson.TaskStartTimeHourTextBox;minute=$ItemJson.TaskStartTimeMinuteTextBox;second=$ItemJson.TaskStartTimeSecondTextBox};
                                        TaskEndTime        = @{hour=$ItemJson.TaskEndTimeHourTextBox;minute=$ItemJson.TaskEndTimeMinuteTextBox;second=$ItemJson.TaskEndTimeSecondTextBox};
                                        TaskLimitTime      = @{hour=$ItemJson.TaskLimitTimeHourTextBox;minute=$ItemJson.TaskLimitTimeMinuteTextBox;second=$ItemJson.TaskLimitTimeSecondTextBox};
                                        TaskRepetitionTime = @{hour=$ItemJson.TaskRepetitionTimeHourTextBox;minute=$ItemJson.TaskRepetitionTimeMinuteTextBox;second=$ItemJson.TaskRepetitionTimeSecondTextBox};
                                        TaskWindowStyle    = $ItemJson.TaskWindowStyleIdSelectBox;
                                        TaskScriptType     = $ItemJson.TaskSelectScriptTypeBox;
                                        TaskLanguage       = $ItemJson.TaskScriptblockLanguageSelectBox;
                                        TaskScriptPath     = $ItemJson.TaskScriptBlockFullName;
                                        TaskStatus         = $ItemJson.TaskStatus
                                    }
                                    $GetIndex = [array]::indexof($TaskGroupList.Name,$TaskGroup)
                                    ($TaskGroupList[$GetIndex]).Count          += 1
                                    [array]($TaskGroupList[$GetIndex]).Content += $TaskContentPSCO
                                    if($ItemJson.TaskStatus -eq 'Active'){
                                        ($TaskGroupList[$GetIndex]).Active += 1
                                    }
                                    else{
                                        ($TaskGroupList[$GetIndex]).Inactive += 1
                                    }
                                }
                            }
                            
    
    
                            $Session:TaskGroupListData = @(
                                foreach ($Group in $TaskGroupList){
                                    @{
                                        TaskGroup    = $Group.Name;
                                        TaskCount    = $Group.Count;
                                        TaskActive   = $Group.Active;
                                        TaskInactive = $Group.Inactive;
                                        TaskContent  = $Group.Content|ConvertTo-Json;
                                    }
                                }
                            )
    
                            $Data += $Session:TaskGroupListData
    
                            if($Data -eq $null){
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDTypography -Text 'Data is not found!' -Style @{color='red'}
                                        }
                                    }   
                                }
                            }
                            else{
                                $Columns = @(
                                    New-UDTableColumn -Property TaskGroup -Title 'Group' -IncludeInSearch -Render {
                                        New-UDTypography -Text "$($EventData.TaskGroup)"
                                    }
                                    New-UDTableColumn -Property TaskCount -Title 'Tasks' -IncludeInSearch -Render {
                                        New-UDTypography -Text "$($EventData.TaskCount)"
                                    }
                                    New-UDTableColumn -Property TaskAcive -Title 'Active' -IncludeInSearch -Render {
                                        New-UDTypography -Text "$($EventData.TaskActive)"
                                    }
                                    New-UDTableColumn -Property TaskInactive -Title 'Inactive' -IncludeInSearch -Render {
                                        New-UDTypography -Text "$($EventData.TaskInactive)"
                                    }
                                )
                                New-UDElement -Tag 'div' -Content {
                                    New-UDStyle -Content {
                                        New-UDTable -Id 'TaskGroupList_table' -Data $Data -Columns $Columns -Title 'Task List' -ShowSearch -ShowPagination -Dense -OnRowSelection {
                                            $Session:SelectedTaskRow = $Body
                                        } -PageSize 20 -ShowRefresh -OnRowExpand {
                                            $DatasetDataTable = @()
                                            $DatasetData      = "$($EventData.TaskContent)"
                                            $DatasetDataJson  = $DatasetData|ConvertFrom-Json
                                            
                                            $TaskCenterGroupListDatasetData = @(
                                                if($null -ne $DatasetDataJson){
                                                    foreach ($Item in $DatasetDataJson) {
                                                        if($Item.TaskStatus -eq 'Active' ){
                                                            if((Get-Date -Year (2000+($Item.TaskStartDate).year) -Month ($Item.TaskStartDate).month -Day ($Item.TaskStartDate).day) -le $Session:DateToday -and (Get-Date -Year (2000+($Item.TaskEndDate).year) -Month ($Item.TaskEndDate).month -Day ($Item.TaskEndDate).day) -ge $Session:DateToday){
                                                                $ItemStatus = 'Active'
                                                            }
                                                            else{
                                                                $ItemStatus = 'Inactive'
                                                            }
                                                        }
                                                        else{
                                                            $ItemStatus = 'Inactive'
                                                        }
                                                        @{
                                                            TaskUniqueId       = $Item.TaskUniqueId;
                                                            TaskFullName       = $Item.TaskFullName;
                                                            TaskName           = $Item.TaskName;
                                                            TaskGroup          = $Item.TaskGroup;
                                                            TaskType           = $Item.TaskType;
                                                            TaskMethod         = $Item.TaskMethod;
                                                            TaskGetMethod      = $Item.TaskGetMethod;
                                                            TaskGetReturn      = $Item.TaskGetReturn;
                                                            TaskGetExpiration  = $Item.TaskGetExpiration;
                                                            TaskSetMethod      = $Item.TaskSetMethod;
                                                            TaskSetReturn      = $Item.TaskSetReturn;
                                                            TaskSetType        = $Item.TaskSetType;
                                                            StartPoint         = $Item.StartPoint;
                                                            EndPoint           = $Item.EndPoint;
                                                            EntityGroup        = $Item.EntityGroup;
                                                            EntityModel        = $Item.EntityModel;
                                                            EntityAttribute    = $Item.EntityAttribute;
                                                            TaskStartDate      = (Get-Date -Year (2000+($Item.TaskStartDate).year) -Month ($Item.TaskStartDate).month -Day ($Item.TaskStartDate).day).ToString('dd/MM/yyyy');
                                                            TaskEndDate        = (Get-Date -Year (2000+($Item.TaskEndDate).year) -Month ($Item.TaskEndDate).month -Day ($Item.TaskEndDate).day).ToString('dd/MM/yyyy');
                                                            TaskStartTime      = (Get-Date -Hour (($Item.TaskStartTime).hour) -Minute ($Item.TaskStartTime).minute -Second ($Item.TaskStartTime).second).ToString('HH:mm:ss');
                                                            TaskEndTime        = (Get-Date -Hour (($Item.TaskEndTime).hour) -Minute ($Item.TaskEndTime).minute -Second ($Item.TaskEndTime).second).ToString('HH:mm:ss');
                                                            TaskLimitTime      = (Get-Date -Hour (($Item.TaskLimitTime).hour) -Minute ($Item.TaskLimitTime).minute -Second ($Item.TaskLimitTime).second).ToString('HH:mm:ss');
                                                            TaskRepetitionTime = (Get-Date -Hour (($Item.TaskRepetitionTime).hour) -Minute ($Item.TaskRepetitionTime).minute -Second ($Item.TaskRepetitionTime).second).ToString('HH:mm:ss');
                                                            TaskWindowStyle    = $Item.TaskWindowStyle;
                                                            TaskScriptType     = $Item.TaskScriptType;
                                                            TaskLanguage       = $Item.TaskLanguage;
                                                            TaskScriptPath     = $Item.TaskScriptPath;
                                                            TaskStatus         = $ItemStatus;
                                                        }
                                                        
                                                    }
                                                }
                                            )
                                            $DatasetDataTable   = $TaskCenterGroupListDatasetData
                                            $DatasetDataColumns = @(
                                                New-UDTableColumn -ShowSort -Property TaskName -Title 'Task Name' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskName)"
                                                }
                                                New-UDTableColumn -Property TaskGroup -Title 'Task Group' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskGroup)"
                                                }
                                                New-UDTableColumn -Property TaskType -Title 'Task Type' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskType)"
                                                }
                                                New-UDTableColumn -Property TaskMethod -Title 'Task Method' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskMethod)"
                                                }
                                                New-UDTableColumn -Property TaskGetMethod -Title 'Get Method' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskGetMethod)"
                                                }
                                                New-UDTableColumn -Property TaskGetReturn -Title 'Get Return' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskGetReturn)"
                                                }
                                                New-UDTableColumn -Property TaskGetExpiration -Title 'Get Expiration' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskGetExpiration)"
                                                }
                                                New-UDTableColumn -Property TaskSetMethod -Title 'Set Method' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskSetMethod)"
                                                }
                                                New-UDTableColumn -Property TaskSetReturn -Title 'Set Return' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskSetReturn)"
                                                }
                                                New-UDTableColumn -Property TaskSetType -Title 'Set Type' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskSetType)"
                                                }
                                                New-UDTableColumn -Property StartPoint -Title 'StartPoint' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.StartPoint)"
                                                }
                                                New-UDTableColumn -Property EndPoint -Title 'EndPoint' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.EndPoint)"
                                                }
                                                New-UDTableColumn -Property EntityGroup -Title 'Entity Group' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.EntityGroup)"
                                                }
                                                New-UDTableColumn -Property EntityModel -Title 'Entity Model' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.EntityModel)"
                                                }
                                                New-UDTableColumn -Property EntityAttribute -Title 'Entity Attribute' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.EntityAttribute)"
                                                }
                                                New-UDTableColumn -Property TaskStartDate -Title 'Start Date' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskStartDate)"
                                                }
                                                New-UDTableColumn -Property TaskEndDate -Title 'End Date' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskEndDate)"
                                                }
                                                New-UDTableColumn -Property TaskStartTime -Title 'Start Time' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskStartTime)"
                                                }
                                                New-UDTableColumn -Property TaskEndTime -Title 'End Time' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskEndTime)"
                                                }
                                                New-UDTableColumn -Property TaskLimitTime -Title 'Limit Time' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskLimitTime)"
                                                }
                                                New-UDTableColumn -Property TaskRepetitionTime -Title 'Repetition Time' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskRepetitionTime)"
                                                }
                                                New-UDTableColumn -Property TaskLanguage -Title 'Language' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskLanguage)"
                                                }
                                                New-UDTableColumn -Property TaskWindowStyle -Title 'Visibility' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.TaskWindowStyle)"
                                                }                                                
                                                New-UDTableColumn -Property TaskStatus -Title 'Status' -IncludeInSearch -Render {
                                                    [string]$TaskStartDate = "$($EventData.TaskStartDate)"
                                                    [string]$TaskEndDate   = "$($EventData.TaskEndDate)"
                                                    [string]$TaskStatus    = "$($EventData.TaskStatus)"
                                                    $TaskStatusId          = ('ToggleId-'+"$($EventData.TaskUniqueId)")
                                                    $TaskStatusDynamicId   = ('ToggleDynamicId-'+"$($EventData.TaskUniqueId)")
                                                    $TaskStatusSC          = {
                                                        $TaskFullName = 'importtaskfullname'
                                                        New-UDStyle -Content {
                                                            if($TaskStatus -eq 'Active'){
                                                                New-UDSwitch -Id $TaskStatusId -Checked $True -Color secondary -OnChange {
                                                                    if((Get-Date -Year 'importstartdateyear' -Month 'importstartdatemonth' -Day 'importstartdateday') -le $Session:DateToday -and (Get-Date -Year 'importenddateyear' -Month 'importenddatemonth' -Day 'importenddateday') -ge $Session:DateToday){
                                                                        $ItemFullName   = $TaskFullName
                                                                        $ItemFullNameGc = gc $ItemFullName
                                                                        $ItemJson       = $ItemFullNameGc | ConvertFrom-Json
                                                                        $TaskContentPSCO = [PSCustomObject]@{
                                                                            TaskUniqueId                         = $ItemJson.TaskUniqueId;
                                                                            TaskNameIdTextBox                    = $ItemJson.TaskNameIdTextBox;
                                                                            TaskGroupIdSelectBox                 = $ItemJson.TaskGroupIdSelectBox;
                                                                            TaskTypeIdSelectBox                  = $ItemJson.TaskTypeIdSelectBox;
                                                                            TaskMethodTypeIdSelectBox            = $ItemJson.TaskMethodTypeIdSelectBox;
                                                                            TaskGetMethodIdSelectBox             = $ItemJson.TaskGetMethodIdSelectBox;
                                                                            TaskGetReturnTypeIdSelectBox         = $ItemJson.TaskGetReturnTypeIdSelectBox;
                                                                            TaskGetExpirationIdSelectBox         = $ItemJson.TaskGetExpirationIdSelectBox;
                                                                            TaskSetMethodIdSelectBox             = $ItemJson.TaskSetMethodIdSelectBox;
                                                                            TaskSetReturnTypeIdSelectBox         = $ItemJson.TaskSetReturnTypeIdSelectBox;
                                                                            TaskSetTypeIdSelectBox               = $ItemJson.TaskSetTypeIdSelectBox;
                                                                            InterfaceBlocksStartPointIdSelectBox = $ItemJson.InterfaceBlocksStartPointIdSelectBox;
                                                                            InterfaceBlocksEndPointIdSelectBox   = $ItemJson.InterfaceBlocksEndPointIdSelectBox;
                                                                            EntiyGroupIdSelectBox                = $ItemJson.EntiyGroupIdSelectBox;
                                                                            EntiyModelIdSelectBox                = $ItemJson.EntiyModelIdSelectBox;
                                                                            EntiyModelAttributeIdSelectBox       = $ItemJson.EntiyModelAttributeIdSelectBox;
                                                                            TaskStartDateDayTextBox              = $ItemJson.TaskStartDateDayTextBox;
                                                                            TaskStartDateMonthTextBox            = $ItemJson.TaskStartDateMonthTextBox;
                                                                            TaskStartDateYearTextBox             = $ItemJson.TaskStartDateYearTextBox;
                                                                            TaskEndDateDayTextBox                = $ItemJson.TaskEndDateDayTextBox;
                                                                            TaskEndDateMonthTextBox              = $ItemJson.TaskEndDateMonthTextBox;
                                                                            TaskEndDateYearTextBox               = $ItemJson.TaskEndDateYearTextBox;
                                                                            TaskStartTimeHourTextBox             = $ItemJson.TaskStartTimeHourTextBox;
                                                                            TaskStartTimeMinuteTextBox           = $ItemJson.TaskStartTimeMinuteTextBox;
                                                                            TaskStartTimeSecondTextBox           = $ItemJson.TaskStartTimeSecondTextBox;
                                                                            TaskEndTimeHourTextBox               = $ItemJson.TaskEndTimeHourTextBox;
                                                                            TaskEndTimeMinuteTextBox             = $ItemJson.TaskEndTimeMinuteTextBox;
                                                                            TaskEndTimeSecondTextBox             = $ItemJson.TaskEndTimeSecondTextBox;
                                                                            TaskLimitTimeHourTextBox             = $ItemJson.TaskLimitTimeHourTextBox;
                                                                            TaskLimitTimeMinuteTextBox           = $ItemJson.TaskLimitTimeMinuteTextBox;
                                                                            TaskLimitTimeSecondTextBox           = $ItemJson.TaskLimitTimeSecondTextBox;
                                                                            TaskRepetitionTimeHourTextBox        = $ItemJson.TaskRepetitionTimeHourTextBox;
                                                                            TaskRepetitionTimeMinuteTextBox      = $ItemJson.TaskRepetitionTimeMinuteTextBox;
                                                                            TaskRepetitionTimeSecondTextBox      = $ItemJson.TaskRepetitionTimeSecondTextBox;
                                                                            TaskWindowStyleIdSelectBox           = $ItemJson.TaskWindowStyleIdSelectBox;
                                                                            TaskSelectScriptTypeBox              = $ItemJson.TaskSelectScriptTypeBox;
                                                                            TaskScriptblockLanguageSelectBox     = $ItemJson.TaskScriptblockLanguageSelectBox;
                                                                            TaskScriptBlockFullName              = $ItemJson.TaskScriptBlockFullName;
                                                                            TaskStatus                           = 'Inactive'
                                                                        }
                                                                        $TaskContentToJson = $TaskContentPSCO|ConvertTo-Json
                                                                        if(Test-Path $ItemFullName){
                                                                            $CheckedResult = $False
                                                                            $Save = Set-Content $TaskFullName -Value $TaskContentToJson -Force
                                                                            Set-UDElement -Id $TaskStatusId -Properties @{Checked=$CheckedResult}
                                                                            Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                            Show-UDToast -Message 'Task is deactivated!' -MessageColor 'Black' -BackgroundColor 'green' -Icon 'Check' -Title 'Succes:' -Duration 5000
                                                                        }
                                                                        else{
                                                                            $CheckedResult = $False
                                                                            Set-UDElement -Id $TaskStatusId -Properties @{Checked=$CheckedResult}
                                                                            Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                            Show-UDToast -Message 'Task full name path is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                        }
                                                                    }
                                                                    else{
                                                                        $ItemFullName   = $TaskFullName
                                                                        $ItemFullNameGc = gc $ItemFullName
                                                                        $ItemJson       = $ItemFullNameGc | ConvertFrom-Json
                                                                        $TaskContentPSCO = [PSCustomObject]@{
                                                                            TaskUniqueId                         = $ItemJson.TaskUniqueId;
                                                                            TaskNameIdTextBox                    = $ItemJson.TaskNameIdTextBox;
                                                                            TaskGroupIdSelectBox                 = $ItemJson.TaskGroupIdSelectBox;
                                                                            TaskTypeIdSelectBox                  = $ItemJson.TaskTypeIdSelectBox;
                                                                            TaskMethodTypeIdSelectBox            = $ItemJson.TaskMethodTypeIdSelectBox;
                                                                            TaskGetMethodIdSelectBox             = $ItemJson.TaskGetMethodIdSelectBox;
                                                                            TaskGetReturnTypeIdSelectBox         = $ItemJson.TaskGetReturnTypeIdSelectBox;
                                                                            TaskGetExpirationIdSelectBox         = $ItemJson.TaskGetExpirationIdSelectBox;
                                                                            TaskSetMethodIdSelectBox             = $ItemJson.TaskSetMethodIdSelectBox;
                                                                            TaskSetReturnTypeIdSelectBox         = $ItemJson.TaskSetReturnTypeIdSelectBox;
                                                                            TaskSetTypeIdSelectBox               = $ItemJson.TaskSetTypeIdSelectBox;
                                                                            InterfaceBlocksStartPointIdSelectBox = $ItemJson.InterfaceBlocksStartPointIdSelectBox;
                                                                            InterfaceBlocksEndPointIdSelectBox   = $ItemJson.InterfaceBlocksEndPointIdSelectBox;
                                                                            EntiyGroupIdSelectBox                = $ItemJson.EntiyGroupIdSelectBox;
                                                                            EntiyModelIdSelectBox                = $ItemJson.EntiyModelIdSelectBox;
                                                                            EntiyModelAttributeIdSelectBox       = $ItemJson.EntiyModelAttributeIdSelectBox;
                                                                            TaskStartDateDayTextBox              = $ItemJson.TaskStartDateDayTextBox;
                                                                            TaskStartDateMonthTextBox            = $ItemJson.TaskStartDateMonthTextBox;
                                                                            TaskStartDateYearTextBox             = $ItemJson.TaskStartDateYearTextBox;
                                                                            TaskEndDateDayTextBox                = $ItemJson.TaskEndDateDayTextBox;
                                                                            TaskEndDateMonthTextBox              = $ItemJson.TaskEndDateMonthTextBox;
                                                                            TaskEndDateYearTextBox               = $ItemJson.TaskEndDateYearTextBox;
                                                                            TaskStartTimeHourTextBox             = $ItemJson.TaskStartTimeHourTextBox;
                                                                            TaskStartTimeMinuteTextBox           = $ItemJson.TaskStartTimeMinuteTextBox;
                                                                            TaskStartTimeSecondTextBox           = $ItemJson.TaskStartTimeSecondTextBox;
                                                                            TaskEndTimeHourTextBox               = $ItemJson.TaskEndTimeHourTextBox;
                                                                            TaskEndTimeMinuteTextBox             = $ItemJson.TaskEndTimeMinuteTextBox;
                                                                            TaskEndTimeSecondTextBox             = $ItemJson.TaskEndTimeSecondTextBox;
                                                                            TaskLimitTimeHourTextBox             = $ItemJson.TaskLimitTimeHourTextBox;
                                                                            TaskLimitTimeMinuteTextBox           = $ItemJson.TaskLimitTimeMinuteTextBox;
                                                                            TaskLimitTimeSecondTextBox           = $ItemJson.TaskLimitTimeSecondTextBox;
                                                                            TaskRepetitionTimeHourTextBox        = $ItemJson.TaskRepetitionTimeHourTextBox;
                                                                            TaskRepetitionTimeMinuteTextBox      = $ItemJson.TaskRepetitionTimeMinuteTextBox;
                                                                            TaskRepetitionTimeSecondTextBox      = $ItemJson.TaskRepetitionTimeSecondTextBox;
                                                                            TaskWindowStyleIdSelectBox           = $ItemJson.TaskWindowStyleIdSelectBox;
                                                                            TaskSelectScriptTypeBox              = $ItemJson.TaskSelectScriptTypeBox;
                                                                            TaskScriptblockLanguageSelectBox     = $ItemJson.TaskScriptblockLanguageSelectBox;
                                                                            TaskScriptBlockFullName              = $ItemJson.TaskScriptBlockFullName;
                                                                            TaskStatus                           = 'Inactive'
                                                                        }
                                                                        $TaskContentToJson = $TaskContentPSCO|ConvertTo-Json
                                                                        if(Test-Path $ItemFullName){
                                                                            $CheckedResult = $False
                                                                            $Save = Set-Content $TaskFullName -Value $TaskContentToJson -Force
                                                                            Set-UDElement -Id $TaskStatusId -Properties @{Checked=$CheckedResult}
                                                                            Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                            Show-UDToast -Message 'Task is deactivated!' -MessageColor 'Black' -BackgroundColor 'green' -Icon 'Check' -Title 'Succes:' -Duration 5000
                                                                            Show-UDToast -Message 'Datetime is not current and the task cannot be activated!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                        }
                                                                        else{
                                                                            $CheckedResult = $False
                                                                            Set-UDElement -Id $TaskStatusId -Properties @{Checked=$CheckedResult}
                                                                            Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                            Show-UDToast -Message 'Task full name path is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                            Show-UDToast -Message 'Datetime is not current and the task cannot be activated!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            elseif($TaskStatus -eq 'Inactive'){
                                                                New-UDSwitch -Id $TaskStatusId -Checked $False -Color secondary -OnChange {
                                                                    if((Get-Date -Year 'importstartdateyear' -Month 'importstartdatemonth' -Day 'importstartdateday') -le $Session:DateToday -and (Get-Date -Year 'importenddateyear' -Month 'importenddatemonth' -Day 'importenddateday') -ge $Session:DateToday){
                                                                        $ItemFullName   = $TaskFullName
                                                                        $ItemFullNameGc = gc $ItemFullName
                                                                        $ItemJson       = $ItemFullNameGc | ConvertFrom-Json
                                                                        $TaskContentPSCO = [PSCustomObject]@{
                                                                            TaskUniqueId                         = $ItemJson.TaskUniqueId;
                                                                            TaskNameIdTextBox                    = $ItemJson.TaskNameIdTextBox;
                                                                            TaskGroupIdSelectBox                 = $ItemJson.TaskGroupIdSelectBox;
                                                                            TaskTypeIdSelectBox                  = $ItemJson.TaskTypeIdSelectBox;
                                                                            TaskMethodTypeIdSelectBox            = $ItemJson.TaskMethodTypeIdSelectBox;
                                                                            TaskGetMethodIdSelectBox             = $ItemJson.TaskGetMethodIdSelectBox;
                                                                            TaskGetReturnTypeIdSelectBox         = $ItemJson.TaskGetReturnTypeIdSelectBox;
                                                                            TaskGetExpirationIdSelectBox         = $ItemJson.TaskGetExpirationIdSelectBox;
                                                                            TaskSetMethodIdSelectBox             = $ItemJson.TaskSetMethodIdSelectBox;
                                                                            TaskSetReturnTypeIdSelectBox         = $ItemJson.TaskSetReturnTypeIdSelectBox;
                                                                            TaskSetTypeIdSelectBox               = $ItemJson.TaskSetTypeIdSelectBox;
                                                                            InterfaceBlocksStartPointIdSelectBox = $ItemJson.InterfaceBlocksStartPointIdSelectBox;
                                                                            InterfaceBlocksEndPointIdSelectBox   = $ItemJson.InterfaceBlocksEndPointIdSelectBox;
                                                                            EntiyGroupIdSelectBox                = $ItemJson.EntiyGroupIdSelectBox;
                                                                            EntiyModelIdSelectBox                = $ItemJson.EntiyModelIdSelectBox;
                                                                            EntiyModelAttributeIdSelectBox       = $ItemJson.EntiyModelAttributeIdSelectBox;
                                                                            TaskStartDateDayTextBox              = $ItemJson.TaskStartDateDayTextBox;
                                                                            TaskStartDateMonthTextBox            = $ItemJson.TaskStartDateMonthTextBox;
                                                                            TaskStartDateYearTextBox             = $ItemJson.TaskStartDateYearTextBox;
                                                                            TaskEndDateDayTextBox                = $ItemJson.TaskEndDateDayTextBox;
                                                                            TaskEndDateMonthTextBox              = $ItemJson.TaskEndDateMonthTextBox;
                                                                            TaskEndDateYearTextBox               = $ItemJson.TaskEndDateYearTextBox;
                                                                            TaskStartTimeHourTextBox             = $ItemJson.TaskStartTimeHourTextBox;
                                                                            TaskStartTimeMinuteTextBox           = $ItemJson.TaskStartTimeMinuteTextBox;
                                                                            TaskStartTimeSecondTextBox           = $ItemJson.TaskStartTimeSecondTextBox;
                                                                            TaskEndTimeHourTextBox               = $ItemJson.TaskEndTimeHourTextBox;
                                                                            TaskEndTimeMinuteTextBox             = $ItemJson.TaskEndTimeMinuteTextBox;
                                                                            TaskEndTimeSecondTextBox             = $ItemJson.TaskEndTimeSecondTextBox;
                                                                            TaskLimitTimeHourTextBox             = $ItemJson.TaskLimitTimeHourTextBox;
                                                                            TaskLimitTimeMinuteTextBox           = $ItemJson.TaskLimitTimeMinuteTextBox;
                                                                            TaskLimitTimeSecondTextBox           = $ItemJson.TaskLimitTimeSecondTextBox;
                                                                            TaskRepetitionTimeHourTextBox        = $ItemJson.TaskRepetitionTimeHourTextBox;
                                                                            TaskRepetitionTimeMinuteTextBox      = $ItemJson.TaskRepetitionTimeMinuteTextBox;
                                                                            TaskRepetitionTimeSecondTextBox      = $ItemJson.TaskRepetitionTimeSecondTextBox;
                                                                            TaskWindowStyleIdSelectBox           = $ItemJson.TaskWindowStyleIdSelectBox;
                                                                            TaskSelectScriptTypeBox              = $ItemJson.TaskSelectScriptTypeBox;
                                                                            TaskScriptblockLanguageSelectBox     = $ItemJson.TaskScriptblockLanguageSelectBox;
                                                                            TaskScriptBlockFullName              = $ItemJson.TaskScriptBlockFullName;
                                                                            TaskStatus                           = 'Active'
                                                                        }
                                                                        $TaskContentToJson = $TaskContentPSCO|ConvertTo-Json
                                                                        if(Test-Path $ItemFullName){
                                                                            $CheckedResult = $True
                                                                            $Save = Set-Content $TaskFullName -Value $TaskContentToJson -Force
                                                                            Set-UDElement -Id $TaskStatusId -Properties @{Checked=$CheckedResult}
                                                                            Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                            Show-UDToast -Message 'Task is activated!' -MessageColor 'Black' -BackgroundColor 'green' -Icon 'Check' -Title 'Succes:' -Duration 5000
                                                                        }
                                                                        else{
                                                                            $CheckedResult = $False
                                                                            Set-UDElement -Id $TaskStatusId -Properties @{Checked=$CheckedResult}
                                                                            Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                            Show-UDToast -Message 'Task full name path is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                        }
                                                                    }
                                                                    else{
                                                                        $ItemFullName   = $TaskFullName
                                                                        $ItemFullNameGc = gc $ItemFullName
                                                                        $ItemJson       = $ItemFullNameGc | ConvertFrom-Json
                                                                        $TaskContentPSCO = [PSCustomObject]@{
                                                                            TaskUniqueId                         = $ItemJson.TaskUniqueId;
                                                                            TaskNameIdTextBox                    = $ItemJson.TaskNameIdTextBox;
                                                                            TaskGroupIdSelectBox                 = $ItemJson.TaskGroupIdSelectBox;
                                                                            TaskTypeIdSelectBox                  = $ItemJson.TaskTypeIdSelectBox;
                                                                            TaskMethodTypeIdSelectBox            = $ItemJson.TaskMethodTypeIdSelectBox;
                                                                            TaskGetMethodIdSelectBox             = $ItemJson.TaskGetMethodIdSelectBox;
                                                                            TaskGetReturnTypeIdSelectBox         = $ItemJson.TaskGetReturnTypeIdSelectBox;
                                                                            TaskGetExpirationIdSelectBox         = $ItemJson.TaskGetExpirationIdSelectBox;
                                                                            TaskSetMethodIdSelectBox             = $ItemJson.TaskSetMethodIdSelectBox;
                                                                            TaskSetReturnTypeIdSelectBox         = $ItemJson.TaskSetReturnTypeIdSelectBox;
                                                                            TaskSetTypeIdSelectBox               = $ItemJson.TaskSetTypeIdSelectBox;
                                                                            InterfaceBlocksStartPointIdSelectBox = $ItemJson.InterfaceBlocksStartPointIdSelectBox;
                                                                            InterfaceBlocksEndPointIdSelectBox   = $ItemJson.InterfaceBlocksEndPointIdSelectBox;
                                                                            EntiyGroupIdSelectBox                = $ItemJson.EntiyGroupIdSelectBox;
                                                                            EntiyModelIdSelectBox                = $ItemJson.EntiyModelIdSelectBox;
                                                                            EntiyModelAttributeIdSelectBox       = $ItemJson.EntiyModelAttributeIdSelectBox;
                                                                            TaskStartDateDayTextBox              = $ItemJson.TaskStartDateDayTextBox;
                                                                            TaskStartDateMonthTextBox            = $ItemJson.TaskStartDateMonthTextBox;
                                                                            TaskStartDateYearTextBox             = $ItemJson.TaskStartDateYearTextBox;
                                                                            TaskEndDateDayTextBox                = $ItemJson.TaskEndDateDayTextBox;
                                                                            TaskEndDateMonthTextBox              = $ItemJson.TaskEndDateMonthTextBox;
                                                                            TaskEndDateYearTextBox               = $ItemJson.TaskEndDateYearTextBox;
                                                                            TaskStartTimeHourTextBox             = $ItemJson.TaskStartTimeHourTextBox;
                                                                            TaskStartTimeMinuteTextBox           = $ItemJson.TaskStartTimeMinuteTextBox;
                                                                            TaskStartTimeSecondTextBox           = $ItemJson.TaskStartTimeSecondTextBox;
                                                                            TaskEndTimeHourTextBox               = $ItemJson.TaskEndTimeHourTextBox;
                                                                            TaskEndTimeMinuteTextBox             = $ItemJson.TaskEndTimeMinuteTextBox;
                                                                            TaskEndTimeSecondTextBox             = $ItemJson.TaskEndTimeSecondTextBox;
                                                                            TaskLimitTimeHourTextBox             = $ItemJson.TaskLimitTimeHourTextBox;
                                                                            TaskLimitTimeMinuteTextBox           = $ItemJson.TaskLimitTimeMinuteTextBox;
                                                                            TaskLimitTimeSecondTextBox           = $ItemJson.TaskLimitTimeSecondTextBox;
                                                                            TaskRepetitionTimeHourTextBox        = $ItemJson.TaskRepetitionTimeHourTextBox;
                                                                            TaskRepetitionTimeMinuteTextBox      = $ItemJson.TaskRepetitionTimeMinuteTextBox;
                                                                            TaskRepetitionTimeSecondTextBox      = $ItemJson.TaskRepetitionTimeSecondTextBox;
                                                                            TaskWindowStyleIdSelectBox           = $ItemJson.TaskWindowStyleIdSelectBox;
                                                                            TaskSelectScriptTypeBox              = $ItemJson.TaskSelectScriptTypeBox;
                                                                            TaskScriptblockLanguageSelectBox     = $ItemJson.TaskScriptblockLanguageSelectBox;
                                                                            TaskScriptBlockFullName              = $ItemJson.TaskScriptBlockFullName;
                                                                            TaskStatus                           = 'Inactive'
                                                                        }
                                                                        $TaskContentToJson = $TaskContentPSCO|ConvertTo-Json
                                                                        if(Test-Path $ItemFullName){
                                                                            $CheckedResult = $False
                                                                            $Save = Set-Content $TaskFullName -Value $TaskContentToJson -Force
                                                                            Set-UDElement -Id $TaskStatusId -Properties @{Checked=$CheckedResult}
                                                                            Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                            Show-UDToast -Message 'Task is deactivated!' -MessageColor 'Black' -BackgroundColor 'green' -Icon 'Check' -Title 'Success:' -Duration 5000
                                                                            Show-UDToast -Message 'Datetime is not current and the task cannot be activated!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                        }
                                                                        else{
                                                                            $CheckedResult = $False
                                                                            Set-UDElement -Id $TaskStatusId -Properties @{Checked=$CheckedResult}
                                                                            Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                            Show-UDToast -Message 'Task full name path is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                            Show-UDToast -Message 'Datetime is not current and the task cannot be activated!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                        }
                                                                    }
                                                                }
                                                            }                                                                
                                                        } -Style '
                                                        #importtoggleId {
                                                            
                                                        }
                                                        .MuiSwitch-root {
                                                            display: inline-flex;
                                                            width: 58px;
                                                            height: 38px;
                                                            overflow: hidden;
                                                            box-sizing: border-box;
                                                            position: relative;
                                                            flex-shrink: 0;
                                                            z-index: 0;
                                                            vertical-align: middle;
                                                        }
                                                        .MuiSwitch-switchBase {
                                                            padding: 8px;
                                                        }
                                                        '
                                                    } -replace 'importstartdateyear',(2000+($Item.TaskStartDate).year) -replace 'importstartdatemonth',($Item.TaskStartDate).month -replace 'importstartdateday',($Item.TaskStartDate).day -replace 'importenddateyear',(2000+($Item.TaskEndDate).year) -replace 'importenddatemonth',($Item.TaskEndDate).month -replace 'importenddateday',($Item.TaskEndDate).day -replace 'importtaskfullname',"$($EventData.TaskFullName)"
                                                    $TaskStatusSC|iex
                                                }
                                                New-UDTableColumn -Property TaskEdit -Title ' ' -Width 0 -IncludeInSearch -Render {
                                                    $TaskMiniMenuId = ('TaskMiniMenuId-'+"$($EventData.TaskUniqueId)")
                                                    $TaskMiniMenuSC = {
                                                        New-UDLink -Id $TaskMiniMenuId -Children {
                                                            New-UDIcon -Icon EllipsisV -Style @{color='Gray';padding='0px'}
                                                        } -OnClick {
                                                            Show-UDModal -Header {
                                                                New-UDTypography -Text ('Task Name: '+"$($EventData.TaskName)")
                                                            } -Content {
                                                                New-UDButton -Text "Clone Task" -OnClick { 
                                                                    Show-UDModal -Header {
                                                                        New-UDTypography -Text ('Clone Task Name: '+"$($EventData.TaskName)")
                                                                    } -Content {
                                                                        $TaskFullName = 'importtaskfullname'
                                                                        New-UDButton -Text "Yes" -OnClick {
                                                                            $NewUniqueId    = ([guid]::NewGuid()).Guid
                                                                            $GetObjectPath  = gci $TaskFullName
                                                                            $ObjectName     = $GetObjectPath.Name
                                                                            $CreateNewName  = 'CLONE-'+"$ObjectName"
                                                                            $CreateNewPath  = ($GetObjectPath.DirectoryName)+'\'+"$CreateNewName"
                                                                            $ItemFullName   = $TaskFullName
                                                                            $ItemFullNameGc = gc $ItemFullName
                                                                            $ItemJson       = $ItemFullNameGc | ConvertFrom-Json
                                                                            $TaskContentPSCO = [PSCustomObject]@{
                                                                                TaskUniqueId                         = $NewUniqueId;
                                                                                TaskNameIdTextBox                    = 'CLONE-'+$ItemJson.TaskNameIdTextBox;
                                                                                TaskGroupIdSelectBox                 = $ItemJson.TaskGroupIdSelectBox;
                                                                                TaskTypeIdSelectBox                  = $ItemJson.TaskTypeIdSelectBox;
                                                                                TaskMethodTypeIdSelectBox            = $ItemJson.TaskMethodTypeIdSelectBox;
                                                                                TaskGetMethodIdSelectBox             = $ItemJson.TaskGetMethodIdSelectBox;
                                                                                TaskGetReturnTypeIdSelectBox         = $ItemJson.TaskGetReturnTypeIdSelectBox;
                                                                                TaskGetExpirationIdSelectBox         = $ItemJson.TaskGetExpirationIdSelectBox;
                                                                                TaskSetMethodIdSelectBox             = $ItemJson.TaskSetMethodIdSelectBox;
                                                                                TaskSetReturnTypeIdSelectBox         = $ItemJson.TaskSetReturnTypeIdSelectBox;
                                                                                TaskSetTypeIdSelectBox               = $ItemJson.TaskSetTypeIdSelectBox;
                                                                                InterfaceBlocksStartPointIdSelectBox = $ItemJson.InterfaceBlocksStartPointIdSelectBox;
                                                                                InterfaceBlocksEndPointIdSelectBox   = $ItemJson.InterfaceBlocksEndPointIdSelectBox;
                                                                                EntiyGroupIdSelectBox                = $ItemJson.EntiyGroupIdSelectBox;
                                                                                EntiyModelIdSelectBox                = $ItemJson.EntiyModelIdSelectBox;
                                                                                EntiyModelAttributeIdSelectBox       = $ItemJson.EntiyModelAttributeIdSelectBox;
                                                                                TaskStartDateDayTextBox              = $ItemJson.TaskStartDateDayTextBox;
                                                                                TaskStartDateMonthTextBox            = $ItemJson.TaskStartDateMonthTextBox;
                                                                                TaskStartDateYearTextBox             = $ItemJson.TaskStartDateYearTextBox;
                                                                                TaskEndDateDayTextBox                = $ItemJson.TaskEndDateDayTextBox;
                                                                                TaskEndDateMonthTextBox              = $ItemJson.TaskEndDateMonthTextBox;
                                                                                TaskEndDateYearTextBox               = $ItemJson.TaskEndDateYearTextBox;
                                                                                TaskStartTimeHourTextBox             = $ItemJson.TaskStartTimeHourTextBox;
                                                                                TaskStartTimeMinuteTextBox           = $ItemJson.TaskStartTimeMinuteTextBox;
                                                                                TaskStartTimeSecondTextBox           = $ItemJson.TaskStartTimeSecondTextBox;
                                                                                TaskEndTimeHourTextBox               = $ItemJson.TaskEndTimeHourTextBox;
                                                                                TaskEndTimeMinuteTextBox             = $ItemJson.TaskEndTimeMinuteTextBox;
                                                                                TaskEndTimeSecondTextBox             = $ItemJson.TaskEndTimeSecondTextBox;
                                                                                TaskLimitTimeHourTextBox             = $ItemJson.TaskLimitTimeHourTextBox;
                                                                                TaskLimitTimeMinuteTextBox           = $ItemJson.TaskLimitTimeMinuteTextBox;
                                                                                TaskLimitTimeSecondTextBox           = $ItemJson.TaskLimitTimeSecondTextBox;
                                                                                TaskRepetitionTimeHourTextBox        = $ItemJson.TaskRepetitionTimeHourTextBox;
                                                                                TaskRepetitionTimeMinuteTextBox      = $ItemJson.TaskRepetitionTimeMinuteTextBox;
                                                                                TaskRepetitionTimeSecondTextBox      = $ItemJson.TaskRepetitionTimeSecondTextBox;
                                                                                TaskWindowStyleIdSelectBox           = $ItemJson.TaskWindowStyleIdSelectBox;
                                                                                TaskSelectScriptTypeBox              = $ItemJson.TaskSelectScriptTypeBox;
                                                                                TaskScriptblockLanguageSelectBox     = $ItemJson.TaskScriptblockLanguageSelectBox;
                                                                                TaskScriptBlockFullName              = $ItemJson.TaskScriptBlockFullName;
                                                                                TaskStatus                           = 'Inactive'
                                                                            }
                                                                            $TaskContentToJson = $TaskContentPSCO|ConvertTo-Json
                                                                            $New = New-Item -ItemType File $CreateNewPath
                                                                            if(Test-Path $CreateNewPath){
                                                                                $Save = Set-Content $CreateNewPath -Value $TaskContentToJson -Force
                                                                                Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                                Show-UDToast -Message 'Task is cloned!' -MessageColor 'Black' -BackgroundColor 'green' -Icon Ban -Title 'Succes:' -Duration 5000
                                                                            }
                                                                            else{
                                                                                Show-UDToast -Message 'Task full name path is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                            }
                                                                            Hide-UDModal
                                                                        } -ClassName "task-center-box-btn"
                                                                        New-UDButton -Text "No" -OnClick { 
                                                                            Hide-UDModal
                                                                        } -ClassName "task-center-box-btn"
                                                                    } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "task-center-box-btn" }
                                                                } -ClassName "task-center-box-btn"
                                                                New-UDButton -Text "Edit Task" -OnClick {
                                                                    Show-UDModal -Header {
                                                                        New-UDTypography -Text ('Edit Task Name: '+"$($EventData.TaskName)")
                                                                    } -Content {
                                                                        $TaskFullName = 'importtaskfullname'
                                                                        New-UDButton -Text "Yes" -OnClick {
                                                                            $ItemFullName   = $TaskFullName
                                                                            if(Test-Path $ItemFullName){
                                                                                $ItemFullNameGc = gc $ItemFullName
                                                                                $ItemJson       = $ItemFullNameGc | ConvertFrom-Json
                                                                                $TaskContentPSCO = [PSCustomObject]@{
                                                                                    TaskUniqueId                         = $ItemJson.TaskUniqueId;
                                                                                    TaskNameIdTextBox                    = $ItemJson.TaskNameIdTextBox;
                                                                                    TaskGroupIdSelectBox                 = $ItemJson.TaskGroupIdSelectBox;
                                                                                    TaskTypeIdSelectBox                  = $ItemJson.TaskTypeIdSelectBox;
                                                                                    TaskMethodTypeIdSelectBox            = $ItemJson.TaskMethodTypeIdSelectBox;
                                                                                    TaskGetMethodIdSelectBox             = $ItemJson.TaskGetMethodIdSelectBox;
                                                                                    TaskGetReturnTypeIdSelectBox         = $ItemJson.TaskGetReturnTypeIdSelectBox;
                                                                                    TaskGetExpirationIdSelectBox         = $ItemJson.TaskGetExpirationIdSelectBox;
                                                                                    TaskSetMethodIdSelectBox             = $ItemJson.TaskSetMethodIdSelectBox;
                                                                                    TaskSetReturnTypeIdSelectBox         = $ItemJson.TaskSetReturnTypeIdSelectBox;
                                                                                    TaskSetTypeIdSelectBox               = $ItemJson.TaskSetTypeIdSelectBox;
                                                                                    InterfaceBlocksStartPointIdSelectBox = $ItemJson.InterfaceBlocksStartPointIdSelectBox;
                                                                                    InterfaceBlocksEndPointIdSelectBox   = $ItemJson.InterfaceBlocksEndPointIdSelectBox;
                                                                                    EntiyGroupIdSelectBox                = $ItemJson.EntiyGroupIdSelectBox;
                                                                                    EntiyModelIdSelectBox                = $ItemJson.EntiyModelIdSelectBox;
                                                                                    EntiyModelAttributeIdSelectBox       = $ItemJson.EntiyModelAttributeIdSelectBox;
                                                                                    TaskStartDateDayTextBox              = $ItemJson.TaskStartDateDayTextBox;
                                                                                    TaskStartDateMonthTextBox            = $ItemJson.TaskStartDateMonthTextBox;
                                                                                    TaskStartDateYearTextBox             = $ItemJson.TaskStartDateYearTextBox;
                                                                                    TaskEndDateDayTextBox                = $ItemJson.TaskEndDateDayTextBox;
                                                                                    TaskEndDateMonthTextBox              = $ItemJson.TaskEndDateMonthTextBox;
                                                                                    TaskEndDateYearTextBox               = $ItemJson.TaskEndDateYearTextBox;
                                                                                    TaskStartTimeHourTextBox             = $ItemJson.TaskStartTimeHourTextBox;
                                                                                    TaskStartTimeMinuteTextBox           = $ItemJson.TaskStartTimeMinuteTextBox;
                                                                                    TaskStartTimeSecondTextBox           = $ItemJson.TaskStartTimeSecondTextBox;
                                                                                    TaskEndTimeHourTextBox               = $ItemJson.TaskEndTimeHourTextBox;
                                                                                    TaskEndTimeMinuteTextBox             = $ItemJson.TaskEndTimeMinuteTextBox;
                                                                                    TaskEndTimeSecondTextBox             = $ItemJson.TaskEndTimeSecondTextBox;
                                                                                    TaskLimitTimeHourTextBox             = $ItemJson.TaskLimitTimeHourTextBox;
                                                                                    TaskLimitTimeMinuteTextBox           = $ItemJson.TaskLimitTimeMinuteTextBox;
                                                                                    TaskLimitTimeSecondTextBox           = $ItemJson.TaskLimitTimeSecondTextBox;
                                                                                    TaskRepetitionTimeHourTextBox        = $ItemJson.TaskRepetitionTimeHourTextBox;
                                                                                    TaskRepetitionTimeMinuteTextBox      = $ItemJson.TaskRepetitionTimeMinuteTextBox;
                                                                                    TaskRepetitionTimeSecondTextBox      = $ItemJson.TaskRepetitionTimeSecondTextBox;
                                                                                    TaskWindowStyleIdSelectBox           = $ItemJson.TaskWindowStyleIdSelectBox;
                                                                                    TaskSelectScriptTypeBox              = $ItemJson.TaskSelectScriptTypeBox;
                                                                                    TaskScriptblockLanguageSelectBox     = $ItemJson.TaskScriptblockLanguageSelectBox;
                                                                                    TaskScriptBlockFullName              = $ItemJson.TaskScriptBlockFullName;
                                                                                    TaskStatus                           = $ItemJson.TaskStatus;
                                                                                }
                                                                                $Session:RecoveryTaskContentPSCO      = $TaskContentPSCO
                                                                                $Session:RecoveryTaskContentCondition = $True
                                                                                Invoke-UDRedirect -Url '/createnewtask'
                                                                            }
                                                                            else{
                                                                                Show-UDToast -Message 'Task full name path is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                            }
                                                                            Hide-UDModal
                                                                        } -ClassName "task-center-box-btn"
                                                                        New-UDButton -Text "No" -OnClick { 
                                                                            Hide-UDModal
                                                                        } -ClassName "task-center-box-btn"
                                                                    } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "task-center-box-btn" }
                                                                } -ClassName "task-center-box-btn"                                                                
                                                                New-UDButton -Text "Remove Task" -OnClick {
                                                                    Show-UDModal -Header {
                                                                        New-UDTypography -Text ('Remove Task Name: '+"$($EventData.TaskName)")
                                                                    } -Content {
                                                                        $TaskFullName = 'importtaskfullname'
                                                                        New-UDButton -Text "Yes" -OnClick {
                                                                            if(Test-Path $TaskFullName){
                                                                                $Remove = Remove-Item $TaskFullName -Force
                                                                                Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                                Show-UDToast -Message 'Task is removed!' -MessageColor 'Black' -BackgroundColor 'green' -Icon Ban -Title 'Succes:' -Duration 5000
                                                                            }
                                                                            else{
                                                                                Show-UDToast -Message 'Task full name path is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                            }
                                                                            Hide-UDModal
                                                                        } -ClassName "task-center-box-btn"
                                                                        New-UDButton -Text "No" -OnClick { 
                                                                            Hide-UDModal
                                                                        } -ClassName "task-center-box-btn"
                                                                    } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "task-center-box-btn" }
                                                                } -ClassName "task-center-box-btn"
                                                                New-UDButton -Text "Rename Task" -OnClick {
                                                                    Show-UDModal -Header {
                                                                        New-UDTypography -Text ('Rename Task Name: '+"$($EventData.TaskName)")
                                                                    } -Content {
                                                                        New-UDElement -Tag 'Table' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDElement -Tag 'td' -Content {
                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                        New-UDTypography -Text 'New Task Name' -ClassName 'task-center-box-inner-title' -Style @{width='100px'}
                                                                                    }
                                                                                }
                                                                                New-UDElement -Tag 'td' -Content {
                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                        New-UDTextbox -Id 'TaskNameIdTextBox' -Type text -ClassName 'task-center-box-task-name-text'
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        $TaskFullName = 'importtaskfullname'
                                                                        New-UDButton -Text "Save" -OnClick {
                                                                            $NewName = (Get-UDElement -Id 'TaskNameIdTextBox').Value
                                                                            if($null -eq $NewName -or '' -eq $NewName -or ' ' -eq $NewName -or $true -eq $($NewName -match '\\') -or $true -eq $($NewName -match ' ')){
                                                                                Show-UDToast -Message 'Task name is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                            }
                                                                            else{
                                                                                $GetObjectPath  = gci $TaskFullName
                                                                                $ObjectName     = $GetObjectPath.Name
                                                                                $CreateNewName  = ((Get-UDElement -Id 'TaskNameIdTextBox').Value)+'.'+("$ObjectName" -replace '.*[.]')
                                                                                $CreateNewPath  = ($GetObjectPath.DirectoryName)+'\'+"$CreateNewName"
                                                                                $ItemFullName   = $TaskFullName
                                                                                $ItemFullNameGc = gc $ItemFullName
                                                                                $ItemJson       = $ItemFullNameGc | ConvertFrom-Json
                                                                                $TaskContentPSCO = [PSCustomObject]@{
                                                                                    TaskUniqueId                         = $ItemJson.TaskUniqueId;
                                                                                    TaskNameIdTextBox                    = $NewName;
                                                                                    TaskGroupIdSelectBox                 = $ItemJson.TaskGroupIdSelectBox;
                                                                                    TaskTypeIdSelectBox                  = $ItemJson.TaskTypeIdSelectBox;
                                                                                    TaskMethodTypeIdSelectBox            = $ItemJson.TaskMethodTypeIdSelectBox;
                                                                                    TaskGetMethodIdSelectBox             = $ItemJson.TaskGetMethodIdSelectBox;
                                                                                    TaskGetReturnTypeIdSelectBox         = $ItemJson.TaskGetReturnTypeIdSelectBox;
                                                                                    TaskGetExpirationIdSelectBox         = $ItemJson.TaskGetExpirationIdSelectBox;
                                                                                    TaskSetMethodIdSelectBox             = $ItemJson.TaskSetMethodIdSelectBox;
                                                                                    TaskSetReturnTypeIdSelectBox         = $ItemJson.TaskSetReturnTypeIdSelectBox;
                                                                                    TaskSetTypeIdSelectBox               = $ItemJson.TaskSetTypeIdSelectBox;
                                                                                    InterfaceBlocksStartPointIdSelectBox = $ItemJson.InterfaceBlocksStartPointIdSelectBox;
                                                                                    InterfaceBlocksEndPointIdSelectBox   = $ItemJson.InterfaceBlocksEndPointIdSelectBox;
                                                                                    EntiyGroupIdSelectBox                = $ItemJson.EntiyGroupIdSelectBox;
                                                                                    EntiyModelIdSelectBox                = $ItemJson.EntiyModelIdSelectBox;
                                                                                    EntiyModelAttributeIdSelectBox       = $ItemJson.EntiyModelAttributeIdSelectBox;
                                                                                    TaskStartDateDayTextBox              = $ItemJson.TaskStartDateDayTextBox;
                                                                                    TaskStartDateMonthTextBox            = $ItemJson.TaskStartDateMonthTextBox;
                                                                                    TaskStartDateYearTextBox             = $ItemJson.TaskStartDateYearTextBox;
                                                                                    TaskEndDateDayTextBox                = $ItemJson.TaskEndDateDayTextBox;
                                                                                    TaskEndDateMonthTextBox              = $ItemJson.TaskEndDateMonthTextBox;
                                                                                    TaskEndDateYearTextBox               = $ItemJson.TaskEndDateYearTextBox;
                                                                                    TaskStartTimeHourTextBox             = $ItemJson.TaskStartTimeHourTextBox;
                                                                                    TaskStartTimeMinuteTextBox           = $ItemJson.TaskStartTimeMinuteTextBox;
                                                                                    TaskStartTimeSecondTextBox           = $ItemJson.TaskStartTimeSecondTextBox;
                                                                                    TaskEndTimeHourTextBox               = $ItemJson.TaskEndTimeHourTextBox;
                                                                                    TaskEndTimeMinuteTextBox             = $ItemJson.TaskEndTimeMinuteTextBox;
                                                                                    TaskEndTimeSecondTextBox             = $ItemJson.TaskEndTimeSecondTextBox;
                                                                                    TaskLimitTimeHourTextBox             = $ItemJson.TaskLimitTimeHourTextBox;
                                                                                    TaskLimitTimeMinuteTextBox           = $ItemJson.TaskLimitTimeMinuteTextBox;
                                                                                    TaskLimitTimeSecondTextBox           = $ItemJson.TaskLimitTimeSecondTextBox;
                                                                                    TaskRepetitionTimeHourTextBox        = $ItemJson.TaskRepetitionTimeHourTextBox;
                                                                                    TaskRepetitionTimeMinuteTextBox      = $ItemJson.TaskRepetitionTimeMinuteTextBox;
                                                                                    TaskRepetitionTimeSecondTextBox      = $ItemJson.TaskRepetitionTimeSecondTextBox;
                                                                                    TaskWindowStyleIdSelectBox           = $ItemJson.TaskWindowStyleIdSelectBox;
                                                                                    TaskSelectScriptTypeBox              = $ItemJson.TaskSelectScriptTypeBox;
                                                                                    TaskScriptblockLanguageSelectBox     = $ItemJson.TaskScriptblockLanguageSelectBox;
                                                                                    TaskScriptBlockFullName              = $ItemJson.TaskScriptBlockFullName;
                                                                                    TaskStatus                           = 'Inactive';
                                                                                }
                                                                                $TaskContentToJson = $TaskContentPSCO|ConvertTo-Json
                                                                                if(Test-Path $TaskFullName){
                                                                                    if(Test-Path $CreateNewPath){
                                                                                        Show-UDToast -Message 'Task name is exist!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                                    }
                                                                                    else{
                                                                                        $Save = Set-Content $TaskFullName -Value $TaskContentToJson -Force
                                                                                        $Rename = Rename-Item $TaskFullName $CreateNewPath -Force
                                                                                        Sync-UDElement -Id 'TaskCenterGroupListDynamicId'
                                                                                        Show-UDToast -Message 'Task is renamed!' -MessageColor 'Black' -BackgroundColor 'green' -Icon Ban -Title 'Succes:' -Duration 5000
                                                                                    }
                                                                                }
                                                                                else{
                                                                                    Show-UDToast -Message 'Task full name path is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                                }
                                                                                Hide-UDModal
                                                                            }

                                                                        } -ClassName "task-center-box-btn"
                                                                    } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "task-center-box-btn" }
                                                                } -ClassName "task-center-box-btn"
                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "task-center-box-btn" }
                                                        }
                                                    } -replace 'importtaskfullname',"$($EventData.TaskFullName)"
                                                    $TaskMiniMenuSC|iex
                                                }
                                            )
                                            
                                            New-UDStyle -Content {
                                                New-UDTable -Id ('TaskGroupDetailList_table_'+"$($EventData.TaskGroup)") -Data $DatasetDataTable -Columns $DatasetDataColumns -PageSize 1000 -ShowSearch -Dense
                                            } -Style '
                                                margin-left: -22px;
                                                .MuiTableRow-head {
                                                    background-color: #FFFFF0;
                                                }
                                                .MuiTypography-root {
                                                    font-size: 12px;
                                                    font-weight: 400;
                                                }
                                                .MuiTableCell-head {
                                                    padding 2px 0px 1px 5px;
                                                    font-size: 11px;
                                                }
                                                .MuiTableRow-root {
                                                    background-color: #FFFFF0;
                                                }
                                            '
                                        }
                                    } -Style '
                                    font-size: 7px;
                                    width: 99%;
                                    .MuiTableBody-root .MuiTableRow-root:hover {
                                        background-color: #f8f8f8;
                                    }
                                    .MuiTableCell-root {
                                        padding 2px 5px 0px;
                                        line-heigh: 1;
                                    }
                                    .MuiSelect-select {
                                        padding-top: 0px;
                                        padding-bottom: 0px;
                                        padding-left: 5px;
                                        padding-right: 5px;
                                    }
                                    .MuiTableRow-head {
                                        padding-top: 0px;
                                        padding-bottom: 0px;
                                        padding-left: 5px;
                                        padding-right: 5px;   
                                    }
                                    .MuiToolbar-root {
                                        padding-top: 0px;
                                        padding-bottom: 0px;
                                        padding-left: 5px;
                                        padding-right: 5px;           
                                    }
                                    .css-6tsndk {
                                        position: relative;
                                        display: flex;
                                        -webkit-box-align: center;
                                        align-items: center;
                                        padding-left: 16px;
                                        padding-right: 16px;
                                        min-height: 8px;
                                    }
                                    .css-1ep437t {
                                        width: 5px;
                                        border: 0px solid currentColor;
                                        height: 16px;
                                        margin-top: 0px;
                                        margin-left: 0px;
                                        background-color: #3b3b3b;
                                        border-radius: 0px;
                                    }
                                    .css-mnn31 {
                                        padding: 0px -5px 0px 5px;
                                        position: relative;
                                        font-size: 10px;
                                        transition: border-color 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,box-shadow 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
                                        border-radius: 0px;
    
                                    }
                                    .css-jswlw {
                                        border-radius: 12px;
                                        box-sizing: content-box;
                                        display: inline-block;
                                        position: relative;
                                        cursor: pointer;
                                        touch-action: none;
                                        color: rgb(59, 59, 59);
                                        -webkit-tap-highlight-color: transparent;
                                        height: 0px;
                                        width: 100%;
                                        padding: 4px 0px;
                                    }
                                    .MuiSelect-select {
                                        height: auto;
                                        min-height: 1.4375em;
                                        text-overflow: ellipsis;
                                        white-space: nowrap;
                                        overflow: hidden;
                                        border-radius: 0px;
                                    }
                                    .MuiSlider-valueLabel {
                                        min-width: 20px;
                                        font-size: 8px;
                                        right: 12px;
                                        top: calc(-50% - 3px);
                                    }
                                    .css-vubbuv {
                                        user-select: none;
                                        width: 1em;
                                        height: 1em;
                                        display: inline-block;
                                        fill: currentcolor;
                                        flex-shrink: 0;
                                        transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
                                        font-size: 0.9rem;
                                    }
                                    .MuiTypography-root {
                                        font-size: 14px;
                                        font-weight: 400;
                                    }
                                    .MuiTypography-noWrap {
                                        font-size: 16px;
                                        font-weight: 600;
                                    }
                                    '
                                }
                            }
                        }
                    }
                    New-UDElement -Tag 'p' -Content {}
                    New-UDElement -Tag 'p' -Content {}
                    New-UDElement -Tag 'Table' -Content {
                        New-UDElement -Tag 'Tr' -Content {
                            New-UDElement -Tag 'td' -Content {
                                New-UDButton -Text "Create New Task" -OnClick { Invoke-UDRedirect -Url '/createnewtask' } -ClassName "task-center-box-btn"
                            }
                        }
                        New-UDElement -Tag 'Tr' -Content {
                            New-UDElement -Tag 'td' -Content {
                                New-UDButton -Text "Create New Task Group" -OnClick { Invoke-UDRedirect -Url '/createnewtaskgroup' } -ClassName "task-center-box-btn"
                            }
                        }
                        New-UDElement -Tag 'Tr' -Content {
                            New-UDElement -Tag 'td' -Content {
                                New-UDButton -Text "Create New Task Type" -OnClick { Invoke-UDRedirect -Url '/createnewtasktype' } -ClassName "task-center-box-btn"
                            }
                        }                                                
                    }
                }
            }                 
        } -Elevation 1
    }
}

New-UDGrid -Spacing 1 -Container -Content {
    $MainSC|iex
}




