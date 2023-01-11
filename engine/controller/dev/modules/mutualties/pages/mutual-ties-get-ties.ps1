
$Session:MutualTiesBindingName = $Session:LoadingMutualTiesDatasetJson.BindingName
$Session:MutualTiesBlockPath   = $Session:LoadingMutualTiesDatasetJson.BlockPath
$Session:MutualTiesDataset     = $Session:LoadingMutualTiesDatasetJson.Dataset

$MainSC = {
    New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
        New-UDPaper -ClassName "mutual-ties-box-layout" -Square -Content {
            New-UDRow -Columns {
                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                    New-UDElement -Tag 'table' -Content {
                        New-UDElement -Tag 'tr' -Content {
                            New-UDElement -Tag 'td' -Content {
                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'mutual-ties-box-logo'
                            }
                            New-UDElement -Tag 'td' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDTypography -Text 'Edit Mutual Ties Form' -ClassName 'mutual-ties-box-title'
                                }
                            }
                        }
                    }
                    New-UDStyle -Content {
                        New-UDForm -Id 'Entity-Center-New-Entity-Group-Container-Form' -Children {
                            New-UDElement -Tag 'div' -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Block Id' -ClassName 'mutual-ties-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTextbox -Id 'MutualTiesBlockIdentificationIdTextBox' -Type text -ClassName 'mutual-ties-box-text' -Value $Session:MutualTiesBlockId -Disabled 
                                            }
                                        }
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Block Path' -ClassName 'mutual-ties-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTextbox -Id 'MutualTiesBlockPathIdTextBox' -Type text -ClassName 'mutual-ties-box-text' -Value $Session:MutualTiesBlockPath -Disabled 
                                            }
                                        }
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Block Provider' -ClassName 'mutual-ties-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTextbox -Id 'MutualTiesBlockProviderIdTextBox' -Type text -ClassName 'mutual-ties-box-text' -Value $Session:MutualTiesBlockProvider -Disabled 
                                            }
                                        }
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Binding Name' -ClassName 'mutual-ties-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTextbox -Id 'MutualTiesBindingNameIdTextBox' -Type text -ClassName 'mutual-ties-box-text' -Value $Session:MutualTiesBindingName
                                            }
                                        }
                                    }
                                }

                                # SERVER BLOCK LIST
                                if($Session:ServerBlockListCondition -eq $True){
                                    $ServerBlockListDataGci = gci $Cache:InterfaceServerBlockDatabasePath
                                    $Session:ServerBlockListData = @(
                                        foreach ($Item in $ServerBlockListDataGci) {
                                            $ItemFullName                 = $Item.FullName
                                            $ItemFullNameGc               = gc $ItemFullName
                                            $ItemFullNameJson             = $ItemFullNameGc | ConvertFrom-Json
                                            $ItemFullNameJsonSelections   = $ItemFullNameJson.Selections
                                            $PropertyNameList             = (((($ItemFullNameJsonSelections | ConvertTo-Xml -Depth 100).objects).object).property)
                                            foreach ($PropertyItem in $PropertyNameList) {
                                                if($PropertyItem.Name -eq 'ServiceProvider'){
                                                    $Id   = ($ItemFullNameJsonSelections.ServiceProvider).Id
                                                    $Name = ($ItemFullNameJsonSelections.ServiceProvider).Name
                                                    if($null -ne $Id){
                                                        if($Session:MutualTiesBlockId -eq $Id -and $Session:MutualTiesBlockProvider -eq 'ServiceProvider'){}
                                                        else{
                                                            @{BlockName = 'Server Block';ProviderName = 'Service Provider';BindName = $Name;BindId = $Id;Settings = '1'}
                                                        }
                                                    }
                                                }
                                                elseif($PropertyItem.Name -eq 'TerminalProvider'){
                                                    $Id   = ($ItemFullNameJsonSelections.TerminalProvider).Id
                                                    $Name = ($ItemFullNameJsonSelections.TerminalProvider).Name
                                                    if($null -ne $Id){
                                                        if($Session:MutualTiesBlockId -eq $Id -and $Session:MutualTiesBlockProvider -eq 'TerminalProvider'){}
                                                        else{
                                                            @{BlockName = 'Server Block';ProviderName = 'Terminal Provider';BindName = $Name;BindId = $Id;Settings = '1'}
                                                        }
                                                    }
                                                }
                                            }
                                            
                                        }
                                    ) 
                                }
                                elseif($Session:ServerBlockListCondition -eq $False){}
                                else{}
                                # COMPONENTS BLOCK LIST
                                if($Session:ComponentsBlockListCondition -eq $True){
                                    $ComponentsBlockListDataGci = gci $Cache:InterfaceComponentsBlockDatabasePath
                                    $Session:ComponentsBlockListData = @(
                                        foreach ($Item in $ComponentsBlockListDataGci) {
                                            $ItemFullName                 = $Item.FullName
                                            $ItemFullNameGc               = gc $ItemFullName
                                            $ItemFullNameJson             = $ItemFullNameGc | ConvertFrom-Json
                                            $ItemFullNameJsonSelections   = $ItemFullNameJson.Selections
                                            $PropertyNameList             = (((($ItemFullNameJsonSelections | ConvertTo-Xml -Depth 100).objects).object).property)
                                            foreach ($PropertyItem in $PropertyNameList) {
                                                if($PropertyItem.Name -eq 'ServiceProvider'){
                                                    $Id   = ($ItemFullNameJsonSelections.ServiceProvider).Id
                                                    $Name = ($ItemFullNameJsonSelections.ServiceProvider).Name
                                                    if($null -ne $Id){
                                                        if($Session:MutualTiesBlockId -eq $Id -and $Session:MutualTiesBlockProvider -eq 'ServiceProvider'){}
                                                        else{
                                                            @{BlockName = 'Components Block';ProviderName = 'Service Provider';BindName = $Name;BindId = $Id;Settings = '1'}
                                                        }
                                                    }
                                                }
                                                elseif($PropertyItem.Name -eq 'TerminalProvider'){
                                                    $Id   = ($ItemFullNameJsonSelections.TerminalProvider).Id
                                                    $Name = ($ItemFullNameJsonSelections.TerminalProvider).Name
                                                    if($null -ne $Id){
                                                        if($Session:MutualTiesBlockId -eq $Id -and $Session:MutualTiesBlockProvider -eq 'TerminalProvider'){}
                                                        else{
                                                            @{BlockName = 'Components Block';ProviderName = 'Terminal Provider';BindName = $Name;BindId = $Id;Settings = '1'}
                                                        }
                                                    }
                                                }
                                            }
                                            
                                        }
                                    ) 
                                }
                                elseif($Session:ComponentsBlockListCondition -eq $False){}
                                else{}
                                # PSUCA CONTROLLER BLOCK LIST
                                if($Session:PsucaControllerBlockListCondition -eq $True){
                                    $PsucaControllerBlockListDataGci = gci $Cache:InterfacePsucaControllerBlockDatabasePath
                                    $Session:PsucaControllerBlockListData = @(
                                        foreach ($Item in $PsucaControllerBlockListDataGci) {
                                            $ItemFullName                 = $Item.FullName
                                            $ItemFullNameGc               = gc $ItemFullName
                                            $ItemFullNameJson             = $ItemFullNameGc | ConvertFrom-Json
                                            $ItemFullNameJsonSelections   = $ItemFullNameJson.Selections
                                            $PropertyNameList             = (((($ItemFullNameJsonSelections | ConvertTo-Xml -Depth 100).objects).object).property)
                                            foreach ($PropertyItem in $PropertyNameList) {
                                                if($PropertyItem.Name -eq 'ServiceProvider'){
                                                    $Id   = ($ItemFullNameJsonSelections.ServiceProvider).Id
                                                    $Name = ($ItemFullNameJsonSelections.ServiceProvider).Name
                                                    if($null -ne $Id){
                                                        if($Session:MutualTiesBlockId -eq $Id -and $Session:MutualTiesBlockProvider -eq 'ServiceProvider'){}
                                                        else{
                                                            @{BlockName = 'Psuca Controller Block';ProviderName = 'Service Provider';BindName = $Name;BindId = $Id;Settings = '1'}
                                                        }
                                                    }
                                                }
                                                elseif($PropertyItem.Name -eq 'TerminalProvider'){
                                                    $Id   = ($ItemFullNameJsonSelections.TerminalProvider).Id
                                                    $Name = ($ItemFullNameJsonSelections.TerminalProvider).Name
                                                    if($null -ne $Id){
                                                        if($Session:MutualTiesBlockId -eq $Id -and $Session:MutualTiesBlockProvider -eq 'TerminalProvider'){}
                                                        else{
                                                            @{BlockName = 'Psuca Controller Block';ProviderName = 'Terminal Provider';BindName = $Name;BindId = $Id;Settings = '1'}
                                                        }
                                                    }
                                                }
                                            }
                                            
                                        }
                                    ) 
                                }
                                elseif($Session:PsucaControllerBlockListCondition -eq $False){}
                                else{}
                                # PSUCA DASHBOARD BLOCK LIST
                                if($Session:PsucaDashboardBlockListCondition -eq $True){
                                    $PsucaDashboardBlockListDataGci = gci $Cache:InterfacePsucaDashboardBlockDatabasePath
                                    $Session:PsucaDashboardBlockListData = @(
                                        foreach ($Item in $PsucaDashboardBlockListDataGci) {
                                            $ItemFullName                 = $Item.FullName
                                            $ItemFullNameGc               = gc $ItemFullName
                                            $ItemFullNameJson             = $ItemFullNameGc | ConvertFrom-Json
                                            $ItemFullNameJsonSelections   = $ItemFullNameJson.Selections
                                            $PropertyNameList             = (((($ItemFullNameJsonSelections | ConvertTo-Xml -Depth 100).objects).object).property)
                                            foreach ($PropertyItem in $PropertyNameList) {
                                                if($PropertyItem.Name -eq 'ServiceProvider'){
                                                    $Id   = ($ItemFullNameJsonSelections.ServiceProvider).Id
                                                    $Name = ($ItemFullNameJsonSelections.ServiceProvider).Name
                                                    if($null -ne $Id){
                                                        if($Session:MutualTiesBlockId -eq $Id -and $Session:MutualTiesBlockProvider -eq 'ServiceProvider'){}
                                                        else{
                                                            @{BlockName = 'Psuca Dashboard Block';ProviderName = 'Service Provider';BindName = $Name;BindId = $Id;Settings = '1'}
                                                        }
                                                    }
                                                }
                                                elseif($PropertyItem.Name -eq 'TerminalProvider'){
                                                    $Id   = ($ItemFullNameJsonSelections.TerminalProvider).Id
                                                    $Name = ($ItemFullNameJsonSelections.TerminalProvider).Name
                                                    if($null -ne $Id){
                                                        if($Session:MutualTiesBlockId -eq $Id -and $Session:MutualTiesBlockProvider -eq 'TerminalProvider'){}
                                                        else{
                                                            @{BlockName = 'Psuca Dashboard Block';ProviderName = 'Terminal Provider';BindName = $Name;BindId = $Id;Settings = '1'}
                                                        }
                                                    }
                                                }
                                            }
                                            
                                        }
                                    ) 
                                }
                                elseif($Session:PsucaDashboardBlockListCondition -eq $False){}
                                else{}

                                $Data = @()
                                $Data += $Session:ServerBlockListData
                                $Data += $Session:ComponentsBlockListData
                                $Data += $Session:PsucaControllerBlockListData
                                $Data += $Session:PsucaDashboardBlockListData

                                $Columns = @(
                                    New-UDTableColumn -Property Settings -Title ' ' -Width 0 -Render {
                                        $Icon        = New-UDIcon -Icon Square
                                        $CheckedIcon = New-UDIcon -Icon CheckSquare
                                        New-UDElement -Id 'MutualTiesTableColumnCheckboxId' -Tag 'div' -Content {
                                            
                                            foreach ($CheckBoxItem in $Session:MutualTiesDataset) {
                                                if($($EventData.BindId) -eq $CheckBoxItem.Id){
                                                    $CheckBoxItemCondition = $True
                                                }    
                                            }
                                            if($CheckBoxItemCondition -eq $True){
                                                New-UDCheckBox -Id ("CheckBox$($EventData.BindId)"+'ProviderName'+"$($EventData.ProviderName)") -Icon $Icon -Style @{color='gray';padding='0px'} -Checked $True
                                            }
                                            else{
                                                New-UDCheckBox -Id ("CheckBox$($EventData.BindId)"+'ProviderName'+"$($EventData.ProviderName)") -Icon $Icon -Style @{color='gray';padding='0px'} -Checked $False
                                            }
                                            $CheckBoxItemCondition = $False
                                        }
                                    }
                                    New-UDTableColumn -ShowSort -Property BlockName -Title 'Block' -IncludeInSearch -Render {
                                        New-UDTypography -Text "$($EventData.BlockName)"
                                    }
                                    New-UDTableColumn -Property ProviderName -Title 'Provider' -IncludeInSearch -Render {
                                        New-UDTypography -Text "$($EventData.ProviderName)"
                                    }
                                    New-UDTableColumn -Property BindName -Title 'Name' -IncludeInSearch -Render {
                                        New-UDTypography -Text "$($EventData.BindName)"
                                    }
                                    New-UDTableColumn -Property BindId -Title 'Id' -IncludeInSearch -Render {
                                        New-UDTypography -Text "$($EventData.BindId)"
                                    }
                                    New-UDTableColumn -Property ActiveJobs -Title 'ActiveJobs' -IncludeInSearch -Render {
                                        New-UDTypography -Text '0'
                                    }
                                )
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'div' -Content {
                                                New-UDStyle -Content {
                                                    New-UDTable -Id 'MutualTiesList_table' -Data $Data -Columns $Columns -Title 'Mutual Ties List' -ShowSearch -ShowPagination -Dense -OnRowSelection {
                                                        $Item = $EventData
                                                    } -PageSize 20 -ClassName 'dashboard-list-of-transactions-table-class' -ShowRefresh 
                                                } -Style '
                                                font-size: 7px;
                                                width: 99%;
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

                            }
                            New-UDElement -Tag 'p' -Content {}
                            New-UDElement -Tag 'p' -Content {}
                        } -SubmitText 'Save Mutual Ties' -OnSubmit {
                            $BodyJson              = $Body | ConvertFrom-Json
                            $SelectCheckBoxListXml = (((($BodyJson | ConvertTo-Xml).Objects).Object).Property) | ? {$_.Name -like '*CheckBox*'}
                            $MutualTiesList        = @()
                            $MutualTiesId          = $BodyJson.MutualTiesBlockIdentificationIdTextBox
                            $MutualTiesPath        = $BodyJson.MutualTiesBlockPathIdTextBox
                            $MutualTiesProvider    = $BodyJson.MutualTiesBlockProviderIdTextBox
                            $MutualTiesBindingName = $BodyJson.MutualTiesBindingNameIdTextBox
                            foreach ($CheckBoxItem in $SelectCheckBoxListXml) {
                                if($BodyJson.($CheckBoxItem.Name) -eq $True){
                                    $MutualTiesList += @{Id=(($CheckBoxItem.Name).Replace('CheckBox','')) -replace 'ProviderName.*';Provider=(($CheckBoxItem.Name) -replace '.*ProviderName') -replace ' '}
                                }
                            }
                            if($null -ne $MutualTiesList){
                                $MutualTiesListToJson    = $MutualTiesList | ConvertTo-Json -Depth 100
                                $MutualTiesDatasetFormat = '['+'{'+"'"+'BindingName'+"'"+':'+"'"+"$MutualTiesBindingName"+"'"+','+"'"+'BlockPath'+"'"+':'+"'"+"$MutualTiesPath"+"'"+','+"'"+'Dataset'+"'"+':'+"$MutualTiesListToJson"+'}'+']'
                                $CreatePath              = "$Cache:MutualTieskDatabaseDatasetPath"+"$MutualTiesId"+'\'
                                $CreateFilePath          = "$Cache:MutualTieskDatabaseDatasetPath"+"$MutualTiesId"+'\'+"$MutualTiesProvider"+'.json'
                                if(Test-Path $CreatePath){
                                    if(Test-Path $CreateFilePath){
                                        $Save = Set-Content $CreateFilePath -Value $MutualTiesDatasetFormat
                                        Show-UDToast -Message 'Save Mutual Ties'
                                    }
                                    else{
                                        $Save = New-Item -ItemType File $CreateFilePath -Value $MutualTiesDatasetFormat
                                        Show-UDToast -Message 'Save Mutual Ties'
                                    }
                                }
                                else{
                                    $Save = New-Item -ItemType Directory $CreatePath
                                    if(Test-Path $CreateFilePath){
                                        $Save = Set-Content $CreateFilePath -Value $MutualTiesDatasetFormat
                                        Show-UDToast -Message 'Save Mutual Ties'
                                    }
                                    else{
                                        $Save = New-Item -ItemType File $CreateFilePath -Value $MutualTiesDatasetFormat
                                        Show-UDToast -Message 'Save Mutual Ties'
                                    }
                                }
                                Hide-UDModal
                            }
                        } -OnValidate {
                            $FormContent = $EventData

                            if ($FormContent.MutualTiesBlockIdentificationIdTextBox -eq $null -or $FormContent.MutualTiesBlockIdentificationIdTextBox -eq '') {
                                New-UDFormValidationResult -ValidationError "MutualTiesBlockIdentificationIdTextBox is required"
                            } else {
                                $ValidCon1 = $true
                            }
                            if ($FormContent.MutualTiesBlockPathIdTextBox -eq $null -or $FormContent.MutualTiesBlockPathIdTextBox -eq '') {
                                New-UDFormValidationResult -ValidationError "MutualTiesBlockPathIdTextBox is required"
                            } else {
                                $ValidCon2 = $true
                            }
                            if ($FormContent.MutualTiesBlockProviderIdTextBox -eq $null -or $FormContent.MutualTiesBlockProviderIdTextBox -eq '') {
                                New-UDFormValidationResult -ValidationError "MutualTiesBlockProviderIdTextBox is required"
                            } else {
                                $ValidCon3 = $true
                            }
                            if ($FormContent.MutualTiesBindingNameIdTextBox -eq $null -or $FormContent.MutualTiesBindingNameIdTextBox -eq '') {
                                New-UDFormValidationResult -ValidationError "MutualTiesBindingNameIdTextBox is required"
                            } else {
                                $ValidCon4 = $true
                            }
                            if(
                                $ValidCon1 -eq $true -and
                                $ValidCon2 -eq $true -and
                                $ValidCon3 -eq $true -and
                                $ValidCon4 -eq $true
                                ){New-UDFormValidationResult -Valid}

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




