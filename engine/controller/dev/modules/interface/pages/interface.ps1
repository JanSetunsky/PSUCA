$Session:RemoveFullBlockSC = {
    if($TypeCollection -eq 'ServerBlock'){
        $BlockData = $Cache:ServerBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
            elseif(Test-Path ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if(Test-Path ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
            elseif(Test-Path ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 1'}
    }
    elseif($TypeCollection -eq 'ComponentsBlock'){
        $BlockData = $Cache:ComponentsBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
            elseif(Test-Path ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if(Test-Path ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
            elseif(Test-Path ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 2'}
    }
    elseif($TypeCollection -eq 'PsucaControllerBlock'){
        $BlockData = $Cache:PsucaControllerBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
            elseif(Test-Path ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if(Test-Path ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
            elseif(Test-Path ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 3'}
    }
    elseif($TypeCollection -eq 'PsucaDashboardBlock'){
        $BlockData = $Cache:PsucaDashboardBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
            elseif(Test-Path ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if(Test-Path ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
            elseif(Test-Path ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 4'}
    }
    $BlockDataRecovery = @()
    $SearchItemNumber = $ItemNumber
    $ItemCount = 0
    foreach ($Item in $BlockData) {
        if($ItemCount -eq $SearchItemNumber){
            $BlockDataRecovery += $Item.clear
        }
        else{
            $BlockDataRecovery += $Item
        }
        $ItemCount++
    }
    if($null -ne $ErasePath -and $EraseType -eq 'erase-file' -and $EraseCondition -eq $true){
        $RemoveFile = Remove-Item -Path $ErasePath -Force
    }
    $BlockData = $BlockDataRecovery
    if($TypeCollection -eq 'ServerBlock'){
        $Cache:ServerBlockData = $BlockData
        $Session:InvokeServerBlockContent = $null
        Sync-UDElement -Id 'InterfaceServersBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfaceServersBlockDynamicId'
    }
    elseif($TypeCollection -eq 'ComponentsBlock'){
        $Cache:ComponentsBlockData = $BlockData
        $Session:InvokeComponentsContent = $null
        Sync-UDElement -Id 'InterfaceComponentsBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfaceComponentsBlockDynamicId'
    }
    elseif($TypeCollection -eq 'PsucaControllerBlock'){
        $Cache:PsucaControllerBlockData = $BlockData
        $Session:InvokePsucaControllerContent = $null
        Sync-UDElement -Id 'InterfacePsucaControllerBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfacePsucaControllerBlockDynamicId'
    }
    elseif($TypeCollection -eq 'PsucaDashboardBlock'){
        $Cache:PsucaDashboardBlockData = $BlockData
        $Session:InvokePsucaDashboardContent = $null
        Sync-UDElement -Id 'InterfacePsucaDashboardBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfacePsucaDashboardBlockDynamicId'
    }
    Hide-UDModal
}

$Session:RemoveTerminalBlockSC = {
    if($TypeCollection -eq 'ServerBlock'){
        $BlockData = $Cache:ServerBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if((Test-Path ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
            elseif((Test-Path ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 5'}
    }
    elseif($TypeCollection -eq 'ComponentsBlock'){
        $BlockData = $Cache:ComponentsBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if((Test-Path ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
            elseif((Test-Path ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 6'}
    }
    elseif($TypeCollection -eq 'PsucaControllerBlock'){
        $BlockData = $Cache:PsucaControllerBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if((Test-Path ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
            elseif((Test-Path ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 7'}
    }
    elseif($TypeCollection -eq 'PsucaDashboardBlock'){
        $BlockData = $Cache:PsucaDashboardBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if((Test-Path ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
            elseif((Test-Path ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 8'}
    }
    $BlockDataRecovery = @()
    $BlockDataSelections = @()
    $BlockDataSelectionsRecovery = @()
    $SearchItemNumber = $ItemNumber
    $ItemCount = 0
    foreach ($Item in $BlockData) {
        if($ItemCount -eq $SearchItemNumber){
            $BlockDataSelectionsRecovery = [PSCustomObject]@{
                ServiceProvider          = (($Item).Selections).ServiceProvider
                TerminalProvider         = 'null'
            }
            $BlockDataSelections = [PSCustomObject]@{
                Selections = $BlockDataSelectionsRecovery
            }
            $Item = $BlockDataSelections
            if($null -ne $ErasePath -and $EraseType -eq 'erase-file' -and $EraseCondition -eq $true){
                $RemoveFile = Remove-Item -Path $ErasePath -Force
            }
            elseif($null -ne $ErasePath -and $EraseType -eq 'overwrite-file' -and $EraseCondition -eq $true){
                $OverwriteFile = Set-Content -Path $ErasePath -Value ($BlockDataSelections|ConvertTo-Json -Depth 100) -Force
            }
        }
        else{
            $BlockDataSelectionsRecovery = [PSCustomObject]@{
                ServiceProvider          = (($Item).Selections).ServiceProvider
                TerminalProvider         = (($Item).Selections).TerminalProvider
            }
            $BlockDataSelections = [PSCustomObject]@{
                Selections = $BlockDataSelectionsRecovery
            }
            $Item = $BlockDataSelections
        }
        $BlockDataRecovery += $Item
        $ItemCount++
    }
    $BlockData = $BlockDataRecovery
    if($TypeCollection -eq 'ServerBlock'){
        $Cache:ServerBlockData = $BlockData
        $Session:InvokeServerBlockContent = $null
        Sync-UDElement -Id 'InterfaceServersBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfaceServersBlockDynamicId'
    }
    elseif($TypeCollection -eq 'ComponentsBlock'){
        $Cache:ComponentsBlockData = $BlockData
        $Session:InvokeComponentsContent = $null
        Sync-UDElement -Id 'InterfaceComponentsBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfaceComponentsBlockDynamicId'
    }
    elseif($TypeCollection -eq 'PsucaControllerBlock'){
        $Cache:PsucaControllerBlockData = $BlockData
        $Session:InvokePsucaControllerContent = $null
        Sync-UDElement -Id 'InterfacePsucaControllerBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfacePsucaControllerBlockDynamicId'
    }
    elseif($TypeCollection -eq 'PsucaDashboardBlock'){
        $Cache:PsucaDashboardBlockData = $BlockData
        $Session:InvokePsucaDashboardContent = $null
        Sync-UDElement -Id 'InterfacePsucaDashboardBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfacePsucaDashboardBlockDynamicId'
    }
    Hide-UDModal
}

$Session:RemoveServiceBlockSC = {
    if($TypeCollection -eq 'ServerBlock'){
        $BlockData = $Cache:ServerBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if((Test-Path ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
            elseif((Test-Path ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfaceServerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 9'}
    }
    elseif($TypeCollection -eq 'ComponentsBlock'){
        $BlockData = $Cache:ComponentsBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if((Test-Path ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
            elseif((Test-Path ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfaceComponentsBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 10'}
    }
    elseif($TypeCollection -eq 'PsucaControllerBlock'){
        $BlockData = $Cache:PsucaControllerBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if((Test-Path ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
            elseif((Test-Path ("$Cache:InterfacePsucaControllerBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 11'}
    }
    elseif($TypeCollection -eq 'PsucaDashboardBlock'){
        $BlockData = $Cache:PsucaDashboardBlockData
        $BlockDataPoint = 0
        if($null -ne ((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id -and (((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($null -ne ((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id -and (((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id).Length -gt 10){$BlockDataPoint++}
        if($BlockDataPoint -eq 1){
            if(Test-Path ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')){
                Show-UDToast -Message 'ERASE FILE'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'erase-file'
                $EraseCondition = $true
            }
        }
        elseif($BlockDataPoint -eq 2){
            if((Test-Path ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).ServiceProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
            elseif((Test-Path ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json'))){
                Show-UDToast -Message 'ERASE BLOCK'
                $ErasePath = ("$Cache:InterfacePsucaDashboardBlockDatabasePath"+(((($BlockData[$ItemNumber]).Selections).TerminalProvider).Id)+'.json')
                $EraseType = 'overwrite-file'
                $EraseCondition = $true
            }
        }
        else{Show-UDToast -Message 'ERASE ERROR 12'}
    }
    $BlockDataRecovery = @()
    $BlockDataSelectionsRecovery = @()
    $SearchItemNumber = $ItemNumber
    $ItemCount = 0
    foreach ($Item in $BlockData) {
        if($ItemCount -eq $SearchItemNumber){
            $BlockDataSelectionsRecovery = [PSCustomObject]@{
                ServiceProvider          = 'null'
                TerminalProvider         = (($Item).Selections).TerminalProvider
            }
            $BlockDataSelections = [PSCustomObject]@{
                Selections = $BlockDataSelectionsRecovery
            }
            $Item = $BlockDataSelections
            if($null -ne $ErasePath -and $EraseType -eq 'erase-file' -and $EraseCondition -eq $true){
                $RemoveFile = Remove-Item -Path $ErasePath -Force
            }
            elseif($null -ne $ErasePath -and $EraseType -eq 'overwrite-file' -and $EraseCondition -eq $true){
                $OverwriteFile = Set-Content -Path $ErasePath -Value ($BlockDataSelections|ConvertTo-Json -Depth 100) -Force
            }
        }
        else{
            $BlockDataSelectionsRecovery = [PSCustomObject]@{
                ServiceProvider          = (($Item).Selections).ServiceProvider
                TerminalProvider         = (($Item).Selections).TerminalProvider
            }
            $BlockDataSelections = [PSCustomObject]@{
                Selections = $BlockDataSelectionsRecovery
            }
            $Item = $BlockDataSelections
        }
        $Item
        $BlockDataRecovery += $Item
        $ItemCount++
    }
    $BlockData = $BlockDataRecovery
    if($TypeCollection -eq 'ServerBlock'){
        $Cache:ServerBlockData = $BlockData
        $Session:InvokeServerBlockContent = $null
        Sync-UDElement -Id 'InterfaceServersBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfaceServersBlockDynamicId'
    }
    elseif($TypeCollection -eq 'ComponentsBlock'){
        $Cache:ComponentsBlockData = $BlockData
        $Session:InvokeComponentsContent = $null
        Sync-UDElement -Id 'InterfaceComponentsBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfaceComponentsBlockDynamicId'
    }
    elseif($TypeCollection -eq 'PsucaControllerBlock'){
        $Cache:PsucaControllerBlockData = $BlockData
        $Session:InvokePsucaControllerContent = $null
        Sync-UDElement -Id 'InterfacePsucaControllerBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfacePsucaControllerBlockDynamicId'
    }
    elseif($TypeCollection -eq 'PsucaDashboardBlock'){
        $Cache:PsucaDashboardBlockData = $BlockData
        $Session:InvokePsucaDashboardContent = $null
        Sync-UDElement -Id 'InterfacePsucaDashboardBlockInvokeContentDynamicId'
        Sync-UDElement -Id 'InterfacePsucaDashboardBlockDynamicId'
    }
    Hide-UDModal
}

New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
    New-UDPaper -ClassName "interface-box-layout" -Square -Content {
        New-UDRow -Columns {
            New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDIcon -Icon 'Server' -Size '1x' -Border -ClassName 'interface-menu-box-logo'
                        }
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDTypography -Text 'Server list block' -ClassName 'interface-menu-box-title'
                            }
                        }
                    }
                }
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                        }
                    }
                }
                # INTERFACE SERVERS BLOCK
                $Session:InterfaceServerBlockSC = {
                    New-UDElement -Id 'InterfaceServersBlock' -Tag 'div' -Content {
                        # SERVER PROVIDER
                        New-UDGrid -ClassName 'interface-box-grid-fixed-left' -Container -Content {
                            New-UDGrid -Item -Content {
                                New-UDPaper -ClassName "interface-box-layout-plus" -Square -Content {
                                    New-UDRow -Columns {
                                        New-UDLink -ClassName 'interface-box-logo-plus-link' -Children {
                                            New-UDElement -Id 'InterFaceBoxLogoPlusId' -Tag 'div' -Content {
                                                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                    New-UDIcon -Icon 'Plus' -Size '1x' -ClassName 'interface-box-logo-plus'
                                                }
                                            }
                                        } -OnClick {
                                            Show-UDModal -Header {
                                                New-UDTypography -Text 'Interface - Add Server'
                                            } -Content {
                                                New-UDButton -Text 'Create Server Block' -OnClick {
                                                    Invoke-UDRedirect -Url '/interface/newserverblockitem'
                                                    Hide-UDModal
                                                } -ClassName "interface-box-btn"
                                            }
                                        }
                                    }                 
                                } -Elevation 1
                            }
                            $BlockData = ($Cache:ServerBlockData)
                            
                            if(($BlockData).Count -gt 0){
                                $ItemCounter    = 0
                                $Collection     = $null
                                $Collection     = ($BlockData)
                                $TypeCollection = 'ServerBlock'
                                foreach ($Item in $collection) {
                                    
                    
                                    if($null -eq $Item -or ((($null -eq (($Item.Selections).ServiceProvider)) -or ((($Item.Selections).ServiceProvider) -eq 'null')) -and (($null -eq (($Item.Selections).TerminalProvider)) -or ((($Item.Selections).TerminalProvider) -eq 'null')))){}
                                    else{
                                        $Item = ($Item.Selections)
                                        if((($Item).TerminalProvider -eq 'null' -or $null -eq ($Item).TerminalProvider) -and (($Item).ServiceProvider -ne 'null' -or $null -ne ($Item).ServiceProvider)){
                                            # SERVICE
                                            $ServiceStatus            = (($Item.ServiceProvider).Items).StatusVariable
                                            $ServiceId                = ($Item.ServiceProvider).Id
                                            $ServiceName              = ($Item.ServiceProvider).Name
                                            $ServiceButtonsCollection = (($Item.ServiceProvider).Items).Buttons

                                            # SERVICE
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            if($ServiceStatus -like '*$*'){
                                                                if(($ServiceStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($ServiceStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveServiceBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($ServiceButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $ServiceButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='ServiceProvider';Path='ServerBlock';Id=$ServiceId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    Show-UDToast -Message $ItemNumber
                                                                                                    $Session:ButtonCounter          = $ButtonNum
                                                                                                    $Session:ButtonDataSet          = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                        elseif((($Item).ServiceProvider -eq 'null' -or $null -eq ($Item).ServiceProvider) -and (($Item).TerminalProvider -ne 'null' -or $null -ne ($Item).TerminalProvider)){
                                            # TERMINAL
                                            $TerminalStatus            = (($Item.TerminalProvider).Items).StatusVariable
                                            $TerminalId                = ($Item.TerminalProvider).Id
                                            $TerminalName              = ($Item.TerminalProvider).Name
                                            $TerminalButtonsCollection = (($Item.TerminalProvider).Items).Buttons
                            
                                            # TERMINAL
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            if($TerminalStatus -like '*$*'){
                                                                if(($TerminalStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($TerminalStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveTerminalBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($TerminalButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $TerminalButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='TerminalProvider';Path='ServerBlock';Id=$TerminalId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                        elseif((($Item).TerminalProvider -ne 'null' -or $null -ne ($Item).TerminalProvider) -and (($Item).ServiceProvider -ne 'null' -or $null -ne ($Item).ServiceProvider)){
                                            # TERMINAL
                                            $TerminalStatus            = (($Item.TerminalProvider).Items).StatusVariable
                                            $TerminalId                = ($Item.TerminalProvider).Id
                                            $TerminalName              = ($Item.TerminalProvider).Name
                                            $TerminalButtonsCollection = ((($Item.TerminalProvider).Items)).Buttons
                        
                                            # SERVICE
                                            $ServiceStatus             = (($Item.ServiceProvider).Items).StatusVariable
                                            $ServiceId                 = ($Item.ServiceProvider).Id
                                            $ServiceName               = ($Item.ServiceProvider).Name
                                            $ServiceButtonsCollection  = (($Item.ServiceProvider).Items).Buttons
                                            
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            # TERMINAL
                                                            if($TerminalStatus -like '*$*'){
                                                                if(($TerminalStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($TerminalStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveTerminalBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($TerminalButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $TerminalButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='TerminalProvider';Path='ServerBlock';Id=$TerminalId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                        
                                                            # SERVICE
                                                            if($ServiceStatus -like '*$*'){
                                                                if(($ServiceStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($ServiceStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveServiceBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($ServiceButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $ServiceButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='ServiceProvider';Path='ServerBlock';Id=$ServiceId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                    $ItemCounter++
                    
                                }
                            }
                        
                        } -Spacing 1
                        New-UDCardBody -ClassName 'BlockBoxPadding' -Content {}
                    }
                }
                New-UDDynamic -Id 'InterfaceServersBlockDynamicId' -Content {
                    $Session:InvokeServerBlockContent = $Session:InterfaceServerBlockSC|iex
                    New-UDDynamic -Id 'InterfaceServersBlockInvokeContentDynamicId' -Content {
                        $Session:InvokeServerBlockContent
                    }
                }
            }
        }
    }
}


New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
    New-UDPaper -ClassName "interface-box-layout" -Square -Content {
        New-UDRow -Columns {
            New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDIcon -Icon 'LayerGroup' -Size '1x' -Border -ClassName 'interface-menu-box-logo'
                        }
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDTypography -Text 'Components list block' -ClassName 'interface-menu-box-title'
                            }
                        }
                    }
                }
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                        }
                    }
                }                
                # INTERFACE COMPONENTS BLOCK
                $Session:InterfaceComponentBlockSC = {
                    New-UDElement -Id 'InterfaceComponentsBlock' -Tag 'div' -Content {
                        # SERVER PROVIDER
                        New-UDGrid -ClassName 'interface-box-grid-fixed-left' -Container -Content {
                            New-UDGrid -Item -Content {
                                New-UDPaper -ClassName "interface-box-layout-plus" -Square -Content {
                                    New-UDRow -Columns {
                                        New-UDLink -ClassName 'interface-box-logo-plus-link' -Children {
                                            New-UDElement -Id 'InterFaceBoxLogoPlusId' -Tag 'div' -Content {
                                                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                    New-UDIcon -Icon 'Plus' -Size '1x' -ClassName 'interface-box-logo-plus'
                                                }
                                            }
                                        } -OnClick {
                                            Show-UDModal -Header {
                                                New-UDTypography -Text 'Interface - Add Component'
                                            } -Content {
                                                New-UDButton -Text 'Create Component Block' -OnClick {
                                                    Invoke-UDRedirect -Url '/interface/newcomponentsblockitem'
                                                    Hide-UDModal
                                                } -ClassName "interface-box-btn"
                                            }
                                        }
                                    }                 
                                } -Elevation 1
                            }
                            $BlockData = ($Cache:ComponentsBlockData)
                        
                            if(($BlockData).Count -gt 0){
                                $ItemCounter    = 0
                                $Collection     = $null
                                $Collection     = ($BlockData)
                                $TypeCollection = 'ComponentsBlock'
                                foreach ($Item in $collection) {
                                    
                    
                                    if($null -eq $Item -or ((($null -eq (($Item.Selections).ServiceProvider)) -or ((($Item.Selections).ServiceProvider) -eq 'null')) -and (($null -eq (($Item.Selections).TerminalProvider)) -or ((($Item.Selections).TerminalProvider) -eq 'null')))){}
                                    else{
                                        $Item = ($Item.Selections)
                                        if((($Item).TerminalProvider -eq 'null' -or $null -eq ($Item).TerminalProvider) -and (($Item).ServiceProvider -ne 'null' -or $null -ne ($Item).ServiceProvider)){
                                            # SERVICE
                                            $ServiceStatus            = (($Item.ServiceProvider).Items).StatusVariable
                                            $ServiceId                = ($Item.ServiceProvider).Id
                                            $ServiceName              = ($Item.ServiceProvider).Name
                                            $ServiceButtonsCollection = (($Item.ServiceProvider).Items).Buttons

                                            # SERVICE
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            if($ServiceStatus -like '*$*'){
                                                                if(($ServiceStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($ServiceStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveServiceBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($ServiceButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $ServiceButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='ServiceProvider';Path='ComponentsBlock';Id=$ServiceId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                        elseif((($Item).ServiceProvider -eq 'null' -or $null -eq ($Item).ServiceProvider) -and (($Item).TerminalProvider -ne 'null' -or $null -ne ($Item).TerminalProvider)){
                                            # TERMINAL
                                            $TerminalStatus            = (($Item.TerminalProvider).Items).StatusVariable
                                            $TerminalId                = ($Item.TerminalProvider).Id
                                            $TerminalName              = ($Item.TerminalProvider).Name
                                            $TerminalButtonsCollection = (($Item.TerminalProvider).Items).Buttons
                            
                                            # TERMINAL
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            if($TerminalStatus -like '*$*'){
                                                                if(($TerminalStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($TerminalStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveTerminalBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($TerminalButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $TerminalButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='TerminalProvider';Path='ComponentsBlock';Id=$TerminalId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                        elseif((($Item).TerminalProvider -ne 'null' -or $null -ne ($Item).TerminalProvider) -and (($Item).ServiceProvider -ne 'null' -or $null -ne ($Item).ServiceProvider)){
                                            # TERMINAL
                                            $TerminalStatus            = (($Item.TerminalProvider).Items).StatusVariable
                                            $TerminalId                = ($Item.TerminalProvider).Id
                                            $TerminalName              = ($Item.TerminalProvider).Name
                                            $TerminalButtonsCollection = ((($Item.TerminalProvider).Items)).Buttons
                        
                                            # SERVICE
                                            $ServiceStatus             = (($Item.ServiceProvider).Items).StatusVariable
                                            $ServiceId                 = ($Item.ServiceProvider).Id
                                            $ServiceName               = ($Item.ServiceProvider).Name
                                            $ServiceButtonsCollection  = (($Item.ServiceProvider).Items).Buttons
                                            
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            # TERMINAL
                                                            if($TerminalStatus -like '*$*'){
                                                                if(($TerminalStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($TerminalStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveTerminalBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($TerminalButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $TerminalButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='TerminalProvider';Path='ComponentsBlock';Id=$TerminalId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                        
                                                            # SERVICE
                                                            if($ServiceStatus -like '*$*'){
                                                                if(($ServiceStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($ServiceStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveServiceBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($ServiceButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $ServiceButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='ServiceProvider';Path='ComponentsBlock';Id=$ServiceId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                    $ItemCounter++
                    
                                }
                            }
                        
                        } -Spacing 1
                        New-UDCardBody -ClassName 'BlockBoxPadding' -Content {}
                    }
                }
                New-UDDynamic -Id 'InterfaceComponentsBlockDynamicId' -Content {
                    $Session:InvokeComponentsContent = $Session:InterfaceComponentBlockSC|iex
                    New-UDDynamic -Id 'InterfaceComponentsBlockInvokeContentDynamicId' -Content {
                        $Session:InvokeComponentsContent
                    }
                }
            }
        }
    }
}


New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
    New-UDPaper -ClassName "interface-box-layout" -Square -Content {
        New-UDRow -Columns {
            New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDIcon -Icon 'ShareAlt' -Size '1x' -Border -ClassName 'interface-menu-box-logo'
                        }
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDTypography -Text 'Controller list block' -ClassName 'interface-menu-box-title'
                            }
                        }
                    }
                }
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                        }
                    }
                }      
                # INTERFACE PSUCA CONTROLLER BLOCK
                $Session:InterfacePsucaControllerBlockSC = {
                    New-UDElement -Id 'InterfacePsucaControllerBlock' -Tag 'div' -Content {
                        # SERVER PROVIDER
                        New-UDGrid -ClassName 'interface-box-grid-fixed-left' -Container -Content {
                            New-UDGrid -Item -Content {
                                New-UDPaper -ClassName "interface-box-layout-plus" -Square -Content {
                                    New-UDRow -Columns {
                                        New-UDLink -ClassName 'interface-box-logo-plus-link' -Children {
                                            New-UDElement -Id 'InterFaceBoxLogoPlusId' -Tag 'div' -Content {
                                                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                    New-UDIcon -Icon 'Plus' -Size '1x' -ClassName 'interface-box-logo-plus'
                                                }
                                            }
                                        } -OnClick {
                                            Show-UDModal -Header {
                                                New-UDTypography -Text 'Interface - Add Psuca Controller'
                                            } -Content {
                                                New-UDButton -Text 'Create Psuca Controller Block' -OnClick {
                                                    Invoke-UDRedirect -Url '/interface/newpsucacontrollerblockitem'
                                                    Hide-UDModal
                                                } -ClassName "interface-box-btn"
                                            }
                                        }
                                    }                 
                                } -Elevation 1
                            }
                            $BlockData = ($Cache:PsucaControllerBlockData)
                        
                            if(($BlockData).Count -gt 0){
                                $ItemCounter    = 0
                                $Collection     = $null
                                $Collection     = ($BlockData)
                                $TypeCollection = 'PsucaControllerBlock'
                                foreach ($Item in $collection) {
                                    
                    
                                    if($null -eq $Item -or ((($null -eq (($Item.Selections).ServiceProvider)) -or ((($Item.Selections).ServiceProvider) -eq 'null')) -and (($null -eq (($Item.Selections).TerminalProvider)) -or ((($Item.Selections).TerminalProvider) -eq 'null')))){}
                                    else{
                                        $Item = ($Item.Selections)
                                        if((($Item).TerminalProvider -eq 'null' -or $null -eq ($Item).TerminalProvider) -and (($Item).ServiceProvider -ne 'null' -or $null -ne ($Item).ServiceProvider)){
                                            # SERVICE
                                            $ServiceStatus            = (($Item.ServiceProvider).Items).StatusVariable
                                            $ServiceId                = ($Item.ServiceProvider).Id
                                            $ServiceName              = ($Item.ServiceProvider).Name
                                            $ServiceButtonsCollection = (($Item.ServiceProvider).Items).Buttons

                                            # SERVICE
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            if($ServiceStatus -like '*$*'){
                                                                if(($ServiceStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($ServiceStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveServiceBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($ServiceButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $ServiceButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='ServiceProvider';Path='PsucaControllerBlock';Id=$ServiceId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                        elseif((($Item).ServiceProvider -eq 'null' -or $null -eq ($Item).ServiceProvider) -and (($Item).TerminalProvider -ne 'null' -or $null -ne ($Item).TerminalProvider)){
                                            # TERMINAL
                                            $TerminalStatus            = (($Item.TerminalProvider).Items).StatusVariable
                                            $TerminalId                = ($Item.TerminalProvider).Id
                                            $TerminalName              = ($Item.TerminalProvider).Name
                                            $TerminalButtonsCollection = (($Item.TerminalProvider).Items).Buttons
                            
                                            # TERMINAL
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            if($TerminalStatus -like '*$*'){
                                                                if(($TerminalStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($TerminalStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveTerminalBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($TerminalButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $TerminalButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='TerminalProvider';Path='PsucaControllerBlock';Id=$TerminalId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                        elseif((($Item).TerminalProvider -ne 'null' -or $null -ne ($Item).TerminalProvider) -and (($Item).ServiceProvider -ne 'null' -or $null -ne ($Item).ServiceProvider)){
                                            # TERMINAL
                                            $TerminalStatus            = (($Item.TerminalProvider).Items).StatusVariable
                                            $TerminalId                = ($Item.TerminalProvider).Id
                                            $TerminalName              = ($Item.TerminalProvider).Name
                                            $TerminalButtonsCollection = ((($Item.TerminalProvider).Items)).Buttons
                        
                                            # SERVICE
                                            $ServiceStatus             = (($Item.ServiceProvider).Items).StatusVariable
                                            $ServiceId                 = ($Item.ServiceProvider).Id
                                            $ServiceName               = ($Item.ServiceProvider).Name
                                            $ServiceButtonsCollection  = (($Item.ServiceProvider).Items).Buttons
                                            
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            # TERMINAL
                                                            if($TerminalStatus -like '*$*'){
                                                                if(($TerminalStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($TerminalStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveTerminalBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($TerminalButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $TerminalButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='TerminalProvider';Path='PsucaControllerBlock';Id=$TerminalId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                        
                                                            # SERVICE
                                                            if($ServiceStatus -like '*$*'){
                                                                if(($ServiceStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($ServiceStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveServiceBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($ServiceButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $ServiceButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='ServiceProvider';Path='PsucaControllerBlock';Id=$ServiceId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                    $ItemCounter++
                    
                                }
                            }
                        
                        } -Spacing 1
                        New-UDCardBody -ClassName 'BlockBoxPadding' -Content {}
                    }
                }
                New-UDDynamic -Id 'InterfacePsucaControllerBlockDynamicId' -Content {
                    $Session:InvokePsucaControllerContent = $Session:InterfacePsucaControllerBlockSC|iex
                    New-UDDynamic -Id 'InterfacePsucaControllerBlockInvokeContentDynamicId' -Content {
                        $Session:InvokePsucaControllerContent
                    }
                }
            }
        }
    }
}


New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
    New-UDPaper -ClassName "interface-box-layout" -Square -Content {
        New-UDRow -Columns {
            New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                            New-UDIcon -Icon 'Desktop' -Size '1x' -Border -ClassName 'interface-menu-box-logo'
                        }
                        New-UDElement -Tag 'td' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDTypography -Text 'Dashboard list block' -ClassName 'interface-menu-box-title'
                            }
                        }
                    }
                }
                New-UDElement -Tag 'table' -Content {
                    New-UDElement -Tag 'tr' -Content {
                        New-UDElement -Tag 'td' -Content {
                        }
                    }
                }      
                # INTERFACE PSUCA DASHBOARD BLOCK
                $Session:InterfacePsucaDashboardBlockSC = {
                    New-UDElement -Id 'InterfacePsucaDashboardBlock' -Tag 'div' -Content {
                        # SERVER PROVIDER
                        New-UDGrid -ClassName 'interface-box-grid-fixed-left' -Container -Content {
                            New-UDGrid -Item -Content {
                                New-UDPaper -ClassName "interface-box-layout-plus" -Square -Content {
                                    New-UDRow -Columns {
                                        New-UDLink -ClassName 'interface-box-logo-plus-link' -Children {
                                            New-UDElement -Id 'InterFaceBoxLogoPlusId' -Tag 'div' -Content {
                                                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                    New-UDIcon -Icon 'Plus' -Size '1x' -ClassName 'interface-box-logo-plus'
                                                }
                                            }
                                        } -OnClick {
                                            Show-UDModal -Header {
                                                New-UDTypography -Text 'Interface - Add Psuca Dashboard'
                                            } -Content {
                                                New-UDButton -Text 'Create Psuca Dashboard Block' -OnClick {
                                                    Invoke-UDRedirect -Url '/interface/newpsucadashboardblockitem'
                                                    Hide-UDModal
                                                } -ClassName "interface-box-btn"
                                            }
                                        }
                                    }                 
                                } -Elevation 1
                            }
                            $BlockData = ($Cache:PsucaDashboardBlockData)
                        
                            if(($BlockData).Count -gt 0){
                                $ItemCounter    = 0
                                $Collection     = $null
                                $Collection     = ($BlockData)
                                $TypeCollection = 'PsucaDashboardBlock'
                                foreach ($Item in $collection) {
                                    
                    
                                    if($null -eq $Item -or ((($null -eq (($Item.Selections).ServiceProvider)) -or ((($Item.Selections).ServiceProvider) -eq 'null')) -and (($null -eq (($Item.Selections).TerminalProvider)) -or ((($Item.Selections).TerminalProvider) -eq 'null')))){}
                                    else{
                                        $Item = ($Item.Selections)
                                        if((($Item).TerminalProvider -eq 'null' -or $null -eq ($Item).TerminalProvider) -and (($Item).ServiceProvider -ne 'null' -or $null -ne ($Item).ServiceProvider)){
                                            # SERVICE
                                            $ServiceStatus            = (($Item.ServiceProvider).Items).StatusVariable
                                            $ServiceId                = ($Item.ServiceProvider).Id
                                            $ServiceName              = ($Item.ServiceProvider).Name
                                            $ServiceButtonsCollection = (($Item.ServiceProvider).Items).Buttons

                                            # SERVICE
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            if($ServiceStatus -like '*$*'){
                                                                if(($ServiceStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($ServiceStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveServiceBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($ServiceButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $ServiceButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='ServiceProvider';Path='PsucaDashboardBlock';Id=$ServiceId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                        elseif((($Item).ServiceProvider -eq 'null' -or $null -eq ($Item).ServiceProvider) -and (($Item).TerminalProvider -ne 'null' -or $null -ne ($Item).TerminalProvider)){
                                            # TERMINAL
                                            $TerminalStatus            = (($Item.TerminalProvider).Items).StatusVariable
                                            $TerminalId                = ($Item.TerminalProvider).Id
                                            $TerminalName              = ($Item.TerminalProvider).Name
                                            $TerminalButtonsCollection = (($Item.TerminalProvider).Items).Buttons
                            
                                            # TERMINAL
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            if($TerminalStatus -like '*$*'){
                                                                if(($TerminalStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($TerminalStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveTerminalBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($TerminalButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $TerminalButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='TerminalProvider';Path='PsucaDashboardBlock';Id=$TerminalId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                        elseif((($Item).TerminalProvider -ne 'null' -or $null -ne ($Item).TerminalProvider) -and (($Item).ServiceProvider -ne 'null' -or $null -ne ($Item).ServiceProvider)){
                                            # TERMINAL
                                            $TerminalStatus            = (($Item.TerminalProvider).Items).StatusVariable
                                            $TerminalId                = ($Item.TerminalProvider).Id
                                            $TerminalName              = ($Item.TerminalProvider).Name
                                            $TerminalButtonsCollection = ((($Item.TerminalProvider).Items)).Buttons
                        
                                            # SERVICE
                                            $ServiceStatus             = (($Item.ServiceProvider).Items).StatusVariable
                                            $ServiceId                 = ($Item.ServiceProvider).Id
                                            $ServiceName               = ($Item.ServiceProvider).Name
                                            $ServiceButtonsCollection  = (($Item.ServiceProvider).Items).Buttons
                                            
                                            New-UDGrid -Item -Content {
                                                New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                                                    New-UDRow -Columns {
                                                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                            # TERMINAL
                                                            if($TerminalStatus -like '*$*'){
                                                                if(($TerminalStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($TerminalStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($TerminalStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveTerminalBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $TerminalId     = $TerminalId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Terminal: '+"$TerminalName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Terminal: '+"$TerminalName") -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveTerminalBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $TerminalId     = $TerminalId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $TerminalName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($TerminalButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $TerminalButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='TerminalProvider';Path='PsucaDashboardBlock';Id=$TerminalId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                        
                                                            # SERVICE
                                                            if($ServiceStatus -like '*$*'){
                                                                if(($ServiceStatus|iex) -eq 'online'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                                                                }
                                                                elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                                                                }
                                                                else{
                                                                    New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                }
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            if(($ServiceStatus|iex) -eq 'online'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            elseif(($ServiceStatus|iex) -eq 'offline'){
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                            else{
                                                                                New-UDLink -Children {
                                                                                    New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                } -OnClick {
                                                                                    $ItemNumber = $ItemCounter
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                    } -Content {
                                                                                        New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveServiceBlockSC|iex
                                                                                        } -ClassName "interface-box-btn"
                                                                                        New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                            $ServiceId      = $ServiceId
                                                                                            $TypeCollection = $TypeCollection
                                                                                            $ItemNumber     = $ItemNumber
                                                                                            $Session:RemoveFullBlockSC|iex
                                                                                        } -ClassName "interface-box-btn" 
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                                                                New-UDElement -Tag 'table' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDLink -Children {
                                                                                New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                            } -OnClick {
                                                                                $ItemNumber = $ItemCounter
                                                                                Show-UDModal -Header {
                                                                                    New-UDTypography -Text ('Service: '+"$ServiceName") -ClassName 'interface-box-title'
                                                                                } -Content {
                                                                                    New-UDButton -Text ('Remove '+'Service: '+"$ServiceName") -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveServiceBlockSC|iex
                                                                                    } -ClassName "interface-box-btn"
                                                                                    New-UDButton -Text ('Remove Full block') -OnClick {
                                                                                        $ServiceId      = $ServiceId
                                                                                        $TypeCollection = $TypeCollection
                                                                                        $ItemNumber     = $ItemNumber
                                                                                        $Session:RemoveFullBlockSC|iex
                                                                                    } -ClassName "interface-box-btn" 
                                                                                }
                                                                            }
                                                                        }
                                                                        New-UDElement -Tag 'td' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDTypography -Text $ServiceName -ClassName 'interface-box-title'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                            
                                                            }
                                                            New-UDElement -Tag 'div' -Content {
                                                                New-UDStyle -Content {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            if($ServiceButtonsCollection.Count -gt 0){
                                                                                $ButtonNum = 0
                                                                                foreach ($ButtonItem in $ServiceButtonsCollection) {
                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                        New-UDLink -Children {
                                                                                            New-UDIcon -Icon $ButtonItem.Icon -Size '1x' -Border -ClassName 'interface-box-logo'
                                                                                        } -OnClick {
                                                                                            $ItemNumber = $ItemCounter
                                                                                            $Session:BlockId = @{Provider='ServiceProvider';Path='PsucaDashboardBlock';Id=$ServiceId}
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text $ButtonItem.Title -Variant subtitle1
                                                                                            } -Content {
                                                                                                if($null -ne $ButtonItem.Content){
                                                                                                    $Session:ButtonCounter = $ButtonNum
                                                                                                    $Session:ButtonDataSet = $ButtonItem.DataSet | ConvertTo-Json -Depth 100
                                                                                                    $Session:ButtonDataSetCondition = $ButtonItem.DataSet
                                                                                                    ($ButtonItem.Content)[0] | iex
                                                                                                }
                                                                                            } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                                                                        }
                                                                                    }
                                                                                    $ButtonNum++
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
                                    $ItemCounter++
                    
                                }
                            }
                        
                        } -Spacing 1
                        New-UDCardBody -ClassName 'BlockBoxPadding' -Content {}
                    }
                }
                New-UDDynamic -Id 'InterfacePsucaDashboardBlockDynamicId' -Content {
                    $Session:InvokePsucaDashboardContent = $Session:InterfacePsucaDashboardBlockSC|iex
                    New-UDDynamic -Id 'InterfacePsucaDashboardBlockInvokeContentDynamicId' -Content {
                        $Session:InvokePsucaDashboardContent
                    }
                }
            }
        }
    }
}



<#


New-UDElement -Id 'InterfaceServersBlock' -Tag 'div' -Content {
    # SERVER PROVIDER
    New-UDGrid -ClassName 'interface-box-grid-fixed-left' -Container -Content {
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout-plus" -Square -Content {
                New-UDRow -Columns {
                    New-UDLink -ClassName 'interface-box-logo-plus-link' -Children {
                        New-UDElement -Id 'InterFaceBoxLogoPlusId' -Tag 'div' -Content {
                            New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                New-UDIcon -Icon 'Plus' -Size '1x' -ClassName 'interface-box-logo-plus'
                            }
                        }
                    } -OnClick {
                        Show-UDModal -Header {
                            New-UDTypography -Text ''
                        } -Content {}
                    }
                }                 
            } -Elevation 1
        }
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        if($Cache:MainServerStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:MainServerStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:MainServerStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:MainServerStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Server' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Server - Server Power' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }                                            
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Desktop' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Server - Server Desktop' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Folder' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Server - Server Repository' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'CodeBranch' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Server - Server Mutual Ties' -Variant subtitle1
                                                } -Content {
                                                    New-UDElement -Tag 'table' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDButton -Text "Mutual Ties" -OnClick { Hide-UDModal } -ClassName "interface-box-btn interface-box-btn-fix-width"
                                                            }
                                                        }
                                                    }
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Server - Server configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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
    
    } -Spacing 1
    New-UDCardBody -ClassName 'BlockBoxPadding' -Content {}
}

New-UDElement -Id 'InterfaceComponentsBlock' -Tag 'div' -Content {    
    # SERVERS
    New-UDGrid -ClassName 'interface-box-grid-fixed-left' -Container -Content {
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout-plus" -Square -Content {
                New-UDRow -Columns {
                    New-UDLink -ClassName 'interface-box-logo-plus-link' -Children {
                        New-UDElement -Id 'InterFaceBoxLogoPlusId' -Tag 'div' -Content {
                            New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                New-UDIcon -Icon 'Plus' -Size '1x' -ClassName 'interface-box-logo-plus'
                            }
                        }
                    }
                }                 
            } -Elevation 1
        }
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        if($Cache:PsuMainServerStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsuMainServerStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsuMainServerStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsuMainServerStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'PSU' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psu - Power' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Desktop' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psu - Dashboard' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "New Tab" -OnClick { Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+"admin/") -OpenInNewWindow ;Hide-UDModal } -ClassName "interface-box-btn"
                                                    New-UDButton -Text "Open here" -OnClick { Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+"admin/") } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'CodeBranch' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psu - Mutual Ties' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psu - Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        if($Cache:SqlServerStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:SqlServerStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:SqlServerStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:SqlServerStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'SQL' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'SQL - Power' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Database' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'SQL - Database' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'CodeBranch' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'SQL - Mutual Ties' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'SQL - Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        if($Cache:StorageServerStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:StorageServerStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:StorageServerStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:StorageServerStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'STORAGE' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Storage - Power' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Folder' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Storage - Data' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'CodeBranch' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Storage - Mutual Ties' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Storage - Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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

    } -Spacing 1
    New-UDCardBody -ClassName 'BlockBoxPadding' -Content {}
}

New-UDElement -Id 'InterfacePsucaControllerBlock' -Tag 'div' -Content {
    # PSUCA CONTROLLER
    New-UDGrid -ClassName 'interface-box-grid-fixed-left' -Container -Content {
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout-plus" -Square -Content {
                New-UDRow -Columns {
                    New-UDLink -ClassName 'interface-box-logo-plus-link' -Children {
                        New-UDElement -Id 'InterFaceBoxLogoPlusId' -Tag 'div' -Content {
                            New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                New-UDIcon -Icon 'Plus' -Size '1x' -ClassName 'interface-box-logo-plus'
                            }
                        }
                    }
                }                 
            } -Elevation 1
        }
        # PSUCA MAIN TERMINAL
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        if($Cache:PsucaMainTerminalStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsucaMainTerminalStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsucaMainTerminalStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsucaMainTerminalStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'PSUCA' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Main Power' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Main Tasks' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'CodeBranch' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Main Mutual Ties' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Main Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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

        # PSUCA ENTITY CENTER
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        if($Cache:PsucaEntityTerminalStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsucaEntityTerminalStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsucaEntityTerminalStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsucaEntityTerminalStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Entity' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Entity Center Power' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'List' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Entity Center List' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "Group List" -OnClick {
                                                        Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+'app/'+"$Cache:RootControllerType"+'/entitygrouplist')
                                                    } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'CodeBranch' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Entity Center Mutual Ties' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "List Of Relationships" -OnClick {
                                                        Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+'app/'+"$Cache:RootControllerType"+'/entitygrouplist')
                                                    } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Entity Center configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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

    } -Spacing 1
    New-UDCardBody -ClassName 'BlockBoxPadding' -Content {}
}

New-UDElement -Id 'InterfacePsucaDashboardsBlock' -Tag 'div' -Content {
    
    $Cache:PsucaDevTerminalStatus = 'online'
    $Cache:PsucaDevDashboardStatus = 'online'
    # PSUCA CONTROLLER DASHBOARDS
    New-UDGrid -ClassName 'interface-box-grid-fixed-left' -Container -Content {
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout-plus" -Square -Content {
                New-UDRow -Columns {
                    New-UDLink -ClassName 'interface-box-logo-plus-link' -Children {
                        New-UDElement -Id 'InterFaceBoxLogoPlusId' -Tag 'div' -Content {
                            New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                New-UDIcon -Icon 'Plus' -Size '1x' -ClassName 'interface-box-logo-plus'
                            }
                        }
                    }
                }                 
            } -Elevation 1
        }
        # PSUCA DEV
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        if($Cache:PsucaDevTerminalStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsucaDevTerminalStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsucaDevTerminalStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsucaDevTerminalStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Terminal' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Dev Terminal Power' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Database' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Dev Terminal Database' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }                                        
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Dev Terminal Tasks' -Variant subtitle1
                                                } -Content {
                                                    New-UDElement -Tag 'table' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDButton -Text "Create new task group" -OnClick { Hide-UDModal } -ClassName "interface-box-btn interface-box-btn-fix-width"
                                                            }
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDButton -Text "Get task group" -OnClick { Hide-UDModal } -ClassName "interface-box-btn interface-box-btn-fix-width"            
                                                            }
                                                        }
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDButton -Text "Create new task type" -OnClick { Hide-UDModal } -ClassName "interface-box-btn interface-box-btn-fix-width"            
                                                            }
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDButton -Text "Get task type" -OnClick { Hide-UDModal } -ClassName "interface-box-btn interface-box-btn-fix-width"            
                                                            }
                                                        }
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDButton -Text "Create new task" -OnClick { Hide-UDModal } -ClassName "interface-box-btn interface-box-btn-fix-width"
                                                            }
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDButton -Text "Task center" -OnClick { Hide-UDModal } -ClassName "interface-box-btn interface-box-btn-fix-width"
                                                            }
                                                        }
                                                    }
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'CodeBranch' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Dev Terminal Mutual Ties' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Dev Terminal Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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
                        if($Cache:PsucaDevDashboardStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsucaDevDashboardStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsucaDevDashboardStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsucaDevDashboardStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Dev' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Dev Dashboard Power' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "Stop Dashobard" -OnClick {
                                                        $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq 'psucaDev'
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
                                                        $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq 'psucaDev'
                                                        if($Dashboard.Status -eq 'Stopped'){
                                                            $Dashboard | Start-PSUDashBoard
                                                            Show-UDToast -Message 'Dashboard is started'
                                                        }
                                                        elseif($Dashboard.Status -eq 'Started'){
                                                            Show-UDToast -Message 'Dashboard is started, cannot be started'
                                                        }
                                                        Hide-UDModal
                                                    } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }  
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Desktop' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Dev Dashboard' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "New Tab" -OnClick { Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+"app/dev/interface") -OpenInNewWindow ;Hide-UDModal } -ClassName "interface-box-btn"
                                                    New-UDButton -Text "Open here" -OnClick { Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+"app/dev/interface") } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Users' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Dev Account Management' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }          
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cube' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Dev Addons and Modules' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Dev Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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

        # PSUCA ADMIN
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        if($Cache:PsucaAdminTerminalStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsucaAdminTerminalStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsucaAdminTerminalStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsucaAdminTerminalStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Terminal' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Admin Terminal Power' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }  
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Database' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Admin Terminal Database' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Admin Terminal Tasks' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'CodeBranch' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Admin Terminal Mutual Ties' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Admin Terminal Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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
                        if($Cache:PsucaAdminDashboardStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsucaAdminDashboardStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsucaAdminDashboardStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsucaAdminDashboardStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Admin' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Admin Dashboard Power' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "Stop Dashobard" -OnClick {
                                                        $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq 'psucaAdmin'
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
                                                        $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq 'psucaAdmin'
                                                        if($Dashboard.Status -eq 'Stopped'){
                                                            $Dashboard | Start-PSUDashBoard
                                                            Show-UDToast -Message 'Dashboard is started'
                                                        }
                                                        elseif($Dashboard.Status -eq 'Started'){
                                                            Show-UDToast -Message 'Dashboard is started, cannot be started'
                                                        }
                                                        Hide-UDModal
                                                    } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }  
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Desktop' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Admin Dashboard' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "New Tab" -OnClick { Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+"app/admin/") -OpenInNewWindow ;Hide-UDModal } -ClassName "interface-box-btn"
                                                    New-UDButton -Text "Open here" -OnClick { Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+"app/admin/") } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Users' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Admin Account Management' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }          
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cube' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Admin Addons and Modules' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Admin Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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

        # PSUCA EMPLOYEE
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        if($Cache:PsucaEmployeeTerminalStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsucaEmployeeTerminalStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsucaEmployeeTerminalStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsucaEmployeeTerminalStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Terminal' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Employee Terminal Power' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }  
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Database' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Employee Terminal Database' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Employee Terminal Tasks' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'CodeBranch' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Employee Terminal Mutual Ties' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Employee Terminal configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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
                        if($Cache:PsucaEmployeeDashboardStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsucaEmployeeDashboardStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsucaEmployeeDashboardStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsucaEmployeeDashboardStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Employee' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Employee Dashboard Power' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "Stop Dashobard" -OnClick {
                                                        $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq 'psucaEmployee'
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
                                                        $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq 'psucaEmployee'
                                                        if($Dashboard.Status -eq 'Stopped'){
                                                            $Dashboard | Start-PSUDashBoard
                                                            Show-UDToast -Message 'Dashboard is started'
                                                        }
                                                        elseif($Dashboard.Status -eq 'Started'){
                                                            Show-UDToast -Message 'Dashboard is started, cannot be started'
                                                        }
                                                        Hide-UDModal
                                                    } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }  
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Desktop' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Employee Dashboard' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "New Tab" -OnClick { Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+"app/employee/") -OpenInNewWindow ;Hide-UDModal } -ClassName "interface-box-btn"
                                                    New-UDButton -Text "Open here" -OnClick { Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+"app/employee/") } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Users' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Employee Account Management' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }          
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cube' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Employee Addons and Modules' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Employee Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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

        # PSUCA PUBLIC
        New-UDGrid -Item -Content {
            New-UDPaper -ClassName "interface-box-layout" -Square -Content {
                New-UDRow -Columns {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        if($Cache:PsucaPublicTerminalStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsucaPublicTerminalStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsucaPublicTerminalStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsucaPublicTerminalStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Terminal' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Public Terminal Power' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }  
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Database' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Public Terminal Database' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Public Terminal Tasks' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'CodeBranch' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Public Terminal Mutual Ties' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Public Terminal Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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
                        if($Cache:PsucaPublicDashboardStatus -eq 'online'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-green"></div></div>'
                        }
                        elseif($Cache:PsucaPublicDashboardStatus -eq 'offline'){
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-red"></div></div>'
                        }
                        else{
                            New-UDHtml -Markup '<div style="width:100%;padding:0px;"><div class="interface-width-line-gray"></div></div>'
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    if($Cache:PsucaPublicDashboardStatus -eq 'online'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-online'
                                    }
                                    elseif($Cache:PsucaPublicDashboardStatus -eq 'offline'){
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'interface-box-logo-offline'
                                    }
                                    else{
                                        New-UDIcon -Icon 'QuestionCircle' -Size '1x' -Border -ClassName 'interface-box-logo'
                                    }
                                    
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Public' -ClassName 'interface-box-title'
                                    }
                                }
                            }
                        }

                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'PowerOff' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Public Dashboard Power' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "Stop Dashobard" -OnClick {
                                                        $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq 'psucaPublic'
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
                                                        $Dashboard = Get-PSUDashboard -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken | Where-Object Name -eq 'psucaPublic'
                                                        if($Dashboard.Status -eq 'Stopped'){
                                                            $Dashboard | Start-PSUDashBoard
                                                            Show-UDToast -Message 'Dashboard is started'
                                                        }
                                                        elseif($Dashboard.Status -eq 'Started'){
                                                            Show-UDToast -Message 'Dashboard is started, cannot be started'
                                                        }
                                                        Hide-UDModal
                                                    } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }  
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Desktop' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Public Dashboard' -Variant subtitle1
                                                } -Content {
                                                    New-UDButton -Text "New Tab" -OnClick { Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress") -OpenInNewWindow ;Hide-UDModal } -ClassName "interface-box-btn"
                                                    New-UDButton -Text "Open here" -OnClick { Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress") } -ClassName "interface-box-btn"
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Users' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Public Account Management' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }          
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cube' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Public Addons and Modules' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDLink -Children {
                                                New-UDIcon -Icon 'Cog' -Size '1x' -Border -ClassName 'interface-box-logo'
                                            } -OnClick {
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Psuca - Public Configuration' -Variant subtitle1
                                                } -Content {
    
                                                } -Footer { New-UDButton -Text "Close" -OnClick { Hide-UDModal } -ClassName "interface-box-btn" }
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


    } -Spacing 1
    New-UDCardBody -ClassName 'BlockBoxPadding' -Content {}
}


#>