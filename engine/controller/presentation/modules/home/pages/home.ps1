function Invoke-PSUCache {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][hashtable]$Body
        )
    Begin{
        
    }
    Process{
        if($Body.Type -eq 'GET'){
            if($Body.Arg -eq 'All'){
                $Data            = $Body.Data
                [string]$CacheId = $Data.Id
                $GetPsuCachce    = Get-PSUCache -Key $CacheId -Integrated
                $GetPsuCachce
            }
            elseif($Body.Arg -eq 'Selected'){
                $Data            = $Body.Data
                [string]$CacheId = $Data.Id
                $CacheArrayList  = $Data.ArrayList
                $GetPsuCachce    = Get-PSUCache -Key $CacheId -Integrated
                $DatabaseList    = $GetPsuCachce
                if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                    if($DatabaseList){
                        # VALIDATION ARRAY LIST
                        $DatabaseIndex  = $DatabaseList.Count-1
                        $ArrayNum       = 0
                        $ArrayNumList   = @()
                        foreach ($ArrayItem in $CacheArrayList) {
                            if($ArrayItem -gt $DatabaseIndex){
                                $ArrayNumList   += $ArrayNum
                                $ArrayValidation = $true
                            }
                            $ArrayNum++
                        }
                        if($ArrayValidation -eq $true){
                            foreach ($IndexNum in $ArrayNumList) {
                                $CacheArrayList[$IndexNum] = $null
                            }
                            $CacheArrayList = $CacheArrayList.Where({ $null -ne $_ })
                        }
        
                        if(($CacheArrayList).Count -eq 1){
                            $CacheDataContent = ($DatabaseList[$CacheArrayList])
                            $CacheDataContent
                        }
                        elseif(($CacheArrayList).Count -gt 1){
                            $CacheDataContent = @()
                            $num = 0
                            foreach ($Index in $CacheArrayList) {
                                $CacheDataContent += ($DatabaseList[$Index])
                                $num++
                            }
                            $CacheDataContent
                        }
                        else{
                            'error'
                        }
                    }
                    else{
                        $DatabaseList
                    }
                }
                else{
                    'error'
                }
            }
            else{
                'error'
            }
        }
        elseif($Body.Type -eq 'ADD'){
            if($Body.Arg -eq 'All'){
                $Data            = $Body.Data
                [string]$CacheId = $Data.Id
                $CacheContent    = $Data.Content
                $GetPsuCachce    = Get-PSUCache -Key $CacheId -Integrated
                $CacheList       = @()
                $CacheList      += $GetPsuCachce
                $CacheList      += $CacheContent
                $CacheListToJson = $CacheList
                $SetCachce       = Set-PSUCache -Key $CacheId -Value $CacheListToJson -Integrated
                'add'
            }
            elseif($Body.Arg -eq 'Selected'){
                $Data            = $Body.Data
                [string]$CacheId = $Data.Id
                $CacheArrayList  = $Data.ArrayList
                $CacheContent    = $Data.Content
                $GetPsuCachce    = Get-PSUCache -Key $CacheId -Integrated
                $DatabaseList    = $GetPsuCachce
                if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                    if($DatabaseList){
                        # VALIDATION ARRAY LIST
                        $DatabaseIndex  = $DatabaseList.Count-1
                        $ArrayNum       = 0
                        $ArrayNumList   = @()
                        foreach ($ArrayItem in $CacheArrayList) {
                            if($ArrayItem -gt $DatabaseIndex){
                                $ArrayNumList   += $ArrayNum
                                $ArrayValidation = $true
                            }
                            $ArrayNum++
                        }
                        if($ArrayValidation -eq $true){
                            foreach ($IndexNum in $ArrayNumList) {
                                $CacheArrayList[$IndexNum] = $null
                            }
                            $CacheArrayList = $CacheArrayList.Where({ $null -ne $_ })
                        }
                        $CacheList = @()
                        if(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -gt 1){
                            $num = 0
                            foreach ($Database in $DatabaseList) {
                                if($num -eq $CacheArrayList){
                                    $CacheList += $CacheContent
                                }
                                $CacheList += $Database
                                $num++
                            }
                            $CacheListToJson = $CacheList
                            $Add = Set-PSUCache -Key $CacheId -Value $CacheListToJson -Integrated
                            'add'
                        }
                        elseif(($CacheArrayList).Count -gt 1 -and ($CacheContent).Count -gt 1){
                            $CacheContentJson = $CacheContent
                            $num = 0
                            foreach ($Database in $DatabaseList) {
                                if($null -ne $($CacheArrayList -like $num)){
                                    $CacheList += $CacheContentJson[$num]
                                }
                                $CacheList += $Database
                                $num++
                            }
                            $CacheListToJson = $CacheList
                            $Add = Set-PSUCache -Key $CacheId -Value $CacheListToJson -Integrated
                            'add'
                        }
                        elseif(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -eq 1){
                            $CacheContentJson = $CacheContent
                            if($CacheArrayList -eq 0){
                                $CacheList += $CacheContentJson
                                $CacheList += $GetPsuCachce
                                $Add        = Set-PSUCache -Key $CacheId -Value $CacheList -Integrated
                                'add'
                            }
                            elseif($CacheArrayList -gt 0){
                                $num = 0
                                foreach ($Database in $DatabaseList) {
                                    if($num -eq $CacheArrayList){
                                        $CacheList += $CacheContentJson
                                    }
                                    $CacheList += $Database
                                    $num++
                                }
                                $CacheListToJson = $CacheList
                                $Add = Set-PSUCache -Key $CacheId -Value $CacheListToJson -Integrated
                                'add'
                            }
                            else{
                                'error'
                            }
                        }
                        else{
                            'error'
                        }
                    }
                    else{
                        $Add = Set-PSUCache -Key $CacheId -Value $CacheContent -Integrated
                        'add'
                    }
                }
                else{
                    'error'
                }
            }
            else{
                'error'
            }
        }
        elseif($Body.Type -eq 'DELETE'){
            if($Body.Arg -eq 'All'){
                $Data            = $Body.Data
                [string]$CacheId = $Data.Id
                $CacheValue      = ''
                $SetPsuCachce    = Set-PSUCache -Key $CacheId -Value $CacheValue -Integrated
                'delete'
            }
            elseif($Body.Arg -eq 'Selected'){
                $Data            = $Body.Data
                [string]$CacheId = $Data.Id
                $CacheArrayList  = $Data.ArrayList
                $GetPsuCachce    = Get-PSUCache -Key $CacheId -Integrated
                $DatabaseList    = $GetPsuCachce
                if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                    if($DatabaseList){
                        # VALIDATION ARRAY LIST
                        $DatabaseIndex  = $DatabaseList.Count-1
                        $ArrayNum       = 0
                        $ArrayNumList   = @()
                        foreach ($ArrayItem in $CacheArrayList) {
                            if($ArrayItem -gt $DatabaseIndex){
                                $ArrayNumList   += $ArrayNum
                                $ArrayValidation = $true
                            }
                            $ArrayNum++
                        }
                        if($ArrayValidation -eq $true){
                            foreach ($IndexNum in $ArrayNumList) {
                                $CacheArrayList[$IndexNum] = $null
                            }
                            $CacheArrayList = $CacheArrayList.Where({ $null -ne $_ })
                        }
        
                        if(($CacheArrayList).Count -eq 1 -and ($GetPsuCachce).Count -gt 1){
                            ($DatabaseList[$CacheArrayList]) = $null
                            $DatabaseList   = $DatabaseList.Where({ $null -ne $_ })
                            $Delete = Set-PSUCache -Key $CacheId -Value $DatabaseList -Integrated
                            'delete'
                        }
                        elseif(($CacheArrayList).Count -gt 1 -and ($GetPsuCachce).Count -gt 1){
                            foreach ($Index in $CacheArrayList) {
                                ($DatabaseList[$Index]) = $null
                            }
                            $DatabaseList   = $DatabaseList.Where({ $null -ne $_ })
                            $Delete = Set-PSUCache -Key $CacheId -Value $DatabaseList -Integrated
                            'delete'
                        }
                        elseif(($CacheArrayList).Count -eq 1 -and ($GetPsuCachce).Count -eq 1){
                            if($CacheArrayList -eq 0){
                                $CacheValue        = ''
                                $SetPsuCachce      = Set-PSUCache -Key $CacheId -Value $CacheValue -Integrated
                                'delete'
                            }
                            else{
                                'error'
                            }
                        }
                        else{
                            'error'
                        }
                    }
                    else{
                        'delete'
                    }
                }
                else{
                    'error'
                }
            }
            else{
                'error'
            }
        }
        elseif($Body.Type -eq 'UPDATE'){
            if($Body.Arg -eq 'All'){
                $Data            = $Body.Data
                [string]$CacheId = $Data.Id
                $CacheContent    = $Data.Content
                $SetPsuCachce    = Set-PSUCache -Key $CacheId -Value $CacheContent -Integrated
                'update'
            }
            elseif($Body.Arg -eq 'Selected'){
                $Data            = $Body.Data
                [string]$CacheId = $Data.Id
                $CacheArrayList  = $Data.ArrayList
                $CacheContent    = $Data.Content
                $GetPsuCachce    = Get-PSUCache -Key $CacheId -Integrated
                $DatabaseList    = $GetPsuCachce
                if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                    # VALIDATION ARRAY LIST
                    $DatabaseIndex  = $DatabaseList.Count-1
                    $ArrayNum       = 0
                    $ArrayNumList   = @()
                    foreach ($ArrayItem in $CacheArrayList) {
                        if($ArrayItem -gt $DatabaseIndex){
                            $ArrayNumList   += $ArrayNum
                            $ArrayValidation = $true
                        }
                        $ArrayNum++
                    }
                    if($ArrayValidation -eq $true){
                        foreach ($IndexNum in $ArrayNumList) {
                            $CacheArrayList[$IndexNum] = $null
                        }
                        $CacheArrayList = $CacheArrayList.Where({ $null -ne $_ })
                    }
        
                    if(($CacheArrayList).Count -eq 1 -and ($GetPsuCachce).Count -gt 1){
                        ($DatabaseList[$CacheArrayList]) = $CacheContent
                        $Update = Set-PSUCache -Key $CacheId -Value $DatabaseList -Integrated
                        'update'
                    }
                    elseif(($CacheArrayList).Count -gt 1 -and ($GetPsuCachce).Count -gt 1){
                        $num = 0
                        foreach ($Index in $CacheArrayList) {
                            ($DatabaseList[$Index]) = $CacheContent[$num]
                            $num++
                        }
                        $Update = Set-PSUCache -Key $CacheId -Value $DatabaseList -Integrated
                        'update'
                    }
                    elseif(($CacheArrayList).Count -eq 1 -and ($GetPsuCachce).Count -eq 1){
                        ($DatabaseList[$CacheArrayList]) = $CacheContent
                        $Update = Set-PSUCache -Key $CacheId -Value $DatabaseList -Integrated
                        'update'
                    }                
                    else{
                        'error'
                    }
                }
                else{
                    'error'
                }
            }
            else{
                'error'
            }
        }
        else{
            'error'
        }
    }
    End{

    }
}

