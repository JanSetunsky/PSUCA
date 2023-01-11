New-PSUEndpoint -Url "/api/stream" -Description "Streaming database" -Method @('POST') -Endpoint {
$BodyJson = $Body | ConvertFrom-Json -Depth 100
if($BodyJson.Token -eq 'testapiapptoken'){
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
New-PSUEndpoint -Url "/api/auth" -Description "Authentication" -Method @('POST') -Endpoint {
$VerifyCredentialsSC = {
    
}

$BodyJson = $Body | ConvertFrom-Json -Depth 100
if($BodyJson.Type -eq 'verify-save-device'){
    $time = $BodyJson.time
    $cd = $BodyJson.cd
    $ci = $BodyJson.ci
    $cn = $BodyJson.cn
    $ct = $BodyJson.ct
    $ce = $BodyJson.ce
    $ssid = $BodyJson.ssid
    $login = $BodyJson.encrypt
    $psudata = Get-PSUCache -Key $ssid -Integrated
    if($psudata.type -eq 'verify-login-account-key' -and $psudata.id -eq $ci){
        # decrypt - decipher
        $text = $BodyJson.encrypt
        $key = $psudata.key
        $textArray = $text.ToCharArray()
        $keyBytes = [Text.Encoding]::ASCII.GetBytes($key)
        $textToArray = $null
        foreach ($char in $textArray) {
            [string]$charString += $char
            if($charString.Length -eq 2){
                [array]$textToArray += $charString
                $charString=$null
            }
        }
        if($keyBytes.Count -eq 1){
            [string]$charKeyByteXor = [string]$keyBytes
        }
        elseif($keyBytes.Count -gt 1){
            for ($i = 0; $i -lt $keyBytes.Count; $i++) {
                if($i -eq 0){
                    [string]$charKeyByteXor = [string]$keyBytes[$i] -bxor [string]$keyBytes[$i+1]
                }
                else{
                    [string]$charKeyByteXor = $charKeyByteXor -bxor [string]$keyBytes[$i+1]
                }
            }
        }
        foreach ($hex in $textToArray) {
            [string]$hexByte = [Convert]::FromHexString($hex)
            $hexByteXor = $hexByte -bxor $charKeyByteXor
            $hexString = [Text.Encoding]::ASCII.GetString($hexByteXor) -join ''
            $hexStringAll = $hexStringAll + $hexString
        }
        $decryptString = $hexStringAll
        $decryptJson = $decryptString|ConvertFrom-Json
        $uid = $decryptJson.uid
        $pwd = $decryptJson.pwd
        if($Body.length -gt 44){
            $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
            $uidPath = "$dataPath"+"$uid"+'\'
            if(Test-Path $uidPath -ErrorAction Stop){
                $uidAuth = gc ("$uidPath"+'auth.json')|ConvertFrom-Json -ErrorAction Stop
                if($null -ne $uidAuth -and $uidAuth.uid -eq $uid -and $uidAuth.pwd -eq $pwd -and $uidAuth.id -eq $ci){
                    # SAVE DEVICE
                    $cred = $uidAuth.cred
                    $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred=$cred;Lock=$false;Vr=$true;Uid=$uid;Pwd=$pwd}
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                    '[{"r":"success"}]'
                }
                elseif($null -ne $uidAuth -and $uidAuth.uid -eq $uid -and $uidAuth.pwd -eq $pwd -and ($true -ne $($uidAuth.id -eq $ci))){
                    # 2 STEP VERIFICATION
                    # CREATE NEW DEVICE
                    $keygen = Get-Random -Minimum 1000 -Maximum 9999 -ErrorAction Stop
                    $sendEmail = Set-Content 'd:\PSUCA\engine\controller\default\modules\Dashboards\Authentication\scripts\keytest.txt' -Value $keygen -force
                    $sendPhone = ''
                    $getTime = (Get-Date).AddMinutes(2)
                    $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr='2step';Uid=$uid;Pwd=$pwd;lkey=$keygen;lkeytime=$getTime}
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                    '[{"r":"verification"}]'
                }
                else{
                    $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                    '[{"r":"denied"}]'
                }            
            }
            else{
                $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"denied"}]'
            }
        }
        else{
            '[{"r":"error"}]'
        }        
    }
    elseif($psudata.type -eq 'verify-login-account-key' -and $cd -eq 'undefined' -and $ci -eq 'undefined' -and $cn -eq 'undefined' -and $ct -eq 'undefined'){
        # decrypt - decipher
        $text = $BodyJson.encrypt
        $key = $psudata.key
        $textArray = $text.ToCharArray()
        $keyBytes = [Text.Encoding]::ASCII.GetBytes($key)
        $textToArray = $null
        foreach ($char in $textArray) {
            [string]$charString += $char
            if($charString.Length -eq 2){
                [array]$textToArray += $charString
                $charString=$null
            }
        }
        if($keyBytes.Count -eq 1){
            [string]$charKeyByteXor = [string]$keyBytes
        }
        elseif($keyBytes.Count -gt 1){
            for ($i = 0; $i -lt $keyBytes.Count; $i++) {
                if($i -eq 0){
                    [string]$charKeyByteXor = [string]$keyBytes[$i] -bxor [string]$keyBytes[$i+1]
                }
                else{
                    [string]$charKeyByteXor = $charKeyByteXor -bxor [string]$keyBytes[$i+1]
                }
            }
        }
        foreach ($hex in $textToArray) {
            [string]$hexByte = [Convert]::FromHexString($hex)
            $hexByteXor = $hexByte -bxor $charKeyByteXor
            $hexString = [Text.Encoding]::ASCII.GetString($hexByteXor) -join ''
            $hexStringAll = $hexStringAll + $hexString
        }
        $decryptString = $hexStringAll
        $decryptJson = $decryptString|ConvertFrom-Json
        $uid = $decryptJson.uid
        $pwd = $decryptJson.pwd
        if($Body.length -gt 44){
            $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
            $uidPath = "$dataPath"+"$uid"+'\'
            if(Test-Path $uidPath -ErrorAction Stop){
                $uidAuth = gc ("$uidPath"+'auth.json')|ConvertFrom-Json -ErrorAction Stop
                if($null -ne $uidAuth -and $uidAuth.uid -eq $uid -and $uidAuth.pwd -eq $pwd -and $uidAuth.id -eq $ssid){
                    # SAVE DEVICE
                    $cred = $uidAuth.cred
                    $data = @{Id=$ssid;Created='null';Expire='null';Cred=$cred;Lock=$false;Vr=$true;Uid=$uid;Pwd=$pwd}
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                    '[{"r":"success"}]'
                }
                elseif($null -ne $uidAuth -and $uidAuth.uid -eq $uid -and $uidAuth.pwd -eq $pwd -and ($true -ne $($uidAuth.id -eq $ssid))){
                    # 2 STEP VERIFICATION
                    # CREATE NEW DEVICE
                    $keygen = Get-Random -Minimum 1000 -Maximum 9999 -ErrorAction Stop
                    $sendEmail = Set-Content 'd:\PSUCA\engine\controller\default\modules\Dashboards\Authentication\scripts\keytest.txt' -Value $keygen -force
                    $sendPhone = ''
                    $getTime = (Get-Date).AddMinutes(2)
                    $data = @{Id=$ssid;Created='null';Expire='null';Cred='vc';Lock=$false;Vr='2step';Uid=$uid;Pwd=$pwd;lkey=$keygen;lkeytime=$getTime}
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                    '[{"r":"verification"}]'
                }
                else{
                    $data = @{Id=$ssid;Created='null';Expire='null';Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                    '[{"r":"denied"}]'
                }            
            }
            else{
                $data = @{Id=$ssid;Created='null';Expire='null';Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"denied"}]'
            }
        }
        else{
            '[{"r":"error"}]'
        }  
    }
    else{
        $data = @{Id=$ssid;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
        $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
        '[{"r":"denied"}]'
    }    
}
elseif($BodyJson.Type -eq 'verify-new-device'){
    $time = $BodyJson.time
    $cd = $BodyJson.cd
    $ci = $BodyJson.ci
    $cn = $BodyJson.cn
    $ct = $BodyJson.ct
    $ce = $BodyJson.ce    
    $ssid = $BodyJson.ssid
    if($Body.length -gt 39){
        $ssn = Get-PSUCache -Key $ssid -Integrated
        $uid = $ssn.uid
        $pwd = $ssn.pwd
        $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
        $uidPath = "$dataPath"+"$uid"+'\'
        if(Test-Path $uidPath){
            $uidAuth = gc ("$uidPath"+'auth.json')|ConvertFrom-Json -ErrorAction Stop
            if($null -ne $uidAuth -and $uidAuth.uid -eq $uid -and $uidAuth.pwd -eq $pwd -and $uidAuth.id -eq $ci){
                # 2 STEP VERIFICATION
                # REGISTER NEW DEVICE FROM VERIFICATION
                # SAVE NEW DEVICE
                $cred = $uidAuth.cred
                $vr = $uidAuth.vr
                $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred=$cred;Lock=$false;Vr=$vr;Uid=$uid;Pwd=$pwd}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"success"}]'
            }
            elseif($null -ne $uidAuth -and $uidAuth.uid -eq $uid -and $uidAuth.pwd -eq $pwd -and ($true -ne $($uidAuth.id -eq $ci))){
                # 2 STEP VERIFICATION
                # REGISTER NEW DEVICE FROM VERIFICATION
                # SAVE NEW DEVICE
                $cred = $uidAuth.cred
                $vr = $uidAuth.vr
                $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred=$cred;Lock=$false;Vr=$true;Uid=$uid;Pwd=$pwd}
                $dataJson = $data|ConvertTo-Json -Depth 100 -ErrorAction Stop
                $save = Set-Content ("$uidPath"+'auth.json') -Value $dataJson -ErrorAction Stop
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"success"}]'
            }
            elseif($null -ne $uidAuth -and $uidAuth.uid -eq $uid -and $uidAuth.pwd -eq $pwd -and $uidAuth.Id -eq $ssid -and $cd -eq 'undefined' -and $ci -eq 'undefined' -and $cn -eq 'undefined' -and $ct -eq 'undefined'){
                # 2 STEP VERIFICATION
                # REGISTER NEW DEVICE FROM VERIFICATION
                # NULL COOKIE VERSION
                # SAVE NEW DEVICE
                $cred = $uidAuth.cred
                $vr = $uidAuth.vr
                $data = @{Id=$ssid;Created='null';Expire='null';Cred=$cred;Lock=$false;Vr=$true;Uid=$uid;Pwd=$pwd}
                $dataJson = $data|ConvertTo-Json -Depth 100 -ErrorAction Stop
                $save = Set-Content ("$uidPath"+'auth.json') -Value $dataJson -ErrorAction Stop
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"success"}]'
            }
            else{
                $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"denied"}]'
            }
        }
        elseif($cd -eq 'undefined' -and $ci -eq 'undefined' -and $cn -eq 'undefined' -and $ct -eq 'undefined'){
            $data = @{Id=$ssid;Created='null';Expire='null';Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
            $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
            '[{"r":"denied"}]'
        }        
        else{
            $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
            $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
            '[{"r":"denied"}]'
        }        
    }
    else{
        '[{"r":"error"}]'
    }
}
elseif($BodyJson.Type -eq 'verify-register-account'){
    $time = $BodyJson.time
    $cd = $BodyJson.cd
    $ci = $BodyJson.ci
    $cn = $BodyJson.cn
    $ct = $BodyJson.ct
    $ce = $BodyJson.ce
    $ssid = $BodyJson.ssid
    $psudata = Get-PSUCache -Key $ssid -Integrated
    if($psudata.type -eq 'verify-register-account-key' -and $psudata.id -eq $ci){
        if($Body.length -gt 44){
            # decrypt - decipher
            $text = $BodyJson.encrypt
            $key = $psudata.key



            $textArray = $text.ToCharArray()
            $keyBytes = [Text.Encoding]::ASCII.GetBytes($key)
            $textToArray = $null
            foreach ($char in $textArray) {
                [string]$charString += $char
                if($charString.Length -eq 2){
                    [array]$textToArray += $charString
                    $charString=$null
                }
            }
            if($keyBytes.Count -eq 1){
                [string]$charKeyByteXor = [string]$keyBytes
            }
            elseif($keyBytes.Count -gt 1){
                for ($i = 0; $i -lt $keyBytes.Count; $i++) {
                    if($i -eq 0){
                        [string]$charKeyByteXor = [string]$keyBytes[$i] -bxor [string]$keyBytes[$i+1]
                    }
                    else{
                        [string]$charKeyByteXor = $charKeyByteXor -bxor [string]$keyBytes[$i+1]
                    }
                }
            }
            
            foreach ($hex in $textToArray) {
                [string]$hexByte = [Convert]::FromHexString($hex)
                $hexByteXor = $hexByte -bxor $charKeyByteXor
                $hexString = [Text.Encoding]::ASCII.GetString($hexByteXor) -join ''
                $hexStringAll = $hexStringAll + $hexString
            }
            $decryptString = $hexStringAll
            


            if($null -ne $decryptString){
                $json = $decryptString|ConvertFrom-Json -Depth 100
                if($json.type -eq 'registration'){
                    $SellerData = $json.sellerData
                    $CompanyData = $json.companyData
                    $PaymentData = $json.paymentData
                    $LoginData = $json.loginData
                    $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
                    $uid = $LoginData.email
                    $pwd = $LoginData.password
                    $uidPath = "$dataPath"+"$uid"+'\'
                    if(Test-Path $uidPath -ErrorAction Stop){
                        '[{"r":"denied","type":"account-is-exist"}]'
                    }
                    else{
                        $newUidAuthDir  = New-Item -ItemType Directory $uidPath -Force -ErrorAction Stop
                        $newUidAuthFile = New-Item -ItemType File ("$uidPath"+'auth.json') -Force -ErrorAction Stop
                        $newUidProfileFile = New-Item -ItemType File ("$uidPath"+'profile.json') -Force -ErrorAction Stop                        
                        if(Test-Path $uidPath -ErrorAction Stop){
                            # REGISTER DEVICE
                            $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='cc';Lock=$false;Vr=$false;Uid=$uid;Pwd=$pwd}
                            $dataJson = $data|ConvertTo-Json
                            $saveUidAuth = Set-Content ("$uidPath"+'auth.json') -Value $dataJson -Force -ErrorAction Stop
                            $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                            # SAVE PROFILE DETAILS
                            $saveUidProfile = Set-Content ("$uidPath"+'profile.json') -Value $decryptString -Force -ErrorAction Stop
                            '[{"r":"success"}]'
                        }
                        else{
                            '[{"r":"error"}]'
                        }
                    }
                }
                else{
                    '[{"r":"error"}]'
                }
            }
            else{
                '[{"r":"error"}]'
            }
        }
        else{
            '[{"r":"error"}]'
        } 
    }
    elseif($psudata.type -eq 'verify-register-account-key' -and $cd -eq 'undefined' -and $ci -eq 'undefined' -and $cn -eq 'undefined' -and $ct -eq 'undefined'){
        if($Body.length -gt 44){
            # decrypt - decipher
            $text = $BodyJson.encrypt
            $key = $psudata.key



            $textArray = $text.ToCharArray()
            $keyBytes = [Text.Encoding]::ASCII.GetBytes($key)
            $textToArray = $null
            foreach ($char in $textArray) {
                [string]$charString += $char
                if($charString.Length -eq 2){
                    [array]$textToArray += $charString
                    $charString=$null
                }
            }
            if($keyBytes.Count -eq 1){
                [string]$charKeyByteXor = [string]$keyBytes
            }
            elseif($keyBytes.Count -gt 1){
                for ($i = 0; $i -lt $keyBytes.Count; $i++) {
                    if($i -eq 0){
                        [string]$charKeyByteXor = [string]$keyBytes[$i] -bxor [string]$keyBytes[$i+1]
                    }
                    else{
                        [string]$charKeyByteXor = $charKeyByteXor -bxor [string]$keyBytes[$i+1]
                    }
                }
            }
            
            foreach ($hex in $textToArray) {
                [string]$hexByte = [Convert]::FromHexString($hex)
                $hexByteXor = $hexByte -bxor $charKeyByteXor
                $hexString = [Text.Encoding]::ASCII.GetString($hexByteXor) -join ''
                $hexStringAll = $hexStringAll + $hexString
            }
            $decryptString = $hexStringAll
            


            if($null -ne $decryptString){
                $json = $decryptString|ConvertFrom-Json -Depth 100
                if($json.type -eq 'registration'){
                    $SellerData = $json.sellerData
                    $CompanyData = $json.companyData
                    $PaymentData = $json.paymentData
                    $LoginData = $json.loginData
                    $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
                    $uid = $LoginData.email
                    $pwd = $LoginData.password
                    $uidPath = "$dataPath"+"$uid"+'\'
                    if(Test-Path $uidPath -ErrorAction Stop){
                        '[{"r":"denied","type":"account-is-exist"}]'
                    }
                    else{
                        $newUidAuthDir  = New-Item -ItemType Directory $uidPath -Force -ErrorAction Stop
                        $newUidAuthFile = New-Item -ItemType File ("$uidPath"+'auth.json') -Force -ErrorAction Stop
                        $newUidProfileFile = New-Item -ItemType File ("$uidPath"+'profile.json') -Force -ErrorAction Stop                        
                        if(Test-Path $uidPath -ErrorAction Stop){
                            # REGISTER DEVICE
                            $data = @{Id=$ssid;Created='null';Expire='null';Cred='cc';Lock=$false;Vr=$false;Uid=$uid;Pwd=$pwd}
                            $dataJson = $data|ConvertTo-Json
                            $saveUidAuth = Set-Content ("$uidPath"+'auth.json') -Value $dataJson -Force -ErrorAction Stop
                            $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                            # SAVE PROFILE DETAILS
                            $saveUidProfile = Set-Content ("$uidPath"+'profile.json') -Value $decryptString -Force -ErrorAction Stop
                            '[{"r":"success"}]'
                        }
                        else{
                            '[{"r":"error"}]'
                        }
                    }
                }
                else{
                    '[{"r":"error"}]'
                }
            }
            else{
                '[{"r":"error"}]'
            }
        }
        else{
            '[{"r":"error"}]'
        } 
    }    
    else{
        '[{"r":"error"}]'
    }   
}
elseif($BodyJson.Type -eq 'verify-recovery-password-identity-email'){
    $time = $BodyJson.time
    $cd = $BodyJson.cd
    $ci = $BodyJson.ci
    $cn = $BodyJson.cn
    $ct = $BodyJson.ct
    $ce = $BodyJson.ce
    $ssid = $BodyJson.ssid
    $psudata = Get-PSUCache -Key $ssid -Integrated
    if($psudata.type -eq 'verify-recovery-password-key' -and $psudata.id -eq $ci){
        # decrypt - decipher
        $text = $BodyJson.encrypt
        $key = $psudata.key
        $textArray = $text.ToCharArray()
        $keyBytes = [Text.Encoding]::ASCII.GetBytes($key)
        $textToArray = $null
        foreach ($char in $textArray) {
            [string]$charString += $char
            if($charString.Length -eq 2){
                [array]$textToArray += $charString
                $charString=$null
            }
        }
        if($keyBytes.Count -eq 1){
            [string]$charKeyByteXor = [string]$keyBytes
        }
        elseif($keyBytes.Count -gt 1){
            for ($i = 0; $i -lt $keyBytes.Count; $i++) {
                if($i -eq 0){
                    [string]$charKeyByteXor = [string]$keyBytes[$i] -bxor [string]$keyBytes[$i+1]
                }
                else{
                    [string]$charKeyByteXor = $charKeyByteXor -bxor [string]$keyBytes[$i+1]
                }
            }
        }
        foreach ($hex in $textToArray) {
            [string]$hexByte = [Convert]::FromHexString($hex)
            $hexByteXor = $hexByte -bxor $charKeyByteXor
            $hexString = [Text.Encoding]::ASCII.GetString($hexByteXor) -join ''
            $hexStringAll = $hexStringAll + $hexString
        }
        $decryptString = $hexStringAll
        $decryptJson = $decryptString|ConvertFrom-Json
        $uid = $decryptJson.uid
        if($Body.length -gt 44){
            $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
            $uidPath = "$dataPath"+"$uid"+'\'
            if(Test-Path $uidPath -ErrorAction Stop){
                $uidAuth = gc ("$uidPath"+'auth.json')|ConvertFrom-Json -ErrorAction Stop
                if($null -ne $uidAuth -and $uidAuth.uid -eq $uid){
                    # 2 STEP VERIFICATION EMAIL
                    # CREATE NEW DEVICE
                    $cred = $uidAuth.cred
                    $keygen = Get-Random -Minimum 1000 -Maximum 9999 -ErrorAction Stop
                    $sendEmail = Set-Content 'd:\PSUCA\engine\controller\default\modules\Dashboards\Authentication\scripts\keytest.txt' -Value $keygen -force
                    $getTime = (Get-Date).AddMinutes(2)
                    $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred=$cred;Lock=$false;Vr='2step';Uid=$uid;Pwd='null';lkey=$keygen;lkeytime=$getTime;tkey='email'}
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                    '[{"r":"verification"}]'
                }
                else{
                    $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                    '[{"r":"denied"}]'
                }            
            }
            else{
                $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"denied"}]'
            }
        }
        else{
            '[{"r":"error"}]'
        }        
    }
    else{
        $data = @{Id=$ssid;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
        $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
        '[{"r":"denied"}]'
    }    
}
elseif($BodyJson.Type -eq 'verify-recovery-password-identity-phone'){
    $time = $BodyJson.time
    $cd = $BodyJson.cd
    $ci = $BodyJson.ci
    $cn = $BodyJson.cn
    $ct = $BodyJson.ct
    $ce = $BodyJson.ce
    $ssid = $BodyJson.ssid
    $psudata = Get-PSUCache -Key $ssid -Integrated
    if($psudata.type -eq 'verify-recovery-password-key' -and $psudata.id -eq $ci){
        # decrypt - decipher
        $text = $BodyJson.encrypt
        $key = $psudata.key
        $textArray = $text.ToCharArray()
        $keyBytes = [Text.Encoding]::ASCII.GetBytes($key)
        $textToArray = $null
        foreach ($char in $textArray) {
            [string]$charString += $char
            if($charString.Length -eq 2){
                [array]$textToArray += $charString
                $charString=$null
            }
        }
        if($keyBytes.Count -eq 1){
            [string]$charKeyByteXor = [string]$keyBytes
        }
        elseif($keyBytes.Count -gt 1){
            for ($i = 0; $i -lt $keyBytes.Count; $i++) {
                if($i -eq 0){
                    [string]$charKeyByteXor = [string]$keyBytes[$i] -bxor [string]$keyBytes[$i+1]
                }
                else{
                    [string]$charKeyByteXor = $charKeyByteXor -bxor [string]$keyBytes[$i+1]
                }
            }
        }
        foreach ($hex in $textToArray) {
            [string]$hexByte = [Convert]::FromHexString($hex)
            $hexByteXor = $hexByte -bxor $charKeyByteXor
            $hexString = [Text.Encoding]::ASCII.GetString($hexByteXor) -join ''
            $hexStringAll = $hexStringAll + $hexString
        }
        $decryptString = $hexStringAll
        $decryptJson = $decryptString|ConvertFrom-Json
        $phone = $decryptJson.phone
        if($Body.length -gt 44){
            $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
            $phonePath = "$dataPath"+'*'+'\'+'p'+"$phone"
            if(Test-Path $phonePath -ErrorAction Stop){
                $phonePathGci = gci $phonePath -Force -ErrorAction Stop
                if($phonePathGci.Count -eq 1){
                    $uidPath = $phonePathGci.Directory.FullName
                    if(Test-Path $uidPath -ErrorAction Stop){
                        $uidAuth = gc ("$uidPath"+'\'+'auth.json')|ConvertFrom-Json -ErrorAction Stop
                        $uidProfile = gc ("$uidPath"+'\'+'profile.json')|ConvertFrom-Json -ErrorAction Stop
                        if($null -ne ($uidProfile.logindata).phone -and ($uidProfile.logindata).phone -eq $phone -and $uidAuth.Uid -ne 'null'){
                            # 2 STEP VERIFICATION PHONE
                            # CREATE NEW DEVICE
                            $uid = $uidAuth.Uid
                            $cred = $uidAuth.cred
                            $keygen = Get-Random -Minimum 1000 -Maximum 9999 -ErrorAction Stop
                            $sendPhone = Set-Content 'd:\PSUCA\engine\controller\default\modules\Dashboards\Authentication\scripts\keytest.txt' -Value $keygen -force -ErrorAction Stop
                            $getTime = (Get-Date -ErrorAction Stop).AddMinutes(2)
                            $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred=$cred;Lock=$false;Vr='2step';Uid=$uid;Pwd='null';lkey=$keygen;lkeytime=$getTime;tkey='phone'}
                            $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated -ErrorAction Stop
                            '[{"r":"verification"}]'
                        }
                        else{
                            $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                            $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated -ErrorAction Stop
                            '[{"r":"denied"}]'
                        } 
                    }
                    else{
                        $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                        $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated -ErrorAction Stop
                        '[{"r":"denied"}]'
                    }                     
                }
                else{
                    $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated -ErrorAction Stop
                    '[{"r":"denied"}]'
                }                               
            }
            else{
                $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated -ErrorAction Stop
                '[{"r":"denied"}]'
            }
        }
        else{
            '[{"r":"error"}]'
        }        
    }
    else{
        $data = @{Id=$ssid;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
        $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated -ErrorAction Stop
        '[{"r":"denied"}]'
    }    
}
elseif($BodyJson.Type -eq 'verify-recovery-password'){
    $time = $BodyJson.time
    $cd = $BodyJson.cd
    $ci = $BodyJson.ci
    $cn = $BodyJson.cn
    $ct = $BodyJson.ct
    $ce = $BodyJson.ce
    $ssid = $BodyJson.ssid
    $psudata = Get-PSUCache -Key $ssid -Integrated -ErrorAction Stop
    $lkeyTime = $psudata.lkeyTime
    $recoveryHash = $psudata.Recovery
    $recoveryHashKey = $recoveryHash.Key
    $timeVerify = (Get-Date -Date $lkeyTime -ErrorAction Stop).AddMinutes(8)
    $actualTime = Get-Date -ErrorAction Stop
    if($recoveryHash.Type -eq 'verify-recovery-password-key-step-2' -and $psudata.id -eq $ci -and $actualTime -lt $timeVerify){
        # decrypt - decipher
        $text = $BodyJson.encrypt
        $key = $recoveryHashKey
        $textArray = $text.ToCharArray()
        $keyBytes = [Text.Encoding]::ASCII.GetBytes($key)
        $textToArray = $null
        foreach ($char in $textArray) {
            [string]$charString += $char
            if($charString.Length -eq 2){
                [array]$textToArray += $charString
                $charString=$null
            }
        }
        if($keyBytes.Count -eq 1){
            [string]$charKeyByteXor = [string]$keyBytes
        }
        elseif($keyBytes.Count -gt 1){
            for ($i = 0; $i -lt $keyBytes.Count; $i++) {
                if($i -eq 0){
                    [string]$charKeyByteXor = [string]$keyBytes[$i] -bxor [string]$keyBytes[$i+1]
                }
                else{
                    [string]$charKeyByteXor = $charKeyByteXor -bxor [string]$keyBytes[$i+1]
                }
            }
        }
        foreach ($hex in $textToArray) {
            [string]$hexByte = [Convert]::FromHexString($hex)
            $hexByteXor = $hexByte -bxor $charKeyByteXor
            $hexString = [Text.Encoding]::ASCII.GetString($hexByteXor) -join ''
            $hexStringAll = $hexStringAll + $hexString
        }
        $decryptString = $hexStringAll
        $decryptJson = $decryptString|ConvertFrom-Json -ErrorAction Stop
        $pwd = $decryptJson.pwd
        $uid = $psudata.uid
        if($Body.length -gt 44){
            $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
            $uidPath = "$dataPath"+"$uid"+'\'
            if(Test-Path $uidPath -ErrorAction Stop){
                $uidAuth = gc ("$uidPath"+'auth.json') -ErrorAction Stop|ConvertFrom-Json -ErrorAction Stop
                if($null -ne $uidAuth -and $uidAuth.uid -eq $uid){
                    # 2 STEP VERIFICATION EMAIL
                    # CREATE NEW DEVICE
                    $data = @{Id=$uidAuth.Id;Created=$uidAuth.Created;Expire=$uidAuth.Expire;Cred=$uidAuth.Cred;Lock=$uidAuth.Lock;Vr=$uidAuth.Vr;Uid=$uidAuth.Uid;Pwd=$pwd}
                    $dataJson = $data|ConvertTo-Json -ErrorAction Stop
                    $save = Set-Content ("$uidPath"+'auth.json') -Force -Value $dataJson -ErrorAction Stop
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated -ErrorAction Stop
                    '[{"r":"success"}]'
                }
                else{
                    $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                    $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated -ErrorAction Stop
                    '[{"r":"denied"}]'
                }            
            }
            else{
                $data = @{Id=$ci;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated -ErrorAction Stop
                '[{"r":"denied"}]'
            }
        }
        else{
            '[{"r":"error"}]'
        }        
    }
    else{
        $data = @{Id=$ssid;Created=$cd;Expire=$ce;Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
        $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated -ErrorAction Stop
        '[{"r":"denied"}]'
    }    
}
else{
    '[{"r":"error"}]'
}
}