$Session:SelectedTaskGroupRow = $null

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
                                    New-UDTypography -Text 'Task Group Form' -ClassName 'task-center-box-title'
                                }
                            }
                        }
                    }
                    New-UDElement -Tag 'div' -Content {
                        # DATA FORMAT
                        $Data = @()

                        # TASK TYPE LIST
                        $Cache:TaskGroupSC|iex
                        $Session:TaskCenterTaskGroupListData = @(
                            if($null -ne $Cache:TaskGroupList){
                                foreach ($Item in $Cache:TaskGroupList) {
                                    $TaskGroupName = $Item.Name
                                    @{Name = $TaskGroupName}
                                }
                            }
                        )
                        $Data += $Session:TaskCenterTaskGroupListData
                        
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
                                New-UDTableColumn -ShowSort -Property Name -Title 'Name' -IncludeInSearch -Render {
                                    New-UDTypography -Text "$($EventData.Name)"
                                }
                            )
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'div' -Content {
                                            New-UDStyle -Content {
                                                New-UDTable -Id 'TaskGroupListFull_table' -Data $Data -Columns $Columns -Title 'Task Group List' -ShowSearch -ShowPagination -ShowSelection -DisableMultiSelect -Dense -OnRowSelection {
                                                    $Session:SelectedTaskGroupRow = $Body
                                                } -PageSize 20 -ShowRefresh 
                                            } -Style '
                                            font-size: 7px;
                                            width: 99%;
                                            .MuiFormControlLabel-root {
                                                display: inline-flex;
                                                -webkit-box-align: center;
                                                align-items: center;
                                                cursor: pointer;
                                                vertical-align: middle;
                                                -webkit-tap-highlight-color: transparent;
                                            }
                                            .MuiCheckbox-root {
                                                margin-left: 0px;
                                                margin-bottom: 2px;
                                            }
                                            .MuiTableCell-root {
                                                padding 2px 0px 1px 5px;
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
                        }
                    }

                    New-UDElement -Tag 'table' -Content {
                        New-UDElement -Tag 'tr' -Content {
                            New-UDElement -Tag 'td' -Content {
                                New-UDButton -Text 'Create Task Group' -ClassName 'task-center-box-btn' -OnClick {
                                    Show-UDModal -Header {
                                        New-UDTypography -Text 'Create Task Group' -ClassName 'task-center-box-inner-title'
                                    } -Content {
                                        New-UDElement -Tag 'div' -Content {
                                            New-UDElement -Tag 'table' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTypography -Text 'Task Group Name' -ClassName 'task-center-box-inner-title'
                                                        }
                                                    }
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTextbox -Id 'TaskGroupNameIdTextBox' -Type text -ClassName 'task-center-box-task-name-text'
                                                        }
                                                    }
                                                }
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDButton -Text 'Create Task Group' -ClassName 'task-center-box-btn' -OnClick {
                                                            $GetTaskTypeGroup = (Get-UDElement -Id 'TaskGroupNameIdTextBox').Value
                                                            $TaskGroupPath = ("$Cache:TaskGroupDatabasePath"+"$GetTaskTypeGroup")
                                                            if(Test-Path $TaskGroupPath){
                                                                Show-UDToast -Message 'Type name is exist!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                            }
                                                            else{
                                                                New-Item -ItemType Directory $TaskGroupPath
                                                                Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+'app/'+"$Cache:RootControllerType"+'/createnewtaskgroup')
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    } -Footer {
                                        New-UDButton -Text 'Close' -ClassName 'task-center-box-btn' -OnClick {Hide-UDModal}
                                    }
                                }
                            }
                            New-UDElement -Tag 'td' -Content {
                                New-UDButton -Text 'Remove Task Group' -ClassName 'task-center-box-btn' -OnClick {
                                    $GetTaskGroup = ($Session:SelectedTaskGroupRow|ConvertFrom-Json).Name
                                    if($GetTaskGroup){
                                        Show-UDModal -Header {
                                            New-UDTypography -Text 'Remove Selected Task Group' -ClassName 'task-center-box-inner-title'
                                        } -Content {
                                            New-UDButton -Text 'Yes' -ClassName 'task-center-box-btn' -OnClick {
                                                foreach ($Name in $GetTaskGroup) {
                                                    $CreateRemovePath = "$Cache:TaskGroupDatabasePath"+"$Name"
                                                    if(Test-Path $CreateRemovePath){
                                                        Remove-Item $CreateRemovePath -Force
                                                    }
                                                }
                                                Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+'app/'+"$Cache:RootControllerType"+'/createnewtaskgroup')
                                            }
                                            New-UDButton -Text 'No' -ClassName 'task-center-box-btn' -OnClick {Hide-UDModal}
                                        } -Footer {
                                            New-UDButton -Text 'Close' -ClassName 'task-center-box-btn' -OnClick {Hide-UDModal}
                                        }
                                    }
                                    else{
                                        Show-UDToast -Message 'Group name is not selected!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                    }

                                }
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