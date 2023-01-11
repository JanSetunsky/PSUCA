$Session:MainHash0 = $null
$Session:MainHash1 = $null
$Session:MainHash2 = $null
$Session:MainHash3 = $null
$Session:MainHash4 = $null
$Session:MainHash5 = $null
$Session:MainHash6 = $null
$Session:MainHash7 = $null
$Session:MainHash8 = $null
$Session:MainHash9 = $null

$Session:TerminalHash0 = $null
$Session:TerminalHash1 = $null
$Session:TerminalHash2 = $null
$Session:TerminalHash3 = $null
$Session:TerminalHash4 = $null
$Session:TerminalHash5 = $null
$Session:TerminalHash6 = $null
$Session:TerminalHash7 = $null
$Session:TerminalHash8 = $null
$Session:TerminalHash9 = $null

$Session:MainHashPSCO = $null
$Session:TerminalHashPSCO = $null

$MainSC = {
    New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
        New-UDPaper -ClassName "interface-box-layout" -Square -Content {
            New-UDRow -Columns {
                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                    New-UDElement -Tag 'table' -Content {
                        New-UDElement -Tag 'tr' -Content {
                            New-UDElement -Tag 'td' -Content {
                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'interface-center-box-logo'
                            }
                            New-UDElement -Tag 'td' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDTypography -Text 'Create New Psuca Dashboard Form' -ClassName 'interface-box-title'
                                }
                            }
                        }
                    }
                    New-UDStyle -Content {
                        New-UDForm -Id 'Interface-Container-Form' -Children {
                            New-UDElement -Tag 'div' -Content {
                                New-UDElement -Tag 'table' -Content {
                                    $Session:TerminalSelectBoxResult = 1
                                    New-UDDynamic -Id 'MainDynamicSelectboxId' -Content {
                                        if($Session:TerminalSelectBoxResult -eq 1 -or $Session:TerminalSelectBoxResult -eq 2){
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTypography -Text 'Main Name' -ClassName 'interface-box-inner-title'
                                                    }
                                                }
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTextbox -Id 'ItemNameIdTextBox' -Type text -ClassName 'interface-box-text'
                                                    }
                                                }
                                            }
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTypography -Text 'Main Status Variable' -ClassName 'interface-box-inner-title'
                                                    }
                                                }
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTextbox -Id 'ItemVariableNameIdTextBox' -Type text -ClassName 'interface-box-text'
                                                    }
                                                }
                                            }
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTypography -Text 'Main Buttons Count' -ClassName 'interface-box-inner-title'
                                                    }
                                                }
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        $Session:ButtonsMainCountValue = 0
                                                        New-UDDynamic -Id 'ButtonsRowMainCountIdTextBoxDynamic' -Content {
                                                            New-UDTextbox -Id 'ButtonsRowMainCountIdTextBox' -Type text -ClassName 'interface-box-text' -Value $Session:ButtonsMainCountValue
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        else{}
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Terminal' -ClassName 'interface-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDStyle -Content {
                                                    New-UDSelect -Id 'TerminalResultIdSelectBox' -ClassName 'interface-box-terminal-select' -Option {
                                                        New-UDSelectOption -Name 'Off' -Value 1
                                                        New-UDSelectOption -Name 'On' -Value 2
                                                        New-UDSelectOption -Name 'Only Terminal' -Value 3
                                                    } -OnChange {
                                                        
                                                        $Session:TerminalSelectBoxResult = $EventData
                                                        
                                                        Sync-UDElement -Id 'MainDynamicSelectboxId'
                                                        Sync-UDElement -Id 'TerminalDynamicSelectboxId'
                                                    }
                                                } -Style '
                                                    label + .css-1ntzb12 {
                                                        margin-top: 0px;
                                                    }
                                                '
                                            }
                                        }
                                    }
                                    New-UDDynamic -Id 'TerminalDynamicSelectboxId' -Content {
                                        if($Session:TerminalSelectBoxResult -eq 2 -or $Session:TerminalSelectBoxResult -eq 3){
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTypography -Text 'Terminal Name' -ClassName 'interface-box-inner-title'
                                                    }
                                                }
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTextbox -Id 'TerminalItemNameIdTextBox' -Type text -ClassName 'interface-box-text'
                                                    }
                                                }
                                            }
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTypography -Text 'Terminal Status Variable' -ClassName 'interface-box-inner-title'
                                                    }
                                                }
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTextbox -Id 'ItemTerminalVariableNameIdTextBox' -Type text -ClassName 'interface-box-text'
                                                    }
                                                }
                                            }
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTypography -Text 'Terminal Buttons Count' -ClassName 'interface-box-inner-title'
                                                    }
                                                }
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        $Session:ButtonsTerminalCountValue = 0
                                                        New-UDDynamic -Id 'ButtonsRowTerminalCountIdTextBoxDynamic' -Content {
                                                            New-UDTextbox -Id 'ButtonsRowTerminalCountIdTextBox' -Type text -ClassName 'interface-box-text' -Value $Session:ButtonsTerminalCountValue
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }


                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDButton -Text "Generate" -OnClick {
                                                    $Session:MainHash0 = $null
                                                    $Session:MainHash1 = $null
                                                    $Session:MainHash2 = $null
                                                    $Session:MainHash3 = $null
                                                    $Session:MainHash4 = $null
                                                    $Session:MainHash5 = $null
                                                    $Session:MainHash6 = $null
                                                    $Session:MainHash7 = $null
                                                    $Session:MainHash8 = $null
                                                    $Session:MainHash9 = $null
                                                    
                                                    $Session:TerminalHash0 = $null
                                                    $Session:TerminalHash1 = $null
                                                    $Session:TerminalHash2 = $null
                                                    $Session:TerminalHash3 = $null
                                                    $Session:TerminalHash4 = $null
                                                    $Session:TerminalHash5 = $null
                                                    $Session:TerminalHash6 = $null
                                                    $Session:TerminalHash7 = $null
                                                    $Session:TerminalHash8 = $null
                                                    $Session:TerminalHash9 = $null

                                                    if($Session:TerminalSelectBoxResult -eq 2){
                                                        Set-UDElement -Id 'GenerateFullLayoutDynamicContent' -Content {$null}
                                                        Sync-UDElement -Id 'GenerateFullLayoutDynamicContent'

                                                        Sync-UDElement -Id 'GenerateButtonsPscoIdDynamic'
                                                        
                                                        Sync-UDElement -Id 'GenerateFullLayoutDynamicTerminalContent'
                                                        Sync-UDElement -Id 'TerminalItemNameDynamicId'
                                                        Sync-UDElement -Id 'TerminalItemVariableNamePart1DynamicId'
                                                        Sync-UDElement -Id 'TerminalItemVariableNamePart2DynamicId'
                                                        Sync-UDElement -Id 'TerminalButtonRowDynamicId'

                                                        Sync-UDElement -Id 'GenerateFullLayoutDynamicContent'
                                                        Sync-UDElement -Id 'ItemNameDynamicId'
                                                        Sync-UDElement -Id 'ItemVariableNamePart1DynamicId'
                                                        Sync-UDElement -Id 'ItemVariableNamePart2DynamicId'
                                                        Sync-UDElement -Id 'ButtonRowMainDynamicId'

                                                        Sync-UDElement -Id 'RestartButtonsFunctionParameter'
                                                    }
                                                    elseif($Session:TerminalSelectBoxResult -eq 1){
                                                        Set-UDElement -Id 'GenerateFullLayoutDynamicTerminalContent' -Content {$null}
                                                        Sync-UDElement -Id 'GenerateFullLayoutDynamicTerminalContent'

                                                        Sync-UDElement -Id 'GenerateButtonsPscoIdDynamic'

                                                        Sync-UDElement -Id 'GenerateFullLayoutDynamicContent'
                                                        Sync-UDElement -Id 'ItemNameDynamicId'
                                                        Sync-UDElement -Id 'ItemVariableNamePart1DynamicId'
                                                        Sync-UDElement -Id 'ItemVariableNamePart2DynamicId'
                                                        Sync-UDElement -Id 'ButtonRowMainDynamicId'

                                                        Sync-UDElement -Id 'RestartButtonsFunctionParameter'
                                                    }
                                                    elseif($Session:TerminalSelectBoxResult -eq 3){
                                                        Sync-UDElement -Id 'GenerateFullLayoutDynamicTerminalContent'
                                                        Sync-UDElement -Id 'MainDynamicSelectboxId'

                                                        Sync-UDElement -Id 'GenerateButtonsPscoIdDynamic'

                                                        Sync-UDElement -Id 'GenerateFullLayoutDynamicTerminalContent'
                                                        Sync-UDElement -Id 'TerminalItemNameDynamicId'
                                                        Sync-UDElement -Id 'TerminalItemVariableNamePart1DynamicId'
                                                        Sync-UDElement -Id 'TerminalItemVariableNamePart2DynamicId'
                                                        Sync-UDElement -Id 'TerminalButtonRowDynamicId'

                                                        Sync-UDElement -Id 'RestartButtonsFunctionParameter'
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    $LoadAllIcons = $Cache:LoadAllIconsCache
                                    $LoadTerminalAllIcons = $Cache:LoadTerminalAllIconsCache

                                    New-UDDynamic -Id 'GenerateFullLayoutDynamicTerminalContent' -Content {
                                        $ValidateItemNameIdTextBox         = (Get-UDElement -Id 'TerminalItemNameIdTextBox').Value
                                        $ValidateItemVariableNameIdTextBox = (Get-UDElement -Id 'ItemTerminalVariableNameIdTextBox').Value
                                        $ValidateButtonsRow1CountIdTextBox = (Get-UDElement -Id 'ButtonsRowTerminalCountIdTextBox').Value
                                        if($null -ne $ValidateItemNameIdTextBox -and $null -ne $ValidateItemVariableNameIdTextBox -and $null -ne $ValidateButtonsRow1CountIdTextBox){
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            New-UDDynamic -Id 'TerminalItemVariableNamePart1DynamicId' -Content {
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                            }
                                                            New-UDElement -Tag 'table' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDElement -Tag 'td' -Content {
                                                                        New-UDDynamic -Id 'TerminalItemVariableNamePart2DynamicId' -Content {
                                                                            New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                        }
                                                                    }
                                                                    New-UDElement -Tag 'td' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            New-UDDynamic -Id 'TerminalItemNameDynamicId' -Content {
                                                                                $GetTerminalItemName = (Get-UDElement -Id 'TerminalItemNameIdTextBox').Value
                                                                                New-UDTypography -Text $GetTerminalItemName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                    
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDDynamic -Id 'TerminalButtonRowDynamicId' -Content {
                                                                        $GetButtonRow1Count = (Get-UDElement -Id 'ButtonsRowTerminalCountIdTextBox').Value
                                                                        if($GetButtonRow1Count){
                                                                            if($GetButtonRow1Count -gt 1){
                                                                                New-UDElement -Tag 'table' -Content {
                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                        $Session:DefaultIconName = 'plus'
                                                                                        $ButtonNum = 0
                                                                                        1..$GetButtonRow1Count | % {
                                                                                            $CreateButtonVariableButtonSC    = '$'+'Session:'+'TerminalVariableButtonId'+"$ButtonNum"+'='+"$ButtonNum"
                                                                                            $CreateButtonVariableButtonSC|iex
                                                                                            $CreateButtonVariableButton      = '$'+'Session:'+'TerminalVariableButtonId'+"$ButtonNum"
                                                                                            
                                                                                            $CreateButtonVariableConditionSC = '$'+'session:'+'TerminalElementVariableId'+"$ButtonNum"+'='+'$'+'true'
                                                                                            $CreateButtonVariableCondition   = '$'+'session:'+'TerminalElementVariableId'+"$ButtonNum"
                                                                                            $CreateElementVariableId         = 'TerminalElementVariableId'+"$ButtonNum"
                                                                                            $CreateButtonVariableConditionSC|iex
                                                                                            New-UDElement -Id $CreateElementVariableId -Tag 'td' -Content {
                                                                                                New-UDLink -Children {
                                                                                                    New-UDDynamic -Id ('TerminalVariableIconDynamicId'+"$ButtonNum") -Content {
                                                                                                        New-UDIcon -Icon $Session:DefaultIconName -Size '1x' -Border -ClassName "interface-box-logo"
                                                                                                    }
                                                                                                } -OnClick {
                                                                                                    
                                                                                                    $JavascriptString = (('
                                                                                                    function RemoveElement() {
                                                                                                        const element = document.getElementById("importelementid");
                                                                                                        element.remove();
                                                                                                    }
                                                                                                    RemoveElement();') -replace 'importelementid',"$CreateElementVariableId")
                                                                                                    $Session:VariableValueNumber = $CreateButtonVariableButton|iex
                                                                                                    $CreateButtonVariableConditionSC = '$'+'session:'+'TerminalElementVariableId'+"$Session:VariableValueNumber"
                                                                                                    $SaveIconContentNumber = $Session:VariableValueNumber
                                                                                                    Show-UDToast -Message ($CreateButtonVariableConditionSC)
                                                                                                    Show-UDToast -Message ($CreateButtonVariableConditionSC|iex)
                                                                                                    Show-UDModal -Content {
                                                                                                        
                                                                                                        New-UDDynamic -Id ('TerminalVariableChangeIconDynamicId'+"$Session:VariableValueNumber") -Content {
                                                                                                            if(($CreateButtonVariableConditionSC|iex) -eq $true){
                                                                                                                $LoadTerminalAllIcons
                                                                                                            }
                                                                                                            else{
                                                                                                                New-UDButton -Text "Change icon" -OnClick {
                                                                                                                    $CreateButtonVariableConditionSC = '$'+'session:'+'TerminalElementVariableId'+"$Session:VariableValueNumber"+'='+'$'+'true'
                                                                                                                    $CreateButtonVariableConditionSC|iex
                                                                                                                    Sync-UDElement -Id ('TerminalVariableChangeIconDynamicId'+"$Session:VariableValueNumber")
                                                                                                                    
                                                                                                                } -ClassName "interface-box-btn"
                                                                                                            }
                                                                                                        }
                                                                                                        
                                                                                                    } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" } -FullWidth
                                                                                                }
                                                                                            }
                                                                                            $ButtonNum++
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif($GetButtonRow1Count -eq 1){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon Plus -Size '1x' -Border -ClassName "interface-box-logo"
                                                                                } -OnClick {
                                                                                        $VariableButtonId=0
                                                                                        Show-UDToast -Message $VariableButtonId
                                                                                        Show-UDModal -Content {
                                                                                        $LoadTerminalAllIcons
                                                                                    } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" } -FullWidth
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                } -Style '
                                                                table {
                                                                    width:100%;
                                                                    padding:0px;
                                                                }
                                                                tr {
                                                                    width:100%;
                                                                }
                                                                '
                                                            }
                                                        }
                                                    }                 
                                                } -Elevation 1
                                            }
                                        }
                                        else{
                                            
                                        }
  
                                        
                                    }


                                    New-UDDynamic -Id 'GenerateFullLayoutDynamicContent' -Content {
                                        $ValidateItemNameIdTextBox         = (Get-UDElement -Id 'ItemNameIdTextBox').Value
                                        $ValidateItemVariableNameIdTextBox = (Get-UDElement -Id 'ItemVariableNameIdTextBox').Value
                                        $ValidateButtonsRow1CountIdTextBox = (Get-UDElement -Id 'ButtonsRowMainCountIdTextBox').Value
                                        if($null -ne $ValidateItemNameIdTextBox -and $null -ne $ValidateItemVariableNameIdTextBox -and $null -ne $ValidateButtonsRow1CountIdTextBox){
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            New-UDDynamic -Id 'ItemVariableNamePart1DynamicId' -Content {
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                            }
                                                            New-UDElement -Tag 'table' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDElement -Tag 'td' -Content {
                                                                        New-UDDynamic -Id 'ItemVariableNamePart2DynamicId' -Content {
                                                                            New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                        }
                                                                    }
                                                                    New-UDElement -Tag 'td' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            New-UDDynamic -Id 'ItemNameDynamicId' -Content {
                                                                                $GetItemName = (Get-UDElement -Id 'ItemNameIdTextBox').Value
                                                                                New-UDTypography -Text $GetItemName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                    
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDDynamic -Id 'ButtonRowMainDynamicId' -Content {
                                                                        $GetButtonRow1Count = (Get-UDElement -Id 'ButtonsRowMainCountIdTextBox').Value
                                                                        if($GetButtonRow1Count){
                                                                            if($GetButtonRow1Count -gt 1){
                                                                                New-UDElement -Tag 'table' -Content {
                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                        $Session:DefaultIconName = 'plus'
                                                                                        $ButtonNum = 0
                                                                                        1..$GetButtonRow1Count | % {
                                                                                            $CreateButtonVariableButtonSC    = '$'+'Session:'+'VariableButtonId'+"$ButtonNum"+'='+"$ButtonNum"
                                                                                            $CreateButtonVariableButtonSC|iex
                                                                                            $CreateButtonVariableButton      = '$'+'Session:'+'VariableButtonId'+"$ButtonNum"
                                                                                            
                                                                                            $CreateButtonVariableConditionSC = '$'+'session:'+'ElementVariableId'+"$ButtonNum"+'='+'$'+'true'
                                                                                            $CreateButtonVariableCondition   = '$'+'session:'+'ElementVariableId'+"$ButtonNum"
                                                                                            $CreateElementVariableId         = 'ElementVariableId'+"$ButtonNum"
                                                                                            $CreateButtonVariableConditionSC|iex
                                                                                            New-UDElement -Id $CreateElementVariableId -Tag 'td' -Content {
                                                                                                New-UDLink -Children {
                                                                                                    New-UDDynamic -Id ('VariableIconDynamicId'+"$ButtonNum") -Content {
                                                                                                        New-UDIcon -Icon $Session:DefaultIconName -Size '1x' -Border -ClassName "interface-box-logo"
                                                                                                    }
                                                                                                } -OnClick {
                                                                                                    
                                                                                                    $JavascriptString = (('
                                                                                                    function RemoveElement() {
                                                                                                        const element = document.getElementById("importelementid");
                                                                                                        element.remove();
                                                                                                    }
                                                                                                    RemoveElement();') -replace 'importelementid',"$CreateElementVariableId")
                                                                                                    $Session:VariableValueNumber = $CreateButtonVariableButton|iex
                                                                                                    $CreateButtonVariableConditionSC = '$'+'session:'+'ElementVariableId'+"$Session:VariableValueNumber"
                                                                                                    $SaveIconContentNumber = $Session:VariableValueNumber
                                                                                                    Show-UDToast -Message ($CreateButtonVariableConditionSC)
                                                                                                    Show-UDToast -Message ($CreateButtonVariableConditionSC|iex)
                                                                                                    Show-UDModal -Content {
                                                                                                        
                                                                                                        New-UDDynamic -Id ('VariableChangeIconDynamicId'+"$Session:VariableValueNumber") -Content {
                                                                                                            if(($CreateButtonVariableConditionSC|iex) -eq $true){
                                                                                                                $LoadAllIcons
                                                                                                            }
                                                                                                            else{
                                                                                                                New-UDButton -Text "Change icon" -OnClick {
                                                                                                                    $CreateButtonVariableConditionSC = '$'+'session:'+'ElementVariableId'+"$Session:VariableValueNumber"+'='+'$'+'true'
                                                                                                                    $CreateButtonVariableConditionSC|iex
                                                                                                                    Sync-UDElement -Id ('VariableChangeIconDynamicId'+"$Session:VariableValueNumber")
                                                                                                                    
                                                                                                                } -ClassName "interface-box-btn"
                                                                                                            }
                                                                                                        }
                                                                                                        
                                                                                                    } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" } -FullWidth
                                                                                                }
                                                                                            }
                                                                                            $ButtonNum++
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif($GetButtonRow1Count -eq 1){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon Plus -Size '1x' -Border -ClassName "interface-box-logo"
                                                                                } -OnClick {
                                                                                        $VariableButtonId=0
                                                                                        Show-UDToast -Message $VariableButtonId
                                                                                        Show-UDModal -Content {
                                                                                        $LoadAllIcons
                                                                                    } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" } -FullWidth
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                } -Style '
                                                                table {
                                                                    width:100%;
                                                                    padding:0px;
                                                                }
                                                                tr {
                                                                    width:100%;
                                                                }
                                                                '
                                                            }
                                                        }
                                                    }                 
                                                } -Elevation 1
                                            }
                                        }
                                        else{
                                            
                                        }
  
                                        
                                    }
                                }
                            }
                            New-UDElement -Tag 'p' -Content {}

                            New-UDDynamic -Id 'RestartButtonsFunctionParameter' -Content {
                                $GetButtonsTerminalCount = (Get-UDElement -Id 'ButtonsRowTerminalCountIdTextBox').Value
                                $GetButtonsMainCount     = (Get-UDElement -Id 'ButtonsRowMainCountIdTextBox').Value
    
                                $CreatorButtonNum = 0
                                1..$GetButtonsTerminalCount | % {
                                    ('$'+'Session:'+'TerminalDefaultSelectValue'+"$CreatorButtonNum"+'='+'1') | iex
                                    $CreatorButtonNum++
                                }
    
                                $CreatorButtonNum = 0
                                1..$GetButtonsMainCount | % {
                                    ('$'+'Session:'+'MainDefaultSelectValue'+"$CreatorButtonNum"+'='+'1') | iex
                                    $CreatorButtonNum++
                                }
                            }

                            New-UDDynamic -Id 'GenerateButtonsPscoIdDynamic' -Content {
                                        

                                [int]$GetTerminalButtonCount = (Get-UDElement -Id 'ButtonsRowTerminalCountIdTextBox').value
                                if($GetTerminalButtonCount -eq 0 -or $null -eq $GetTerminalButtonCount){
                                    
                                }
                                elseif($GetTerminalButtonCount -gt 0){
                                    if($GetTerminalButtonCount -eq 1){
                                        $Session:TerminalHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:TerminalHash0
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 2){
                                        $Session:TerminalHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:TerminalHash0
                                            Button1 = $Session:TerminalHash1
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 3){
                                        $Session:TerminalHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:TerminalHash0
                                            Button1 = $Session:TerminalHash1
                                            Button2 = $Session:TerminalHash2
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 4){
                                        $Session:TerminalHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:TerminalHash0
                                            Button1 = $Session:TerminalHash1
                                            Button2 = $Session:TerminalHash2
                                            Button3 = $Session:TerminalHash3
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 5){
                                        $Session:TerminalHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:TerminalHash0
                                            Button1 = $Session:TerminalHash1
                                            Button2 = $Session:TerminalHash2
                                            Button3 = $Session:TerminalHash3
                                            Button4 = $Session:TerminalHash4
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 6){
                                        $Session:TerminalHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:TerminalHash0
                                            Button1 = $Session:TerminalHash1
                                            Button2 = $Session:TerminalHash2
                                            Button3 = $Session:TerminalHash3
                                            Button4 = $Session:TerminalHash4
                                            Button5 = $Session:TerminalHash5
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 7){
                                        $Session:TerminalHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:TerminalHash0
                                            Button1 = $Session:TerminalHash1
                                            Button2 = $Session:TerminalHash2
                                            Button3 = $Session:TerminalHash3
                                            Button4 = $Session:TerminalHash4
                                            Button5 = $Session:TerminalHash5
                                            Button6 = $Session:TerminalHash6
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 8){
                                        $Session:TerminalHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:TerminalHash0
                                            Button1 = $Session:TerminalHash1
                                            Button2 = $Session:TerminalHash2
                                            Button3 = $Session:TerminalHash3
                                            Button4 = $Session:TerminalHash4
                                            Button5 = $Session:TerminalHash5
                                            Button6 = $Session:TerminalHash6
                                            Button7 = $Session:TerminalHash7
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 9){
                                        $Session:TerminalHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:TerminalHash0
                                            Button1 = $Session:TerminalHash1
                                            Button2 = $Session:TerminalHash2
                                            Button3 = $Session:TerminalHash3
                                            Button4 = $Session:TerminalHash4
                                            Button5 = $Session:TerminalHash5
                                            Button6 = $Session:TerminalHash6
                                            Button7 = $Session:TerminalHash7
                                            Button8 = $Session:TerminalHash8
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 10){
                                        $Session:TerminalHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:TerminalHash0
                                            Button1 = $Session:TerminalHash1
                                            Button2 = $Session:TerminalHash2
                                            Button3 = $Session:TerminalHash3
                                            Button4 = $Session:TerminalHash4
                                            Button5 = $Session:TerminalHash5
                                            Button6 = $Session:TerminalHash6
                                            Button7 = $Session:TerminalHash7
                                            Button8 = $Session:TerminalHash8
                                            Button9 = $Session:TerminalHash9
                                        }
                                    }
                                }

                                [int]$GetMainButtonCount = (Get-UDElement -Id 'ButtonsRowMainCountIdTextBox').value
                                if($GetMainButtonCount -eq 0 -or $null -eq $GetMainButtonCount){
                                    
                                }
                                elseif($GetMainButtonCount -gt 0){
                                    if($GetMainButtonCount -eq 1){
                                        $Session:MainHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:MainHash0
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 2){
                                        $Session:MainHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:MainHash0
                                            Button1 = $Session:MainHash1
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 3){
                                        $Session:MainHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:MainHash0
                                            Button1 = $Session:MainHash1
                                            Button2 = $Session:MainHash2
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 4){
                                        $Session:MainHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:MainHash0
                                            Button1 = $Session:MainHash1
                                            Button2 = $Session:MainHash2
                                            Button3 = $Session:MainHash3
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 5){
                                        $Session:MainHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:MainHash0
                                            Button1 = $Session:MainHash1
                                            Button2 = $Session:MainHash2
                                            Button3 = $Session:MainHash3
                                            Button4 = $Session:MainHash4
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 6){
                                        $Session:MainHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:MainHash0
                                            Button1 = $Session:MainHash1
                                            Button2 = $Session:MainHash2
                                            Button3 = $Session:MainHash3
                                            Button4 = $Session:MainHash4
                                            Button5 = $Session:MainHash5
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 7){
                                        $Session:MainHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:MainHash0
                                            Button1 = $Session:MainHash1
                                            Button2 = $Session:MainHash2
                                            Button3 = $Session:MainHash3
                                            Button4 = $Session:MainHash4
                                            Button5 = $Session:MainHash5
                                            Button6 = $Session:MainHash6
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 8){
                                        $Session:MainHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:MainHash0
                                            Button1 = $Session:MainHash1
                                            Button2 = $Session:MainHash2
                                            Button3 = $Session:MainHash3
                                            Button4 = $Session:MainHash4
                                            Button5 = $Session:MainHash5
                                            Button6 = $Session:MainHash6
                                            Button7 = $Session:MainHash7
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 9){
                                        $Session:MainHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:MainHash0
                                            Button1 = $Session:MainHash1
                                            Button2 = $Session:MainHash2
                                            Button3 = $Session:MainHash3
                                            Button4 = $Session:MainHash4
                                            Button5 = $Session:MainHash5
                                            Button6 = $Session:MainHash6
                                            Button7 = $Session:MainHash7
                                            Button8 = $Session:MainHash8
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 10){
                                        $Session:MainHashPSCO = [PSCustomObject]@{
                                            Button0 = $Session:MainHash0
                                            Button1 = $Session:MainHash1
                                            Button2 = $Session:MainHash2
                                            Button3 = $Session:MainHash3
                                            Button4 = $Session:MainHash4
                                            Button5 = $Session:MainHash5
                                            Button6 = $Session:MainHash6
                                            Button7 = $Session:MainHash7
                                            Button8 = $Session:MainHash8
                                            Button9 = $Session:MainHash9
                                        }
                                    }
                                }

                                

                                $InvokeFunctionsSelectListSC = {
                                    $Cache:DataFunctionSelectListSC|iex
                                }

                                $InvokeFunctionsResultSC = {
                                    Show-UDToast -Message $EventData
                                    $Cache:DataInvokeFunctionsResultSC|iex                                    
                                }

                                

                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            if($GetTerminalButtonCount -eq 0 -or $null -eq $GetTerminalButtonCount){

                                            }
                                            elseif($GetTerminalButtonCount -gt 0){
                                                New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                                                    New-UDElement -Tag 'table' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDPaper -Square -Content {
                                                                    New-UDRow -Columns {
                                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {

                                                                            New-UDElement -Tag 'table' -Content {
                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                            New-UDTypography -Text 'Terminal' -ClassName 'interface-box-inner-title'
                                                                                        }
                                                                                    }
                                                                                }

                                                                                $GetTerminalButtonNum = 0
                                                                                1..$GetTerminalButtonCount | % {
                                                                                    $GetCurrenctItemTerminalHashPSCOString = '$'+'Session:'+'TerminalHashPSCO'+'.'+'Button'+"$GetTerminalButtonNum"
                                                                                    $GetHash = $GetCurrenctItemTerminalHashPSCOString|iex
                                                                                    New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                                                        New-UDStyle -Content {
                                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                                New-UDElement -Tag 'td' -Content {
                                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                                        if($null -eq $GetHash.Icon){
                                                                                                            New-UDIcon -Icon 'Slash' -Size '1x' -Border -ClassName 'interface-center-box-logo'
                                                                                                        }
                                                                                                        else{
                                                                                                            New-UDIcon -Icon $GetHash.Icon -Size '1x' -Border -ClassName 'interface-center-box-logo'
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                New-UDElement -Tag 'td' -Content {
                                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                                        New-UDTextbox -Id ('TerminalPSCOItemIconIdTextBox'+"$GetTerminalButtonNum") -Type text -ClassName 'interface-box-text' -Value $GetHash.Icon -Variant filled -Disabled
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
                                                                                                        New-UDTextbox -Id ('TerminalPSCOItemTitleIdTextBox'+"$GetTerminalButtonNum") -Type text -ClassName 'interface-box-text' -Value $GetHash.Title -Variant filled
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                                New-UDElement -Tag 'td' -Content {
                                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                                        New-UDTypography -Text 'Function' -ClassName 'interface-box-inner-title'
                                                                                                    }
                                                                                                }
                                                                                                New-UDElement -Tag 'td' -Content {
                                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                                        New-UDStyle -Content {
                                                                                                            $DefaultSelectValue = ('$'+'Session:'+'TerminalDefaultSelectValue'+"$GetTerminalButtonNum")
                                                                                                            New-UDSelect -DefaultValue ($DefaultSelectValue|iex) -Id ('TerminalPSCOItemScriptblockIdSelectBox'+"$GetTerminalButtonNum") -ClassName 'interface-box-terminal-select' -Option {
                                                                                                                $InvokeFunctionsSelectListSC|iex
                                                                                                            } -OnChange {
                                                                                                                $SelectorIdString = ('TerminalPSCOItemScriptblockIdSelectBox'+"$GetTerminalButtonNum")
                                                                                                                $SelectorIdNum    = $GetTerminalButtonNum
                                                                                                                $SelectorType     = 'Terminal'
                                                                                                                Show-UDToast -Message $SelectorIdString
                                                                                                                $InvokeFunctionsResultSC|iex
                                                                                                            }
                                                                                                        } -Style '
                                                                                                            label + .css-1ntzb12 {
                                                                                                                margin-top: 0px;
                                                                                                            }
                                                                                                        '
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        } -Style '
                                                                                        .MuiInputBase-input {
                                                                                            font: inherit;
                                                                                            letter-spacing: inherit;
                                                                                            color: currentcolor;
                                                                                            border: 0px;
                                                                                            box-sizing: content-box;
                                                                                            background: none;
                                                                                            height: 1.4375em;
                                                                                            margin: 0px;
                                                                                            -webkit-tap-highlight-color: transparent;
                                                                                            display: block;
                                                                                            min-width: 0px;
                                                                                            width: 100%;
                                                                                            animation-name: mui-auto-fill-cancel;
                                                                                            animation-duration: 10ms;
                                                                                            padding: 0px 0px 0px;
                                                                                        }
                                                                                        '
                                                                                    }
                                                                                    $GetTerminalButtonNum++
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                } -Elevation 1
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            if($GetMainButtonCount -eq 0 -or $null -eq $GetMainButtonCount){

                                            }
                                            elseif($GetMainButtonCount -gt 0){
                                                New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                                                    New-UDElement -Tag 'table' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDPaper -Square -Content {
                                                                    New-UDRow -Columns {
                                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
            
                                                                            New-UDElement -Tag 'table' -Content {
                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                            New-UDTypography -Text 'Main' -ClassName 'interface-box-inner-title'
                                                                                        }
                                                                                    }
                                                                                }
            
                                                                                $GetMainButtonNum = 0
                                                                                1..$GetMainButtonCount | % {
                                                                                    $GetCurrenctItemMainHashPSCOString = '$'+'Session:'+'MainHashPSCO'+'.'+'Button'+"$GetMainButtonNum"
                                                                                    $GetHash = $GetCurrenctItemMainHashPSCOString|iex
                                                                                    New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                                                        New-UDStyle -Content {
                                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                                New-UDElement -Tag 'td' -Content {
                                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                                        if($null -eq $GetHash.Icon){
                                                                                                            New-UDIcon -Icon 'Slash' -Size '1x' -Border -ClassName 'interface-center-box-logo'
                                                                                                        }
                                                                                                        else{
                                                                                                            New-UDIcon -Icon $GetHash.Icon -Size '1x' -Border -ClassName 'interface-center-box-logo'
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                New-UDElement -Tag 'td' -Content {
                                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                                        New-UDTextbox -Id ('MainPSCOItemIconIdTextBox'+"$GetMainButtonNum") -Type text -ClassName 'interface-box-text' -Value $GetHash.Icon -Variant filled -Disabled
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
                                                                                                        New-UDTextbox -Id ('MainPSCOItemTitleIdTextBox'+"$GetMainButtonNum") -Type text -ClassName 'interface-box-text' -Value $GetHash.Title -Variant filled
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                                New-UDElement -Tag 'td' -Content {
                                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                                        New-UDTypography -Text 'Function' -ClassName 'interface-box-inner-title'
                                                                                                    }
                                                                                                }
                                                                                                New-UDElement -Tag 'td' -Content {
                                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                                        New-UDStyle -Content {
                                                                                                            $DefaultSelectValue = ('$'+'Session:'+'MainDefaultSelectValue'+"$GetMainButtonNum")
                                                                                                            New-UDSelect -DefaultValue ($DefaultSelectValue|iex) -Id ('MainPSCOItemScriptblockIdSelectBox'+"$GetMainButtonNum") -ClassName 'interface-box-terminal-select' -Option {
                                                                                                                $InvokeFunctionsSelectListSC|iex
                                                                                                            } -OnChange {
                                                                                                                $SelectorIdString = ('MainPSCOItemScriptblockIdSelectBox'+"$GetMainButtonNum")
                                                                                                                $SelectorIdNum    = $GetMainButtonNum
                                                                                                                $SelectorType     = 'Main'
                                                                                                                Show-UDToast -Message $SelectorIdString
                                                                                                                $InvokeFunctionsResultSC|iex
                                                                                                            }
                                                                                                        } -Style '
                                                                                                            label + .css-1ntzb12 {
                                                                                                                margin-top: 0px;
                                                                                                            }
                                                                                                        '
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        } -Style '
                                                                                        .MuiInputBase-input {
                                                                                            font: inherit;
                                                                                            letter-spacing: inherit;
                                                                                            color: currentcolor;
                                                                                            border: 0px;
                                                                                            box-sizing: content-box;
                                                                                            background: none;
                                                                                            height: 1.4375em;
                                                                                            margin: 0px;
                                                                                            -webkit-tap-highlight-color: transparent;
                                                                                            display: block;
                                                                                            min-width: 0px;
                                                                                            width: 100%;
                                                                                            animation-name: mui-auto-fill-cancel;
                                                                                            animation-duration: 10ms;
                                                                                            padding: 0px 0px 0px;
                                                                                        }
                                                                                        '
                                                                                    }
                                                                                    $GetMainButtonNum++
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                } -Elevation 1
                                                            }
                                                        }
                                                    }
                                                }
                                            }
            
                                        }
                                    }
                                }

                                New-UDElement -Tag 'p' -Content {}
                                New-UDElement -Tag 'p' -Content {}



                            }

                            New-UDElement -Tag 'p' -Content {}
                            New-UDElement -Tag 'p' -Content {}

                        } -SubmitText 'Create New Psuca Dashboard' -OnSubmit {

                            $ValidationSC = {

                                $GetMainButtonCount     = (Get-UDElement -Id 'ButtonsRowMainCountIdTextBox').Value
                                $GetTerminalButtonCount = (Get-UDElement -Id 'ButtonsRowTerminalCountIdTextBox').Value
                                $GetValidateSelectId    = (Get-UDElement -Id 'TerminalResultIdSelectBox').Value

                                $ValidateTerminalSC = {
                                    if($GetTerminalButtonCount -eq 1){
                                        Show-UDToast -Message 'Minimum terminal buttons is 2'
                                    }
                                    elseif($GetTerminalButtonCount -eq 2){
                                        $ValidationTerminalIcon0        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationTerminalTitle0       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationTerminalScriptBlock0 = $Session:TerminalHash0.Function
                                        if($null -ne $ValidationTerminalIcon0 -and $null -ne $ValidationTerminalTitle0 -and $null -ne $ValidationTerminalScriptBlock0){
                                            $ValidationTerminalIcon1        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationTerminalTitle1       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationTerminalScriptBlock1 = $Session:TerminalHash1.Function
                                            if($null -ne $ValidationTerminalIcon1 -and $null -ne $ValidationTerminalTitle1 -and $null -ne $ValidationTerminalScriptBlock1){
                                                $TerminalValidationCondition = $true
                                                $TerminalExportButtonsJson   = (
@"
[{'Icon':'$ValidationTerminalIcon0','Title':'$ValidationTerminalTitle0','DataSet':'null','Content':[$ValidationTerminalScriptBlock0]},{'Icon':'$ValidationTerminalIcon1','Title':'$ValidationTerminalTitle1','DataSet':'null','Content':[$ValidationTerminalScriptBlock1]}]
"@)
                                            }
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 3){
                                        $ValidationTerminalIcon0        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationTerminalTitle0       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationTerminalScriptBlock0 = $Session:TerminalHash0.Function
                                        if($null -ne $ValidationTerminalIcon0 -and $null -ne $ValidationTerminalTitle0 -and $null -ne $ValidationTerminalScriptBlock0){
                                            $ValidationTerminalIcon1        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationTerminalTitle1       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationTerminalScriptBlock1 = $Session:TerminalHash1.Function
                                            if($null -ne $ValidationTerminalIcon1 -and $null -ne $ValidationTerminalTitle1 -and $null -ne $ValidationTerminalScriptBlock1){
                                                $ValidationTerminalIcon2        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationTerminalTitle2       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationTerminalScriptBlock2 = $Session:TerminalHash2.Function
                                                if($null -ne $ValidationTerminalIcon2 -and $null -ne $ValidationTerminalTitle2 -and $null -ne $ValidationTerminalScriptBlock2){
                                                    $TerminalValidationCondition = $true
                                                    $TerminalExportButtonsJson   = (
@"
[{'Icon':'$ValidationTerminalIcon0','Title':'$ValidationTerminalTitle0','DataSet':'null','Content':[$ValidationTerminalScriptBlock0]},{'Icon':'$ValidationTerminalIcon1','Title':'$ValidationTerminalTitle1','DataSet':'null','Content':[$ValidationTerminalScriptBlock1]},{'Icon':'$ValidationTerminalIcon2','Title':'$ValidationTerminalTitle2','DataSet':'null','Content':[$ValidationTerminalScriptBlock2]}]
"@)
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 4){
                                        $ValidationTerminalIcon0        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationTerminalTitle0       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationTerminalScriptBlock0 = $Session:TerminalHash0.Function
                                        if($null -ne $ValidationTerminalIcon0 -and $null -ne $ValidationTerminalTitle0 -and $null -ne $ValidationTerminalScriptBlock0){
                                            $ValidationTerminalIcon1        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationTerminalTitle1       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationTerminalScriptBlock1 = $Session:TerminalHash1.Function
                                            if($null -ne $ValidationTerminalIcon1 -and $null -ne $ValidationTerminalTitle1 -and $null -ne $ValidationTerminalScriptBlock1){
                                                $ValidationTerminalIcon2        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationTerminalTitle2       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationTerminalScriptBlock2 = $Session:TerminalHash2.Function
                                                if($null -ne $ValidationTerminalIcon2 -and $null -ne $ValidationTerminalTitle2 -and $null -ne $ValidationTerminalScriptBlock2){
                                                    $ValidationTerminalIcon3        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationTerminalTitle3       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationTerminalScriptBlock3 = $Session:TerminalHash3.Function
                                                    if($null -ne $ValidationTerminalIcon3 -and $null -ne $ValidationTerminalTitle3 -and $null -ne $ValidationTerminalScriptBlock3){
                                                        $TerminalValidationCondition = $true
                                                        $TerminalExportButtonsJson   = (
@"
[{'Icon':'$ValidationTerminalIcon0','Title':'$ValidationTerminalTitle0','DataSet':'null','Content':[$ValidationTerminalScriptBlock0]},{'Icon':'$ValidationTerminalIcon1','Title':'$ValidationTerminalTitle1','DataSet':'null','Content':[$ValidationTerminalScriptBlock1]},{'Icon':'$ValidationTerminalIcon2','Title':'$ValidationTerminalTitle2','DataSet':'null','Content':[$ValidationTerminalScriptBlock2]},{'Icon':'$ValidationTerminalIcon3','Title':'$ValidationTerminalTitle3','DataSet':'null','Content':[$ValidationTerminalScriptBlock3]}]
"@)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 5){
                                        $ValidationTerminalIcon0        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationTerminalTitle0       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationTerminalScriptBlock0 = $Session:TerminalHash0.Function
                                        if($null -ne $ValidationTerminalIcon0 -and $null -ne $ValidationTerminalTitle0 -and $null -ne $ValidationTerminalScriptBlock0){
                                            $ValidationTerminalIcon1        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationTerminalTitle1       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationTerminalScriptBlock1 = $Session:TerminalHash1.Function
                                            if($null -ne $ValidationTerminalIcon1 -and $null -ne $ValidationTerminalTitle1 -and $null -ne $ValidationTerminalScriptBlock1){
                                                $ValidationTerminalIcon2        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationTerminalTitle2       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationTerminalScriptBlock2 = $Session:TerminalHash2.Function
                                                if($null -ne $ValidationTerminalIcon2 -and $null -ne $ValidationTerminalTitle2 -and $null -ne $ValidationTerminalScriptBlock2){
                                                    $ValidationTerminalIcon3        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationTerminalTitle3       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationTerminalScriptBlock3 = $Session:TerminalHash3.Function
                                                    if($null -ne $ValidationTerminalIcon3 -and $null -ne $ValidationTerminalTitle3 -and $null -ne $ValidationTerminalScriptBlock3){
                                                        $ValidationTerminalIcon4        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationTerminalTitle4       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationTerminalScriptBlock4 = $Session:TerminalHash4.Function
                                                        if($null -ne $ValidationTerminalIcon4 -and $null -ne $ValidationTerminalTitle4 -and $null -ne $ValidationTerminalScriptBlock4){
                                                            $TerminalValidationCondition = $true
                                                            $TerminalExportButtonsJson   = (
@"
[{'Icon':'$ValidationTerminalIcon0','Title':'$ValidationTerminalTitle0','DataSet':'null','Content':[$ValidationTerminalScriptBlock0]},{'Icon':'$ValidationTerminalIcon1','Title':'$ValidationTerminalTitle1','DataSet':'null','Content':[$ValidationTerminalScriptBlock1]},{'Icon':'$ValidationTerminalIcon2','Title':'$ValidationTerminalTitle2','DataSet':'null','Content':[$ValidationTerminalScriptBlock2]},{'Icon':'$ValidationTerminalIcon3','Title':'$ValidationTerminalTitle3','DataSet':'null','Content':[$ValidationTerminalScriptBlock3]},{'Icon':'$ValidationTerminalIcon4','Title':'$ValidationTerminalTitle4','DataSet':'null','Content':[$ValidationTerminalScriptBlock4]}]
"@)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 6){
                                        $ValidationTerminalIcon0        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationTerminalTitle0       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationTerminalScriptBlock0 = $Session:TerminalHash0.Function
                                        if($null -ne $ValidationTerminalIcon0 -and $null -ne $ValidationTerminalTitle0 -and $null -ne $ValidationTerminalScriptBlock0){
                                            $ValidationTerminalIcon1        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationTerminalTitle1       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationTerminalScriptBlock1 = $Session:TerminalHash1.Function
                                            if($null -ne $ValidationTerminalIcon1 -and $null -ne $ValidationTerminalTitle1 -and $null -ne $ValidationTerminalScriptBlock1){
                                                $ValidationTerminalIcon2        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationTerminalTitle2       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationTerminalScriptBlock2 = $Session:TerminalHash2.Function
                                                if($null -ne $ValidationTerminalIcon2 -and $null -ne $ValidationTerminalTitle2 -and $null -ne $ValidationTerminalScriptBlock2){
                                                    $ValidationTerminalIcon3        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationTerminalTitle3       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationTerminalScriptBlock3 = $Session:TerminalHash3.Function
                                                    if($null -ne $ValidationTerminalIcon3 -and $null -ne $ValidationTerminalTitle3 -and $null -ne $ValidationTerminalScriptBlock3){
                                                        $ValidationTerminalIcon4        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationTerminalTitle4       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationTerminalScriptBlock4 = $Session:TerminalHash4.Function
                                                        if($null -ne $ValidationTerminalIcon4 -and $null -ne $ValidationTerminalTitle4 -and $null -ne $ValidationTerminalScriptBlock4){
                                                            $ValidationTerminalIcon5        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'5')).Value
                                                            $ValidationTerminalTitle5       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'5')).Value
                                                            $ValidationTerminalScriptBlock5 = $Session:TerminalHash5.Function
                                                            if($null -ne $ValidationTerminalIcon5 -and $null -ne $ValidationTerminalTitle5 -and $null -ne $ValidationTerminalScriptBlock5){
                                                                $TerminalValidationCondition = $true
                                                                $TerminalExportButtonsJson   = (
@"
[{'Icon':'$ValidationTerminalIcon0','Title':'$ValidationTerminalTitle0','DataSet':'null','Content':[$ValidationTerminalScriptBlock0]},{'Icon':'$ValidationTerminalIcon1','Title':'$ValidationTerminalTitle1','DataSet':'null','Content':[$ValidationTerminalScriptBlock1]},{'Icon':'$ValidationTerminalIcon2','Title':'$ValidationTerminalTitle2','DataSet':'null','Content':[$ValidationTerminalScriptBlock2]},{'Icon':'$ValidationTerminalIcon3','Title':'$ValidationTerminalTitle3','DataSet':'null','Content':[$ValidationTerminalScriptBlock3]},{'Icon':'$ValidationTerminalIcon4','Title':'$ValidationTerminalTitle4','DataSet':'null','Content':[$ValidationTerminalScriptBlock4]},{'Icon':'$ValidationTerminalIcon5','Title':'$ValidationTerminalTitle5','DataSet':'null','Content':[$ValidationTerminalScriptBlock5]}]
"@)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 7){
                                        $ValidationTerminalIcon0        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationTerminalTitle0       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationTerminalScriptBlock0 = $Session:TerminalHash0.Function
                                        if($null -ne $ValidationTerminalIcon0 -and $null -ne $ValidationTerminalTitle0 -and $null -ne $ValidationTerminalScriptBlock0){
                                            $ValidationTerminalIcon1        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationTerminalTitle1       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationTerminalScriptBlock1 = $Session:TerminalHash1.Function
                                            if($null -ne $ValidationTerminalIcon1 -and $null -ne $ValidationTerminalTitle1 -and $null -ne $ValidationTerminalScriptBlock1){
                                                $ValidationTerminalIcon2        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationTerminalTitle2       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationTerminalScriptBlock2 = $Session:TerminalHash2.Function
                                                if($null -ne $ValidationTerminalIcon2 -and $null -ne $ValidationTerminalTitle2 -and $null -ne $ValidationTerminalScriptBlock2){
                                                    $ValidationTerminalIcon3        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationTerminalTitle3       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationTerminalScriptBlock3 = $Session:TerminalHash3.Function
                                                    if($null -ne $ValidationTerminalIcon3 -and $null -ne $ValidationTerminalTitle3 -and $null -ne $ValidationTerminalScriptBlock3){
                                                        $ValidationTerminalIcon4        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationTerminalTitle4       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationTerminalScriptBlock4 = $Session:TerminalHash4.Function
                                                        if($null -ne $ValidationTerminalIcon4 -and $null -ne $ValidationTerminalTitle4 -and $null -ne $ValidationTerminalScriptBlock4){
                                                            $ValidationTerminalIcon5        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'5')).Value
                                                            $ValidationTerminalTitle5       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'5')).Value
                                                            $ValidationTerminalScriptBlock5 = $Session:TerminalHash5.Function
                                                            if($null -ne $ValidationTerminalIcon5 -and $null -ne $ValidationTerminalTitle5 -and $null -ne $ValidationTerminalScriptBlock5){
                                                                $ValidationTerminalIcon6        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'6')).Value
                                                                $ValidationTerminalTitle6       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'6')).Value
                                                                $ValidationTerminalScriptBlock6 = $Session:TerminalHash6.Function
                                                                if($null -ne $ValidationTerminalIcon6 -and $null -ne $ValidationTerminalTitle6 -and $null -ne $ValidationTerminalScriptBlock6){
                                                                    $TerminalValidationCondition = $true
                                                                    $TerminalExportButtonsJson   = (
@"
[{'Icon':'$ValidationTerminalIcon0','Title':'$ValidationTerminalTitle0','DataSet':'null','Content':[$ValidationTerminalScriptBlock0]},{'Icon':'$ValidationTerminalIcon1','Title':'$ValidationTerminalTitle1','DataSet':'null','Content':[$ValidationTerminalScriptBlock1]},{'Icon':'$ValidationTerminalIcon2','Title':'$ValidationTerminalTitle2','DataSet':'null','Content':[$ValidationTerminalScriptBlock2]},{'Icon':'$ValidationTerminalIcon3','Title':'$ValidationTerminalTitle3','DataSet':'null','Content':[$ValidationTerminalScriptBlock3]},{'Icon':'$ValidationTerminalIcon4','Title':'$ValidationTerminalTitle4','DataSet':'null','Content':[$ValidationTerminalScriptBlock4]},{'Icon':'$ValidationTerminalIcon5','Title':'$ValidationTerminalTitle5','DataSet':'null','Content':[$ValidationTerminalScriptBlock5]},{'Icon':'$ValidationTerminalIcon6','Title':'$ValidationTerminalTitle6','DataSet':'null','Content':[$ValidationTerminalScriptBlock6]}]
"@)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 8){
                                        $ValidationTerminalIcon0        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationTerminalTitle0       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationTerminalScriptBlock0 = $Session:TerminalHash0.Function
                                        if($null -ne $ValidationTerminalIcon0 -and $null -ne $ValidationTerminalTitle0 -and $null -ne $ValidationTerminalScriptBlock0){
                                            $ValidationTerminalIcon1        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationTerminalTitle1       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationTerminalScriptBlock1 = $Session:TerminalHash1.Function
                                            if($null -ne $ValidationTerminalIcon1 -and $null -ne $ValidationTerminalTitle1 -and $null -ne $ValidationTerminalScriptBlock1){
                                                $ValidationTerminalIcon2        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationTerminalTitle2       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationTerminalScriptBlock2 = $Session:TerminalHash2.Function
                                                if($null -ne $ValidationTerminalIcon2 -and $null -ne $ValidationTerminalTitle2 -and $null -ne $ValidationTerminalScriptBlock2){
                                                    $ValidationTerminalIcon3        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationTerminalTitle3       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationTerminalScriptBlock3 = $Session:TerminalHash3.Function
                                                    if($null -ne $ValidationTerminalIcon3 -and $null -ne $ValidationTerminalTitle3 -and $null -ne $ValidationTerminalScriptBlock3){
                                                        $ValidationTerminalIcon4        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationTerminalTitle4       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationTerminalScriptBlock4 = $Session:TerminalHash4.Function
                                                        if($null -ne $ValidationTerminalIcon4 -and $null -ne $ValidationTerminalTitle4 -and $null -ne $ValidationTerminalScriptBlock4){
                                                            $ValidationTerminalIcon5        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'5')).Value
                                                            $ValidationTerminalTitle5       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'5')).Value
                                                            $ValidationTerminalScriptBlock5 = $Session:TerminalHash5.Function
                                                            if($null -ne $ValidationTerminalIcon5 -and $null -ne $ValidationTerminalTitle5 -and $null -ne $ValidationTerminalScriptBlock5){
                                                                $ValidationTerminalIcon6        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'6')).Value
                                                                $ValidationTerminalTitle6       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'6')).Value
                                                                $ValidationTerminalScriptBlock6 = $Session:TerminalHash6.Function
                                                                if($null -ne $ValidationTerminalIcon6 -and $null -ne $ValidationTerminalTitle6 -and $null -ne $ValidationTerminalScriptBlock6){
                                                                    $ValidationTerminalIcon7        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'7')).Value
                                                                    $ValidationTerminalTitle7       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'7')).Value
                                                                    $ValidationTerminalScriptBlock7 = $Session:TerminalHash7.Function
                                                                    if($null -ne $ValidationTerminalIcon7 -and $null -ne $ValidationTerminalTitle7 -and $null -ne $ValidationTerminalScriptBlock7){
                                                                        $TerminalValidationCondition = $true
                                                                        $TerminalExportButtonsJson   = (
@"
[{'Icon':'$ValidationTerminalIcon0','Title':'$ValidationTerminalTitle0','DataSet':'null','Content':[$ValidationTerminalScriptBlock0]},{'Icon':'$ValidationTerminalIcon1','Title':'$ValidationTerminalTitle1','DataSet':'null','Content':[$ValidationTerminalScriptBlock1]},{'Icon':'$ValidationTerminalIcon2','Title':'$ValidationTerminalTitle2','DataSet':'null','Content':[$ValidationTerminalScriptBlock2]},{'Icon':'$ValidationTerminalIcon3','Title':'$ValidationTerminalTitle3','DataSet':'null','Content':[$ValidationTerminalScriptBlock3]},{'Icon':'$ValidationTerminalIcon4','Title':'$ValidationTerminalTitle4','DataSet':'null','Content':[$ValidationTerminalScriptBlock4]},{'Icon':'$ValidationTerminalIcon5','Title':'$ValidationTerminalTitle5','DataSet':'null','Content':[$ValidationTerminalScriptBlock5]},{'Icon':'$ValidationTerminalIcon6','Title':'$ValidationTerminalTitle6','DataSet':'null','Content':[$ValidationTerminalScriptBlock6]},{'Icon':'$ValidationTerminalIcon7','Title':'$ValidationTerminalTitle7','DataSet':'null','Content':[$ValidationTerminalScriptBlock7]}]
"@)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 9){
                                        $ValidationTerminalIcon0        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationTerminalTitle0       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationTerminalScriptBlock0 = $Session:TerminalHash0.Function
                                        if($null -ne $ValidationTerminalIcon0 -and $null -ne $ValidationTerminalTitle0 -and $null -ne $ValidationTerminalScriptBlock0){
                                            $ValidationTerminalIcon1        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationTerminalTitle1       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationTerminalScriptBlock1 = $Session:TerminalHash1.Function
                                            if($null -ne $ValidationTerminalIcon1 -and $null -ne $ValidationTerminalTitle1 -and $null -ne $ValidationTerminalScriptBlock1){
                                                $ValidationTerminalIcon2        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationTerminalTitle2       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationTerminalScriptBlock2 = $Session:TerminalHash2.Function
                                                if($null -ne $ValidationTerminalIcon2 -and $null -ne $ValidationTerminalTitle2 -and $null -ne $ValidationTerminalScriptBlock2){
                                                    $ValidationTerminalIcon3        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationTerminalTitle3       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationTerminalScriptBlock3 = $Session:TerminalHash3.Function
                                                    if($null -ne $ValidationTerminalIcon3 -and $null -ne $ValidationTerminalTitle3 -and $null -ne $ValidationTerminalScriptBlock3){
                                                        $ValidationTerminalIcon4        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationTerminalTitle4       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationTerminalScriptBlock4 = $Session:TerminalHash4.Function
                                                        if($null -ne $ValidationTerminalIcon4 -and $null -ne $ValidationTerminalTitle4 -and $null -ne $ValidationTerminalScriptBlock4){
                                                            $ValidationTerminalIcon5        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'5')).Value
                                                            $ValidationTerminalTitle5       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'5')).Value
                                                            $ValidationTerminalScriptBlock5 = $Session:TerminalHash5.Function
                                                            if($null -ne $ValidationTerminalIcon5 -and $null -ne $ValidationTerminalTitle5 -and $null -ne $ValidationTerminalScriptBlock5){
                                                                $ValidationTerminalIcon6        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'6')).Value
                                                                $ValidationTerminalTitle6       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'6')).Value
                                                                $ValidationTerminalScriptBlock6 = $Session:TerminalHash6.Function
                                                                if($null -ne $ValidationTerminalIcon6 -and $null -ne $ValidationTerminalTitle6 -and $null -ne $ValidationTerminalScriptBlock6){
                                                                    $ValidationTerminalIcon7        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'7')).Value
                                                                    $ValidationTerminalTitle7       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'7')).Value
                                                                    $ValidationTerminalScriptBlock7 = $Session:TerminalHash7.Function
                                                                    if($null -ne $ValidationTerminalIcon7 -and $null -ne $ValidationTerminalTitle7 -and $null -ne $ValidationTerminalScriptBlock7){
                                                                        $ValidationTerminalIcon8        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'8')).Value
                                                                        $ValidationTerminalTitle8       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'8')).Value
                                                                        $ValidationTerminalScriptBlock8 = $Session:TerminalHash8.Function
                                                                        if($null -ne $ValidationTerminalIcon8 -and $null -ne $ValidationTerminalTitle8 -and $null -ne $ValidationTerminalScriptBlock8){
                                                                            $TerminalValidationCondition = $true
                                                                            $TerminalExportButtonsJson   = (
@"
[{'Icon':'$ValidationTerminalIcon0','Title':'$ValidationTerminalTitle0','DataSet':'null','Content':[$ValidationTerminalScriptBlock0]},{'Icon':'$ValidationTerminalIcon1','Title':'$ValidationTerminalTitle1','DataSet':'null','Content':[$ValidationTerminalScriptBlock1]},{'Icon':'$ValidationTerminalIcon2','Title':'$ValidationTerminalTitle2','DataSet':'null','Content':[$ValidationTerminalScriptBlock2]},{'Icon':'$ValidationTerminalIcon3','Title':'$ValidationTerminalTitle3','DataSet':'null','Content':[$ValidationTerminalScriptBlock3]},{'Icon':'$ValidationTerminalIcon4','Title':'$ValidationTerminalTitle4','DataSet':'null','Content':[$ValidationTerminalScriptBlock4]},{'Icon':'$ValidationTerminalIcon5','Title':'$ValidationTerminalTitle5','DataSet':'null','Content':[$ValidationTerminalScriptBlock5]},{'Icon':'$ValidationTerminalIcon6','Title':'$ValidationTerminalTitle6','DataSet':'null','Content':[$ValidationTerminalScriptBlock6]},{'Icon':'$ValidationTerminalIcon7','Title':'$ValidationTerminalTitle7','DataSet':'null','Content':[$ValidationTerminalScriptBlock7]},{'Icon':'$ValidationTerminalIcon8','Title':'$ValidationTerminalTitle8','DataSet':'null','Content':[$ValidationTerminalScriptBlock8]}]
"@)
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetTerminalButtonCount -eq 10){
                                        $ValidationTerminalIcon0        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationTerminalTitle0       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationTerminalScriptBlock0 = $Session:TerminalHash0.Function
                                        if($null -ne $ValidationTerminalIcon0 -and $null -ne $ValidationTerminalTitle0 -and $null -ne $ValidationTerminalScriptBlock0){
                                            $ValidationTerminalIcon1        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationTerminalTitle1       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationTerminalScriptBlock1 = $Session:TerminalHash1.Function
                                            if($null -ne $ValidationTerminalIcon1 -and $null -ne $ValidationTerminalTitle1 -and $null -ne $ValidationTerminalScriptBlock1){
                                                $ValidationTerminalIcon2        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationTerminalTitle2       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationTerminalScriptBlock2 = $Session:TerminalHash2.Function
                                                if($null -ne $ValidationTerminalIcon2 -and $null -ne $ValidationTerminalTitle2 -and $null -ne $ValidationTerminalScriptBlock2){
                                                    $ValidationTerminalIcon3        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationTerminalTitle3       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationTerminalScriptBlock3 = $Session:TerminalHash3.Function
                                                    if($null -ne $ValidationTerminalIcon3 -and $null -ne $ValidationTerminalTitle3 -and $null -ne $ValidationTerminalScriptBlock3){
                                                        $ValidationTerminalIcon4        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationTerminalTitle4       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationTerminalScriptBlock4 = $Session:TerminalHash4.Function
                                                        if($null -ne $ValidationTerminalIcon4 -and $null -ne $ValidationTerminalTitle4 -and $null -ne $ValidationTerminalScriptBlock4){
                                                            $ValidationTerminalIcon5        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'5')).Value
                                                            $ValidationTerminalTitle5       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'5')).Value
                                                            $ValidationTerminalScriptBlock5 = $Session:TerminalHash5.Function
                                                            if($null -ne $ValidationTerminalIcon5 -and $null -ne $ValidationTerminalTitle5 -and $null -ne $ValidationTerminalScriptBlock5){
                                                                $ValidationTerminalIcon6        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'6')).Value
                                                                $ValidationTerminalTitle6       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'6')).Value
                                                                $ValidationTerminalScriptBlock6 = $Session:TerminalHash6.Function
                                                                if($null -ne $ValidationTerminalIcon6 -and $null -ne $ValidationTerminalTitle6 -and $null -ne $ValidationTerminalScriptBlock6){
                                                                    $ValidationTerminalIcon7        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'7')).Value
                                                                    $ValidationTerminalTitle7       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'7')).Value
                                                                    $ValidationTerminalScriptBlock7 = $Session:TerminalHash7.Function
                                                                    if($null -ne $ValidationTerminalIcon7 -and $null -ne $ValidationTerminalTitle7 -and $null -ne $ValidationTerminalScriptBlock7){
                                                                        $ValidationTerminalIcon8        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'8')).Value
                                                                        $ValidationTerminalTitle8       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'8')).Value
                                                                        $ValidationTerminalScriptBlock8 = $Session:TerminalHash8.Function
                                                                        if($null -ne $ValidationTerminalIcon8 -and $null -ne $ValidationTerminalTitle8 -and $null -ne $ValidationTerminalScriptBlock8){
                                                                            $ValidationTerminalIcon9        = (Get-UDElement -Id ('TerminalPSCOItemIconIdTextBox'+'9')).Value
                                                                            $ValidationTerminalTitle9       = (Get-UDElement -Id ('TerminalPSCOItemTitleIdTextBox'+'9')).Value
                                                                            $ValidationTerminalScriptBlock9 = $Session:TerminalHash9.Function
                                                                            if($null -ne $ValidationTerminalIcon9 -and $null -ne $ValidationTerminalTitle9 -and $null -ne $ValidationTerminalScriptBlock9){
                                                                                $TerminalValidationCondition = $true
                                                                                $TerminalExportButtonsJson   = (
@"
[{'Icon':'$ValidationTerminalIcon0','Title':'$ValidationTerminalTitle0','DataSet':'null','Content':[$ValidationTerminalScriptBlock0]},{'Icon':'$ValidationTerminalIcon1','Title':'$ValidationTerminalTitle1','DataSet':'null','Content':[$ValidationTerminalScriptBlock1]},{'Icon':'$ValidationTerminalIcon2','Title':'$ValidationTerminalTitle2','DataSet':'null','Content':[$ValidationTerminalScriptBlock2]},{'Icon':'$ValidationTerminalIcon3','Title':'$ValidationTerminalTitle3','DataSet':'null','Content':[$ValidationTerminalScriptBlock3]},{'Icon':'$ValidationTerminalIcon4','Title':'$ValidationTerminalTitle4','DataSet':'null','Content':[$ValidationTerminalScriptBlock4]},{'Icon':'$ValidationTerminalIcon5','Title':'$ValidationTerminalTitle5','DataSet':'null','Content':[$ValidationTerminalScriptBlock5]},{'Icon':'$ValidationTerminalIcon6','Title':'$ValidationTerminalTitle6','DataSet':'null','Content':[$ValidationTerminalScriptBlock6]},{'Icon':'$ValidationTerminalIcon7','Title':'$ValidationTerminalTitle7','DataSet':'null','Content':[$ValidationTerminalScriptBlock7]},{'Icon':'$ValidationTerminalIcon8','Title':'$ValidationTerminalTitle8','DataSet':'null','Content':[$ValidationTerminalScriptBlock8]},{'Icon':'$ValidationTerminalIcon9','Title':'$ValidationTerminalTitle9','DataSet':'null','Content':[$ValidationTerminalScriptBlock9]}]
"@)                                                                                
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                $ValidateMainSC = {
                                    if($GetMainButtonCount -eq 1){
                                        Show-UDToast -Message 'Minimum main buttons is 2'
                                    }
                                    elseif($GetMainButtonCount -eq 2){
                                        $ValidationMainIcon0        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationMainTitle0       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationMainScriptBlock0 = $Session:MainHash0.Function
                                        if($null -ne $ValidationMainIcon0 -and $null -ne $ValidationMainTitle0 -and $null -ne $ValidationMainScriptBlock0){
                                            $ValidationMainIcon1        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationMainTitle1       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationMainScriptBlock1 = $Session:MainHash1.Function
                                            if($null -ne $ValidationMainIcon1 -and $null -ne $ValidationMainTitle1 -and $null -ne $ValidationMainScriptBlock1){
                                                $MainValidationCondition = $true
                                                $MainExportButtonsJson   = (
@"
[{'Icon':'$ValidationMainIcon0','Title':'$ValidationMainTitle0','DataSet':'null','Content':[$ValidationMainScriptBlock0]},{'Icon':'$ValidationMainIcon1','Title':'$ValidationMainTitle1','DataSet':'null','Content':[$ValidationMainScriptBlock1]}]
"@)
                                            }
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 3){
                                        $ValidationMainIcon0        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationMainTitle0       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationMainScriptBlock0 = $Session:MainHash0.Function
                                        if($null -ne $ValidationMainIcon0 -and $null -ne $ValidationMainTitle0 -and $null -ne $ValidationMainScriptBlock0){
                                            $ValidationMainIcon1        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationMainTitle1       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationMainScriptBlock1 = $Session:MainHash1.Function
                                            if($null -ne $ValidationMainIcon1 -and $null -ne $ValidationMainTitle1 -and $null -ne $ValidationMainScriptBlock1){
                                                $ValidationMainIcon2        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationMainTitle2       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationMainScriptBlock2 = $Session:MainHash2.Function
                                                if($null -ne $ValidationMainIcon2 -and $null -ne $ValidationMainTitle2 -and $null -ne $ValidationMainScriptBlock2){
                                                    $MainValidationCondition = $true
                                                    $MainExportButtonsJson   = (
@"
[{'Icon':'$ValidationMainIcon0','Title':'$ValidationMainTitle0','DataSet':'null','Content':[$ValidationMainScriptBlock0]},{'Icon':'$ValidationMainIcon1','Title':'$ValidationMainTitle1','DataSet':'null','Content':[$ValidationMainScriptBlock1]},{'Icon':'$ValidationMainIcon2','Title':'$ValidationMainTitle2','DataSet':'null','Content':[$ValidationMainScriptBlock2]}]
"@)
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 4){
                                        $ValidationMainIcon0        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationMainTitle0       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationMainScriptBlock0 = $Session:MainHash0.Function
                                        if($null -ne $ValidationMainIcon0 -and $null -ne $ValidationMainTitle0 -and $null -ne $ValidationMainScriptBlock0){
                                            $ValidationMainIcon1        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationMainTitle1       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationMainScriptBlock1 = $Session:MainHash1.Function
                                            if($null -ne $ValidationMainIcon1 -and $null -ne $ValidationMainTitle1 -and $null -ne $ValidationMainScriptBlock1){
                                                $ValidationMainIcon2        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationMainTitle2       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationMainScriptBlock2 = $Session:MainHash2.Function
                                                if($null -ne $ValidationMainIcon2 -and $null -ne $ValidationMainTitle2 -and $null -ne $ValidationMainScriptBlock2){
                                                    $ValidationMainIcon3        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationMainTitle3       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationMainScriptBlock3 = $Session:MainHash3.Function
                                                    if($null -ne $ValidationMainIcon3 -and $null -ne $ValidationMainTitle3 -and $null -ne $ValidationMainScriptBlock3){
                                                        $MainValidationCondition = $true
                                                        $MainExportButtonsJson   = (
@"
[{'Icon':'$ValidationMainIcon0','Title':'$ValidationMainTitle0','DataSet':'null','Content':[$ValidationMainScriptBlock0]},{'Icon':'$ValidationMainIcon1','Title':'$ValidationMainTitle1','DataSet':'null','Content':[$ValidationMainScriptBlock1]},{'Icon':'$ValidationMainIcon2','Title':'$ValidationMainTitle2','DataSet':'null','Content':[$ValidationMainScriptBlock2]},{'Icon':'$ValidationMainIcon3','Title':'$ValidationMainTitle3','DataSet':'null','Content':[$ValidationMainScriptBlock3]}]
"@)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 5){
                                        $ValidationMainIcon0        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationMainTitle0       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationMainScriptBlock0 = $Session:MainHash0.Function
                                        if($null -ne $ValidationMainIcon0 -and $null -ne $ValidationMainTitle0 -and $null -ne $ValidationMainScriptBlock0){
                                            $ValidationMainIcon1        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationMainTitle1       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationMainScriptBlock1 = $Session:MainHash1.Function
                                            if($null -ne $ValidationMainIcon1 -and $null -ne $ValidationMainTitle1 -and $null -ne $ValidationMainScriptBlock1){
                                                $ValidationMainIcon2        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationMainTitle2       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationMainScriptBlock2 = $Session:MainHash2.Function
                                                if($null -ne $ValidationMainIcon2 -and $null -ne $ValidationMainTitle2 -and $null -ne $ValidationMainScriptBlock2){
                                                    $ValidationMainIcon3        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationMainTitle3       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationMainScriptBlock3 = $Session:MainHash3.Function
                                                    if($null -ne $ValidationMainIcon3 -and $null -ne $ValidationMainTitle3 -and $null -ne $ValidationMainScriptBlock3){
                                                        $ValidationMainIcon4        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationMainTitle4       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationMainScriptBlock4 = $Session:MainHash4.Function
                                                        if($null -ne $ValidationMainIcon4 -and $null -ne $ValidationMainTitle4 -and $null -ne $ValidationMainScriptBlock4){
                                                            $MainValidationCondition = $true
                                                            $MainExportButtonsJson   = (
@"
[{'Icon':'$ValidationMainIcon0','Title':'$ValidationMainTitle0','DataSet':'null','Content':[$ValidationMainScriptBlock0]},{'Icon':'$ValidationMainIcon1','Title':'$ValidationMainTitle1','DataSet':'null','Content':[$ValidationMainScriptBlock1]},{'Icon':'$ValidationMainIcon2','Title':'$ValidationMainTitle2','DataSet':'null','Content':[$ValidationMainScriptBlock2]},{'Icon':'$ValidationMainIcon3','Title':'$ValidationMainTitle3','DataSet':'null','Content':[$ValidationMainScriptBlock3]},{'Icon':'$ValidationMainIcon4','Title':'$ValidationMainTitle4','DataSet':'null','Content':[$ValidationMainScriptBlock4]}]
"@)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 6){
                                        $ValidationMainIcon0        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationMainTitle0       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationMainScriptBlock0 = $Session:MainHash0.Function
                                        if($null -ne $ValidationMainIcon0 -and $null -ne $ValidationMainTitle0 -and $null -ne $ValidationMainScriptBlock0){
                                            $ValidationMainIcon1        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationMainTitle1       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationMainScriptBlock1 = $Session:MainHash1.Function
                                            if($null -ne $ValidationMainIcon1 -and $null -ne $ValidationMainTitle1 -and $null -ne $ValidationMainScriptBlock1){
                                                $ValidationMainIcon2        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationMainTitle2       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationMainScriptBlock2 = $Session:MainHash2.Function
                                                if($null -ne $ValidationMainIcon2 -and $null -ne $ValidationMainTitle2 -and $null -ne $ValidationMainScriptBlock2){
                                                    $ValidationMainIcon3        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationMainTitle3       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationMainScriptBlock3 = $Session:MainHash3.Function
                                                    if($null -ne $ValidationMainIcon3 -and $null -ne $ValidationMainTitle3 -and $null -ne $ValidationMainScriptBlock3){
                                                        $ValidationMainIcon4        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationMainTitle4       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationMainScriptBlock4 = $Session:MainHash4.Function
                                                        if($null -ne $ValidationMainIcon4 -and $null -ne $ValidationMainTitle4 -and $null -ne $ValidationMainScriptBlock4){
                                                            $ValidationMainIcon5        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'5')).Value
                                                            $ValidationMainTitle5       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'5')).Value
                                                            $ValidationMainScriptBlock5 = $Session:MainHash5.Function
                                                            if($null -ne $ValidationMainIcon5 -and $null -ne $ValidationMainTitle5 -and $null -ne $ValidationMainScriptBlock5){
                                                                $MainValidationCondition = $true
                                                                $MainExportButtonsJson   = (
@"
[{'Icon':'$ValidationMainIcon0','Title':'$ValidationMainTitle0','DataSet':'null','Content':[$ValidationMainScriptBlock0]},{'Icon':'$ValidationMainIcon1','Title':'$ValidationMainTitle1','DataSet':'null','Content':[$ValidationMainScriptBlock1]},{'Icon':'$ValidationMainIcon2','Title':'$ValidationMainTitle2','DataSet':'null','Content':[$ValidationMainScriptBlock2]},{'Icon':'$ValidationMainIcon3','Title':'$ValidationMainTitle3','DataSet':'null','Content':[$ValidationMainScriptBlock3]},{'Icon':'$ValidationMainIcon4','Title':'$ValidationMainTitle4','DataSet':'null','Content':[$ValidationMainScriptBlock4]},{'Icon':'$ValidationMainIcon5','Title':'$ValidationMainTitle5','DataSet':'null','Content':[$ValidationMainScriptBlock5]}]
"@)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 7){
                                        $ValidationMainIcon0        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationMainTitle0       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationMainScriptBlock0 = $Session:MainHash0.Function
                                        if($null -ne $ValidationMainIcon0 -and $null -ne $ValidationMainTitle0 -and $null -ne $ValidationMainScriptBlock0){
                                            $ValidationMainIcon1        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationMainTitle1       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationMainScriptBlock1 = $Session:MainHash1.Function
                                            if($null -ne $ValidationMainIcon1 -and $null -ne $ValidationMainTitle1 -and $null -ne $ValidationMainScriptBlock1){
                                                $ValidationMainIcon2        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationMainTitle2       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationMainScriptBlock2 = $Session:MainHash2.Function
                                                if($null -ne $ValidationMainIcon2 -and $null -ne $ValidationMainTitle2 -and $null -ne $ValidationMainScriptBlock2){
                                                    $ValidationMainIcon3        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationMainTitle3       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationMainScriptBlock3 = $Session:MainHash3.Function
                                                    if($null -ne $ValidationMainIcon3 -and $null -ne $ValidationMainTitle3 -and $null -ne $ValidationMainScriptBlock3){
                                                        $ValidationMainIcon4        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationMainTitle4       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationMainScriptBlock4 = $Session:MainHash4.Function
                                                        if($null -ne $ValidationMainIcon4 -and $null -ne $ValidationMainTitle4 -and $null -ne $ValidationMainScriptBlock4){
                                                            $ValidationMainIcon5        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'5')).Value
                                                            $ValidationMainTitle5       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'5')).Value
                                                            $ValidationMainScriptBlock5 = $Session:MainHash5.Function
                                                            if($null -ne $ValidationMainIcon5 -and $null -ne $ValidationMainTitle5 -and $null -ne $ValidationMainScriptBlock5){
                                                                $ValidationMainIcon6        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'6')).Value
                                                                $ValidationMainTitle6       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'6')).Value
                                                                $ValidationMainScriptBlock6 = $Session:MainHash6.Function
                                                                if($null -ne $ValidationMainIcon6 -and $null -ne $ValidationMainTitle6 -and $null -ne $ValidationMainScriptBlock6){
                                                                    $MainValidationCondition = $true
                                                                    $MainExportButtonsJson   = (
@"
[{'Icon':'$ValidationMainIcon0','Title':'$ValidationMainTitle0','DataSet':'null','Content':[$ValidationMainScriptBlock0]},{'Icon':'$ValidationMainIcon1','Title':'$ValidationMainTitle1','DataSet':'null','Content':[$ValidationMainScriptBlock1]},{'Icon':'$ValidationMainIcon2','Title':'$ValidationMainTitle2','DataSet':'null','Content':[$ValidationMainScriptBlock2]},{'Icon':'$ValidationMainIcon3','Title':'$ValidationMainTitle3','DataSet':'null','Content':[$ValidationMainScriptBlock3]},{'Icon':'$ValidationMainIcon4','Title':'$ValidationMainTitle4','DataSet':'null','Content':[$ValidationMainScriptBlock4]},{'Icon':'$ValidationMainIcon5','Title':'$ValidationMainTitle5','DataSet':'null','Content':[$ValidationMainScriptBlock5]},{'Icon':'$ValidationMainIcon6','Title':'$ValidationMainTitle6','DataSet':'null','Content':[$ValidationMainScriptBlock6]}]
"@)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 8){
                                        $ValidationMainIcon0        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationMainTitle0       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationMainScriptBlock0 = $Session:MainHash0.Function
                                        if($null -ne $ValidationMainIcon0 -and $null -ne $ValidationMainTitle0 -and $null -ne $ValidationMainScriptBlock0){
                                            $ValidationMainIcon1        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationMainTitle1       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationMainScriptBlock1 = $Session:MainHash1.Function
                                            if($null -ne $ValidationMainIcon1 -and $null -ne $ValidationMainTitle1 -and $null -ne $ValidationMainScriptBlock1){
                                                $ValidationMainIcon2        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationMainTitle2       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationMainScriptBlock2 = $Session:MainHash2.Function
                                                if($null -ne $ValidationMainIcon2 -and $null -ne $ValidationMainTitle2 -and $null -ne $ValidationMainScriptBlock2){
                                                    $ValidationMainIcon3        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationMainTitle3       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationMainScriptBlock3 = $Session:MainHash3.Function
                                                    if($null -ne $ValidationMainIcon3 -and $null -ne $ValidationMainTitle3 -and $null -ne $ValidationMainScriptBlock3){
                                                        $ValidationMainIcon4        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationMainTitle4       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationMainScriptBlock4 = $Session:MainHash4.Function
                                                        if($null -ne $ValidationMainIcon4 -and $null -ne $ValidationMainTitle4 -and $null -ne $ValidationMainScriptBlock4){
                                                            $ValidationMainIcon5        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'5')).Value
                                                            $ValidationMainTitle5       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'5')).Value
                                                            $ValidationMainScriptBlock5 = $Session:MainHash5.Function
                                                            if($null -ne $ValidationMainIcon5 -and $null -ne $ValidationMainTitle5 -and $null -ne $ValidationMainScriptBlock5){
                                                                $ValidationMainIcon6        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'6')).Value
                                                                $ValidationMainTitle6       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'6')).Value
                                                                $ValidationMainScriptBlock6 = $Session:MainHash6.Function
                                                                if($null -ne $ValidationMainIcon6 -and $null -ne $ValidationMainTitle6 -and $null -ne $ValidationMainScriptBlock6){
                                                                    $ValidationMainIcon7        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'7')).Value
                                                                    $ValidationMainTitle7       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'7')).Value
                                                                    $ValidationMainScriptBlock7 = $Session:MainHash7.Function
                                                                    if($null -ne $ValidationMainIcon7 -and $null -ne $ValidationMainTitle7 -and $null -ne $ValidationMainScriptBlock7){
                                                                        $MainValidationCondition = $true
                                                                        $MainExportButtonsJson   = (
@"
[{'Icon':'$ValidationMainIcon0','Title':'$ValidationMainTitle0','DataSet':'null','Content':[$ValidationMainScriptBlock0]},{'Icon':'$ValidationMainIcon1','Title':'$ValidationMainTitle1','DataSet':'null','Content':[$ValidationMainScriptBlock1]},{'Icon':'$ValidationMainIcon2','Title':'$ValidationMainTitle2','DataSet':'null','Content':[$ValidationMainScriptBlock2]},{'Icon':'$ValidationMainIcon3','Title':'$ValidationMainTitle3','DataSet':'null','Content':[$ValidationMainScriptBlock3]},{'Icon':'$ValidationMainIcon4','Title':'$ValidationMainTitle4','DataSet':'null','Content':[$ValidationMainScriptBlock4]},{'Icon':'$ValidationMainIcon5','Title':'$ValidationMainTitle5','DataSet':'null','Content':[$ValidationMainScriptBlock5]},{'Icon':'$ValidationMainIcon6','Title':'$ValidationMainTitle6','DataSet':'null','Content':[$ValidationMainScriptBlock6]},{'Icon':'$ValidationMainIcon7','Title':'$ValidationMainTitle7','DataSet':'null','Content':[$ValidationMainScriptBlock7]}]
"@)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 9){
                                        $ValidationMainIcon0        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationMainTitle0       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationMainScriptBlock0 = $Session:MainHash0.Function
                                        if($null -ne $ValidationMainIcon0 -and $null -ne $ValidationMainTitle0 -and $null -ne $ValidationMainScriptBlock0){
                                            $ValidationMainIcon1        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationMainTitle1       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationMainScriptBlock1 = $Session:MainHash1.Function
                                            if($null -ne $ValidationMainIcon1 -and $null -ne $ValidationMainTitle1 -and $null -ne $ValidationMainScriptBlock1){
                                                $ValidationMainIcon2        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationMainTitle2       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationMainScriptBlock2 = $Session:MainHash2.Function
                                                if($null -ne $ValidationMainIcon2 -and $null -ne $ValidationMainTitle2 -and $null -ne $ValidationMainScriptBlock2){
                                                    $ValidationMainIcon3        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationMainTitle3       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationMainScriptBlock3 = $Session:MainHash3.Function
                                                    if($null -ne $ValidationMainIcon3 -and $null -ne $ValidationMainTitle3 -and $null -ne $ValidationMainScriptBlock3){
                                                        $ValidationMainIcon4        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationMainTitle4       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationMainScriptBlock4 = $Session:MainHash4.Function
                                                        if($null -ne $ValidationMainIcon4 -and $null -ne $ValidationMainTitle4 -and $null -ne $ValidationMainScriptBlock4){
                                                            $ValidationMainIcon5        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'5')).Value
                                                            $ValidationMainTitle5       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'5')).Value
                                                            $ValidationMainScriptBlock5 = $Session:MainHash5.Function
                                                            if($null -ne $ValidationMainIcon5 -and $null -ne $ValidationMainTitle5 -and $null -ne $ValidationMainScriptBlock5){
                                                                $ValidationMainIcon6        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'6')).Value
                                                                $ValidationMainTitle6       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'6')).Value
                                                                $ValidationMainScriptBlock6 = $Session:MainHash6.Function
                                                                if($null -ne $ValidationMainIcon6 -and $null -ne $ValidationMainTitle6 -and $null -ne $ValidationMainScriptBlock6){
                                                                    $ValidationMainIcon7        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'7')).Value
                                                                    $ValidationMainTitle7       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'7')).Value
                                                                    $ValidationMainScriptBlock7 = $Session:MainHash7.Function
                                                                    if($null -ne $ValidationMainIcon7 -and $null -ne $ValidationMainTitle7 -and $null -ne $ValidationMainScriptBlock7){
                                                                        $ValidationMainIcon8        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'8')).Value
                                                                        $ValidationMainTitle8       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'8')).Value
                                                                        $ValidationMainScriptBlock8 = $Session:MainHash8.Function
                                                                        if($null -ne $ValidationMainIcon8 -and $null -ne $ValidationMainTitle8 -and $null -ne $ValidationMainScriptBlock8){
                                                                            $MainValidationCondition = $true
                                                                            $MainExportButtonsJson   = (
@"
[{'Icon':'$ValidationMainIcon0','Title':'$ValidationMainTitle0','DataSet':'null','Content':[$ValidationMainScriptBlock0]},{'Icon':'$ValidationMainIcon1','Title':'$ValidationMainTitle1','DataSet':'null','Content':[$ValidationMainScriptBlock1]},{'Icon':'$ValidationMainIcon2','Title':'$ValidationMainTitle2','DataSet':'null','Content':[$ValidationMainScriptBlock2]},{'Icon':'$ValidationMainIcon3','Title':'$ValidationMainTitle3','DataSet':'null','Content':[$ValidationMainScriptBlock3]},{'Icon':'$ValidationMainIcon4','Title':'$ValidationMainTitle4','DataSet':'null','Content':[$ValidationMainScriptBlock4]},{'Icon':'$ValidationMainIcon5','Title':'$ValidationMainTitle5','DataSet':'null','Content':[$ValidationMainScriptBlock5]},{'Icon':'$ValidationMainIcon6','Title':'$ValidationMainTitle6','DataSet':'null','Content':[$ValidationMainScriptBlock6]},{'Icon':'$ValidationMainIcon7','Title':'$ValidationMainTitle7','DataSet':'null','Content':[$ValidationMainScriptBlock7]},{'Icon':'$ValidationMainIcon8','Title':'$ValidationMainTitle8','DataSet':'null','Content':[$ValidationMainScriptBlock8]}]
"@)
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    elseif($GetMainButtonCount -eq 10){
                                        $ValidationMainIcon0        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'0')).Value
                                        $ValidationMainTitle0       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'0')).Value
                                        $ValidationMainScriptBlock0 = $Session:MainHash0.Function
                                        if($null -ne $ValidationMainIcon0 -and $null -ne $ValidationMainTitle0 -and $null -ne $ValidationMainScriptBlock0){
                                            $ValidationMainIcon1        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'1')).Value
                                            $ValidationMainTitle1       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'1')).Value
                                            $ValidationMainScriptBlock1 = $Session:MainHash1.Function
                                            if($null -ne $ValidationMainIcon1 -and $null -ne $ValidationMainTitle1 -and $null -ne $ValidationMainScriptBlock1){
                                                $ValidationMainIcon2        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'2')).Value
                                                $ValidationMainTitle2       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'2')).Value
                                                $ValidationMainScriptBlock2 = $Session:MainHash2.Function
                                                if($null -ne $ValidationMainIcon2 -and $null -ne $ValidationMainTitle2 -and $null -ne $ValidationMainScriptBlock2){
                                                    $ValidationMainIcon3        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'3')).Value
                                                    $ValidationMainTitle3       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'3')).Value
                                                    $ValidationMainScriptBlock3 = $Session:MainHash3.Function
                                                    if($null -ne $ValidationMainIcon3 -and $null -ne $ValidationMainTitle3 -and $null -ne $ValidationMainScriptBlock3){
                                                        $ValidationMainIcon4        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'4')).Value
                                                        $ValidationMainTitle4       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'4')).Value
                                                        $ValidationMainScriptBlock4 = $Session:MainHash4.Function
                                                        if($null -ne $ValidationMainIcon4 -and $null -ne $ValidationMainTitle4 -and $null -ne $ValidationMainScriptBlock4){
                                                            $ValidationMainIcon5        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'5')).Value
                                                            $ValidationMainTitle5       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'5')).Value
                                                            $ValidationMainScriptBlock5 = $Session:MainHash5.Function
                                                            if($null -ne $ValidationMainIcon5 -and $null -ne $ValidationMainTitle5 -and $null -ne $ValidationMainScriptBlock5){
                                                                $ValidationMainIcon6        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'6')).Value
                                                                $ValidationMainTitle6       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'6')).Value
                                                                $ValidationMainScriptBlock6 = $Session:MainHash6.Function
                                                                if($null -ne $ValidationMainIcon6 -and $null -ne $ValidationMainTitle6 -and $null -ne $ValidationMainScriptBlock6){
                                                                    $ValidationMainIcon7        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'7')).Value
                                                                    $ValidationMainTitle7       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'7')).Value
                                                                    $ValidationMainScriptBlock7 = $Session:MainHash7.Function
                                                                    if($null -ne $ValidationMainIcon7 -and $null -ne $ValidationMainTitle7 -and $null -ne $ValidationMainScriptBlock7){
                                                                        $ValidationMainIcon8        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'8')).Value
                                                                        $ValidationMainTitle8       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'8')).Value
                                                                        $ValidationMainScriptBlock8 = $Session:MainHash8.Function
                                                                        if($null -ne $ValidationMainIcon8 -and $null -ne $ValidationMainTitle8 -and $null -ne $ValidationMainScriptBlock8){
                                                                            $ValidationMainIcon9        = (Get-UDElement -Id ('MainPSCOItemIconIdTextBox'+'9')).Value
                                                                            $ValidationMainTitle9       = (Get-UDElement -Id ('MainPSCOItemTitleIdTextBox'+'9')).Value
                                                                            $ValidationMainScriptBlock9 = $Session:MainHash9.Function
                                                                            if($null -ne $ValidationMainIcon9 -and $null -ne $ValidationMainTitle9 -and $null -ne $ValidationMainScriptBlock9){
                                                                                $MainValidationCondition = $true
                                                                                $MainExportButtonsJson   = (
@"
[{'Icon':'$ValidationMainIcon0','Title':'$ValidationMainTitle0','DataSet':'null','Content':[$ValidationMainScriptBlock0]},{'Icon':'$ValidationMainIcon1','Title':'$ValidationMainTitle1','DataSet':'null','Content':[$ValidationMainScriptBlock1]},{'Icon':'$ValidationMainIcon2','Title':'$ValidationMainTitle2','DataSet':'null','Content':[$ValidationMainScriptBlock2]},{'Icon':'$ValidationMainIcon3','Title':'$ValidationMainTitle3','DataSet':'null','Content':[$ValidationMainScriptBlock3]},{'Icon':'$ValidationMainIcon4','Title':'$ValidationMainTitle4','DataSet':'null','Content':[$ValidationMainScriptBlock4]},{'Icon':'$ValidationMainIcon5','Title':'$ValidationMainTitle5','DataSet':'null','Content':[$ValidationMainScriptBlock5]},{'Icon':'$ValidationMainIcon6','Title':'$ValidationMainTitle6','DataSet':'null','Content':[$ValidationMainScriptBlock6]},{'Icon':'$ValidationMainIcon7','Title':'$ValidationMainTitle7','DataSet':'null','Content':[$ValidationMainScriptBlock7]},{'Icon':'$ValidationMainIcon8','Title':'$ValidationMainTitle8','DataSet':'null','Content':[$ValidationMainScriptBlock8]},{'Icon':'$ValidationMainIcon9','Title':'$ValidationMainTitle9','DataSet':'null','Content':[$ValidationMainScriptBlock9]}]
"@)
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }

                                if($GetValidateSelectId -eq 1){
                                    $ValidateMainSC|iex
                                    if($MainValidationCondition -eq $true){
                                        $MainValidationConditionResult = $true
                                        $DataJson                    = $Body | ConvertFrom-Json
                                        $MainName                    = $DataJson.ItemNameIdTextBox
                                        $MainCacheVariable           = $DataJson.ItemVariableNameIdTextBox
                                        $UniqueId                    = ([guid]::NewGuid()).Guid
                                        $ExportJson                  = (
@"
[{'Selections':[
    {'ServiceProvider':[{'Id':'$UniqueId','Name':'$MainName','Items':[{'StatusVariable':'$MainCacheVariable','Buttons':$MainExportButtonsJson}]}]},
    {'TerminalProvider':'null'}
]}]
"@)    
                                    }
                                    else{
                                        $MainValidationConditionResult = $false
                                    }
                                }
                                elseif($GetValidateSelectId -eq 2){
                                    $ValidateMainSC|iex
                                    $ValidateTerminalSC|iex
                                    if($MainValidationCondition -eq $true -and $TerminalValidationCondition -eq $true){
                                        $MainValidationConditionResult = $true
                                        $DataJson                    = $Body | ConvertFrom-Json
                                        $MainName                    = $DataJson.ItemNameIdTextBox
                                        $TerminalName                = $DataJson.TerminalItemNameIdTextBox
                                        $MainCacheVariable           = $DataJson.ItemVariableNameIdTextBox
                                        $TerminalCacheVariable       = $DataJson.ItemTerminalVariableNameIdTextBox
                                        $UniqueId                    = ([guid]::NewGuid()).Guid
                                        $ExportJson                  = (
@"
[{'Selections':[
    {'ServiceProvider':[{'Id':'$UniqueId','Name':'$MainName','Items':[{'StatusVariable':'$MainCacheVariable','Buttons':$MainExportButtonsJson}]}]},
    {'TerminalProvider':[{'Id':'$UniqueId','Name':'$TerminalName','Items':[{'StatusVariable':'$TerminalCacheVariable','Buttons':$TerminalExportButtonsJson}]}]}
]}]
"@)                                        
                                    }
                                    else{
                                        $MainValidationConditionResult = $false
                                    }
                                }
                                elseif($GetValidateSelectId -eq 3){
                                    $ValidateTerminalSC|iex
                                    if($TerminalValidationCondition -eq $true){
                                        $MainValidationConditionResult = $true
                                        $DataJson                    = $Body | ConvertFrom-Json
                                        $TerminalName                = $DataJson.TerminalItemNameIdTextBox
                                        $TerminalCacheVariable       = $DataJson.ItemTerminalVariableNameIdTextBox
                                        $UniqueId                    = ([guid]::NewGuid()).Guid
                                        $ExportJson                  = (
@"
[{'Selections':[
    {'ServiceProvider':'null'},
    {'TerminalProvider':[{'Id':'$UniqueId','Name':'$TerminalName','Items':[{'StatusVariable':'$TerminalCacheVariable','Buttons':$TerminalExportButtonsJson}]}]}
]}]
"@)                                    
                                    }
                                    else{
                                        $MainValidationConditionResult = $false
                                    }
                                }
                            }
                            $ValidationSC|iex
                            
                            if($MainValidationConditionResult -eq $true){
                                Show-UDToast -Message 'CREATE SUCCESS'
                                $CreateNewFileJsonString = "$UniqueId"+'.json'
                                $NewItem = New-item -ItemType File ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+"$CreateNewFileJsonString") -Force
                                $SaveContent = Set-Content ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+"$CreateNewFileJsonString") -Value $ExportJson -Force
                                $Cache:InterfaceBlockDatabaseSC|iex
                                if($Session:DashboardCreatorSC -ne $null){
                                    $Session:DashboardCreatorSC|iex
                                }
                                $Session:DashboardCreatorSC=$null
                                Invoke-UDRedirect -Url '/interface'
                            }
                            else{
                                Show-UDToast -Message 'CREATE FAIL'
                            }

                        } -OnValidate {
                            $FormContent = $EventData
                            
                            if($Session:TerminalSelectBoxResult -eq 1){
                                # MAIN
                                if ($FormContent.ItemNameIdTextBox -eq $null -or $FormContent.ItemNameIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "ItemNameIdTextBox is required"
                                } else {
                                    $ValidCon1 = $true
                                }
                                if ($FormContent.ItemVariableNameIdTextBox -eq $null -or $FormContent.ItemVariableNameIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "ItemVariableNameIdTextBox is required"
                                } else {
                                    $ValidCon2 = $true
                                }
                                if ($FormContent.ButtonsRowMainCountIdTextBox -eq $null -or $FormContent.ButtonsRowMainCountIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "ButtonsRowMainCountIdTextBox is required"
                                } else {
                                    $ValidCon3 = $true
                                }

                                if(
                                    $ValidCon1 -eq $true -and
                                    $ValidCon2 -eq $true -and
                                    $ValidCon3 -eq $true
                                    ){New-UDFormValidationResult -Valid}
                            }
                            elseif($Session:TerminalSelectBoxResult -eq 2){
                                # MAIN
                                if ($FormContent.ItemNameIdTextBox -eq $null -or $FormContent.ItemNameIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "ItemNameIdTextBox is required"
                                } else {
                                    $ValidCon1 = $true
                                }
                                if ($FormContent.ItemVariableNameIdTextBox -eq $null -or $FormContent.ItemVariableNameIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "ItemVariableNameIdTextBox is required"
                                } else {
                                    $ValidCon2 = $true
                                }
                                if ($FormContent.ButtonsRowMainCountIdTextBox -eq $null -or $FormContent.ButtonsRowMainCountIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "ButtonsRowMainCountIdTextBox is required"
                                } else {
                                    $ValidCon3 = $true
                                }

                                # TERMINAL
                                if ($FormContent.TerminalItemNameIdTextBox -eq $null -or $FormContent.TerminalItemNameIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "TerminalItemNameIdTextBox is required"
                                } else {
                                    $ValidCon4 = $true
                                }
                                if ($FormContent.ItemTerminalVariableNameIdTextBox -eq $null -or $FormContent.ItemTerminalVariableNameIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "ItemTerminalVariableNameIdTextBox is required"
                                } else {
                                    $ValidCon5 = $true
                                }
                                if ($FormContent.ButtonsRowTerminalCountIdTextBox -eq $null -or $FormContent.ButtonsRowTerminalCountIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "ButtonsRowTerminalCountIdTextBox is required"
                                } else {
                                    $ValidCon6 = $true
                                }

                                if(
                                    $ValidCon1 -eq $true -and
                                    $ValidCon2 -eq $true -and
                                    $ValidCon3 -eq $true -and
                                    $ValidCon4 -eq $true -and
                                    $ValidCon5 -eq $true -and
                                    $ValidCon6 -eq $true
                                    ){New-UDFormValidationResult -Valid}
                            }
                            elseif($Session:TerminalSelectBoxResult -eq 3){
                                # TERMINAL
                                if ($FormContent.TerminalItemNameIdTextBox -eq $null -or $FormContent.TerminalItemNameIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "TerminalItemNameIdTextBox is required"
                                } else {
                                    $ValidCon1 = $true
                                }
                                if ($FormContent.ItemTerminalVariableNameIdTextBox -eq $null -or $FormContent.ItemTerminalVariableNameIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "ItemTerminalVariableNameIdTextBox is required"
                                } else {
                                    $ValidCon2 = $true
                                }
                                if ($FormContent.ButtonsRowTerminalCountIdTextBox -eq $null -or $FormContent.ButtonsRowTerminalCountIdTextBox -eq '') {
                                    New-UDFormValidationResult -ValidationError "ButtonsRowTerminalCountIdTextBox is required"
                                } else {
                                    $ValidCon3 = $true
                                }

                                if(
                                    $ValidCon1 -eq $true -and
                                    $ValidCon2 -eq $true -and
                                    $ValidCon3 -eq $true

                                    ){New-UDFormValidationResult -Valid}
                            }
                            else{

                            }
                        }
                    } -Style '
                    .MuiGrid-root {
                        padding: 0px;
                    }
                    .MuiButton-textPrimary {
                        display: inline-flex;
                        -webkit-box-align: center;
                        align-items: center;
                        -webkit-box-pack: center;
                        justify-content: center;
                        position: relative;
                        box-sizing: border-box;
                        -webkit-tap-highlight-color: transparent;
                        background-color: transparent;
                        outline: 0px;
                        border: 1px solid #eeeeee;
                        cursor: pointer;
                        user-select: none;
                        vertical-align: middle;
                        appearance: none;
                        text-decoration: none;
                        font-family: Roboto, Helvetica, Arial, sans-serif;
                        font-size: 12px;
                        font-weight: 600;
                        line-height: 1.75;
                        letter-spacing: 0.02857em;
                        text-transform: uppercase;
                        min-width: 64px;
                        margin-left: 3px;
                        margin-bottom: 3px;
                        padding-top: 2px;
                        padding-bottom: 0px;
                        padding-left: 5px;
                        padding-right: 5px;
                        border-radius: 0px;
                        transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, border-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
                        color: rgb(59, 59, 59);
                    }
                    .MuiButton-textPrimary:hover {
                        background-color: #f5f5f5;
                        color: #012cd9;
                        text-decoration: none;
                        background-color: rgb(245, 245, 245);
                        box-shadow: rgb(0 0 0 / 20%) 0px 2px 4px -1px, rgb(0 0 0 / 14%) 0px 4px 5px 0px, rgb(0 0 0 / 12%) 0px 1px 10px 0px;
                    }
                    '
                }
            }                 
        } -Elevation 1
    }
}

New-UDGrid -Spacing 1 -Container -Content {
    $Session:FirstRunNum=1
    $MainSC|iex
    
}