<#
New-UDButton -Text 'Invoke-PSUCache All Get' -OnClick {
    $measure = Measure-Command -Expression {
        $DataPSCO = [PSCustomObject]@{
            Id        = $Cache:InterfacePSCO.Home
            ArrayList = 0
            Content   = $ContentPSCO
        }
        $Result = Invoke-PSUCache -Body @{Arg='All';Type='GET';Data=$DataPSCO}
    }
    Show-UDToast -Message $measure.Ticks
    Show-UDToast -Message ($Result|ConvertTo-Json)
}


New-UDButton -Text 'Invoke-PSUCache Selected Get' -OnClick {
    $measure = Measure-Command -Expression {
        $DataPSCO = [PSCustomObject]@{
            Id        = $Cache:InterfacePSCO.Home
            ArrayList = 1
            Content   = $ContentPSCO
        }
        $Result = Invoke-PSUCache -Body @{Arg='Selected';Type='GET';Data=$DataPSCO}
    }
    Show-UDToast -Message $measure.Ticks
    Show-UDToast -Message ($Result|ConvertTo-Json)
}


New-UDButton -Text 'Invoke-PSUCache All Add' -OnClick {
    $measure = Measure-Command -Expression {
        $ContentPSCO = [PSCustomObject]@{
            Table1 = 1
            Table2 = 2
            Table3 = 3
            Table4 = 4
            Table5 = 5
            Table6 = 6
        }
        $DataPSCO = [PSCustomObject]@{
            Id        = $Cache:InterfacePSCO.Home
            ArrayList = 0
            Content   = $ContentPSCO
        }
        $Result = Invoke-PSUCache -Body @{Arg='All';Type='ADD';Data=$DataPSCO}
    }
    Show-UDToast -Message $measure.Ticks
    Show-UDToast -Message ($Result|ConvertTo-Json)
}


New-UDButton -Text 'Invoke-PSUCache All Update' -OnClick {
    $measure = Measure-Command -Expression {
        $ContentPSCO = [PSCustomObject]@{
            Table1 = 1
            Table2 = 2
            Table3 = 3
            Table4 = 4
            Table5 = 5
            Table6 = 6
        }
        $DataPSCO = [PSCustomObject]@{
            Id        = $Cache:InterfacePSCO.Home
            ArrayList = 0
            Content   = $ContentPSCO
        }
        $Result = Invoke-PSUCache -Body @{Arg='All';Type='UPDATE';Data=$DataPSCO}
    }
    Show-UDToast -Message $measure.Ticks
    Show-UDToast -Message ($Result|ConvertTo-Json)
}


