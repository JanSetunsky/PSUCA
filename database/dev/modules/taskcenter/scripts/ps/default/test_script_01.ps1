function Get-PSUCA-test_table {[CmdletBinding()]Param([Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CacheMethod,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CacheType,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CachePoint,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][hashtable]$CacheData,[Parameter(Mandatory=$True,ValueFromPipelineByPropertyName)][Int]$Argument_test_item_id,[Parameter(Mandatory=$True,ValueFromPipelineByPropertyName)][String]$Argument_test_item_string)Begin{[string]$CacheModelId='279e842c-cf49-4920-94bf-658abf517f2f';[string]$CacheTableId='1ff92345-34cc-410e-af21-499419f61305';[string]$CachePSU='_1ff92345_34cc_410e_af21_499419f61305';[string]$CacheTerminal='$Global:1ff92345_34cc_410e_af21_499419f61305'}Process{
                                            switch ($CacheMethod) {
                                                'local'    {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CachePath    = $CacheData.Path
                                                                $DatabasePath = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    $DatabasePathGc  = gc $DatabasePath
                                                                    $DatabaseList    = $DatabasePathGc|iex
                                                                    if($DatabaseList){
                                                                        $Arguments            = '[{"Name":"test_item_id","Type":"1","TypeData":"Int","Mandatory":true},{"Name":"test_item_string","Type":"2","TypeData":"String","Mandatory":"True"}]'
                                                                        $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                        $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                        $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                        $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                        $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                        $PreNameList = @()
                                                                        foreach ($Name in $ArgumentsXmlName) {
                                                                            if($PreNameList -match $Name){}
                                                                            else{$PreNameList += $Name}
                                                                        }
                                                                        $NameList = @()
                                                                        foreach ($Name in $PreNameList) {
                                                                            if($ArgumentsXmlIdName -match $Name){}
                                                                            else{$NameList += $Name}
                                                                        }
    
                                                                        $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
    
                                                                        if($ArgumentTopValue -eq '0'){
                                                                            $DatabaseList = $DatabaseList
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        else{
                                                                            $DatabaseListIndex = $ArgumentTopValue-1
                                                                            $DatabaseList      = $DatabaseList[$DatabaseListIndex]
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        if($DatabaseList){
                                                                            $FunctionResult  = $DatabaseList|ConvertTo-Json -Depth 100
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CachePath      = $CacheData.Path
                                                                $DatabasePath   = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                                                                        $DatabasePathGc = gc $DatabasePath
                                                                        $DatabaseList   = $DatabasePathGc|iex

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

                                                                        if($DatabaseList){
                                                                            $CacheList      = @()
                                                                            foreach ($Index in $CacheArrayList) {
                                                                                $CacheList += $DatabaseList[$Index]
                                                                            }
    
                                                                            $Arguments            = '[{"Name":"test_item_id","Type":"1","TypeData":"Int","Mandatory":true},{"Name":"test_item_string","Type":"2","TypeData":"String","Mandatory":"True"}]'
                                                                            $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                            $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                            $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                            $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                            $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                            $PreNameList = @()
                                                                            foreach ($Name in $ArgumentsXmlName) {
                                                                                if($PreNameList -match $Name){}
                                                                                else{$PreNameList += $Name}
                                                                            }
                                                                            $NameList = @()
                                                                            foreach ($Name in $PreNameList) {
                                                                                if($ArgumentsXmlIdName -match $Name){}
                                                                                else{$NameList += $Name}
                                                                            }
        
                                                                            $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
        
                                                                            if($ArgumentTopValue -eq '0'){
                                                                                $CacheList = $CacheList
                                                                                foreach ($Name in $NameList) {
                                                                                    'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                        '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                        '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                    '}'|iex
                                                                                }
                                                                            }
                                                                            else{
                                                                                $CacheListIndex = $ArgumentTopValue-1
                                                                                $CacheList      = $CacheList[$CacheListIndex]
                                                                                foreach ($Name in $NameList) {
                                                                                    'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                        '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                        '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                    '}'|iex
                                                                                }
                                                                            }                                                                        
                                                                            if($CacheList){
                                                                                $FunctionResult  = $CacheList|ConvertTo-Json -Depth 100
                                                                            }
                                                                            else{
                                                                                $FunctionResult = 'null'
                                                                            }
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }
                                                'psu'      {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CachePSU){
                                                                $ApiDataPSCO = [PSCustomObject]@{
                                                                    Id        = $CachePSU
                                                                    ArrayList = $null
                                                                    Content   = $null
                                                                }
                                                                $RequestData = iwr ('http://localhost:5000/'+'api/stream') -Method Post -Body (@{Token='xxx';ApiType='GET';;ApiArg='All';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content){
                                                                    $DatabaseList       = $RequestData.Content|ConvertFrom-Json -Depth 100
                                                                    if($DatabaseList){
                                                                        $Arguments            = '[{"Name":"test_item_id","Type":"1","TypeData":"Int","Mandatory":true},{"Name":"test_item_string","Type":"2","TypeData":"String","Mandatory":"True"}]'
                                                                        $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                        $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                        $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                        $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                        $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                        $PreNameList = @()
                                                                        foreach ($Name in $ArgumentsXmlName) {
                                                                            if($PreNameList -match $Name){}
                                                                            else{$PreNameList += $Name}
                                                                        }
                                                                        $NameList = @()
                                                                        foreach ($Name in $PreNameList) {
                                                                            if($ArgumentsXmlIdName -match $Name){}
                                                                            else{$NameList += $Name}
                                                                        }
    
                                                                        $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
    
                                                                        if($ArgumentTopValue -eq '0'){
                                                                            $DatabaseList = $DatabaseList
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        else{
                                                                            $DatabaseListIndex = $ArgumentTopValue-1
                                                                            $DatabaseList      = $DatabaseList[$DatabaseListIndex]
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        
                                                                        if($DatabaseList){
                                                                            $FunctionResult = $DatabaseList|ConvertTo-Json -Depth 100
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CachePSU){
                                                                $ApiDataPSCO = [PSCustomObject]@{
                                                                    Id        = $CachePSU
                                                                    ArrayList = $CacheData.ArrayList
                                                                    Content   = $CacheData.Content
                                                                }
                                                                $RequestData = iwr ('http://localhost:5000/'+'api/stream') -Method Post -Body (@{Token='xxx';ApiType='GET';;ApiArg='Selected';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content){
                                                                    $DatabaseList       = $RequestData.Content|ConvertFrom-Json -Depth 100
                                                                    if($DatabaseList){
                                                                        $Arguments            = '[{"Name":"test_item_id","Type":"1","TypeData":"Int","Mandatory":true},{"Name":"test_item_string","Type":"2","TypeData":"String","Mandatory":"True"}]'
                                                                        $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                        $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                        $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                        $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                        $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                        $PreNameList = @()
                                                                        foreach ($Name in $ArgumentsXmlName) {
                                                                            if($PreNameList -match $Name){}
                                                                            else{$PreNameList += $Name}
                                                                        }
                                                                        $NameList = @()
                                                                        foreach ($Name in $PreNameList) {
                                                                            if($ArgumentsXmlIdName -match $Name){}
                                                                            else{$NameList += $Name}
                                                                        }
    
                                                                        $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
    
                                                                        if($ArgumentTopValue -eq '0'){
                                                                            $DatabaseList = $DatabaseList
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        else{
                                                                            $DatabaseListIndex = $ArgumentTopValue-1
                                                                            $DatabaseList      = $DatabaseList[$DatabaseListIndex]
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        
                                                                        if($DatabaseList){
                                                                            $FunctionResult = $DatabaseList|ConvertTo-Json -Depth 100
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'        
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'        
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }
                                                'sql'      {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $Parameters = Invoke-Command {
                                                                    $SqlDatabaseName  = $CacheModelId
                                                                    $ConnectionString = $CacheData.ConnectionString -replace 'importdatabasename',"$SqlDatabaseName"
                                                                    $QueryCommand     = 'SELECT'+' '+'*'+' '+'FROM'+' '+"$CacheTableId"
                                                                    $QueryColumnName  = $CacheColumn
                                                                }
                                                                $StartSqlSession = Invoke-Command {
                                                                    $Connection                  = New-Object System.Data.SqlClient.SqlConnection
                                                                    $Connection.ConnectionString = $ConnectionString
                                                                    $Connection.Open()
                                                                }
                                                                $NewQuery = Invoke-Command {
                                                                    $Query               = “$global:queryString"
                                                                    $Command             = $Connection.CreateCommand()
                                                                    $Command.CommandText = $Query
                                                                    $SqlDataReader       = $Command.ExecuteReader()
                                                                    #Fetch data and write out to files
                                                                    while ($SqlDataReader.Read()) {
                                                                        Write-Output $SqlDataReader[$QueryColumn];
                                                                    }
                                                                }
                                                                $CloseSession = Invoke-Command {
                                                                    $Connection.Close()
                                                                    $Connection.Dispose()
                                                                }
                                                                switch (1,2,3,4,5,6){
                                                                    1{$Param       = $Parameters      }
                                                                    2{$Start       = $StartSqlSession }
                                                                    3{$QueryString = $QueryCommand    }
                                                                    4{$QueryColumn = $QueryColumnName }
                                                                    5{$QueryResult = $NewQuery        }
                                                                    6{$Close       = $CloseSqlSession }
                                                                }
                                                                $FunctionResult = $QueryResult
                                                            }
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $Parameters = Invoke-Command {
                                                                    $SqlDatabaseName  = $CacheModelId
                                                                    $ConnectionString = $CacheData.ConnectionString -replace 'importdatabasename',"$SqlDatabaseName"
                                                                    $QueryCommand     = 'SELECT'+' '+"'"+"$CacheValue"+"'"+' '+'FROM'+' '+"$CacheTableId"
                                                                    $QueryColumnName  = $CacheColumn
                                                                }
                                                                $StartSqlSession = Invoke-Command {
                                                                    $Connection                  = New-Object System.Data.SqlClient.SqlConnection
                                                                    $Connection.ConnectionString = $ConnectionString
                                                                    $Connection.Open()
                                                                }
                                                                $NewQuery = Invoke-Command {
                                                                    $Query               = “$global:queryString"
                                                                    $Command             = $Connection.CreateCommand()
                                                                    $Command.CommandText = $Query
                                                                    $SqlDataReader       = $Command.ExecuteReader()
                                                                    #Fetch data and write out to files
                                                                    while ($SqlDataReader.Read()) {
                                                                        Write-Output $SqlDataReader[$QueryColumn];
                                                                    }
                                                                }
                                                                $CloseSession = Invoke-Command {
                                                                    $Connection.Close()
                                                                    $Connection.Dispose()
                                                                }
                                                                switch (1,2,3,4,5,6){
                                                                    1{$Param       = $Parameters      }
                                                                    2{$Start       = $StartSqlSession }
                                                                    3{$QueryString = $QueryCommand    }
                                                                    4{$QueryColumn = $QueryColumnName }
                                                                    5{$QueryResult = $NewQuery        }
                                                                    6{$Close       = $CloseSqlSession }
                                                                }
                                                                $FunctionResult = $QueryResult
                                                            }
                                                        }
                                                    }
                                                }
                                                'terminal' {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $RepositoryPath  = $CacheTerminal|iex
                                                                $DatabaseList    = $RepositoryPath
                                                                if($DatabaseList){
                                                                    $Arguments            = '[{"Name":"test_item_id","Type":"1","TypeData":"Int","Mandatory":true},{"Name":"test_item_string","Type":"2","TypeData":"String","Mandatory":"True"}]'
                                                                    $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                    $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                    $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                    $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                    $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                    $PreNameList = @()
                                                                    foreach ($Name in $ArgumentsXmlName) {
                                                                        if($PreNameList -match $Name){}
                                                                        else{$PreNameList += $Name}
                                                                    }
                                                                    $NameList = @()
                                                                    foreach ($Name in $PreNameList) {
                                                                        if($ArgumentsXmlIdName -match $Name){}
                                                                        else{$NameList += $Name}
                                                                    }

                                                                    $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)

                                                                    if($ArgumentTopValue -eq '0'){
                                                                        $DatabaseList = $DatabaseList
                                                                        foreach ($Name in $NameList) {
                                                                            'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                            '}'|iex
                                                                        }
                                                                    }
                                                                    else{
                                                                        $DatabaseListIndex = $ArgumentTopValue-1
                                                                        $DatabaseList      = $DatabaseList[$DatabaseListIndex]
                                                                        foreach ($Name in $NameList) {
                                                                            'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                            '}'|iex
                                                                        }
                                                                    }

                                                                    if($DatabaseList){
                                                                        $FunctionResult = $DatabaseList|ConvertTo-Json -Depth 100
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'        
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = 'null'
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CacheArrayList  = $CacheData.ArrayList
                                                                $RepositoryPath  = $CacheTerminal|iex
                                                                $DatabaseList    = $RepositoryPath
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

                                                                        $CacheList      = @()
                                                                        foreach ($Index in $CacheArrayList) {
                                                                            $CacheList += $DatabaseList[$Index]
                                                                        }
    
                                                                        $Arguments            = '[{"Name":"test_item_id","Type":"1","TypeData":"Int","Mandatory":true},{"Name":"test_item_string","Type":"2","TypeData":"String","Mandatory":"True"}]'
                                                                        $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                        $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                        $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                        $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                        $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                        $PreNameList = @()
                                                                        foreach ($Name in $ArgumentsXmlName) {
                                                                            if($PreNameList -match $Name){}
                                                                            else{$PreNameList += $Name}
                                                                        }
                                                                        $NameList = @()
                                                                        foreach ($Name in $PreNameList) {
                                                                            if($ArgumentsXmlIdName -match $Name){}
                                                                            else{$NameList += $Name}
                                                                        }
    
                                                                        $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
    
                                                                        if($ArgumentTopValue -eq '0'){
                                                                            $CacheList = $CacheList
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        else{
                                                                            $CacheListIndex = $ArgumentTopValue-1
                                                                            $CacheList      = $CacheList[$CacheListIndex]
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }                                                                        
    
                                                                        if($CacheList){
                                                                            $FunctionResult = $CacheList|ConvertTo-Json -Depth 100
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'        
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'        
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }
                                                'terminal-cachefile' {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CachePath    = $CacheData.Path
                                                                $DatabasePath = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    $DatabasePathGc  = gc $DatabasePath
                                                                    $DatabaseList    = $DatabasePathGc|iex
                                                                    if($DatabaseList){
                                                                        $Arguments            = '[{"Name":"test_item_id","Type":"1","TypeData":"Int","Mandatory":true},{"Name":"test_item_string","Type":"2","TypeData":"String","Mandatory":"True"}]'
                                                                        $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                        $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                        $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                        $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                        $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                        $PreNameList = @()
                                                                        foreach ($Name in $ArgumentsXmlName) {
                                                                            if($PreNameList -match $Name){}
                                                                            else{$PreNameList += $Name}
                                                                        }
                                                                        $NameList = @()
                                                                        foreach ($Name in $PreNameList) {
                                                                            if($ArgumentsXmlIdName -match $Name){}
                                                                            else{$NameList += $Name}
                                                                        }
    
                                                                        $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
    
                                                                        if($ArgumentTopValue -eq '0'){
                                                                            $DatabaseList = $DatabaseList
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        else{
                                                                            $DatabaseListIndex = $ArgumentTopValue-1
                                                                            $DatabaseList      = $DatabaseList[$DatabaseListIndex]
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
    
                                                                        if($DatabaseList){
                                                                            $FunctionResult = $DatabaseList|ConvertTo-Json -Depth 100
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'        
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CachePath      = $CacheData.Path
                                                                $DatabasePath   = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                                                                        $DatabasePathGc = gc $DatabasePath
                                                                        $DatabaseList   = $DatabasePathGc|iex

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

                                                                        if($DatabaseList){
                                                                            $CacheList      = @()
                                                                            foreach ($Index in $CacheArrayList) {
                                                                                $CacheList += $DatabaseList[$Index]
                                                                            }
    
                                                                            $Arguments            = '[{"Name":"test_item_id","Type":"1","TypeData":"Int","Mandatory":true},{"Name":"test_item_string","Type":"2","TypeData":"String","Mandatory":"True"}]'
                                                                            $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                            $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                            $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                            $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                            $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                            $PreNameList = @()
                                                                            foreach ($Name in $ArgumentsXmlName) {
                                                                                if($PreNameList -match $Name){}
                                                                                else{$PreNameList += $Name}
                                                                            }
                                                                            $NameList = @()
                                                                            foreach ($Name in $PreNameList) {
                                                                                if($ArgumentsXmlIdName -match $Name){}
                                                                                else{$NameList += $Name}
                                                                            }
        
                                                                            $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
        
                                                                            if($ArgumentTopValue -eq '0'){
                                                                                $CacheList = $CacheList
                                                                                foreach ($Name in $NameList) {
                                                                                    'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                        '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                        '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                    '}'|iex
                                                                                }
                                                                            }
                                                                            else{
                                                                                $CacheListIndex = $ArgumentTopValue-1
                                                                                $CacheList      = $CacheList[$CacheListIndex]
                                                                                foreach ($Name in $NameList) {
                                                                                    'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                        '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                        '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                    '}'|iex
                                                                                }
                                                                            }                                                                        
                                                                            if($CacheList){
                                                                                $FunctionResult  = $CacheList|ConvertTo-Json -Depth 100
                                                                            }
                                                                            else{
                                                                                $FunctionResult = 'null'
                                                                            }
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }                                                                
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }                                                
                                            }
                                        }End{$FunctionResult}}
function Get-PSUCA-test_table_002 {[CmdletBinding()]Param([Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CacheMethod,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CacheType,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CachePoint,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][hashtable]$CacheData,[Parameter(Mandatory=$True,ValueFromPipelineByPropertyName)][Int]$Argument_test_item_002_id)Begin{[string]$CacheModelId='279e842c-cf49-4920-94bf-658abf517f2f';[string]$CacheTableId='9df1df3d-5588-4179-83e9-4da09c4ad531';[string]$CachePSU='_9df1df3d_5588_4179_83e9_4da09c4ad531';[string]$CacheTerminal='$Global:9df1df3d_5588_4179_83e9_4da09c4ad531'}Process{
                                            switch ($CacheMethod) {
                                                'local'    {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CachePath    = $CacheData.Path
                                                                $DatabasePath = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    $DatabasePathGc  = gc $DatabasePath
                                                                    $DatabaseList    = $DatabasePathGc|iex
                                                                    if($DatabaseList){
                                                                        $Arguments            = '{"Name":"test_item_002_id","Type":"1","TypeData":"Int","Mandatory":true}'
                                                                        $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                        $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                        $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                        $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                        $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                        $PreNameList = @()
                                                                        foreach ($Name in $ArgumentsXmlName) {
                                                                            if($PreNameList -match $Name){}
                                                                            else{$PreNameList += $Name}
                                                                        }
                                                                        $NameList = @()
                                                                        foreach ($Name in $PreNameList) {
                                                                            if($ArgumentsXmlIdName -match $Name){}
                                                                            else{$NameList += $Name}
                                                                        }
    
                                                                        $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
    
                                                                        if($ArgumentTopValue -eq '0'){
                                                                            $DatabaseList = $DatabaseList
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        else{
                                                                            $DatabaseListIndex = $ArgumentTopValue-1
                                                                            $DatabaseList      = $DatabaseList[$DatabaseListIndex]
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        if($DatabaseList){
                                                                            $FunctionResult  = $DatabaseList|ConvertTo-Json -Depth 100
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CachePath      = $CacheData.Path
                                                                $DatabasePath   = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                                                                        $DatabasePathGc = gc $DatabasePath
                                                                        $DatabaseList   = $DatabasePathGc|iex

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

                                                                        if($DatabaseList){
                                                                            $CacheList      = @()
                                                                            foreach ($Index in $CacheArrayList) {
                                                                                $CacheList += $DatabaseList[$Index]
                                                                            }
    
                                                                            $Arguments            = '{"Name":"test_item_002_id","Type":"1","TypeData":"Int","Mandatory":true}'
                                                                            $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                            $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                            $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                            $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                            $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                            $PreNameList = @()
                                                                            foreach ($Name in $ArgumentsXmlName) {
                                                                                if($PreNameList -match $Name){}
                                                                                else{$PreNameList += $Name}
                                                                            }
                                                                            $NameList = @()
                                                                            foreach ($Name in $PreNameList) {
                                                                                if($ArgumentsXmlIdName -match $Name){}
                                                                                else{$NameList += $Name}
                                                                            }
        
                                                                            $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
        
                                                                            if($ArgumentTopValue -eq '0'){
                                                                                $CacheList = $CacheList
                                                                                foreach ($Name in $NameList) {
                                                                                    'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                        '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                        '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                    '}'|iex
                                                                                }
                                                                            }
                                                                            else{
                                                                                $CacheListIndex = $ArgumentTopValue-1
                                                                                $CacheList      = $CacheList[$CacheListIndex]
                                                                                foreach ($Name in $NameList) {
                                                                                    'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                        '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                        '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                    '}'|iex
                                                                                }
                                                                            }                                                                        
                                                                            if($CacheList){
                                                                                $FunctionResult  = $CacheList|ConvertTo-Json -Depth 100
                                                                            }
                                                                            else{
                                                                                $FunctionResult = 'null'
                                                                            }
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }
                                                'psu'      {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CachePSU){
                                                                $ApiDataPSCO = [PSCustomObject]@{
                                                                    Id        = $CachePSU
                                                                    ArrayList = $null
                                                                    Content   = $null
                                                                }
                                                                $RequestData = iwr ('http://localhost:5000/'+'api/stream') -Method Post -Body (@{Token='xxx';ApiType='GET';;ApiArg='All';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content){
                                                                    $DatabaseList       = $RequestData.Content|ConvertFrom-Json -Depth 100
                                                                    if($DatabaseList){
                                                                        $Arguments            = '{"Name":"test_item_002_id","Type":"1","TypeData":"Int","Mandatory":true}'
                                                                        $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                        $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                        $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                        $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                        $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                        $PreNameList = @()
                                                                        foreach ($Name in $ArgumentsXmlName) {
                                                                            if($PreNameList -match $Name){}
                                                                            else{$PreNameList += $Name}
                                                                        }
                                                                        $NameList = @()
                                                                        foreach ($Name in $PreNameList) {
                                                                            if($ArgumentsXmlIdName -match $Name){}
                                                                            else{$NameList += $Name}
                                                                        }
    
                                                                        $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
    
                                                                        if($ArgumentTopValue -eq '0'){
                                                                            $DatabaseList = $DatabaseList
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        else{
                                                                            $DatabaseListIndex = $ArgumentTopValue-1
                                                                            $DatabaseList      = $DatabaseList[$DatabaseListIndex]
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        
                                                                        if($DatabaseList){
                                                                            $FunctionResult = $DatabaseList|ConvertTo-Json -Depth 100
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CachePSU){
                                                                $ApiDataPSCO = [PSCustomObject]@{
                                                                    Id        = $CachePSU
                                                                    ArrayList = $CacheData.ArrayList
                                                                    Content   = $CacheData.Content
                                                                }
                                                                $RequestData = iwr ('http://localhost:5000/'+'api/stream') -Method Post -Body (@{Token='xxx';ApiType='GET';;ApiArg='Selected';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content){
                                                                    $DatabaseList       = $RequestData.Content|ConvertFrom-Json -Depth 100
                                                                    if($DatabaseList){
                                                                        $Arguments            = '{"Name":"test_item_002_id","Type":"1","TypeData":"Int","Mandatory":true}'
                                                                        $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                        $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                        $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                        $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                        $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                        $PreNameList = @()
                                                                        foreach ($Name in $ArgumentsXmlName) {
                                                                            if($PreNameList -match $Name){}
                                                                            else{$PreNameList += $Name}
                                                                        }
                                                                        $NameList = @()
                                                                        foreach ($Name in $PreNameList) {
                                                                            if($ArgumentsXmlIdName -match $Name){}
                                                                            else{$NameList += $Name}
                                                                        }
    
                                                                        $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
    
                                                                        if($ArgumentTopValue -eq '0'){
                                                                            $DatabaseList = $DatabaseList
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        else{
                                                                            $DatabaseListIndex = $ArgumentTopValue-1
                                                                            $DatabaseList      = $DatabaseList[$DatabaseListIndex]
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        
                                                                        if($DatabaseList){
                                                                            $FunctionResult = $DatabaseList|ConvertTo-Json -Depth 100
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'        
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'        
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }
                                                'sql'      {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $Parameters = Invoke-Command {
                                                                    $SqlDatabaseName  = $CacheModelId
                                                                    $ConnectionString = $CacheData.ConnectionString -replace 'importdatabasename',"$SqlDatabaseName"
                                                                    $QueryCommand     = 'SELECT'+' '+'*'+' '+'FROM'+' '+"$CacheTableId"
                                                                    $QueryColumnName  = $CacheColumn
                                                                }
                                                                $StartSqlSession = Invoke-Command {
                                                                    $Connection                  = New-Object System.Data.SqlClient.SqlConnection
                                                                    $Connection.ConnectionString = $ConnectionString
                                                                    $Connection.Open()
                                                                }
                                                                $NewQuery = Invoke-Command {
                                                                    $Query               = “$global:queryString"
                                                                    $Command             = $Connection.CreateCommand()
                                                                    $Command.CommandText = $Query
                                                                    $SqlDataReader       = $Command.ExecuteReader()
                                                                    #Fetch data and write out to files
                                                                    while ($SqlDataReader.Read()) {
                                                                        Write-Output $SqlDataReader[$QueryColumn];
                                                                    }
                                                                }
                                                                $CloseSession = Invoke-Command {
                                                                    $Connection.Close()
                                                                    $Connection.Dispose()
                                                                }
                                                                switch (1,2,3,4,5,6){
                                                                    1{$Param       = $Parameters      }
                                                                    2{$Start       = $StartSqlSession }
                                                                    3{$QueryString = $QueryCommand    }
                                                                    4{$QueryColumn = $QueryColumnName }
                                                                    5{$QueryResult = $NewQuery        }
                                                                    6{$Close       = $CloseSqlSession }
                                                                }
                                                                $FunctionResult = $QueryResult
                                                            }
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $Parameters = Invoke-Command {
                                                                    $SqlDatabaseName  = $CacheModelId
                                                                    $ConnectionString = $CacheData.ConnectionString -replace 'importdatabasename',"$SqlDatabaseName"
                                                                    $QueryCommand     = 'SELECT'+' '+"'"+"$CacheValue"+"'"+' '+'FROM'+' '+"$CacheTableId"
                                                                    $QueryColumnName  = $CacheColumn
                                                                }
                                                                $StartSqlSession = Invoke-Command {
                                                                    $Connection                  = New-Object System.Data.SqlClient.SqlConnection
                                                                    $Connection.ConnectionString = $ConnectionString
                                                                    $Connection.Open()
                                                                }
                                                                $NewQuery = Invoke-Command {
                                                                    $Query               = “$global:queryString"
                                                                    $Command             = $Connection.CreateCommand()
                                                                    $Command.CommandText = $Query
                                                                    $SqlDataReader       = $Command.ExecuteReader()
                                                                    #Fetch data and write out to files
                                                                    while ($SqlDataReader.Read()) {
                                                                        Write-Output $SqlDataReader[$QueryColumn];
                                                                    }
                                                                }
                                                                $CloseSession = Invoke-Command {
                                                                    $Connection.Close()
                                                                    $Connection.Dispose()
                                                                }
                                                                switch (1,2,3,4,5,6){
                                                                    1{$Param       = $Parameters      }
                                                                    2{$Start       = $StartSqlSession }
                                                                    3{$QueryString = $QueryCommand    }
                                                                    4{$QueryColumn = $QueryColumnName }
                                                                    5{$QueryResult = $NewQuery        }
                                                                    6{$Close       = $CloseSqlSession }
                                                                }
                                                                $FunctionResult = $QueryResult
                                                            }
                                                        }
                                                    }
                                                }
                                                'terminal' {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $RepositoryPath  = $CacheTerminal|iex
                                                                $DatabaseList    = $RepositoryPath
                                                                if($DatabaseList){
                                                                    $Arguments            = '{"Name":"test_item_002_id","Type":"1","TypeData":"Int","Mandatory":true}'
                                                                    $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                    $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                    $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                    $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                    $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                    $PreNameList = @()
                                                                    foreach ($Name in $ArgumentsXmlName) {
                                                                        if($PreNameList -match $Name){}
                                                                        else{$PreNameList += $Name}
                                                                    }
                                                                    $NameList = @()
                                                                    foreach ($Name in $PreNameList) {
                                                                        if($ArgumentsXmlIdName -match $Name){}
                                                                        else{$NameList += $Name}
                                                                    }

                                                                    $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)

                                                                    if($ArgumentTopValue -eq '0'){
                                                                        $DatabaseList = $DatabaseList
                                                                        foreach ($Name in $NameList) {
                                                                            'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                            '}'|iex
                                                                        }
                                                                    }
                                                                    else{
                                                                        $DatabaseListIndex = $ArgumentTopValue-1
                                                                        $DatabaseList      = $DatabaseList[$DatabaseListIndex]
                                                                        foreach ($Name in $NameList) {
                                                                            'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                            '}'|iex
                                                                        }
                                                                    }

                                                                    if($DatabaseList){
                                                                        $FunctionResult = $DatabaseList|ConvertTo-Json -Depth 100
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'        
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = 'null'
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CacheArrayList  = $CacheData.ArrayList
                                                                $RepositoryPath  = $CacheTerminal|iex
                                                                $DatabaseList    = $RepositoryPath
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

                                                                        $CacheList      = @()
                                                                        foreach ($Index in $CacheArrayList) {
                                                                            $CacheList += $DatabaseList[$Index]
                                                                        }
    
                                                                        $Arguments            = '{"Name":"test_item_002_id","Type":"1","TypeData":"Int","Mandatory":true}'
                                                                        $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                        $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                        $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                        $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                        $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                        $PreNameList = @()
                                                                        foreach ($Name in $ArgumentsXmlName) {
                                                                            if($PreNameList -match $Name){}
                                                                            else{$PreNameList += $Name}
                                                                        }
                                                                        $NameList = @()
                                                                        foreach ($Name in $PreNameList) {
                                                                            if($ArgumentsXmlIdName -match $Name){}
                                                                            else{$NameList += $Name}
                                                                        }
    
                                                                        $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
    
                                                                        if($ArgumentTopValue -eq '0'){
                                                                            $CacheList = $CacheList
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        else{
                                                                            $CacheListIndex = $ArgumentTopValue-1
                                                                            $CacheList      = $CacheList[$CacheListIndex]
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }                                                                        
    
                                                                        if($CacheList){
                                                                            $FunctionResult = $CacheList|ConvertTo-Json -Depth 100
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'        
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'        
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }
                                                'terminal-cachefile' {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CachePath    = $CacheData.Path
                                                                $DatabasePath = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    $DatabasePathGc  = gc $DatabasePath
                                                                    $DatabaseList    = $DatabasePathGc|iex
                                                                    if($DatabaseList){
                                                                        $Arguments            = '{"Name":"test_item_002_id","Type":"1","TypeData":"Int","Mandatory":true}'
                                                                        $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                        $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                        $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                        $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                        $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                        $PreNameList = @()
                                                                        foreach ($Name in $ArgumentsXmlName) {
                                                                            if($PreNameList -match $Name){}
                                                                            else{$PreNameList += $Name}
                                                                        }
                                                                        $NameList = @()
                                                                        foreach ($Name in $PreNameList) {
                                                                            if($ArgumentsXmlIdName -match $Name){}
                                                                            else{$NameList += $Name}
                                                                        }
    
                                                                        $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
    
                                                                        if($ArgumentTopValue -eq '0'){
                                                                            $DatabaseList = $DatabaseList
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
                                                                        else{
                                                                            $DatabaseListIndex = $ArgumentTopValue-1
                                                                            $DatabaseList      = $DatabaseList[$DatabaseListIndex]
                                                                            foreach ($Name in $NameList) {
                                                                                'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                    '$DatabaseSelector'+'='+'$DatabaseList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                    '$DatabaseList'+'='+'$DatabaseSelector'+';'+
                                                                                '}'|iex
                                                                            }
                                                                        }
    
                                                                        if($DatabaseList){
                                                                            $FunctionResult = $DatabaseList|ConvertTo-Json -Depth 100
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'        
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = 'null'
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CachePath      = $CacheData.Path
                                                                $DatabasePath   = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                                                                        $DatabasePathGc = gc $DatabasePath
                                                                        $DatabaseList   = $DatabasePathGc|iex

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

                                                                        if($DatabaseList){
                                                                            $CacheList      = @()
                                                                            foreach ($Index in $CacheArrayList) {
                                                                                $CacheList += $DatabaseList[$Index]
                                                                            }
    
                                                                            $Arguments            = '{"Name":"test_item_002_id","Type":"1","TypeData":"Int","Mandatory":true}'
                                                                            $ArgumentsJson        = $Arguments | ConvertFrom-Json -Depth 100
                                                                            $ArgumentsXml         = $ArgumentsJson | ConvertTo-Xml
                                                                            $ArgumentsItemTypeXml = $ArgumentsJson | ? {$_.Type -eq '1'} | ConvertTo-Xml
                                                                            $ArgumentsXmlName     = (((($ArgumentsXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text"
                                                                            $ArgumentsXmlIdName   = (((($ArgumentsItemTypeXml.Objects).Object).Property) | ? {$_.Name -eq 'Name'})."#text" | sort -Top 1
                                                                            $PreNameList = @()
                                                                            foreach ($Name in $ArgumentsXmlName) {
                                                                                if($PreNameList -match $Name){}
                                                                                else{$PreNameList += $Name}
                                                                            }
                                                                            $NameList = @()
                                                                            foreach ($Name in $PreNameList) {
                                                                                if($ArgumentsXmlIdName -match $Name){}
                                                                                else{$NameList += $Name}
                                                                            }
        
                                                                            $ArgumentTopValue = (('$Argument_'+"$ArgumentsXmlIdName")|iex)
        
                                                                            if($ArgumentTopValue -eq '0'){
                                                                                $CacheList = $CacheList
                                                                                foreach ($Name in $NameList) {
                                                                                    'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                        '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                        '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                    '}'|iex
                                                                                }
                                                                            }
                                                                            else{
                                                                                $CacheListIndex = $ArgumentTopValue-1
                                                                                $CacheList      = $CacheList[$CacheListIndex]
                                                                                foreach ($Name in $NameList) {
                                                                                    'if('+'$null'+' -ne '+('$PSBoundParameters.'+'Argument_'+"$Name")+')'+'{'+
                                                                                        '$DatabaseSelector'+'='+'$CacheList'+'|'+'?'+'{'+'$_.'+"$Name"+' -match '+'$Argument_'+"$Name"+'}'+';'+
                                                                                        '$CacheList'+'='+'$DatabaseSelector'+';'+
                                                                                    '}'|iex
                                                                                }
                                                                            }                                                                        
                                                                            if($CacheList){
                                                                                $FunctionResult  = $CacheList|ConvertTo-Json -Depth 100
                                                                            }
                                                                            else{
                                                                                $FunctionResult = 'null'
                                                                            }
                                                                        }
                                                                        else{
                                                                            $FunctionResult = 'null'
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }                                                                
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }                                                
                                            }
                                        }End{$FunctionResult}}
function Add-PSUCA-test_table {[CmdletBinding()]Param([Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CacheMethod,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CacheType,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CachePoint,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][hashtable]$CacheData)Begin{[string]$CacheModelId='279e842c-cf49-4920-94bf-658abf517f2f';[string]$CacheTableId='1ff92345-34cc-410e-af21-499419f61305';[string]$CachePSU='_1ff92345_34cc_410e_af21_499419f61305';[string]$CacheTerminal='$Global:1ff92345_34cc_410e_af21_499419f61305'}Process{
                                            switch ($CacheMethod) {
                                                'local'    {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CachePath    = $CacheData.Path
                                                                $CacheContent = $CacheData.Content
                                                                $DatabaseDir  = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'
                                                                $DatabasePath = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($CacheContent){
                                                                        $AddContent     = Add-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    if($CacheContent){
                                                                        $NewDir         = New-Item -ItemType Directory $DatabaseDir
                                                                        $NewFile        = New-Item -ItemType File $DatabasePath
                                                                        $AddContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CachePath      = $CacheData.Path
                                                                $CacheContent   = $CacheData.Content
                                                                $DatabaseDir    = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'
                                                                $DatabasePath   = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                                                                        $DatabasePathGc = gc $DatabasePath
                                                                        $DatabaseList   = $DatabasePathGc|iex
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

                                                                            $CacheList      = @()
                                                                            if(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Database in $DatabaseList) {
                                                                                    if($num -eq $CacheArrayList){
                                                                                        $CacheList += $CacheContent
                                                                                    }
                                                                                    $CacheList += $Database
                                                                                    $num++
                                                                                }
                                                                                $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            if(($CacheArrayList).Count -gt 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Database in $DatabaseList) {
                                                                                    if($null -ne $($CacheArrayList -like $num)){
                                                                                        $CacheList += $CacheContent[$num]
                                                                                    }
                                                                                    $CacheList += $Database
                                                                                    $num++
                                                                                }
                                                                                $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -eq 1){
                                                                                if($CacheArrayList -eq 0){
                                                                                    $SetContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                                    $AddContent     = Add-Content $DatabasePath -Value $DatabaseList
                                                                                    $FunctionResult = $true
                                                                                }
                                                                                elseif($CacheArrayList -gt 0){
                                                                                    $num = 0
                                                                                    foreach ($Database in $DatabaseList) {
                                                                                        if($num -eq $CacheArrayList){
                                                                                            $CacheList += $CacheContent
                                                                                        }
                                                                                        $CacheList += $Database
                                                                                        $num++
                                                                                    }
                                                                                    $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                    $FunctionResult = $true
                                                                                }
                                                                                else{
                                                                                    $FunctionResult = $false
                                                                                }
                                                                            }  
                                                                            else{
                                                                                $FunctionResult = $false
                                                                            }
                                                                        }
                                                                        else{
                                                                            $AddContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                            $FunctionResult = $true
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    if($CacheContent){
                                                                        $NewDir         = New-Item -ItemType Directory $DatabaseDir
                                                                        $NewFile        = New-Item -ItemType File $DatabasePath
                                                                        $AddContent     = Add-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }
                                                'psu'      {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CachePSU){
                                                                $ApiDataPSCO = [PSCustomObject]@{
                                                                    Id        = $CachePSU
                                                                    ArrayList = $CacheData.ArrayList|ConvertTo-Json -Depth 100
                                                                    Content   = $CacheData.Content|ConvertTo-Json -Depth 100
                                                                }
                                                                $RequestData = iwr ('http://localhost:5000/'+'api/stream') -Method Post -Body (@{Token='xxx';ApiType='ADD';;ApiArg='All';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content -eq 'Add'){
                                                                    $FunctionResult = $true
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CachePSU){
                                                                $ApiDataPSCO = [PSCustomObject]@{
                                                                    Id        = $CachePSU
                                                                    ArrayList = $CacheData.ArrayList|ConvertTo-Json -Depth 100
                                                                    Content   = $CacheData.Content|ConvertTo-Json -Depth 100
                                                                }
                                                                $RequestData = iwr ('http://localhost:5000/'+'api/stream') -Method Post -Body (@{Token='xxx';ApiType='ADD';;ApiArg='Selected';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content -eq 'Add'){
                                                                    $FunctionResult = $true
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }
                                                'sql'      {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $Parameters = Invoke-Command {
                                                                    $SqlDatabaseName  = $CacheModelId
                                                                    $ConnectionString = $CacheData.ConnectionString -replace 'importdatabasename',"$SqlDatabaseName"
                                                                    $QueryCommand     = 'SELECT'+' '+'*'+' '+'FROM'+' '+"$CacheTableId"
                                                                    $QueryColumnName  = $CacheColumn
                                                                }
                                                                $StartSqlSession = Invoke-Command {
                                                                    $Connection                  = New-Object System.Data.SqlClient.SqlConnection
                                                                    $Connection.ConnectionString = $ConnectionString
                                                                    $Connection.Open()
                                                                }
                                                                $NewQuery = Invoke-Command {
                                                                    $Query               = “$global:queryString"
                                                                    $Command             = $Connection.CreateCommand()
                                                                    $Command.CommandText = $Query
                                                                    $SqlDataReader       = $Command.ExecuteReader()
                                                                    #Fetch data and write out to files
                                                                    while ($SqlDataReader.Read()) {
                                                                        Write-Output $SqlDataReader[$QueryColumn];
                                                                    }
                                                                }
                                                                $CloseSession = Invoke-Command {
                                                                    $Connection.Close()
                                                                    $Connection.Dispose()
                                                                }
                                                                switch (1,2,3,4,5,6){
                                                                    1{$Param       = $Parameters      }
                                                                    2{$Start       = $StartSqlSession }
                                                                    3{$QueryString = $QueryCommand    }
                                                                    4{$QueryColumn = $QueryColumnName }
                                                                    5{$QueryResult = $NewQuery        }
                                                                    6{$Close       = $CloseSqlSession }
                                                                }
                                                                $FunctionResult = $QueryResult
                                                            }
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $Parameters = Invoke-Command {
                                                                    $SqlDatabaseName  = $CacheModelId
                                                                    $ConnectionString = $CacheData.ConnectionString -replace 'importdatabasename',"$SqlDatabaseName"
                                                                    $QueryCommand     = 'SELECT'+' '+"'"+"$CacheValue"+"'"+' '+'FROM'+' '+"$CacheTableId"
                                                                    $QueryColumnName  = $CacheColumn
                                                                }
                                                                $StartSqlSession = Invoke-Command {
                                                                    $Connection                  = New-Object System.Data.SqlClient.SqlConnection
                                                                    $Connection.ConnectionString = $ConnectionString
                                                                    $Connection.Open()
                                                                }
                                                                $NewQuery = Invoke-Command {
                                                                    $Query               = “$global:queryString"
                                                                    $Command             = $Connection.CreateCommand()
                                                                    $Command.CommandText = $Query
                                                                    $SqlDataReader       = $Command.ExecuteReader()
                                                                    #Fetch data and write out to files
                                                                    while ($SqlDataReader.Read()) {
                                                                        Write-Output $SqlDataReader[$QueryColumn];
                                                                    }
                                                                }
                                                                $CloseSession = Invoke-Command {
                                                                    $Connection.Close()
                                                                    $Connection.Dispose()
                                                                }
                                                                switch (1,2,3,4,5,6){
                                                                    1{$Param       = $Parameters      }
                                                                    2{$Start       = $StartSqlSession }
                                                                    3{$QueryString = $QueryCommand    }
                                                                    4{$QueryColumn = $QueryColumnName }
                                                                    5{$QueryResult = $NewQuery        }
                                                                    6{$Close       = $CloseSqlSession }
                                                                }
                                                                $FunctionResult = $QueryResult
                                                            }
                                                        }
                                                    }
                                                }
                                                'terminal' {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $RepositoryPath   = $CacheTerminal|iex
                                                                $DatabaseList     = $RepositoryPath
                                                                $CacheContent     = $CacheData.Content
                                                                $CacheList        = @()
                                                                $CacheList       += $DatabaseList
                                                                $CacheList       += $CacheContent
                                                                $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheList')|iex
                                                                $FunctionResult = $true
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $RepositoryPath   = $CacheTerminal|iex
                                                                $DatabaseList     = $RepositoryPath
                                                                $CacheArrayList   = $CacheData.ArrayList
                                                                $CacheContent     = $CacheData.Content
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
                                                                            $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheList')|iex
                                                                            $FunctionResult = $true
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
                                                                            $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheList')|iex
                                                                            $FunctionResult = $true
                                                                        }
                                                                        elseif(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -eq 1){
                                                                            if($CacheArrayList -eq 0){
                                                                                $CacheList += $CacheContent
                                                                                $CacheList += $DatabaseList
                                                                                $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheList')|iex
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif($CacheArrayList -gt 0){
                                                                                $num = 0
                                                                                foreach ($Database in $DatabaseList) {
                                                                                    if($num -eq $CacheArrayList){
                                                                                        $CacheList += $CacheContent
                                                                                    }
                                                                                    $CacheList += $Database
                                                                                    $num++
                                                                                }
                                                                                $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheList')|iex
                                                                                $FunctionResult = $true
                                                                            }
                                                                            else{
                                                                                $FunctionResult = $false
                                                                            }
                                                                        }  
                                                                        else{
                                                                            'error'
                                                                        }
                                                                    }
                                                                    else{
                                                                        $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheContent')|iex
                                                                        $FunctionResult = $true
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
                                                'terminal-cachefile' {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CachePath    = $CacheData.Path
                                                                $CacheContent = $CacheData.Content
                                                                $DatabaseDir  = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'
                                                                $DatabasePath = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($CacheContent){
                                                                        $AddContent     = Add-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    if($CacheContent){
                                                                        $NewDir         = New-Item -ItemType Directory $DatabaseDir
                                                                        $NewFile        = New-Item -ItemType File $DatabasePath
                                                                        $AddContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CachePath      = $CacheData.Path
                                                                $CacheContent   = $CacheData.Content
                                                                $DatabaseDir    = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'
                                                                $DatabasePath   = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                                                                        $DatabasePathGc = gc $DatabasePath
                                                                        $DatabaseList   = $DatabasePathGc|iex
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

                                                                            $CacheList      = @()
                                                                            if(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Database in $DatabaseList) {
                                                                                    if($num -eq $CacheArrayList){
                                                                                        $CacheList += $CacheContent
                                                                                    }
                                                                                    $CacheList += $Database
                                                                                    $num++
                                                                                }
                                                                                $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            if(($CacheArrayList).Count -gt 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Database in $DatabaseList) {
                                                                                    if($null -ne $($CacheArrayList -like $num)){
                                                                                        $CacheList += $CacheContent[$num]
                                                                                    }
                                                                                    $CacheList += $Database
                                                                                    $num++
                                                                                }
                                                                                $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -eq 1){
                                                                                if($CacheArrayList -eq 0){
                                                                                    $SetContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                                    $AddContent     = Add-Content $DatabasePath -Value $DatabaseList
                                                                                    $FunctionResult = $true
                                                                                }
                                                                                elseif($CacheArrayList -gt 0){
                                                                                    $num = 0
                                                                                    foreach ($Database in $DatabaseList) {
                                                                                        if($num -eq $CacheArrayList){
                                                                                            $CacheList += $CacheContent
                                                                                        }
                                                                                        $CacheList += $Database
                                                                                        $num++
                                                                                    }
                                                                                    $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                    $FunctionResult = $true
                                                                                }
                                                                                else{
                                                                                    $FunctionResult = $false
                                                                                }
                                                                            }  
                                                                            else{
                                                                                $FunctionResult = $false
                                                                            }
                                                                        }
                                                                        else{
                                                                            $AddContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                            $FunctionResult = $true
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    if($CacheContent){
                                                                        $NewDir         = New-Item -ItemType Directory $DatabaseDir
                                                                        $NewFile        = New-Item -ItemType File $DatabasePath
                                                                        $AddContent     = Add-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }                                                
                                            }
                                        }End{$FunctionResult}}
function Add-PSUCA-test_table_002 {[CmdletBinding()]Param([Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CacheMethod,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CacheType,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][string]$CachePoint,[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)][hashtable]$CacheData)Begin{[string]$CacheModelId='279e842c-cf49-4920-94bf-658abf517f2f';[string]$CacheTableId='9df1df3d-5588-4179-83e9-4da09c4ad531';[string]$CachePSU='_9df1df3d_5588_4179_83e9_4da09c4ad531';[string]$CacheTerminal='$Global:9df1df3d_5588_4179_83e9_4da09c4ad531'}Process{
                                            switch ($CacheMethod) {
                                                'local'    {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CachePath    = $CacheData.Path
                                                                $CacheContent = $CacheData.Content
                                                                $DatabaseDir  = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'
                                                                $DatabasePath = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($CacheContent){
                                                                        $AddContent     = Add-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    if($CacheContent){
                                                                        $NewDir         = New-Item -ItemType Directory $DatabaseDir
                                                                        $NewFile        = New-Item -ItemType File $DatabasePath
                                                                        $AddContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CachePath      = $CacheData.Path
                                                                $CacheContent   = $CacheData.Content
                                                                $DatabaseDir    = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'
                                                                $DatabasePath   = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                                                                        $DatabasePathGc = gc $DatabasePath
                                                                        $DatabaseList   = $DatabasePathGc|iex
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

                                                                            $CacheList      = @()
                                                                            if(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Database in $DatabaseList) {
                                                                                    if($num -eq $CacheArrayList){
                                                                                        $CacheList += $CacheContent
                                                                                    }
                                                                                    $CacheList += $Database
                                                                                    $num++
                                                                                }
                                                                                $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            if(($CacheArrayList).Count -gt 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Database in $DatabaseList) {
                                                                                    if($null -ne $($CacheArrayList -like $num)){
                                                                                        $CacheList += $CacheContent[$num]
                                                                                    }
                                                                                    $CacheList += $Database
                                                                                    $num++
                                                                                }
                                                                                $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -eq 1){
                                                                                if($CacheArrayList -eq 0){
                                                                                    $SetContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                                    $AddContent     = Add-Content $DatabasePath -Value $DatabaseList
                                                                                    $FunctionResult = $true
                                                                                }
                                                                                elseif($CacheArrayList -gt 0){
                                                                                    $num = 0
                                                                                    foreach ($Database in $DatabaseList) {
                                                                                        if($num -eq $CacheArrayList){
                                                                                            $CacheList += $CacheContent
                                                                                        }
                                                                                        $CacheList += $Database
                                                                                        $num++
                                                                                    }
                                                                                    $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                    $FunctionResult = $true
                                                                                }
                                                                                else{
                                                                                    $FunctionResult = $false
                                                                                }
                                                                            }  
                                                                            else{
                                                                                $FunctionResult = $false
                                                                            }
                                                                        }
                                                                        else{
                                                                            $AddContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                            $FunctionResult = $true
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    if($CacheContent){
                                                                        $NewDir         = New-Item -ItemType Directory $DatabaseDir
                                                                        $NewFile        = New-Item -ItemType File $DatabasePath
                                                                        $AddContent     = Add-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }
                                                'psu'      {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CachePSU){
                                                                $ApiDataPSCO = [PSCustomObject]@{
                                                                    Id        = $CachePSU
                                                                    ArrayList = $CacheData.ArrayList|ConvertTo-Json -Depth 100
                                                                    Content   = $CacheData.Content|ConvertTo-Json -Depth 100
                                                                }
                                                                $RequestData = iwr ('http://localhost:5000/'+'api/stream') -Method Post -Body (@{Token='xxx';ApiType='ADD';;ApiArg='All';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content -eq 'Add'){
                                                                    $FunctionResult = $true
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CachePSU){
                                                                $ApiDataPSCO = [PSCustomObject]@{
                                                                    Id        = $CachePSU
                                                                    ArrayList = $CacheData.ArrayList|ConvertTo-Json -Depth 100
                                                                    Content   = $CacheData.Content|ConvertTo-Json -Depth 100
                                                                }
                                                                $RequestData = iwr ('http://localhost:5000/'+'api/stream') -Method Post -Body (@{Token='xxx';ApiType='ADD';;ApiArg='Selected';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content -eq 'Add'){
                                                                    $FunctionResult = $true
                                                                }
                                                                else{
                                                                    $FunctionResult = $false
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }
                                                'sql'      {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $Parameters = Invoke-Command {
                                                                    $SqlDatabaseName  = $CacheModelId
                                                                    $ConnectionString = $CacheData.ConnectionString -replace 'importdatabasename',"$SqlDatabaseName"
                                                                    $QueryCommand     = 'SELECT'+' '+'*'+' '+'FROM'+' '+"$CacheTableId"
                                                                    $QueryColumnName  = $CacheColumn
                                                                }
                                                                $StartSqlSession = Invoke-Command {
                                                                    $Connection                  = New-Object System.Data.SqlClient.SqlConnection
                                                                    $Connection.ConnectionString = $ConnectionString
                                                                    $Connection.Open()
                                                                }
                                                                $NewQuery = Invoke-Command {
                                                                    $Query               = “$global:queryString"
                                                                    $Command             = $Connection.CreateCommand()
                                                                    $Command.CommandText = $Query
                                                                    $SqlDataReader       = $Command.ExecuteReader()
                                                                    #Fetch data and write out to files
                                                                    while ($SqlDataReader.Read()) {
                                                                        Write-Output $SqlDataReader[$QueryColumn];
                                                                    }
                                                                }
                                                                $CloseSession = Invoke-Command {
                                                                    $Connection.Close()
                                                                    $Connection.Dispose()
                                                                }
                                                                switch (1,2,3,4,5,6){
                                                                    1{$Param       = $Parameters      }
                                                                    2{$Start       = $StartSqlSession }
                                                                    3{$QueryString = $QueryCommand    }
                                                                    4{$QueryColumn = $QueryColumnName }
                                                                    5{$QueryResult = $NewQuery        }
                                                                    6{$Close       = $CloseSqlSession }
                                                                }
                                                                $FunctionResult = $QueryResult
                                                            }
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $Parameters = Invoke-Command {
                                                                    $SqlDatabaseName  = $CacheModelId
                                                                    $ConnectionString = $CacheData.ConnectionString -replace 'importdatabasename',"$SqlDatabaseName"
                                                                    $QueryCommand     = 'SELECT'+' '+"'"+"$CacheValue"+"'"+' '+'FROM'+' '+"$CacheTableId"
                                                                    $QueryColumnName  = $CacheColumn
                                                                }
                                                                $StartSqlSession = Invoke-Command {
                                                                    $Connection                  = New-Object System.Data.SqlClient.SqlConnection
                                                                    $Connection.ConnectionString = $ConnectionString
                                                                    $Connection.Open()
                                                                }
                                                                $NewQuery = Invoke-Command {
                                                                    $Query               = “$global:queryString"
                                                                    $Command             = $Connection.CreateCommand()
                                                                    $Command.CommandText = $Query
                                                                    $SqlDataReader       = $Command.ExecuteReader()
                                                                    #Fetch data and write out to files
                                                                    while ($SqlDataReader.Read()) {
                                                                        Write-Output $SqlDataReader[$QueryColumn];
                                                                    }
                                                                }
                                                                $CloseSession = Invoke-Command {
                                                                    $Connection.Close()
                                                                    $Connection.Dispose()
                                                                }
                                                                switch (1,2,3,4,5,6){
                                                                    1{$Param       = $Parameters      }
                                                                    2{$Start       = $StartSqlSession }
                                                                    3{$QueryString = $QueryCommand    }
                                                                    4{$QueryColumn = $QueryColumnName }
                                                                    5{$QueryResult = $NewQuery        }
                                                                    6{$Close       = $CloseSqlSession }
                                                                }
                                                                $FunctionResult = $QueryResult
                                                            }
                                                        }
                                                    }
                                                }
                                                'terminal' {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $RepositoryPath   = $CacheTerminal|iex
                                                                $DatabaseList     = $RepositoryPath
                                                                $CacheContent     = $CacheData.Content
                                                                $CacheList        = @()
                                                                $CacheList       += $DatabaseList
                                                                $CacheList       += $CacheContent
                                                                $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheList')|iex
                                                                $FunctionResult = $true
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $RepositoryPath   = $CacheTerminal|iex
                                                                $DatabaseList     = $RepositoryPath
                                                                $CacheArrayList   = $CacheData.ArrayList
                                                                $CacheContent     = $CacheData.Content
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
                                                                            $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheList')|iex
                                                                            $FunctionResult = $true
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
                                                                            $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheList')|iex
                                                                            $FunctionResult = $true
                                                                        }
                                                                        elseif(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -eq 1){
                                                                            if($CacheArrayList -eq 0){
                                                                                $CacheList += $CacheContent
                                                                                $CacheList += $DatabaseList
                                                                                $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheList')|iex
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif($CacheArrayList -gt 0){
                                                                                $num = 0
                                                                                foreach ($Database in $DatabaseList) {
                                                                                    if($num -eq $CacheArrayList){
                                                                                        $CacheList += $CacheContent
                                                                                    }
                                                                                    $CacheList += $Database
                                                                                    $num++
                                                                                }
                                                                                $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheList')|iex
                                                                                $FunctionResult = $true
                                                                            }
                                                                            else{
                                                                                $FunctionResult = $false
                                                                            }
                                                                        }  
                                                                        else{
                                                                            'error'
                                                                        }
                                                                    }
                                                                    else{
                                                                        $ImportToDatabase = ("$CacheTerminal"+'='+'$'+'CacheContent')|iex
                                                                        $FunctionResult = $true
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
                                                'terminal-cachefile' {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CachePath    = $CacheData.Path
                                                                $CacheContent = $CacheData.Content
                                                                $DatabaseDir  = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'
                                                                $DatabasePath = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($CacheContent){
                                                                        $AddContent     = Add-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    if($CacheContent){
                                                                        $NewDir         = New-Item -ItemType Directory $DatabaseDir
                                                                        $NewFile        = New-Item -ItemType File $DatabasePath
                                                                        $AddContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CachePath      = $CacheData.Path
                                                                $CacheContent   = $CacheData.Content
                                                                $DatabaseDir    = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'
                                                                $DatabasePath   = "$CachePath"+"$CachePoint"+'\'+'cache'+'\'+"$CacheModelId"+'\'+"$CacheTableId"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                                                                        $DatabasePathGc = gc $DatabasePath
                                                                        $DatabaseList   = $DatabasePathGc|iex
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

                                                                            $CacheList      = @()
                                                                            if(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Database in $DatabaseList) {
                                                                                    if($num -eq $CacheArrayList){
                                                                                        $CacheList += $CacheContent
                                                                                    }
                                                                                    $CacheList += $Database
                                                                                    $num++
                                                                                }
                                                                                $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            if(($CacheArrayList).Count -gt 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Database in $DatabaseList) {
                                                                                    if($null -ne $($CacheArrayList -like $num)){
                                                                                        $CacheList += $CacheContent[$num]
                                                                                    }
                                                                                    $CacheList += $Database
                                                                                    $num++
                                                                                }
                                                                                $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -eq 1){
                                                                                if($CacheArrayList -eq 0){
                                                                                    $SetContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                                    $AddContent     = Add-Content $DatabasePath -Value $DatabaseList
                                                                                    $FunctionResult = $true
                                                                                }
                                                                                elseif($CacheArrayList -gt 0){
                                                                                    $num = 0
                                                                                    foreach ($Database in $DatabaseList) {
                                                                                        if($num -eq $CacheArrayList){
                                                                                            $CacheList += $CacheContent
                                                                                        }
                                                                                        $CacheList += $Database
                                                                                        $num++
                                                                                    }
                                                                                    $AddContent     = Set-Content $DatabasePath -Value $CacheList
                                                                                    $FunctionResult = $true
                                                                                }
                                                                                else{
                                                                                    $FunctionResult = $false
                                                                                }
                                                                            }  
                                                                            else{
                                                                                $FunctionResult = $false
                                                                            }
                                                                        }
                                                                        else{
                                                                            $AddContent     = Set-Content $DatabasePath -Value $CacheContent
                                                                            $FunctionResult = $true
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                                else{
                                                                    if($CacheContent){
                                                                        $NewDir         = New-Item -ItemType Directory $DatabaseDir
                                                                        $NewFile        = New-Item -ItemType File $DatabasePath
                                                                        $AddContent     = Add-Content $DatabasePath -Value $CacheContent
                                                                        $FunctionResult = $true
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                }
                                                            }
                                                            else{
                                                                $FunctionResult = $false
                                                            }
                                                        }
                                                        else{
                                                            $FunctionResult = $false
                                                        }
                                                    }
                                                    else{
                                                        $FunctionResult = $false
                                                    }
                                                }                                                
                                            }
                                        }End{$FunctionResult}}

# COMMAND SCRIPTBLOCK

$CacheData = @{Path='d:\PSUCA\database\modules\entitycenter\';ArrayList=$null;Content=$null}
$Result    = Get-PSUCA-test_table -CacheMethod 'local' -CacheType 'All' -CachePoint '9b7bf888-4c5f-4ff4-a64a-40cadfebf427' -CacheData $CacheData -Argument_test_item_id 0 
if($result -ne $false -and $result -ne 'null'){
    $Collection = $result|ConvertFrom-Json -Depth 100
    $ItemList   = @()
    $ArrayList  = @()
    $ArrayNum   = 0
    foreach ($Item in $Collection) {
        $ItemList  += $Item
        $ArrayList += $ArrayNum
        $ArrayNum++
    }
    if('' -ne $ItemList){
        $CacheData = @{Path='d:\PSUCA\database\modules\entitycenter\';ArrayList=$ArrayList;Content=$ItemList}
        $Result    = Add-PSUCA-test_table -CacheMethod 'local' -CacheType 'All' -CachePoint '9b7bf888-4c5f-4ff4-a64a-40cadfebf427' -CacheData $CacheData
    }
}
else{
    $Result = $false
}   
$CacheData = @{Path='d:\PSUCA\database\modules\entitycenter\';ArrayList=$null;Content=$null}
$Result    = Get-PSUCA-test_table_002 -CacheMethod 'local' -CacheType 'All' -CachePoint '9b7bf888-4c5f-4ff4-a64a-40cadfebf427' -CacheData $CacheData -Argument_test_item_002_id 0 
if($result -ne $false -and $result -ne 'null'){
    $Collection = $result|ConvertFrom-Json -Depth 100
    $ItemList   = @()
    $ArrayList  = @()
    $ArrayNum   = 0
    foreach ($Item in $Collection) {
        $ItemList  += $Item
        $ArrayList += $ArrayNum
        $ArrayNum++
    }
    if('' -ne $ItemList){
        $CacheData = @{Path='d:\PSUCA\database\modules\entitycenter\';ArrayList=$ArrayList;Content=$ItemList}
        $Result    = Add-PSUCA-test_table_002 -CacheMethod 'local' -CacheType 'All' -CachePoint '9b7bf888-4c5f-4ff4-a64a-40cadfebf427' -CacheData $CacheData
    }
}
else{
    $Result = $false
}   

