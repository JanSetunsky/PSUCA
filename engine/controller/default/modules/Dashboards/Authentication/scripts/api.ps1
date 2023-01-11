$VerifyCredentialsSC = {
    
}
$BodyJson = $Body | ConvertFrom-Json -Depth 100
if($BodyJson.Type -eq 'verify-save-device'){
    $time = $BodyJson.time
    $cksid = $BodyJson.cksid
    $ckvid = $BodyJson.ckvid
    $cnid = $BodyJson.cnid
    $ssid = $BodyJson.ssid
    $nek = $BodyJson.nek
    $nei = $BodyJson.nei
    $uid = $BodyJson.uid
    $pwd = $BodyJson.pwd
    if($Body.length -gt 44){
        $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
        $uidPath = "$dataPath"+"$uid"+'\'
        if(Test-Path $uidPath -ErrorAction Stop){
            $uidAuth = gc ("$uidPath"+'auth.json')|ConvertFrom-Json -ErrorAction Stop
            if($null -ne $uidAuth -and $uidAuth.uid -eq $uid -and $uidAuth.pwd -eq $pwd -and $uidAuth.nek -match $nek -and $uidAuth.nei -match $nei){
                # SAVE DEVICE
                $cred = $uidAuth.cred
                $vr = $uidAuth.vr
                $data = @{vr=$vr;cred=$cred;time=$time;cksid=$cksid;ckvid=$ckvid;cnid=$cnid;nek=$nek;nei=$nei;uid=$uid;pwd=$pwd}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"success"}]'
            }
            elseif($null -ne $uidAuth -and $uidAuth.uid -eq $uid -and $uidAuth.pwd -eq $pwd -and (($true -ne $($uidAuth.nek -match $nek)) -or ($true -ne $($uidAuth.nei -match $nei)))){
                # 2 STEP VERIFICATION
                # CREATE NEW DEVICE
                $keygen = Get-Random -Minimum 1000 -Maximum 9999 -ErrorAction Stop
                $sendEmail = Set-Content 'd:\PSUCA\engine\controller\default\modules\Dashboards\Authentication\scripts\keytest.txt' -Value $keygen -force
                $sendPhone = ''
                $getTime = (Get-Date).AddMinutes(2)
                $data = @{vr='2step';cred='Visitor';time=$time;cksid=$cksid;ckvid=$ckvid;cnid=$cnid;nek=$nek;nei=$nei;uid=$uid;pwd=$pwd;lkey=$keygen;lkeytime=$getTime}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"verification"}]'
            }
            else{
                $data = @{vr=$false;cred='Visitor';time=$time;cksid=$cksid;ckvid=$ckvid;cnid=$cnid;nek=$nek;nei=$nei;uid='null';pwd='null'}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"denied"}]'
            }            
        }
        else{
            $data = @{vr=$false;cred='Visitor';time=$time;cksid=$cksid;ckvid=$ckvid;cnid=$cnid;nek=$nek;nei=$nei;uid='null';pwd='null'}
            $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
            '[{"r":"denied"}]'
        }
    }
    else{
        '[{"r":"error"}]'
    }
}
elseif($BodyJson.Type -eq 'verify-new-device'){
    $time = $BodyJson.time
    $cksid = $BodyJson.cksid
    $ckvid = $BodyJson.ckvid
    $cnid = $BodyJson.cnid
    $ssid = $BodyJson.ssid
    $nek = $BodyJson.nek
    $nei = $BodyJson.nei
    if($Body.length -gt 39){
        $ssn = Get-Variable -Name $ssid -Integrated
        $uid = $ssn.uid
        $pwd = $ssn.pwd
        $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
        $uidPath = "$dataPath"+"$uid"+'\'
        if(Test-Path $uidPath){
            $uidAuth = gc ("$uidPath"+'auth.json')|ConvertFrom-Json -ErrorAction Stop
            if($null -ne $uidAuth -and $uidAuth.uid -eq $uid -and $uidAuth.pwd -eq $pwd -and $uidAuth.nek -match $nek -and $uidAuth.nei -match $nei){
                # 2 STEP VERIFICATION
                # REGISTER NEW DEVICE FROM VERIFICATION
                # SAVE NEW DEVICE
                $cred = $uidAuth.cred
                $vr = $uidAuth.vr
                $data = @{vr=$vr;cred=$cred;time=$time;cksid=$cksid;ckvid=$ckvid;cnid=$cnid;nek=$nek;nei=$nei;uid=$uid;pwd=$pwd}
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
                '[{"r":"success"}]'
            }
        }
        else{
            $data = @{vr=$false;cred='Visitor';time=$time;cksid=$cksid;ckvid=$ckvid;cnid=$cnid;nek=$nek;nei=$nei;uid='null';pwd='null'}
            $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
            '[{"r":"denied"}]'
        }        
    }
    else{
        '[{"r":"error"}]'
    }
}
elseif($BodyJson.Type -eq 'register-new-device'){
    $time = $BodyJson.time
    $cksid = $BodyJson.cksid
    $ckvid = $BodyJson.ckvid
    $cnid = $BodyJson.cnid
    $ssid = $BodyJson.ssid
    $nek = $BodyJson.nek
    $nei = $BodyJson.nei
    $uid = $BodyJson.uid
    $pwd = $BodyJson.pwd    
    if($Body.length -gt 44){
        $dataPath = 'd:\PSUCA\database\modules\accountsmanagement\'
        $uidPath = "$dataPath"+"$uid"+'\'
        if(Test-Path $uidPath -ErrorAction Stop){
            '[{"r":"denied"}]'
        }
        else{
            $newUidAuthDir  = New-Item -ItemType Directory $uidPath -Force -ErrorAction Stop
            $newUidAuthFile = New-Item -ItemType File ("$uidPath"+'auth.json') -Force -ErrorAction Stop
            if(Test-Path $uidPath -ErrorAction Stop){
                # REGISTER DEVICE
                $data = @{vr='Visitor';cred='Customer';time=$time;cksid=$cksid;ckvid=$ckvid;cnid=$cnid;nek=$nek;nei=$nei;uid=$uid;pwd=$pwd}
                $dataJson = $data|ConvertTo-Json
                $saveUidAuth = Set-Content ("$uidPath"+'auth.json') -Value $dataJson -Force -ErrorAction Stop
                $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
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
elseif($BodyJson.Type -eq 'verify-register-account'){
    $time = $BodyJson.time
    $cksid = $BodyJson.cksid
    $ckvid = $BodyJson.ckvid
    $cnid = $BodyJson.cnid
    $ssid = $BodyJson.ssid
    $nek = $BodyJson.nek
    $nei = $BodyJson.nei
    $psudata = Get-PSUCache -Key $ssid -Integrated
    if($psudata.type -eq 'verify-register-account-key' -and $psudata.ckid -match $ckvid){
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
                        if(Test-Path $uidPath -ErrorAction Stop){
                            # REGISTER DEVICE
                            $data = @{vr='Visitor';cred='Customer';time=$time;cksid=$cksid;ckvid=$ckvid;cnid=$cnid;nek=$nek;nei=$nei;uid=$uid;pwd=$pwd}
                            $dataJson = $data|ConvertTo-Json
                            $saveUidAuth = Set-Content ("$uidPath"+'auth.json') -Value $dataJson -Force -ErrorAction Stop
                            $setVerify = Set-PSUCache -Key $ssid -Value $data -Integrated
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
else{
    '[{"r":"error"}]'
}