New-UDButton -Text 'Invoke-PSUCache All Delete' -OnClick {
    $measure = Measure-Command -Expression {
        $DataPSCO = [PSCustomObject]@{
            Id        = $Cache:InterfacePSCO.Home
            ArrayList = 0
            Content   = $ContentPSCO
        }
        $Result = Invoke-PSUCache -Body @{Arg='All';Type='DELETE';Data=$DataPSCO}
    }
    Show-UDToast -Message $measure.Ticks
    Show-UDToast -Message ($Result|ConvertTo-Json)
}
#>

<#
New-UDGrid -ClassName "initial-content-box-grid" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
    New-UDPaper -ClassName "initial-content-box-layout" -Square -Content {
        New-UDRow -Columns {
            New-UDGrid -Item -ExtraSmallSize 4 -SmallSize 3 -MediumSize 3 -LargeSize 2 -ExtraLargeSize 2 -Content {
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'initial-item-box-logo'
                        }
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDTypography -Text 'Create New Task Form' -ClassName 'initial-item-box-title'
                            }
                        }
                    }
                }
            }
        }
    }
}

#>

<#
New-UDGrid -ClassName "initial-navbar-box-grid" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
    New-UDPaper -ClassName "initial-content-box-layout" -Square -Content {
        New-UDRow -Columns {
            New-UDGrid -ClassName "initial-content-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                New-UDGrid -ClassName "initial-menu-grid-item" -Item -Content {
                    New-UDLink -ClassName "initial-menu-button-item" -Children {
                        New-UDTypography -Text "Button" -ClassName "initial-menu-button-typography-item"
                    } -OnClick {

                    }
                }
                New-UDGrid -ClassName "initial-menu-grid-item" -Item -Content {
                    New-UDLink -ClassName "initial-menu-button-item" -Children {
                        New-UDTypography -Text "Button" -ClassName "initial-menu-button-typography-item" 
                    } -OnClick {

                    }
                }                
            }
        }
    }
}


    New-UDButton -Text 'video speed' -ClassName 'testbutton' -OnClick {
        Invoke-UDJavaScript -JavaScript '
            var vid = document.getElementById("initial-Universal-Modal-FullScreen-Video");
            vid.playbackRate = 0.5;
        '
    }
#>

