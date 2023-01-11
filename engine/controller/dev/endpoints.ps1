New-PSUEndpoint -Url "/api/test" -Description "test" -Method @('POST') -Endpoint {
$BodyJson = $Body | ConvertFrom-Json -Depth 100
if($BodyJson.Token -eq 'xxx'){
    if($BodyJson.ApiType -eq 'GET'){
        if($BodyJson.ApiData){
            [string]$ApiData   = $BodyJson.ApiData
            $GetCachce = Get-PSUCache -Key $ApiData -Integrated
            $GetCachce
        }
    }
    elseif($BodyJson.ApiType -eq 'SET'){
    
    }
}
else{
    'error'
}
} -Environment "7.2.5" 
New-PSUEndpoint -Url "/api/stream" -Description "Streaming database" -Method @('POST') -Endpoint {
$BodyJson = $Body | ConvertFrom-Json -Depth 100
if($BodyJson.Token -eq 'xxx'){
    if($BodyJson.ApiType -eq 'GET'){
        if($BodyJson.ApiArg -eq 'All'){
            $ApiData           = $BodyJson.ApiData
            [string]$CacheId   = $ApiData.Id
            $GetPsuCachce      = Get-PSUCache -Key $CacheId -Integrated
            $GetPsuCachce
        }
        elseif($BodyJson.ApiArg -eq 'Selected'){
            $ApiData           = $BodyJson.ApiData
            [string]$CacheId   = $ApiData.Id
            $CacheArrayList    = $ApiData.ArrayList
            $GetPsuCachce      = Get-PSUCache -Key $CacheId -Integrated
            $DatabaseList      = $GetPsuCachce
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
    elseif($BodyJson.ApiType -eq 'ADD'){
        if($BodyJson.ApiArg -eq 'All'){
            $ApiData           = $BodyJson.ApiData
            [string]$CacheId   = $ApiData.Id
            $CacheContent      = $ApiData.Content
            $GetPsuCachce      = Get-PSUCache -Key $CacheId -Integrated
            $CacheList         = @()
            $CacheList        += $GetPsuCachce
            $CacheList        += $CacheContent|ConvertFrom-Json -Depth 100
            $CacheListToJson   = $CacheList
            $SetCachce         = Set-PSUCache -Key $CacheId -Value $CacheListToJson -Integrated
            'add'
        }
        elseif($BodyJson.ApiArg -eq 'Selected'){
            $ApiData           = $BodyJson.ApiData
            [string]$CacheId   = $ApiData.Id
            $CacheArrayList    = $ApiData.ArrayList
            $CacheContent      = $ApiData.Content
            $GetPsuCachce      = Get-PSUCache -Key $CacheId -Integrated
            $DatabaseList      = $GetPsuCachce
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
                                $CacheList += $CacheContent|ConvertFrom-Json -Depth 100
                            }
                            $CacheList += $Database
                            $num++
                        }
                        $CacheListToJson = $CacheList
                        $Add = Set-PSUCache -Key $CacheId -Value $CacheListToJson -Integrated
                        'add'
                    }
                    elseif(($CacheArrayList).Count -gt 1 -and ($CacheContent).Count -gt 1){
                        $CacheContentJson = $CacheContent|ConvertFrom-Json -Depth 100
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
                        $CacheContentJson = $CacheContent|ConvertFrom-Json -Depth 100
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
    elseif($BodyJson.ApiType -eq 'DELETE'){
        if($BodyJson.ApiArg -eq 'All'){
            $ApiData           = $BodyJson.ApiData
            [string]$CacheId   = $ApiData.Id
            $CacheValue        = ''
            $SetPsuCachce      = Set-PSUCache -Key $CacheId -Value $CacheValue -Integrated
            'delete'
        }
        elseif($BodyJson.ApiArg -eq 'Selected'){
            $ApiData           = $BodyJson.ApiData
            [string]$CacheId   = $ApiData.Id
            $CacheArrayList    = $ApiData.ArrayList
            $GetPsuCachce      = Get-PSUCache -Key $CacheId -Integrated
            $DatabaseList      = $GetPsuCachce
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
    elseif($BodyJson.ApiType -eq 'UPDATE'){
        if($BodyJson.ApiArg -eq 'All'){
            $ApiData           = $BodyJson.ApiData
            [string]$CacheId   = $ApiData.Id
            $CacheContent      = $ApiData.Content|ConvertFrom-Json -Depth 100
            $SetPsuCachce      = Set-PSUCache -Key $CacheId -Value $CacheContent -Integrated
            'update'
        }
        elseif($BodyJson.ApiArg -eq 'Selected'){
            $ApiData           = $BodyJson.ApiData
            [string]$CacheId   = $ApiData.Id
            $CacheArrayList    = $ApiData.ArrayList
            $CacheContent      = $ApiData.Content|ConvertFrom-Json -Depth 100
            $GetPsuCachce      = Get-PSUCache -Key $CacheId -Integrated
            $DatabaseList      = $GetPsuCachce
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
else{
    'error'
}
}