

# encrypt - cipher
$text = 'abc'
$key = '123'
$textBytes = [Text.Encoding]::ASCII.GetBytes($text)
$keyBytes = [Text.Encoding]::ASCII.GetBytes($key)
write-host '--- start ---'
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
$encryptArray = $null
for ($i = 0; $i -lt $textBytes.Count; $i++) {
    [string]$charTextByte = [string]$textBytes[$i]
    [string]$mix = $charTextByte -bxor $charKeyByteXor 
    [array]$encryptArray += [System.BitConverter]::ToString($mix)
}

$encrypt = $encryptArray -join ''
$encrypt



# decrypt - decipher
$text = $encrypt
$key = '123'
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
$decryptString = $null
$encode = [System.Text.Encoding]::ASCII
foreach ($hex in $textToArray) {
    [string]$hexByte = [Convert]::FromHexString($hex)
    $hexByteXor = $hexByte -bxor $charKeyByteXor
    [string]$decryptString += $encode.GetString($hexByteXor)
}
$decryptString 




#----------------------------------------------------------#



# decrypt - decipher
$text = '515253'
$key = '123'
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
$decryptString = $null
$encode = [Text.Encoding]::ASCII
foreach ($hex in $textToArray) {
    [string]$hexByte = [Convert]::FromHexString($hex)
    $hexByteXor = $hexByte -bxor $charKeyByteXor
    $decryptString = $decryptString + [Text.Encoding]::ASCII.GetString($hexByteXor)
}
$decryptString 

$encode = [Text.Encoding]::ASCII
foreach ($hex in $array) {
    [string]$hexByte = [Convert]::FromHexString($hex)
    $hexByteXor = $hexByte -bxor $charKeyByteXor
    $decryptString = $decryptString + [Text.Encoding]::ASCII.GetString($hexByteXor)
}
$decryptString 