<#
New-UDElement -Id 'initial-Container-Block-Centered' -Tag 'div' -Content {
    New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
        New-UDPaper -ClassName "initial-box-layout" -Square -Content {
            New-UDRow -Columns {
                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                    New-UDElement -Tag 'table' -Content {
                        New-UDElement -Tag 'tr' -Content {
                            New-UDElement -Tag 'td' -Content {
                                New-UDIcon -Icon 'UserCircle' -Size '1x' -Border -ClassName 'initial-box-logo'
                            }
                            New-UDElement -Tag 'td' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDTypography -Text 'Authentication' -ClassName 'initial-box-title'
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
#>

<#
New-UDPaper -ClassName "initial-canvas-content-box-layout" -Square -Content {
    New-UDIFrame -Id 'initial-udiframe-canvas-p5js' -Uri 'http://localhost:5000/presentation/assets/js/p5js/index.html'
}
New-UDHtml -Markup '
<video autoplay muted loop id="initial-Universal-Modal-FullScreen-Video">
    <source src="\presentation\assets\video\best\Particles - 323.mp4" type="video/mp4">
</video>
'    
#>

New-UDElement -Id 'initial-universal-main' -Tag 'div' -Content {
    New-UDElement -Id 'initial-navbar-container-block' -Tag 'div' -Content {
        New-UDGrid -ClassName "initial-navbar-box-grid" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
            New-UDPaper -ClassName "initial-navbar-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDGrid -ClassName "initial-navbar-grid-left" -Item -ExtraSmallSize 1 -SmallSize 1 -MediumSize 1 -LargeSize 1 -ExtraLargeSize 1 -Content {

                    }
                    New-UDGrid -ClassName "initial-navbar-grid-center" -Item -ExtraSmallSize 10 -SmallSize 10 -MediumSize 10 -LargeSize 10 -ExtraLargeSize 10 -Children {
                        New-UDContainer -ClassName 'initial-navbar-container-content' -Children {
                            New-UDGrid -ClassName "initial-navbar-item-left" -Item -Children {
                                New-UDGrid -ClassName "initial-navbar-logo-grid-item" -Item -Content {
                                    New-UDContainer -ClassName "initial-navbar-logo-container-block" -Children {
                                        New-UDImage -Url "/presentation/assets/img/CustomizePSUCA.png" -ClassName 'initial-navbar-logo' -Attributes @{width='55px';height='55px'}
                                    }
                                }
                                New-UDGrid -ClassName "initial-navbar-logo-link-grid-item" -Item -Content {
                                    New-UDRow -Columns {
                                        New-UDLink -Url '' -Text 'Custom Automation Software' -Variant body1 -OnClick {
        
                                        }
                                    }
                                    New-UDRow -Columns {
                                        New-UDLink -Url '' -Text 'Powershell Universal Framework' -Variant caption -OnClick {
        
                                        }
                                    }
                                }
                                New-UDHtml -Markup '
                                <div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-0 MuiGrid-grid-sm-0 MuiGrid-grid-md-0 MuiGrid-grid-lg-0 MuiGrid-grid-xl-0 initial-navbar-button-grid-left-item css-1wxaqej" type="mu-grid" id="920a9c03-e114-4786-bef5-de4065431a4b">
                                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-item ud-mu-link css-ml9ukt" id="products-list-item-id" onclick="ProductsListBoxDropdown();" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w" id="2671a626-feb0-413f-b5f1-6a4cb8ccb4e9">Products</span><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-down" class="svg-inline--fa fa-chevron-down fa-fw fa-sm fa-pull- initial-navbar-button-link-item-chrevrondown" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" type="icon" id="7ede46c1-65b2-4576-86bc-f4065980febd"><path fill="currentColor" d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path></svg></a>
                                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-item ud-mu-link css-ml9ukt" id="services-list-item-id" onclick="ServicesListBoxDropdown();" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w" id="868f24c6-8804-48a6-afce-a7672b09ccdf">Services</span><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-down" class="svg-inline--fa fa-chevron-down fa-fw fa-sm fa-pull- initial-navbar-button-link-item-chrevrondown" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" type="icon" id="c6b1c102-ea34-4830-8dfb-d2bb5226aab4"><path fill="currentColor" d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path></svg></a>
                                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-item ud-mu-link css-ml9ukt" id="about-list-item-id" onclick="AboutListBoxDropdown();" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w" id="48731930-d0a4-4289-b9e0-ad12e14f7e63">About</span><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-down" class="svg-inline--fa fa-chevron-down fa-fw fa-sm fa-pull- initial-navbar-button-link-item-chrevrondown" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" type="icon" id="ce34e9a2-9ddf-4dcb-828a-b493094ae352"><path fill="currentColor" d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path></svg></a>
                                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-item ud-mu-link css-ml9ukt" id="contact-item-id" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w" id="d37ad42d-e4fc-4382-81f6-52e2250e6af1">Contact</span></a>
                                </div>'
                                <#
                                New-UDGrid -ClassName "initial-navbar-button-grid-left-item" -Item -Content {
                                    New-UDLink -ClassName "initial-navbar-button-link-item" -Children {
                                        New-UDTypography -Text 'Products'
                                        New-UDIcon -ClassName "initial-navbar-button-link-item-chrevrondown" -Icon 'ChevronDown'
                                    } -OnClick {
                                        Invoke-UDJavaScript -JavaScript '
                                            ProductsListBoxDropdown();
                                        '
                                    }
                                    New-UDLink -ClassName "initial-navbar-button-link-item" -Children {
                                        New-UDTypography -Text 'Services'
                                        New-UDIcon -ClassName "initial-navbar-button-link-item-chrevrondown" -Icon 'ChevronDown'
                                    } -OnClick {
                                        Invoke-UDJavaScript -JavaScript '
                                            ServicesListBoxDropdown();
                                        '
                                    }
                                    New-UDLink -ClassName "initial-navbar-button-link-item" -Children {
                                        New-UDTypography -Text 'About'
                                        New-UDIcon -ClassName "initial-navbar-button-link-item-chrevrondown" -Icon 'ChevronDown'
                                    } -OnClick {
                                        Invoke-UDJavaScript -JavaScript '
                                            AboutListBoxDropdown();
                                        '                                        
                                    }
                                    New-UDLink -ClassName "initial-navbar-button-link-item" -Children {
                                        New-UDTypography -Text 'Contact'
                                        New-UDIcon -ClassName "initial-navbar-button-link-item-chrevrondown" -Icon 'ChevronDown'
                                    }
                                } 
                                #>

                            }
                            New-UDGrid -ClassName "initial-navbar-item-right" -Item -Children {
                                New-UDHtml -Markup '
                                    <div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-0 MuiGrid-grid-sm-0 MuiGrid-grid-md-0 MuiGrid-grid-lg-0 MuiGrid-grid-xl-0 initial-navbar-button-grid-right-item-bars css-1wxaqej" type="mu-grid" id="043c7804-e10a-43c0-8ff0-c1a03a562d1a">
                                        <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-item ud-mu-link css-ml9ukt" id="navbar-button-bars-id" onclick="NavBarMobileBoxDropdown();DarkEffectBoxDropdown();" rel="noopener" target="_self">
                                            <div class="initial-navbar-button-item-bars"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" class="svg-inline--fa fa-bars fa-fw fa-sm fa-pull- " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" type="icon" id="9d1f8d93-b0cc-4468-ac9a-ddc189d775dd" __version="0"><path fill="currentColor" d="M0 96C0 78.33 14.33 64 32 64H416C433.7 64 448 78.33 448 96C448 113.7 433.7 128 416 128H32C14.33 128 0 113.7 0 96zM0 256C0 238.3 14.33 224 32 224H416C433.7 224 448 238.3 448 256C448 273.7 433.7 288 416 288H32C14.33 288 0 273.7 0 256zM416 448H32C14.33 448 0 433.7 0 416C0 398.3 14.33 384 32 384H416C433.7 384 448 398.3 448 416C448 433.7 433.7 448 416 448z"></path></svg></div>
                                        </a>
                                    </div>
                                    <div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-0 MuiGrid-grid-sm-0 MuiGrid-grid-md-0 MuiGrid-grid-lg-0 MuiGrid-grid-xl-0 initial-navbar-button-grid-right-item css-1wxaqej" type="mu-grid" id="47f51b34-6ccd-44f1-b2b2-98eed5b37cc2">
                                        <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-item ud-mu-link css-ml9ukt" id="login-list-item-id" onclick="LoginListBoxDropdown();" rel="noopener" target="_self">
                                            <div class="initial-navbar-button-item-login"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="lock" class="svg-inline--fa fa-lock fa-fw fa-sm fa-pull- " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" type="icon" id="f3553043-5719-4c76-832c-c6b55c915fea" __version="0"><path fill="currentColor" d="M80 192V144C80 64.47 144.5 0 224 0C303.5 0 368 64.47 368 144V192H384C419.3 192 448 220.7 448 256V448C448 483.3 419.3 512 384 512H64C28.65 512 0 483.3 0 448V256C0 220.7 28.65 192 64 192H80zM144 192H304V144C304 99.82 268.2 64 224 64C179.8 64 144 99.82 144 144V192z"></path></svg></div>
                                        </a>
                                    </div>
                                    <div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-0 MuiGrid-grid-sm-0 MuiGrid-grid-md-0 MuiGrid-grid-lg-0 MuiGrid-grid-xl-0 initial-navbar-button-grid-right-item css-1wxaqej" type="mu-grid" id="b5a9c3e0-f90c-41ef-8cfa-f2af15322ea2">
                                        <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-item ud-mu-link css-ml9ukt" id="language-list-item-id" onclick="LanguageListBoxDropdown();" rel="noopener" target="_self">
                                            <div class="initial-navbar-button-item-flags flag-cz"></div>
                                        </a>
                                    </div>
                                '
                                New-UDElement -Id 'initial-navbar-language-list-dropdown-container-block' -Tag 'div' -Content {
                                    New-UDGrid -ClassName "initial-navbar-dropdown-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                                        New-UDContainer -ClassName 'initial-navbar-dropdown-container-content' -Children {
                                            New-UDGrid -ClassName "initial-navbar-dropdown-item-center" -Item -Children {
                                                New-UDGrid -ClassName "initial-navbar-dropdown-desktop-button-grid-center-item" -Item -Content {
                                                    New-UDHtml -Markup (
@"
                                                        <div id="language-list-box-dropdown" style="display:none">
                                                            <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self">
                                                                <div class="initial-navbar-button-link-item-flags flag-cz"></div>
                                                                <span class="MuiTypography-root MuiTypography-align ud-mu-typography initial-navbar-button-span-item-flags css-1kq3u6w">Czech Republic</span>
                                                            </a>
                                                            <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self">
                                                                <div class="initial-navbar-button-link-item-flags flag-ge"></div>
                                                                <span class="MuiTypography-root MuiTypography-align ud-mu-typography initial-navbar-button-span-item-flags css-1kq3u6w">Germany</span>
                                                            </a>
                                                            <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self">
                                                                <div class="initial-navbar-button-link-item-flags flag-us"></div>
                                                                <span class="MuiTypography-root MuiTypography-align ud-mu-typography initial-navbar-button-span-item-flags css-1kq3u6w">United States</span>
                                                            </a>
                                                        </div>
"@
                                                    )
                                                }
                                            }
                                        }
                                    }
                                }
                                New-UDElement -Id 'initial-navbar-login-list-dropdown-container-block' -Tag 'div' -Content {
                                    New-UDGrid -ClassName "initial-navbar-dropdown-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                                        New-UDContainer -ClassName 'initial-navbar-dropdown-container-content' -Children {
                                            New-UDGrid -ClassName "initial-navbar-dropdown-item-center" -Item -Children {
                                                New-UDGrid -ClassName "initial-navbar-dropdown-desktop-button-grid-center-item" -Item -Content {
                                                    New-UDHtml -Markup (
@"
                                                        <div id="login-list-box-dropdown" style="display:none">
                                                            <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Authentication</span></a>
                                                            <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Forgot Password</span></a>
                                                            <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Register Now</span></a>
                                                        </div>
"@
                                                    )
                                                }
                                            }
                                        }
                                    }
                                }                                
                            }
                        }
                    }
                    New-UDGrid -ClassName "initial-navbar-grid-right" -Item -ExtraSmallSize 1 -SmallSize 1 -MediumSize 1 -LargeSize 1 -ExtraLargeSize 1 -Content {

                    }
                }
            }
        }

    }

    New-UDElement -Id 'initial-navbar-products-list-dropdown-container-block' -Tag 'div' -Content {
        New-UDGrid -ClassName "initial-navbar-dropdown-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
            New-UDContainer -ClassName 'initial-navbar-dropdown-container-content' -Children {
                New-UDGrid -ClassName "initial-navbar-dropdown-item-center" -Item -Children {
                    New-UDGrid -ClassName "initial-navbar-dropdown-desktop-button-grid-center-item" -Item -Content {
                        New-UDHtml -Markup (
@"
                            <div id="products-list-box-dropdown" style="display:none">
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Delivery System</span></a>
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">E-Shop System</span></a>
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Warehouse System</span></a>
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">PowerShell Addons</span></a>
                            </div>
"@
                        )
                    }
                }
            }
        }
    }
    New-UDElement -Id 'initial-navbar-services-list-dropdown-container-block' -Tag 'div' -Content {
        New-UDGrid -ClassName "initial-navbar-dropdown-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
            New-UDContainer -ClassName 'initial-navbar-dropdown-container-content' -Children {
                New-UDGrid -ClassName "initial-navbar-dropdown-item-center" -Item -Children {
                    New-UDGrid -ClassName "initial-navbar-dropdown-desktop-button-grid-center-item" -Item -Content {
                        New-UDHtml -Markup (
@"
                            <div id="services-list-box-dropdown" style="display:none">
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Desktop Applications</span></a>
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Mobile Applications</span></a>
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Web Applications</span></a>
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Full-Stack Development</span></a>
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">PowerShell Automation</span></a>
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Artificial Inteligence</span></a>
                            </div>
"@
                        )
                    }
                }
            }
        }
    }
    New-UDElement -Id 'initial-navbar-about-list-dropdown-container-block' -Tag 'div' -Content {
        New-UDGrid -ClassName "initial-navbar-dropdown-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
            New-UDContainer -ClassName 'initial-navbar-dropdown-container-content' -Children {
                New-UDGrid -ClassName "initial-navbar-dropdown-item-center" -Item -Children {
                    New-UDGrid -ClassName "initial-navbar-dropdown-desktop-button-grid-center-item" -Item -Content {
                        New-UDHtml -Markup (
@"
                            <div id="about-list-box-dropdown" style="display:none">
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Development Team</span></a>
                                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-button-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">PSUCA</span></a>
                            </div>
"@
                        )
                    }
                }
            }
        }
    }

    # MOBILE 
    New-UDHtml -Markup '
    <div id="initial-navbar-mobile-dropdown-container-block">
        <div id="initial-navbar-mobile-dropdown-container-box" style="display:none">
            <a id="initial-navbar-mobile-dropdown-dark-effect" onclick="DarkEffectBoxDropdown();" style="display: none;"></a>
            <div id="all-list-mobile-box-dropdown" style="display: block">
                <hr style="margin-top: 0px;width: 98%;">
                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone ud-mu-link initial-navbar-mobile-button-link-dropdown-item css-ml9ukt" id="language-list-mobile-item-id" onclick="LanguageListMobileBoxDropdown();" rel="noopener" target="_self">
                    <span class="MuiTypography-root MuiTypography-align ud-mu-typography initial-navbar-mobile-button-link-dropdown-item-span css-1kq3u6w" id="2671a626-feb0-413f-b5f1-6a4cb8ccb4e9">
                        Language
                    </span>
                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-down" class="initial-navbar-mobile-button-link-item-chrevrondown svg-inline--fa fa-chevron-down fa-fw fa-sm fa-pull-" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" type="icon" id="7ede46c1-65b2-4576-86bc-f4065980febd"><path fill="currentColor" d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path></svg>
                </a>
                <div id="language-list-mobile-box-dropdown" style="display:none">
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self">
                        <div class="initial-navbar-mobile-button-link-item-flags flag-cz"></div>
                        <span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Czech Republic</span>
                    </a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self">
                        <div class="initial-navbar-mobile-button-link-item-flags flag-ge"></div>
                        <span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Germany</span>
                    </a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self">
                    <div class="initial-navbar-mobile-button-link-item-flags flag-us"></div>
                        <span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">United States</span>
                    </a>
                    <div class="initial-navbar-mobile-list-shadow-dropdown"></div>
                </div> 
                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone ud-mu-link initial-navbar-mobile-button-link-dropdown-item css-ml9ukt" id="login-list-mobile-item-id" onclick="LoginListMobileBoxDropdown();" rel="noopener" target="_self">
                    <span class="MuiTypography-root MuiTypography-align ud-mu-typography initial-navbar-mobile-button-link-dropdown-item-span css-1kq3u6w" id="2671a626-feb0-413f-b5f1-6a4cb8ccb4e9">
                        Login
                    </span>
                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-down" class="initial-navbar-mobile-button-link-item-chrevrondown svg-inline--fa fa-chevron-down fa-fw fa-sm fa-pull-" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" type="icon" id="7ede46c1-65b2-4576-86bc-f4065980febd"><path fill="currentColor" d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path></svg>
                </a>
                <div id="login-list-mobile-box-dropdown" style="display:none">
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Authentication</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Forgot Password</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Register Now</span></a>
                    <div class="initial-navbar-mobile-list-shadow-dropdown"></div>
                </div> 
                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone ud-mu-link initial-navbar-mobile-button-link-dropdown-item css-ml9ukt" id="products-list-mobile-item-id" onclick="ProductsListMobileBoxDropdown();" rel="noopener" target="_self">
                    <span class="MuiTypography-root MuiTypography-align ud-mu-typography initial-navbar-mobile-button-link-dropdown-item-span css-1kq3u6w" id="2671a626-feb0-413f-b5f1-6a4cb8ccb4e9">
                        Products
                    </span>
                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-down" class="initial-navbar-mobile-button-link-item-chrevrondown svg-inline--fa fa-chevron-down fa-fw fa-sm fa-pull-" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" type="icon" id="7ede46c1-65b2-4576-86bc-f4065980febd"><path fill="currentColor" d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path></svg>
                </a>
                <div id="products-list-mobile-box-dropdown" style="display:none">
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Delivery System</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">E-Shop System</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Warehouse System</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">PowerShell Addons</span></a>
                    <div class="initial-navbar-mobile-list-shadow-dropdown"></div>
                </div> 
                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone ud-mu-link initial-navbar-mobile-button-link-dropdown-item css-ml9ukt" id="services-list-mobile-item-id" onclick="ServicesListMobileBoxDropdown();" rel="noopener" target="_self">
                    <span class="MuiTypography-root MuiTypography-align ud-mu-typography initial-navbar-mobile-button-link-dropdown-item-span css-1kq3u6w" id="2671a626-feb0-413f-b5f1-6a4cb8ccb4e9">
                        Services
                    </span>
                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-down" class="initial-navbar-mobile-button-link-item-chrevrondown svg-inline--fa fa-chevron-down fa-fw fa-sm fa-pull-" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" type="icon" id="7ede46c1-65b2-4576-86bc-f4065980febd"><path fill="currentColor" d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path></svg>
                </a>
                <div id="services-list-mobile-box-dropdown" style="display:none">
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Desktop Applications</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Mobile Applications</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Web Applications</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Full-Stack Development</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">PowerShell Automation</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Artificial Inteligence</span></a>
                    <div class="initial-navbar-mobile-list-shadow-dropdown"></div>
                </div> 
                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone ud-mu-link initial-navbar-mobile-button-link-dropdown-item css-ml9ukt" id="about-list-mobile-item-id" onclick="AboutListMobileBoxDropdown();" rel="noopener" target="_self">
                    <span class="MuiTypography-root MuiTypography-align ud-mu-typography initial-navbar-mobile-button-link-dropdown-item-span css-1kq3u6w" id="2671a626-feb0-413f-b5f1-6a4cb8ccb4e9">
                        About
                    </span>
                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chevron-down" class="initial-navbar-mobile-button-link-item-chrevrondown svg-inline--fa fa-chevron-down fa-fw fa-sm fa-pull-" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" type="icon" id="7ede46c1-65b2-4576-86bc-f4065980febd"><path fill="currentColor" d="M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"></path></svg>
                </a>
                <div id="about-list-mobile-box-dropdown" style="display:none">
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">Development Team</span></a>
                    <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone initial-navbar-mobile-button-sub-link-dropdown-item ud-mu-link css-ml9ukt" onclick="" rel="noopener" target="_self"><span class="MuiTypography-root MuiTypography-align ud-mu-typography css-1kq3u6w">PSUCA</span></a>
                    <div class="initial-navbar-mobile-list-shadow-dropdown"></div>
                </div> 
                <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone ud-mu-link initial-navbar-mobile-button-link-dropdown-item css-ml9ukt" id="contact-mobile-item-id" onclick="ProductsListMobileBoxDropdown();" rel="noopener" target="_self">
                    <span class="MuiTypography-root MuiTypography-align ud-mu-typography initial-navbar-mobile-button-link-dropdown-item-span css-1kq3u6w" id="2671a626-feb0-413f-b5f1-6a4cb8ccb4e9">
                        Contact
                    </span>
                </a>
                <hr style="margin-bottom: 0px;width: 98%;">
            </div>
        </div>
    </div>
    '


    New-UDHtml -Markup '
    <a id="initial-navbar-dropdown-dark-effect" onclick="DarkEffectBoxDropdown();" style="display: none;"></a>
    '
    New-UDHtml -Markup '
    <iframe src="http://localhost:5000/presentation/assets/js/p5js/index.html" id="initial-udiframe-canvas-p5js" scrolling="no"></iframe>
    '
    New-UDHtml -Markup '
    <video autoplay muted loop id="initial-slideshow-Video">
        <source src="\presentation\assets\video\best\Particles - 323.mp4" type="video/mp4">
    </video>
    '    
    New-UDElement -Id 'initial-slideshow-container-block' -Tag 'div' -Content {
        New-UDGrid -ClassName "initial-slideshow-box-grid" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
            New-UDPaper -ClassName "initial-slideshow-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDGrid -ClassName "initial-slideshow-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                        New-UDContainer -Children {
                            New-UDHtml -Markup (
@"
<div id="initial-slideshow-caption"></div>
<div id="initial-slideshow-label"></div>
"@                                
                            )
                        }
                    }
                }
            }
        }
    }
    New-UDElement -Id 'initial-slideshow-shadow-down-block' -Tag 'div' -Content {
            
    }
    
    New-UDElement -Id 'initial-universal-main-block' -Tag 'div' -Content {
        New-UDElement -Id 'initial-content-container-block' -Tag 'div' -Content {
            New-UDRow -Columns {
                New-UDGrid -ClassName "initial-content-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                    New-UDGrid -ClassName "initial-content-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                            New-UDHtml -Markup (
@"
<div class="initial-content-item-retractable-title-selection">
    <div class="initial-content-item-retractable-title-selection-svg">
        <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="cart-shopping" class="initial-content-item-retractable-title-selection-svg svg-inline--fa fa-cart-shopping fa-fw fa-1x fa-pull- " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" id="5c8bf02e-0da0-4c39-ac4a-e703cdecca58" type="icon"><path fill="currentColor" d="M96 0C107.5 0 117.4 8.19 119.6 19.51L121.1 32H541.8C562.1 32 578.3 52.25 572.6 72.66L518.6 264.7C514.7 278.5 502.1 288 487.8 288H170.7L179.9 336H488C501.3 336 512 346.7 512 360C512 373.3 501.3 384 488 384H159.1C148.5 384 138.6 375.8 136.4 364.5L76.14 48H24C10.75 48 0 37.25 0 24C0 10.75 10.75 0 24 0H96zM128 464C128 437.5 149.5 416 176 416C202.5 416 224 437.5 224 464C224 490.5 202.5 512 176 512C149.5 512 128 490.5 128 464zM512 464C512 490.5 490.5 512 464 512C437.5 512 416 490.5 416 464C416 437.5 437.5 416 464 416C490.5 416 512 437.5 512 464z"></path></svg>
    </div>
    <div class="initial-content-item-retractable-title-selection-h2">
        <h2>E-Commerce</h2>
    </div>
    <div class="initial-content-item-retractable-title-selection-more">
        <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone ud-mu-link initial-content-item-retractable-title-selection-a" onclick="ServicesListMobileBoxDropdown();" rel="noopener" target="_self">
            Downloads
        </a>
    </div>        
</div>
"@                                
                            )
                        }
                    }
                }
            }
            New-UDRow -Columns {
                New-UDGrid -ClassName "initial-content-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                    New-UDGrid -ClassName "initial-content-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-delivery">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Delivery
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-red">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-info-caption">
                            <h2>Delivery</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Windows
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Linux
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Mac OS
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Delivery</h2>
                    </div>
                    <p>Developing a desktop application using the PowerShell Universal Framework.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-eshop">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        E-Shop
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-green">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-general-caption">
                            <h2>Eshop</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Android
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            iOS
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Eshop</h2>
                    </div>
                    <p>Developing a mobile application using the PowerShell Universal Framework.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-warehouse">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Warehouse
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-purple">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-general-caption">
                            <h2>Warehouse</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            ASP.NET
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            C#
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Javascript
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            React
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            SQL
                        </div> 
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Html
                        </div>  
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            CSS
                        </div>                  
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Warehouse</h2>
                    </div>
                    <p>Developing a web application using the PowerShell Universal Framework.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-entity">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Entity Models
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-yellow">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-info-caption">
                            <h2>Entity Models</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Desktop
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Mobile
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Web
                        </div>                    
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Entity Models</h2>
                    </div>
                    <p>Full Stack developing for desktop, mobile and web applications.</p>
                    <p></p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-interface">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Interface
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-blue">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-info-caption">
                            <h2>Interface</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Windows
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Linux
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Mac OS
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Android
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            IOS
                        </div>                    
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Interface</h2>
                    </div>
                    <p>Build PowerShell automation scripts, addons and modules for specific solutions.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-tasks">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Task Center
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-orange">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-general-caption">
                            <h2>Task Center</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Javascript
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            PowerShell
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Python
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Task Center</h2>
                    </div>
                    <p>Developing Artificial Inteligence using the Javascript, PowerShell, Python.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                    }
                }
            }
            New-UDRow -Columns {
                New-UDGrid -ClassName "initial-content-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                    New-UDGrid -ClassName "initial-content-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                            New-UDHtml -Markup (
@"
<div class="initial-content-item-retractable-title-selection">
    <div class="initial-content-item-retractable-title-selection-svg">
        <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="code" class="initial-content-item-retractable-title-selection-svg svg-inline--fa fa-code fa-fw fa-1x fa-pull- " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" id="9863745c-b0e7-475d-80f7-ae884b894fdc" type="icon"><path fill="currentColor" d="M414.8 40.79L286.8 488.8C281.9 505.8 264.2 515.6 247.2 510.8C230.2 505.9 220.4 488.2 225.2 471.2L353.2 23.21C358.1 6.216 375.8-3.624 392.8 1.232C409.8 6.087 419.6 23.8 414.8 40.79H414.8zM518.6 121.4L630.6 233.4C643.1 245.9 643.1 266.1 630.6 278.6L518.6 390.6C506.1 403.1 485.9 403.1 473.4 390.6C460.9 378.1 460.9 357.9 473.4 345.4L562.7 256L473.4 166.6C460.9 154.1 460.9 133.9 473.4 121.4C485.9 108.9 506.1 108.9 518.6 121.4V121.4zM166.6 166.6L77.25 256L166.6 345.4C179.1 357.9 179.1 378.1 166.6 390.6C154.1 403.1 133.9 403.1 121.4 390.6L9.372 278.6C-3.124 266.1-3.124 245.9 9.372 233.4L121.4 121.4C133.9 108.9 154.1 108.9 166.6 121.4C179.1 133.9 179.1 154.1 166.6 166.6V166.6z"></path></svg>
    </div>
    <div class="initial-content-item-retractable-title-selection-h2">
        <h2>Development</h2>
    </div>
    <div class="initial-content-item-retractable-title-selection-more">
        <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone ud-mu-link initial-content-item-retractable-title-selection-a" onclick="ServicesListMobileBoxDropdown();" rel="noopener" target="_self">
            More
        </a>
    </div>     
</div>
"@                                
                            )
                        }
                    }
                }
            }
            New-UDRow -Columns {
                New-UDGrid -ClassName "initial-content-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                    New-UDGrid -ClassName "initial-content-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-desktop">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Desktop
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-red">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-info-caption">
                            <h2>Desktop Applications</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Windows
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Linux
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Mac OS
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Desktop Applications</h2>
                    </div>
                    <p>Developing a desktop application using the PowerShell Universal Framework.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-mobile">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Mobile
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-green">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-general-caption">
                            <h2>Mobile Applications</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Android
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            iOS
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Mobile Applications</h2>
                    </div>
                    <p>Developing a mobile application using the PowerShell Universal Framework.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-web">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Web
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-purple">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-general-caption">
                            <h2>Web Applications</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            ASP.NET
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            C#
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Javascript
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            React
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            SQL
                        </div> 
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Html
                        </div>  
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            CSS
                        </div>                  
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Web Applications</h2>
                    </div>
                    <p>Developing a web application using the PowerShell Universal Framework.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }                    
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-fullstack">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Full Stack
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-yellow">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-info-caption">
                            <h2>Full Stack Development</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Desktop
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Mobile
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Web
                        </div>                    
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Full Stack Development</h2>
                    </div>
                    <p>Full Stack developing for desktop, mobile and web applications.</p>
                    <p></p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-powershell">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Powershell
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-blue">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-info-caption">
                            <h2>Powershell Automation</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Windows
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Linux
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Mac OS
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Android
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            IOS
                        </div>                    
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Powershell Automation</h2>
                    </div>
                    <p>Build PowerShell automation scripts, addons and modules for specific solutions.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 4 -ExtraLargeSize 4 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-ai">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        AI
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-orange">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-general-caption">
                            <h2>Artificial Inteligence</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Javascript
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            PowerShell
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Python
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Artificial Inteligence</h2>
                    </div>
                    <p>Developing Artificial Inteligence using the Javascript, PowerShell, Python.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                    }
                }
            }
            New-UDRow -Columns {
                New-UDGrid -ClassName "initial-content-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                    New-UDGrid -ClassName "initial-content-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                            New-UDHtml -Markup (
@"
<div class="initial-content-item-retractable-title-selection">
    <div class="initial-content-item-retractable-title-selection-svg">
        <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="book-open-reader" class="initial-content-item-retractable-title-selection-svg svg-inline--fa fa-book fa-fw fa-1x fa-pull- " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" type="icon" id="887be39b-bc53-4cc5-a60c-62705928ad1b"><path fill="currentColor" d="M0 219.2v212.5c0 14.25 11.62 26.25 26.5 27C75.32 461.2 180.2 471.3 240 511.9V245.2C181.4 205.5 79.99 194.8 29.84 192C13.59 191.1 0 203.6 0 219.2zM482.2 192c-50.09 2.848-151.3 13.47-209.1 53.09C272.1 245.2 272 245.3 272 245.5v266.5c60.04-40.39 164.7-50.76 213.5-53.28C500.4 457.9 512 445.9 512 431.7V219.2C512 203.6 498.4 191.1 482.2 192zM352 96c0-53-43-96-96-96S160 43 160 96s43 96 96 96S352 149 352 96z"></path></svg>
    </div>
    <div class="initial-content-item-retractable-title-selection-h2">
        <h2>Support</h2>
    </div>
    <div class="initial-content-item-retractable-title-selection-more">
        <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone ud-mu-link initial-content-item-retractable-title-selection-a" onclick="ServicesListMobileBoxDropdown();" rel="noopener" target="_self">
            More
        </a>
    </div>     
</div>
"@                                
                            )
                        }
                    }
                }
            }
            New-UDRow -Columns {
                New-UDGrid -ClassName "initial-content-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                    New-UDGrid -ClassName "initial-content-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 6 -ExtraLargeSize 6 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-desktop">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Documentation
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-red">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-info-caption">
                            <h2>Documentation</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Windows
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Linux
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Mac OS
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Documentation</h2>
                    </div>
                    <p>Developing a desktop application using the PowerShell Universal Framework.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 6 -LargeSize 6 -ExtraLargeSize 6 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-mobile">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Tutorial
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-green">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-general-caption">
                            <h2>Tutorial</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Android
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            iOS
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right">
                    <div class="initial-content-retractable-card-item-general-caption">
                        <h2>Tutorial</h2>
                    </div>
                    <p>Developing a mobile application using the PowerShell Universal Framework.</p>
                </div>
            </div>
        </div>
    </div>    
"@
                            )
                        }
                    }
                }
            }
            New-UDRow -Columns {
                New-UDGrid -ClassName "initial-content-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                    New-UDGrid -ClassName "initial-content-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                            New-UDHtml -Markup (
@"
<div class="initial-content-item-retractable-title-selection">
    <div class="initial-content-item-retractable-title-selection-svg">
        <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="users" class="initial-content-item-retractable-title-selection-svg svg-inline--fa fa-book fa-fw fa-1x fa-pull- " role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" type="icon" id="ac14e786-d67a-49ce-a9a6-bb68c067f2c2"><path fill="currentColor" d="M319.9 320c57.41 0 103.1-46.56 103.1-104c0-57.44-46.54-104-103.1-104c-57.41 0-103.1 46.56-103.1 104C215.9 273.4 262.5 320 319.9 320zM369.9 352H270.1C191.6 352 128 411.7 128 485.3C128 500.1 140.7 512 156.4 512h327.2C499.3 512 512 500.1 512 485.3C512 411.7 448.4 352 369.9 352zM512 160c44.18 0 80-35.82 80-80S556.2 0 512 0c-44.18 0-80 35.82-80 80S467.8 160 512 160zM183.9 216c0-5.449 .9824-10.63 1.609-15.91C174.6 194.1 162.6 192 149.9 192H88.08C39.44 192 0 233.8 0 285.3C0 295.6 7.887 304 17.62 304h199.5C196.7 280.2 183.9 249.7 183.9 216zM128 160c44.18 0 80-35.82 80-80S172.2 0 128 0C83.82 0 48 35.82 48 80S83.82 160 128 160zM551.9 192h-61.84c-12.8 0-24.88 3.037-35.86 8.24C454.8 205.5 455.8 210.6 455.8 216c0 33.71-12.78 64.21-33.16 88h199.7C632.1 304 640 295.6 640 285.3C640 233.8 600.6 192 551.9 192z"></path></svg>
    </div>
    <div class="initial-content-item-retractable-title-selection-h2">
        <h2>About us</h2>
    </div>
    <div class="initial-content-item-retractable-title-selection-more">
        <a class="MuiTypography-root MuiLink-root MuiLink-underlineNone ud-mu-link initial-content-item-retractable-title-selection-a" onclick="ServicesListMobileBoxDropdown();" rel="noopener" target="_self">
            More
        </a>
    </div>     
</div>
"@                                
                            )
                        }
                    }
                }
            }            
            New-UDRow -Columns {
                New-UDGrid -ClassName "initial-content-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                    New-UDGrid -ClassName "initial-content-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                        New-UDGrid -ClassName "initial-content-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                            New-UDHtml -Markup (
@"
    <div class="initial-content-retractable-card-item-darkening">
        <div class="initial-content-retractable-card-item">
            <div class="initial-content-retractable-card-item-additional-fix item-aditional-desktop">
                <div class="initial-content-retractable-card-item-additional-info-fix">
                    <div class="initial-content-retractable-card-item-additional-info-caption-fix initial-content-retractable-card-item-additional-center">
                        Team
                    </div>
                    <a href="https://www.w3schools.com">
                        <div class="initial-content-retractable-card-item-additional-info-more-fix initial-content-retractable-card-item-additional-center">
                            More
                        </div>
                    </a>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-additional">
                <div class="initial-content-retractable-card-item-additional-info item-aditional-background-red">
                    <div class="initial-content-retractable-card-item-info-left"></div>
                    <div class="initial-content-retractable-card-item-info-long-right item-aditional-color-white">
                        <div class="initial-content-retractable-card-item-info-caption-long">
                            <h2>Development Team</h2>
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Artificial Inteligence
                        </div>                        
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Articles
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Customers
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Scrapping System
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Warehouse System
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Multi Languages
                        </div>
                        <div class="initial-content-retractable-card-item-additional-info-mini_btn-fix">
                            Multi Language
                        </div>
                    </div>
                </div>
            </div>
            <div class="initial-content-retractable-card-item-general">
                <div class="initial-content-retractable-card-item-general-left"></div>
                <div class="initial-content-retractable-card-item-general-right-long">
                    <div class="initial-content-retractable-card-item-general-caption-long">
                        <h2>Development Team</h2>
                    </div>
                    <p>Developing a desktop application using the PowerShell Universal Framework.</p>
                </div>
                <div class="initial-content-container-slideshow-video">
                    <video autoplay muted loop id="initial-content-epsuca-slideshow-video">
                        <source src="\presentation\assets\video\best\Digital - 34175.mp4" type="video/mp4">
                    </video>
                </div>                
            </div>
        </div>
    </div>    
"@
                            )
                        }
                    }
                }
            }
            New-UDElement -Id 'initial-footer-container-block-space' -Tag 'div' -Content {

            }
        }
        New-UDElement -Id 'initial-footer-container-block' -Tag 'div' -Content {
            New-UDRow -Columns {
                New-UDGrid -ClassName "initial-footer-grid-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                    New-UDGrid -ClassName "initial-footer-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Children {
                        New-UDGrid -ClassName "initial-footer-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 3 -MediumSize 3 -LargeSize 3 -ExtraLargeSize 3 -Content {
                            New-UDHtml -Markup '
                            <div class="initial-footer-mini_btn-fix">
                                Products
                            </div>
                            '
                        }
                        New-UDGrid -ClassName "initial-footer-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 3 -MediumSize 3 -LargeSize 3 -ExtraLargeSize 3 -Content {
                            New-UDHtml -Markup '
                            <div class="initial-footer-mini_btn-fix">
                                Services
                            </div>
                            '
                        }
                        New-UDGrid -ClassName "initial-footer-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 3 -MediumSize 3 -LargeSize 3 -ExtraLargeSize 3 -Content {
                            New-UDHtml -Markup '
                            <div class="initial-footer-mini_btn-fix">
                                About
                            </div>
                            '
                        }
                        New-UDGrid -ClassName "initial-footer-box-grid-item" -Item -ExtraSmallSize 12 -SmallSize 3 -MediumSize 3 -LargeSize 3 -ExtraLargeSize 3 -Content {
                            New-UDHtml -Markup '
                            <div class="initial-footer-mini_btn-fix">
                                Contact
                            </div>
                            '
                        }
                    }
                }
            }
        }
    }
}



<#
                    New-UDGrid -ClassName "initial-content-item-center" -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                        New-UDGrid -ClassName "initial-content-grid-item" -Item -Content {
                            New-UDLink -ClassName "initial-content-button-item" -Children {
                                New-UDStyle -Content {
                                    New-UDIcon -Icon 'Lock'
                                } -Style 'transform: scale(1.2);'
                            }
                        }                
                    }
#>



