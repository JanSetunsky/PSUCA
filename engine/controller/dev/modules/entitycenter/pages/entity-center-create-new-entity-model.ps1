[string]$Session:RecoveryNewGridItemSC = (@'
    New-UDElement -Tag 'tr' -Content {
        New-UDElement -Tag 'td' -Content {
            New-UDLink -Children {
                New-UDElement -Tag 'p' -Content {
                    New-UDTypography -Text 'replacertableitemcontentname' -ClassName 'entity-center-box-grid-inner-title'
                    New-UDStyle -Id 'style-replacertableitemcontentname' -Content {
                        New-UDHtml -Markup '<span class="spanstyle1"></span><span class="spanstyle1space"></span>'
                        New-UDHtml -Markup '<span class="spanstyle2"></span><span class="spanstyle2space"></span>'
                        New-UDHtml -Markup '<span class="spanstyle3"></span><span class="spanstyle3space"></span>'
                        New-UDHtml -Markup '<span class="spanstyle4"></span><span class="spanstyle4space"></span>'
                        New-UDHtml -Markup '<span class="spanstyle5"></span><span class="spanstyle5space"></span>'
                        New-UDHtml -Markup '<span class="spanstyle6"></span><span class="spanstyle6space"></span>'
                        New-UDHtml -Markup '<span class="spanstyle7"></span><span class="spanstyle7space"></span>'
                    } -Style 'none'
                }
            } -OnClick {
                Show-UDModal -Header {
                    New-UDTypography -Text 'Table Item Parameters' -ClassName 'entity-center-box-inner-title'
                } -Content {
                    $TableIdTextbox                 = 'replaceritemuniqueid-TableIdTextBox'
                    $TableItemIndexNumber           = 'replacertableitemindexnumber'
                    $TableItemUniqueId              = 'replacerportableuniqueid'
                    $TableItemNameIdTextbox         = "$TableItemUniqueId"+'-TableItemNameIdTextBox'
                    $TableItemPropertiesIdSelectbox = "$TableItemUniqueId"+'-TableItemPropertiesIdSelectBox'
                    $TableItemForeignKeyIdSelectbox = "$TableItemUniqueId"+'-TableItemForeignKeyIdSelectBox'
                    $TableItemDataTypeIdSelectbox   = "$TableItemUniqueId"+'-TableItemDataTypeIdSelectBox'
                    $TableItemMandatoryIdSelectbox  = "$TableItemUniqueId"+'-TableItemMandatoryIdSelectBox'
                    New-UDElement -Tag 'div' -Content {
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Table Id' -ClassName 'entity-center-box-inner-title'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTextbox -Id $TableIdTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'replaceritemuniqueid' -Disabled 
                                    }
                                }
                            }
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Previous Item Name' -ClassName 'entity-center-box-inner-title'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'replacertableitemcontentname' -Disabled
                                    }
                                }
                            }
                            if('replacertableitemcontentproperties' -eq 1){$PreviousItemProperties = 'Id'}
                            elseif('replacertableitemcontentproperties' -eq 2){$PreviousItemProperties = 'Standard'}
                            elseif('replacertableitemcontentproperties' -eq 3){$PreviousItemProperties = 'Foreign Key'}
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Previous Item Properties' -ClassName 'entity-center-box-inner-title'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTextbox -Type text -ClassName 'entity-center-box-long-text' -Value $PreviousItemProperties -Disabled
                                    }
                                }
                            }
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Previous Foreign Key' -ClassName 'entity-center-box-inner-title'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'replacertableitemkeyproperties' -Disabled
                                    }
                                }
                            }
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Previous Data Type' -ClassName 'entity-center-box-inner-title'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'replacertableitemdatatypeproperties' -Disabled
                                    }
                                }
                            }
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Previous Mandatory' -ClassName 'entity-center-box-inner-title'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'replacertableitemmandatoryproperties' -Disabled
                                    }
                                }
                            }
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Item Name' -ClassName 'entity-center-box-inner-title'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTextbox -Id $TableItemNameIdTextbox -Type text -ClassName 'entity-center-box-long-text'
                                    }
                                }
                            }
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDTypography -Text 'Item Properties' -ClassName 'entity-center-box-inner-title'
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDStyle -Content {
                                            New-UDSelect -Id $TableItemPropertiesIdSelectbox -ClassName 'entity-center-box-properties-long-select' -Option {
                                                New-UDSelectOption -Name ' ' -Value 0
                                                New-UDSelectOption -Name 'Id' -Value 1
                                                New-UDSelectOption -Name 'Standard' -Value 2
                                                New-UDSelectOption -Name 'Foreign Key' -Value 3
                                            } -OnChange {
                                                Sync-UDElement -Id ("$TableItemUniqueId"+'-DynamicDataType')
                                                Sync-UDElement -Id ("$TableItemUniqueId"+'-DynamicForeignKey')
                                                Sync-UDElement -Id ("$TableItemUniqueId"+'-DynamicMandatory')
                                            } -DefaultValue 0
                                        } -Style '
                                            label + .css-1ntzb12 {
                                                margin-top: 0px;
                                            }
                                        '
                                    }
                                }
                            }
                            New-UDDynamic -Id ("$TableItemUniqueId"+'-DynamicForeignKey') -Content {
                                if((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 3){
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Foreign Key' -ClassName 'entity-center-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDStyle -Content {
                                                    New-UDSelect -Id $TableItemForeignKeyIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                        New-UDSelectOption -Name ' ' -Value 0
                                                        if($null -ne $Session:TableDatasets){
                                                            $ForeignKeyList = @()
                                                            foreach ($Dataset in $Session:TableDatasets) {
                                                                if('replacerportableuniqueid' -eq $Dataset.TableId){}
                                                                else{
                                                                    $GetDataSetItemType = $Dataset.ItemType
                                                                    if($GetDataSetItemType -eq 1){
                                                                        $GetDataSetItemName = $Dataset.ItemName
                                                                        if($null -ne $GetDataSetItemName){
                                                                            [array]$ForeignKeyList += $GetDataSetItemName    
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            if($null -ne $ForeignKeyList){
                                                                foreach ($KeyName in $ForeignKeyList) {
                                                                    New-UDSelectOption -Name $KeyName -Value $KeyName
                                                                }
                                                            }
                                                        }
                                                    } -OnChange {

                                                    } -DefaultValue 0
                                                } -Style '
                                                    label + .css-1ntzb12 {
                                                        margin-top: 0px;
                                                    }
                                                '
                                            }
                                        }
                                    }
                                }
                                else{}
                            }
                            New-UDDynamic -Id ("$TableItemUniqueId"+'-DynamicDataType') -Content {
                                if((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 1 -or (Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 3){
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Data Type' -ClassName 'entity-center-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDStyle -Content {
                                                    New-UDSelect -Id $TableItemDataTypeIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                        New-UDSelectOption -Name ' ' -Value 0
                                                        New-UDSelectOption -Name 'Array' -Value 'Array'
                                                        New-UDSelectOption -Name 'Bool' -Value 'Bool'
                                                        New-UDSelectOption -Name 'Byte' -Value 'Byte'
                                                        New-UDSelectOption -Name 'DateTime' -Value 'DateTime'
                                                        New-UDSelectOption -Name 'Decimal' -Value 'Decimal'
                                                        New-UDSelectOption -Name 'Double' -Value 'Double'
                                                        New-UDSelectOption -Name 'Hashtable' -Value 'Hashtable'
                                                        New-UDSelectOption -Name 'Char' -Value 'Char'
                                                        New-UDSelectOption -Name 'Int' -Value 'Int'
                                                        New-UDSelectOption -Name 'Long' -Value 'Long'
                                                        New-UDSelectOption -Name 'Single' -Value 'Single'
                                                        New-UDSelectOption -Name 'String' -Value 'String'                                                                            
                                                        New-UDSelectOption -Name 'Xml' -Value 'Xml'
                                                    } -OnChange {

                                                    } -DefaultValue 'Int' -Disabled
                                                } -Style '
                                                    label + .css-1ntzb12 {
                                                        margin-top: 0px;
                                                    }
                                                '
                                            }
                                        }
                                    }
                                }
                                if((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 2){
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Data Type' -ClassName 'entity-center-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDStyle -Content {
                                                    New-UDSelect -Id $TableItemDataTypeIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                        New-UDSelectOption -Name ' ' -Value 0
                                                        New-UDSelectOption -Name 'Array' -Value 'Array'
                                                        New-UDSelectOption -Name 'Bool' -Value 'Bool'
                                                        New-UDSelectOption -Name 'Byte' -Value 'Byte'
                                                        New-UDSelectOption -Name 'DateTime' -Value 'DateTime'
                                                        New-UDSelectOption -Name 'Decimal' -Value 'Decimal'
                                                        New-UDSelectOption -Name 'Double' -Value 'Double'
                                                        New-UDSelectOption -Name 'Hashtable' -Value 'Hashtable'
                                                        New-UDSelectOption -Name 'Char' -Value 'Char'
                                                        New-UDSelectOption -Name 'Int' -Value 'Int'
                                                        New-UDSelectOption -Name 'Long' -Value 'Long'
                                                        New-UDSelectOption -Name 'Single' -Value 'Single'
                                                        New-UDSelectOption -Name 'String' -Value 'String'                                                                            
                                                        New-UDSelectOption -Name 'Xml' -Value 'Xml'
                                                    } -OnChange {

                                                    } -DefaultValue 0
                                                } -Style '
                                                    label + .css-1ntzb12 {
                                                        margin-top: 0px;
                                                    }
                                                '
                                            }
                                        }
                                    }
                                }
                                else{}
                            }
                            New-UDDynamic -Id ("$TableItemUniqueId"+'-DynamicMandatory') -Content {
                                if((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 2){
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Mandatory' -ClassName 'entity-center-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDStyle -Content {
                                                    New-UDSelect -Id $TableItemMandatoryIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                        New-UDSelectOption -Name ' ' -Value 0
                                                        New-UDSelectOption -Name 'True' -Value 'True'
                                                        New-UDSelectOption -Name 'False' -Value 'False'
                                                    } -OnChange {

                                                    } -DefaultValue 0
                                                } -Style '
                                                    label + .css-1ntzb12 {
                                                        margin-top: 0px;
                                                    }
                                                '
                                            }
                                        }
                                    }
                                }
                                elseif(((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 1) -or ((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 3)){
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Mandatory' -ClassName 'entity-center-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDStyle -Content {
                                                    New-UDSelect -Id $TableItemMandatoryIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                        New-UDSelectOption -Name ' ' -Value 0
                                                        New-UDSelectOption -Name 'True' -Value 'True'
                                                        New-UDSelectOption -Name 'False' -Value 'False'
                                                    } -OnChange {

                                                    } -DefaultValue 'True' -Disabled
                                                } -Style '
                                                    label + .css-1ntzb12 {
                                                        margin-top: 0px;
                                                    }
                                                '
                                            }
                                        }
                                    }
                                }
                            }                            
                            New-UDElement -Tag 'p' -Content {}
                        }
                        New-UDElement -Tag 'table' -Content {
                            New-UDElement -Tag 'tr' -Content {
                                New-UDElement -Tag 'td' -Content {
                                    New-UDButton -Text 'Save properties' -ClassName 'entity-center-box-btn' -OnClick {
                                        $EditItemName       = (Get-UDElement -Id 'replacerportableuniqueid-TableItemNameIdTextBox').Value
                                        $EditItemProperties = (Get-UDElement -Id 'replacerportableuniqueid-TableItemPropertiesIdSelectBox').Value
                                        $EditItemKey        = (Get-UDElement -Id 'replacerportableuniqueid-TableItemForeignKeyIdSelectBox').Value
                                        $EditItemDataType   = (Get-UDElement -Id 'replacerportableuniqueid-TableItemDataTypeIdSelectBox').Value
                                        $EditItemMandatory  = (Get-UDElement -Id 'replacerportableuniqueid-TableItemMandatoryIdSelectBox').Value
                                        if($EditItemName -and $EditItemProperties){
                                            if($EditItemProperties -ne 3){
                                                $EditItemKey = 'None'
                                            }
                                            if($EditItemProperties -eq 1 -or $EditItemProperties -eq 3){
                                                $EditItemDataType  = 'Int'
                                                $EditItemMandatory = $true
                                            }

                                            if(($null -eq $EditItemName -or 0 -eq $EditItemName -or '' -eq $EditItemName) -or ($null -eq $EditItemProperties -or 0 -eq $EditItemProperties -or '' -eq $EditItemProperties) -or ($null -eq $EditItemKey -or 0 -eq $EditItemKey -or '' -eq $EditItemKey) -or ($null -eq $EditItemDataType -or 0 -eq $EditItemDataType -or '' -eq $EditItemDataType) -or ($null -eq $EditItemMandatory -or 0 -eq $EditItemMandatory -or '' -eq $EditItemMandatory)){
                                                Show-UDToast -Message 'Not valid item parameters!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                            }
                                            else{
                                                $ArrayDatasets = @()
                                                foreach ($Dataset in $Session:TableDatasets) {
                                                    if($Dataset.TableId -eq 'replaceritemuniqueid' -and $Dataset.ItemId -eq 'replacerportableuniqueid'){
    
                                                    }
                                                    else{
                                                        $TableDataset = [PSCustomObject]@{
                                                            TableId       = $Dataset.TableId
                                                            ItemId        = $Dataset.ItemId
                                                            ItemName      = $Dataset.ItemName
                                                            ItemType      = $Dataset.ItemType
                                                            ItemTypeKey   = $Dataset.ItemTypeKey
                                                            ItemTypeData  = $Dataset.ItemTypeData
                                                            ItemMandatory = $Dataset.ItemMandatory
                                                        }
                                                        [array]$ArrayDatasets += $TableDataset
                                                    }
                                                }
                                                
                                                $TableDataset = [PSCustomObject]@{
                                                    TableId       = 'replaceritemuniqueid'
                                                    ItemId        = 'replacerportableuniqueid'
                                                    ItemName      = $EditItemName
                                                    ItemType      = $EditItemProperties
                                                    ItemTypeKey   = $EditItemKey
                                                    ItemTypeData  = $EditItemDataType
                                                    ItemMandatory = $EditItemMandatory
                                                }
                                                $Session:TableDatasets         = $null
                                                [array]$Session:TableDatasets += $TableDataset
                                                [array]$Session:TableDatasets += $ArrayDatasets
    
                                                if($null -eq $EditItemProperties){
                                                    $EditItemProperties = 'replacertableitemcontentproperties'
                                                }
                                                $UddynamicUniqueId  = ('GridItemDynamicId'+'replacergriditemdynamicid')
                                                $ReplacerUniqueId   = 'replaceritemuniqueid'
                                                $IndexNumber        = 'replacertableitemindexnumber'
                                                $AddIndexNumber     = 'replaceradditemid'
                                                $String0 = 'replacer'+'tableitemcontentname'
                                                $String1 = 'replacer'+'tableitemcontentproperties'
                                                $String2 = 'replacer'+'tableitemkeyproperties'
                                                $String3 = 'replacer'+'tableitemdatatypeproperties'
                                                $String4 = 'replacer'+'tableitemmandatoryproperties'
                                                $String5 = 'replacer'+'tableitemindexnumber'
                                                $String6 = 'replacer'+'additemid'
                                                $String7 = 'replacer'+'griditemdynamicid'
                                                $String8 = 'replacer'+'portableuniqueid'
                                                $String9 = 'replacer'+'itemuniqueid'
    
                                                [string]$StringGridItemSC = $Session:RecoveryNewGridItemSC
                                                $ReplacerNewGridItemSC    = $StringGridItemSC -replace "$String0","$EditItemName" -replace "$String1","$EditItemProperties" -replace "$String2","$EditItemKey" -replace "$String3","$EditItemDataType" -replace "$String4","$EditItemMandatory" -replace "$String5","$IndexNumber" -replace "$String6","$AddIndexNumber" -replace "$String7","$UddynamicUniqueId" -replace "$String8",'replacerportableuniqueid' -replace "$String9","$ReplacerUniqueId"
    
                                                $NewGridItemSCToJson = $ReplacerNewGridItemSC | ConvertTo-Json -Depth 100
                                                $NewGridItemPSCO     = [PSCustomObject]@{
                                                    IdSC             = 'replaceradditemid'
                                                    ScriptBlock      = $NewGridItemSCToJson
                                                }
    
                                                $GetAddIdSC       = $NewGridItemPSCO.IdSC
                                                $GetIndexAddIdSC  = [array]::indexof((($Session:DatasetGridItemList[$IndexNumber]).items).IdSC,$GetAddIdSC)
                                                ((($Session:DatasetGridItemList[$IndexNumber]).items)[$GetIndexAddIdSC]).ScriptBlock = $NewGridItemPSCO.ScriptBlock
                                            
                                                $Session:InvokeGridItemsSC           = (($Session:DatasetGridItemList[$IndexNumber]).items).ScriptBlock
                                                $Session:CallCreateGridItemCondition = $true
                                                Sync-UDElement -Id $UddynamicUniqueId
                                                Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                            }
                                        }
                                        else{
                                            Show-UDToast -Message 'Not valid item parameters!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                        }
                                        Hide-UDModal
                                    }
                                }
                                New-UDElement -Tag 'td' -Content {
                                    New-UDButton -Text 'Remove Item' -ClassName 'entity-center-box-btn' -OnClick {
                                        $ArrayDatasets = @()
                                        foreach ($Dataset in $Session:TableDatasets) {
                                            if($Dataset.TableId -eq 'replaceritemuniqueid' -and $Dataset.ItemId -eq 'replacerportableuniqueid'){

                                            }
                                            else{
                                                $TableDataset = [PSCustomObject]@{
                                                    TableId       = $Dataset.TableId
                                                    ItemId        = $Dataset.ItemId
                                                    ItemName      = $Dataset.ItemName
                                                    ItemType      = $Dataset.ItemType
                                                    ItemTypeKey   = $Dataset.ItemTypeKey
                                                    ItemTypeData  = $Dataset.ItemTypeData
                                                    ItemMandatory = $Dataset.ItemMandatory
                                                }
                                                [array]$ArrayDatasets += $TableDataset
                                            }
                                        }
                                        $Session:TableDatasets         = $null
                                        [array]$Session:TableDatasets += $ArrayDatasets
                                        $LayoutItemUniqueId   = ('grid-element-'+'replacerlayoutgriditemdynamicid')
                                        $UddynamicUniqueId    = ('GridItemDynamicId'+'replacergriditemdynamicid')
                                        $GetAddIdSC           = 'replaceradditemid'
                                        $Collection           = $Session:DatasetGridItemList
                                        $Counter              = 0
                                        $CollectionCount      = $Collection.Count
                                        $NewTableList         = @()
                                        if($CollectionCount -gt 1){
                                            foreach ($Table in $Collection) {
                                                $CounterItem  = 0
                                                $ItemPSCO     = $null
                                                $TablePSCO    = $null
                                                $NewItemList  = @()
                                                foreach ($Item in ($Table.Items)) {
                                                    if($Item.IdSC -eq $GetAddIdSC){}
                                                    else{
                                                        $ItemPSCO  = [PSCustomObject]@{
                                                            IdSC        = ($Item).IdSC
                                                            ScriptBlock = ($Item).ScriptBlock
                                                        }
                                                        $NewItemList += $ItemPSCO
                                                    }
                                                    $CounterItem++
                                                }
                                                $TablePSCO = [PSCustomObject]@{
                                                    Id    = ($Table).Id
                                                    Items = $NewItemList
                                                }
                                                $NewTableList += $TablePSCO
                                                $Counter++
                                            }
                                        }
                                        elseif($CollectionCount -eq 1){
                                            $CounterItem  = 0
                                            $ItemPSCO     = $null
                                            $TablePSCO    = $null
                                            $NewItemList  = @()
                                            foreach ($Item in ($Collection.Items)) {
                                                if($Item.IdSC -eq $GetAddIdSC){}
                                                else{
                                                    $ItemPSCO  = [PSCustomObject]@{
                                                        IdSC        = ($Item).IdSC
                                                        ScriptBlock = ($Item).ScriptBlock
                                                    }
                                                    $NewItemList += $ItemPSCO
                                                }
                                                $CounterItem++
                                            }
                                            $TablePSCO = [PSCustomObject]@{
                                                Id    = $Collection.Id
                                                Items = $NewItemList
                                            }
                                            $NewTableList += $TablePSCO
                                                                                                            
                                        }
                                        else{
                                                                                                            
                                        }
                                                                                                            
                                        if($Session:DatasetGridItemList.Items -eq $null){
                                            $Session:CallCreateGridItemCondition = $false
                                        }
                                        else{
                                            $Session:CallCreateGridItemCondition = $true
                                        }
                                        [array]$Session:DatasetGridItemList = $NewTableList
                                        $Session:LayoutChangeDecreaseSC|iex
                                        Sync-UDElement -Id $UddynamicUniqueId
                                        Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                        Hide-UDModal
                                    }
                                }
                            }
                        }
                    }
                    Sync-UDElement -Id ("$TableItemUniqueId"+'-DynamicDataType')
                    Sync-UDElement -Id ("$TableItemUniqueId"+'-DynamicForeignKey')
                    Sync-UDElement -Id ("$TableItemUniqueId"+'-DynamicMandatory')
                } -Footer {
                    New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {Hide-UDModal}
                }
            }
        }
    }
'@)

[string]$Session:LayoutRemoveSC = {

    $LayoutItemUniqueId  = ('grid-element-'+$ItemUniqueId)
    $LayoutIndexNumById  = [array]::indexof((($Session:GridItemLayoutList.lg).i),$LayoutItemUniqueId)
                                                               
    $NewLayoutList = @()
    $Collection = $Session:GridItemLayoutList
    $num = 0
    foreach ($LayoutItem in $collection) {
        if($num -eq $LayoutIndexNumById){}
        else{
            $NewLayoutList += $LayoutItem
        }
        $num++
    }
    $Session:GridItemLayoutList = $NewLayoutList
                                                            

    $GridItemLayoutListCount            = $Session:GridItemLayoutList.Count
    if($GridItemLayoutListCount -gt 1){
        $Collection   = $Session:GridItemLayoutList
        $Num = 0
        foreach ($LayoutItem in $Collection) {
            $LayoutItemLgJson = $LayoutItem.lg|ConvertTo-Json -Depth 100
            $LayoutItemMdJson = $LayoutItem.md|ConvertTo-Json -Depth 100
            $LayoutItemSmJson = $LayoutItem.sm|ConvertTo-Json -Depth 100
            $LayoutItemXsJson = $LayoutItem.xs|ConvertTo-Json -Depth 100
            # LG SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemLgJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'lg'+'"'+':'+'['+$LayoutItemLgJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemLgJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringLg += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringLg += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringLg += ','+$LayoutStringEnd
            }

            # MD SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemMdJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'md'+'"'+':'+'['+$LayoutItemMdJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemMdJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringMd += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringMd += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringMd += ','+$LayoutStringEnd
            }                                                

            # SM SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemSmJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'sm'+'"'+':'+'['+$LayoutItemSmJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemSmJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringSm += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringSm += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringSm += ','+$LayoutStringEnd
            }

            # XS SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemXsJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'xs'+'"'+':'+'['+$LayoutItemXsJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemXsJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringXs += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringXs += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringXs += ','+$LayoutStringEnd
            }                                                

            $Num++
        }

        [string]$LayoutStringBuilder = '{'+"$LayoutStringLg"+','+"$LayoutStringMd"+','+"$LayoutStringSm"+','+"$LayoutStringXs"+'}'

        $Session:CreateGritLayoutJson = $LayoutStringBuilder -replace '\s',''
    }
    elseif($GridItemLayoutListCount -eq 1){
        $LayoutIndexNumById  = 0
        $GetActualLayoutList = $Session:GridItemLayoutList
        # LG SIZE
        [int]$LayoutByUniqueIdLgW      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).w
        [int]$LayoutByUniqueIdLgH      = ((($GetActualLayoutList[$LayoutIndexNumById]).lg).h)
        [int]$LayoutByUniqueIdLgX      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).x
        [int]$LayoutByUniqueIdLgY      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).y
        [string]$LayoutByUniqueIdLgI      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).i
        [string]$LayoutByUniqueIdLgMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).lg).moved).ToString()).ToLower()
        [string]$LayoutByUniqueIdLgStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).lg).static).ToString()).ToLower()
                                                                    
        # MD SIZE
        [int]$LayoutByUniqueIdMdW      = (($GetActualLayoutList[$LayoutIndexNumById]).md).w
        [int]$LayoutByUniqueIdMdH      = ((($GetActualLayoutList[$LayoutIndexNumById]).md).h)
        [int]$LayoutByUniqueIdMdX      = (($GetActualLayoutList[$LayoutIndexNumById]).md).x
        [int]$LayoutByUniqueIdMdY      = (($GetActualLayoutList[$LayoutIndexNumById]).md).y
        [string]$LayoutByUniqueIdMdI      = (($GetActualLayoutList[$LayoutIndexNumById]).md).i
        [string]$LayoutByUniqueIdMdMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).md).moved).ToString()).ToLower()
        [string]$LayoutByUniqueIdMdStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).md).static).ToString()).ToLower()

        # SM SIZE
        [int]$LayoutByUniqueIdSmW      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).w
        [int]$LayoutByUniqueIdSmH      = ((($GetActualLayoutList[$LayoutIndexNumById]).sm).h)
        [int]$LayoutByUniqueIdSmX      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).x
        [int]$LayoutByUniqueIdSmY      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).y
        [string]$LayoutByUniqueIdSmI      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).i
        [string]$LayoutByUniqueIdSmMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).sm).moved).ToString()).ToLower()
        [string]$LayoutByUniqueIdSmStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).sm).static).ToString()).ToLower()

        # XS SIZE
        [int]$LayoutByUniqueIdXsW      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).w
        [int]$LayoutByUniqueIdXsH      = ((($GetActualLayoutList[$LayoutIndexNumById]).xs).h)
        [int]$LayoutByUniqueIdXsX      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).x
        [int]$LayoutByUniqueIdXsY      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).y
        [string]$LayoutByUniqueIdXsI      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).i
        [string]$LayoutByUniqueIdXsMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).xs).moved).ToString()).ToLower()
        [string]$LayoutByUniqueIdXsStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).xs).static).ToString()).ToLower()

        # SIZE BUILDER
        $NewGridItemLayoutJson = '{'+'"'+'lg'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdLgW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdLgH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdLgX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdLgY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdLgI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdLgMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdLgStatic"+'}'+']'+
                                ','+'"'+'md'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdMdW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdMdH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdMdX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdMdY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdMdI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdMdMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdMdStatic"+'}'+']'+
                                ','+'"'+'sm'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdSmW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdSmH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdSmX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdSmY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdSmI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdSmMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdSmStatic"+'}'+']'+
                                ','+'"'+'xs'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdXsW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdXsH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdXsX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdXsY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdXsI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdXsMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdXsStatic"+'}'+']'+'}'

        $Session:CreateGritLayoutJson = $NewGridItemLayoutJson
    }
    else{
        Show-UDToast -Message 'Layout is empty!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
    }
}

[string]$Session:LayoutChangeIncreaseSC = {
    $LayoutItemUniqueId  = ('grid-element-'+$ItemUniqueId)
    $GetActualLayoutList = $Session:GridItemLayoutList
    $LayoutByUniqueIdLg  = $GetActualLayoutList.lg | ? {$_.i -eq $LayoutItemUniqueId}
    $LayoutByUniqueIdMd  = $GetActualLayoutList.md | ? {$_.i -eq $LayoutItemUniqueId}
    $LayoutByUniqueIdSm  = $GetActualLayoutList.sm | ? {$_.i -eq $LayoutItemUniqueId}
    $LayoutByUniqueIdXs  = $GetActualLayoutList.xs | ? {$_.i -eq $LayoutItemUniqueId}
    $LayoutIndexNumById  = [array]::indexof((($GetActualLayoutList.lg).i),$LayoutItemUniqueId)

    # LG SIZE
    [int]$LayoutByUniqueIdLgW      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).w
    [int]$LayoutByUniqueIdLgH      = ((($GetActualLayoutList[$LayoutIndexNumById]).lg).h) + 1
    [int]$LayoutByUniqueIdLgX      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).x
    [int]$LayoutByUniqueIdLgY      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).y
    [string]$LayoutByUniqueIdLgI      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).i
    [string]$LayoutByUniqueIdLgMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).lg).moved).ToString()).ToLower()
    [string]$LayoutByUniqueIdLgStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).lg).static).ToString()).ToLower()
                                                                
    # MD SIZE
    [int]$LayoutByUniqueIdMdW      = (($GetActualLayoutList[$LayoutIndexNumById]).md).w
    [int]$LayoutByUniqueIdMdH      = ((($GetActualLayoutList[$LayoutIndexNumById]).md).h) + 1
    [int]$LayoutByUniqueIdMdX      = (($GetActualLayoutList[$LayoutIndexNumById]).md).x
    [int]$LayoutByUniqueIdMdY      = (($GetActualLayoutList[$LayoutIndexNumById]).md).y
    [string]$LayoutByUniqueIdMdI      = (($GetActualLayoutList[$LayoutIndexNumById]).md).i
    [string]$LayoutByUniqueIdMdMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).md).moved).ToString()).ToLower()
    [string]$LayoutByUniqueIdMdStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).md).static).ToString()).ToLower()

    # SM SIZE
    [int]$LayoutByUniqueIdSmW      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).w
    [int]$LayoutByUniqueIdSmH      = ((($GetActualLayoutList[$LayoutIndexNumById]).sm).h) + 1
    [int]$LayoutByUniqueIdSmX      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).x
    [int]$LayoutByUniqueIdSmY      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).y
    [string]$LayoutByUniqueIdSmI      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).i
    [string]$LayoutByUniqueIdSmMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).sm).moved).ToString()).ToLower()
    [string]$LayoutByUniqueIdSmStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).sm).static).ToString()).ToLower()

    # XS SIZE
    [int]$LayoutByUniqueIdXsW      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).w
    [int]$LayoutByUniqueIdXsH      = ((($GetActualLayoutList[$LayoutIndexNumById]).xs).h) + 1
    [int]$LayoutByUniqueIdXsX      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).x
    [int]$LayoutByUniqueIdXsY      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).y
    [string]$LayoutByUniqueIdXsI      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).i
    [string]$LayoutByUniqueIdXsMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).xs).moved).ToString()).ToLower()
    [string]$LayoutByUniqueIdXsStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).xs).static).ToString()).ToLower()

    # SIZE BUILDER
    $NewGridItemLayoutJson = '{'+'"'+'lg'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdLgW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdLgH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdLgX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdLgY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdLgI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdLgMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdLgStatic"+'}'+']'+
                             ','+'"'+'md'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdMdW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdMdH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdMdX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdMdY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdMdI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdMdMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdMdStatic"+'}'+']'+
                             ','+'"'+'sm'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdSmW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdSmH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdSmX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdSmY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdSmI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdSmMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdSmStatic"+'}'+']'+
                             ','+'"'+'xs'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdXsW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdXsH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdXsX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdXsY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdXsI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdXsMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdXsStatic"+'}'+']'+'}'
    $ConvertGridItemLayoutFromJson = $NewGridItemLayoutJson | ConvertFrom-Json -Depth 100
                                                                
    $NewLayoutList = @()
    $Collection = $Session:GridItemLayoutList
    $num = 0
    foreach ($LayoutItem in $collection) {
        if($num -eq $LayoutIndexNumById){
            $NewLayoutList += $ConvertGridItemLayoutFromJson
        }
        else{
            $NewLayoutList += $LayoutItem
        }
        $num++
    }
    $Session:GridItemLayoutList = $NewLayoutList
                                                            

    $GridItemLayoutListCount            = $Session:GridItemLayoutList.Count
    if($GridItemLayoutListCount -gt 1){
        $Collection   = $Session:GridItemLayoutList
        $Num = 0
        foreach ($LayoutItem in $Collection) {
            $LayoutItemLgJson = $LayoutItem.lg|ConvertTo-Json -Depth 100
            $LayoutItemMdJson = $LayoutItem.md|ConvertTo-Json -Depth 100
            $LayoutItemSmJson = $LayoutItem.sm|ConvertTo-Json -Depth 100
            $LayoutItemXsJson = $LayoutItem.xs|ConvertTo-Json -Depth 100
            # LG SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemLgJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'lg'+'"'+':'+'['+$LayoutItemLgJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemLgJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringLg += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringLg += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringLg += ','+$LayoutStringEnd
            }

            # MD SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemMdJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'md'+'"'+':'+'['+$LayoutItemMdJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemMdJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringMd += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringMd += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringMd += ','+$LayoutStringEnd
            }                                                

            # SM SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemSmJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'sm'+'"'+':'+'['+$LayoutItemSmJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemSmJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringSm += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringSm += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringSm += ','+$LayoutStringEnd
            }

            # XS SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemXsJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'xs'+'"'+':'+'['+$LayoutItemXsJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemXsJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringXs += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringXs += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringXs += ','+$LayoutStringEnd
            }                                                

            $Num++
        }

        [string]$LayoutStringBuilder = '{'+"$LayoutStringLg"+','+"$LayoutStringMd"+','+"$LayoutStringSm"+','+"$LayoutStringXs"+'}'

        $Session:CreateGritLayoutJson = $LayoutStringBuilder -replace '\s',''
    }
    elseif($GridItemLayoutListCount -eq 1){
        $Session:CreateGritLayoutJson = $NewGridItemLayoutJson
    }
    else{
        Show-UDToast -Message 'Not valid layout!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
    }
}

[string]$Session:LayoutChangeDecreaseSC = {
    
    $GetActualLayoutList = $Session:GridItemLayoutList
    $LayoutByUniqueIdLg  = $GetActualLayoutList.lg | ? {$_.i -eq $LayoutItemUniqueId}
    $LayoutByUniqueIdMd  = $GetActualLayoutList.md | ? {$_.i -eq $LayoutItemUniqueId}
    $LayoutByUniqueIdSm  = $GetActualLayoutList.sm | ? {$_.i -eq $LayoutItemUniqueId}
    $LayoutByUniqueIdXs  = $GetActualLayoutList.xs | ? {$_.i -eq $LayoutItemUniqueId}
    $LayoutIndexNumById  = [array]::indexof((($GetActualLayoutList.lg).i),$LayoutItemUniqueId)

    # LG SIZE
    [int]$LayoutByUniqueIdLgW      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).w
    [int]$LayoutByUniqueIdLgH      = ((($GetActualLayoutList[$LayoutIndexNumById]).lg).h) - 1
    [int]$LayoutByUniqueIdLgX      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).x
    [int]$LayoutByUniqueIdLgY      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).y
    [string]$LayoutByUniqueIdLgI      = (($GetActualLayoutList[$LayoutIndexNumById]).lg).i
    [string]$LayoutByUniqueIdLgMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).lg).moved).ToString()).ToLower()
    [string]$LayoutByUniqueIdLgStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).lg).static).ToString()).ToLower()
                                                                
    # MD SIZE
    [int]$LayoutByUniqueIdMdW      = (($GetActualLayoutList[$LayoutIndexNumById]).md).w
    [int]$LayoutByUniqueIdMdH      = ((($GetActualLayoutList[$LayoutIndexNumById]).md).h) - 1
    [int]$LayoutByUniqueIdMdX      = (($GetActualLayoutList[$LayoutIndexNumById]).md).x
    [int]$LayoutByUniqueIdMdY      = (($GetActualLayoutList[$LayoutIndexNumById]).md).y
    [string]$LayoutByUniqueIdMdI      = (($GetActualLayoutList[$LayoutIndexNumById]).md).i
    [string]$LayoutByUniqueIdMdMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).md).moved).ToString()).ToLower()
    [string]$LayoutByUniqueIdMdStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).md).static).ToString()).ToLower()

    # SM SIZE
    [int]$LayoutByUniqueIdSmW      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).w
    [int]$LayoutByUniqueIdSmH      = ((($GetActualLayoutList[$LayoutIndexNumById]).sm).h) - 1
    [int]$LayoutByUniqueIdSmX      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).x
    [int]$LayoutByUniqueIdSmY      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).y
    [string]$LayoutByUniqueIdSmI      = (($GetActualLayoutList[$LayoutIndexNumById]).sm).i
    [string]$LayoutByUniqueIdSmMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).sm).moved).ToString()).ToLower()
    [string]$LayoutByUniqueIdSmStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).sm).static).ToString()).ToLower()

    # XS SIZE
    [int]$LayoutByUniqueIdXsW      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).w
    [int]$LayoutByUniqueIdXsH      = ((($GetActualLayoutList[$LayoutIndexNumById]).xs).h) - 1
    [int]$LayoutByUniqueIdXsX      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).x
    [int]$LayoutByUniqueIdXsY      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).y
    [string]$LayoutByUniqueIdXsI      = (($GetActualLayoutList[$LayoutIndexNumById]).xs).i
    [string]$LayoutByUniqueIdXsMoved  = (((($GetActualLayoutList[$LayoutIndexNumById]).xs).moved).ToString()).ToLower()
    [string]$LayoutByUniqueIdXsStatic = (((($GetActualLayoutList[$LayoutIndexNumById]).xs).static).ToString()).ToLower()

    # SIZE BUILDER
    $NewGridItemLayoutJson = '{'+'"'+'lg'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdLgW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdLgH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdLgX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdLgY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdLgI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdLgMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdLgStatic"+'}'+']'+
                             ','+'"'+'md'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdMdW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdMdH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdMdX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdMdY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdMdI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdMdMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdMdStatic"+'}'+']'+
                             ','+'"'+'sm'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdSmW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdSmH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdSmX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdSmY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdSmI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdSmMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdSmStatic"+'}'+']'+
                             ','+'"'+'xs'+'"'+':'+'['+'{'+'"'+'w'+'"'+':'+"$LayoutByUniqueIdXsW"+','+'"'+'h'+'"'+':'+"$LayoutByUniqueIdXsH"+','+'"'+'x'+'"'+':'+"$LayoutByUniqueIdXsX"+','+'"'+'y'+'"'+':'+"$LayoutByUniqueIdXsY"+','+'"'+'i'+'"'+':'+'"'+"$LayoutByUniqueIdXsI"+'"'+','+'"'+'moved'+'"'+':'+"$LayoutByUniqueIdXsMoved"+','+'"'+'static'+'"'+':'+"$LayoutByUniqueIdXsStatic"+'}'+']'+'}'
    $ConvertGridItemLayoutFromJson = $NewGridItemLayoutJson | ConvertFrom-Json -Depth 100
                                                                
    $NewLayoutList = @()
    $Collection = $Session:GridItemLayoutList
    $num = 0
    foreach ($LayoutItem in $collection) {
        if($num -eq $LayoutIndexNumById){
            $NewLayoutList += $ConvertGridItemLayoutFromJson
        }
        else{
            $NewLayoutList += $LayoutItem
        }
        $num++
    }
    $Session:GridItemLayoutList = $NewLayoutList
                                                            

    $GridItemLayoutListCount            = $Session:GridItemLayoutList.Count
    if($GridItemLayoutListCount -gt 1){
        $Collection   = $Session:GridItemLayoutList
        $Num = 0
        foreach ($LayoutItem in $Collection) {
            $LayoutItemLgJson = $LayoutItem.lg|ConvertTo-Json -Depth 100
            $LayoutItemMdJson = $LayoutItem.md|ConvertTo-Json -Depth 100
            $LayoutItemSmJson = $LayoutItem.sm|ConvertTo-Json -Depth 100
            $LayoutItemXsJson = $LayoutItem.xs|ConvertTo-Json -Depth 100
            # LG SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemLgJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'lg'+'"'+':'+'['+$LayoutItemLgJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemLgJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringLg += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringLg += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringLg += ','+$LayoutStringEnd
            }

            # MD SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemMdJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'md'+'"'+':'+'['+$LayoutItemMdJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemMdJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringMd += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringMd += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringMd += ','+$LayoutStringEnd
            }                                                

            # SM SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemSmJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'sm'+'"'+':'+'['+$LayoutItemSmJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemSmJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringSm += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringSm += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringSm += ','+$LayoutStringEnd
            }

            # XS SIZE
            if($Num -eq ($GridItemLayoutListCount-1)){
                [string]$LayoutStringEnd = $LayoutItemXsJson+']'
                $LayoutCondition = 'end'
            }
            elseif($Num -eq 0){
                [string]$LayoutStringStart = '"'+'xs'+'"'+':'+'['+$LayoutItemXsJson
                $LayoutCondition = 'start'
            }
            else{
                [string]$LayoutStringMid = $LayoutItemXsJson
                $LayoutCondition = 'mid'
            }

            if($LayoutCondition -eq 'start'){
                [string]$LayoutStringXs += $LayoutStringStart
            }
            elseif($LayoutCondition -eq 'mid'){
                [string]$LayoutStringXs += ','+$LayoutStringMid
            }
            elseif($LayoutCondition -eq 'end'){
                [string]$LayoutStringXs += ','+$LayoutStringEnd
            }                                                

            $Num++
        }

        [string]$LayoutStringBuilder = '{'+"$LayoutStringLg"+','+"$LayoutStringMd"+','+"$LayoutStringSm"+','+"$LayoutStringXs"+'}'

        $Session:CreateGritLayoutJson = $LayoutStringBuilder -replace '\s',''
    }
    elseif($GridItemLayoutListCount -eq 1){
        $Session:CreateGritLayoutJson = $NewGridItemLayoutJson
    }
    else{
        Show-UDToast -Message 'Not valid layout!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
    }
}

$Session:GridItemSC = {

    $TablePSCO = [PSCustomObject]@{
        Id    = 'importitemuniqueid'
        Items = $null
    }
    [array]$Session:DatasetGridItemList += $TablePSCO

    $GetGritItemIndexById   = [array]::indexof(($Session:GridItemListPSCO).Id,'importitemuniqueid')
    $GetGritItemDataByIndex = $Session:GridItemListPSCO[$GetGritItemIndexById]
    $ModelTableName         = $GetGritItemDataByIndex.Name

    New-UDGrid -Id 'importitemuniqueid' -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
        New-UDPaper -ClassName "entity-center-box-layout-grid" -Square -Content {
            New-UDRow -Columns {
                New-UDStyle -Content {
                    New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                        New-UDStyle -Content {
                            New-UDElement -Tag 'div' -Content {
                                New-UDLink -ClassName 'entity-center-box-logo-table-grid-link-plus' -Children {
                                    New-UDIcon -Icon Plus -Border -Size '1x' -ClassName 'entity-center-box-logo-table-grid-plus'
                                } -OnClick {
                                    $ItemUniqueId = 'importitemuniqueid'
                                    Show-UDModal -Header {
                                        New-UDTypography -Text 'Create New Entity Table Item' -ClassName 'entity-center-box-inner-title'
                                    } -Content {
                                        $TableIdTextbox                 = 'importitemuniqueid-TableIdTextBox'
                                        $NewTableItemUniqueId           = ([guid]::NewGuid()).Guid
                                        $TableItemNameIdTextbox         = "$NewTableItemUniqueId"+'-TableItemNameIdTextBox'
                                        $TableItemPropertiesIdSelectbox = "$NewTableItemUniqueId"+'-TableItemPropertiesIdSelectBox'
                                        $TableItemForeignKeyIdSelectbox = "$NewTableItemUniqueId"+'-TableItemForeignKeyIdSelectBox'
                                        $TableItemDataTypeIdSelectbox   = "$NewTableItemUniqueId"+'-TableItemDataTypeIdSelectBox'
                                        $TableItemMandatoryIdSelectbox  = "$NewTableItemUniqueId"+'-TableItemMandatoryIdSelectBox'
                                        New-UDElement -Tag 'div' -Content {
                                            New-UDElement -Tag 'table' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTypography -Text 'Table Id' -ClassName 'entity-center-box-inner-title'
                                                        }
                                                    }
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTextbox -Id $TableIdTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'importitemuniqueid' -Disabled 
                                                        }
                                                    }
                                                }
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTypography -Text 'Item Name' -ClassName 'entity-center-box-inner-title'
                                                        }
                                                    }
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTextbox -Id $TableItemNameIdTextbox -Type text -ClassName 'entity-center-box-long-text'
                                                        }
                                                    }
                                                }
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTypography -Text 'Item Properties' -ClassName 'entity-center-box-inner-title'
                                                        }
                                                    }
                                                    $Session:TableItemPropertiesIdSelectboxResult = 1
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDStyle -Content {
                                                                New-UDSelect -Id $TableItemPropertiesIdSelectbox -ClassName 'entity-center-box-properties-long-select' -Option {
                                                                    New-UDSelectOption -Name ' ' -Value 0
                                                                    New-UDSelectOption -Name 'Id' -Value 1
                                                                    New-UDSelectOption -Name 'Specific Type' -Value 2
                                                                    New-UDSelectOption -Name 'Foreign Key' -Value 3
                                                                } -OnChange {
                                                                    Sync-UDElement -Id ("$NewTableItemUniqueId"+'-DynamicForeignKey')
                                                                    Sync-UDElement -Id ("$NewTableItemUniqueId"+'-DynamicDataType')
                                                                    Sync-UDElement -Id ("$NewTableItemUniqueId"+'-DynamicMandatory')
                                                                } -DefaultValue 0
                                                            } -Style '
                                                                label + .css-1ntzb12 {
                                                                    margin-top: 0px;
                                                                }
                                                            '
                                                        }
                                                    }
                                                }
                                                New-UDDynamic -Id ("$NewTableItemUniqueId"+'-DynamicForeignKey') -Content {
                                                    if((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 3){
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDTypography -Text 'Foreign Key' -ClassName 'entity-center-box-inner-title'
                                                                }
                                                            }
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDStyle -Content {
                                                                        New-UDSelect -Id $TableItemForeignKeyIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                            New-UDSelectOption -Name ' ' -Value 0
                                                                            if($null -ne $Session:TableDatasets){
                                                                                $ForeignKeyList = @()
                                                                                foreach ($Dataset in $Session:TableDatasets) {
                                                                                    if('importitemuniqueid' -eq $Dataset.TableId){}
                                                                                    else{
                                                                                        $GetDataSetItemType = $Dataset.ItemType
                                                                                        if($GetDataSetItemType -eq 1){
                                                                                            $GetDataSetItemName = $Dataset.ItemName
                                                                                            if($null -ne $GetDataSetItemName){
                                                                                                [array]$ForeignKeyList += $GetDataSetItemName    
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                                if($null -ne $ForeignKeyList){
                                                                                    foreach ($KeyName in $ForeignKeyList) {
                                                                                        New-UDSelectOption -Name $KeyName -Value $KeyName
                                                                                    }
                                                                                }
                                                                            }
                                                                        } -OnChange {

                                                                        } -DefaultValue 0
                                                                    } -Style '
                                                                        label + .css-1ntzb12 {
                                                                            margin-top: 0px;
                                                                        }
                                                                    '
                                                                }
                                                            }
                                                        }
                                                    }
                                                    else{}
                                                }
                                                New-UDDynamic -Id ("$NewTableItemUniqueId"+'-DynamicDataType') -Content {
                                                    if((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 1 -or (Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 3){
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDTypography -Text 'Data Type' -ClassName 'entity-center-box-inner-title'
                                                                }
                                                            }
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDStyle -Content {
                                                                        New-UDSelect -Id $TableItemDataTypeIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                            New-UDSelectOption -Name ' ' -Value 0
                                                                            New-UDSelectOption -Name 'Array' -Value 'Array'
                                                                            New-UDSelectOption -Name 'Bool' -Value 'Bool'
                                                                            New-UDSelectOption -Name 'Byte' -Value 'Byte'
                                                                            New-UDSelectOption -Name 'DateTime' -Value 'DateTime'
                                                                            New-UDSelectOption -Name 'Decimal' -Value 'Decimal'
                                                                            New-UDSelectOption -Name 'Double' -Value 'Double'
                                                                            New-UDSelectOption -Name 'Hashtable' -Value 'Hashtable'
                                                                            New-UDSelectOption -Name 'Char' -Value 'Char'
                                                                            New-UDSelectOption -Name 'Int' -Value 'Int'
                                                                            New-UDSelectOption -Name 'Long' -Value 'Long'
                                                                            New-UDSelectOption -Name 'Single' -Value 'Single'
                                                                            New-UDSelectOption -Name 'String' -Value 'String'                                                                            
                                                                            New-UDSelectOption -Name 'Xml' -Value 'Xml'
                                                                        } -OnChange {

                                                                        } -DefaultValue 'Int' -Disabled
                                                                    } -Style '
                                                                        label + .css-1ntzb12 {
                                                                            margin-top: 0px;
                                                                        }
                                                                    '
                                                                }
                                                            }
                                                        }
                                                    }
                                                    elseif((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 2){
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDTypography -Text 'Data Type' -ClassName 'entity-center-box-inner-title'
                                                                }
                                                            }
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDStyle -Content {
                                                                        New-UDSelect -Id $TableItemDataTypeIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                            New-UDSelectOption -Name ' ' -Value 0
                                                                            New-UDSelectOption -Name 'Array' -Value 'Array'
                                                                            New-UDSelectOption -Name 'Bool' -Value 'Bool'
                                                                            New-UDSelectOption -Name 'Byte' -Value 'Byte'
                                                                            New-UDSelectOption -Name 'DateTime' -Value 'DateTime'
                                                                            New-UDSelectOption -Name 'Decimal' -Value 'Decimal'
                                                                            New-UDSelectOption -Name 'Double' -Value 'Double'
                                                                            New-UDSelectOption -Name 'Hashtable' -Value 'Hashtable'
                                                                            New-UDSelectOption -Name 'Char' -Value 'Char'
                                                                            New-UDSelectOption -Name 'Int' -Value 'Int'
                                                                            New-UDSelectOption -Name 'Long' -Value 'Long'
                                                                            New-UDSelectOption -Name 'Single' -Value 'Single'
                                                                            New-UDSelectOption -Name 'String' -Value 'String'                                                                            
                                                                            New-UDSelectOption -Name 'Xml' -Value 'Xml'
                                                                        } -OnChange {

                                                                        } -DefaultValue 0
                                                                    } -Style '
                                                                        label + .css-1ntzb12 {
                                                                            margin-top: 0px;
                                                                        }
                                                                    '
                                                                }
                                                            }
                                                        }
                                                    }
                                                    else{}
                                                }
                                                New-UDDynamic -Id ("$NewTableItemUniqueId"+'-DynamicMandatory') -Content {
                                                    if((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 2){
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDTypography -Text 'Mandatory' -ClassName 'entity-center-box-inner-title'
                                                                }
                                                            }
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDStyle -Content {
                                                                        New-UDSelect -Id $TableItemMandatoryIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                            New-UDSelectOption -Name ' ' -Value 0
                                                                            New-UDSelectOption -Name 'True' -Value 'True'
                                                                            New-UDSelectOption -Name 'False' -Value 'False'
                                                                        } -OnChange {

                                                                        } -DefaultValue 0
                                                                    } -Style '
                                                                        label + .css-1ntzb12 {
                                                                            margin-top: 0px;
                                                                        }
                                                                    '
                                                                }
                                                            }
                                                        }
                                                    }
                                                    elseif(((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 1) -or ((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 3)){
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDTypography -Text 'Mandatory' -ClassName 'entity-center-box-inner-title'
                                                                }
                                                            }
                                                            New-UDElement -Tag 'td' -Content {
                                                                New-UDElement -Tag 'tr' -Content {
                                                                    New-UDStyle -Content {
                                                                        New-UDSelect -Id $TableItemMandatoryIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                            New-UDSelectOption -Name ' ' -Value 0
                                                                            New-UDSelectOption -Name 'True' -Value 'True'
                                                                            New-UDSelectOption -Name 'False' -Value 'False'
                                                                        } -OnChange {

                                                                        } -DefaultValue 'True' -Disabled
                                                                    } -Style '
                                                                        label + .css-1ntzb12 {
                                                                            margin-top: 0px;
                                                                        }
                                                                    '
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                New-UDElement -Tag 'p' -Content {}                                                
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDButton -Text 'Add item' -ClassName 'entity-center-box-btn' -OnClick {
                                                            $TableItemName       = (Get-UDElement -Id $TableItemNameIdTextbox).Value
                                                            $TableItemProperties = (Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value
                                                            $TableItemKey        = (Get-UDElement -Id $TableItemForeignKeyIdSelectbox).Value
                                                            $TableItemDataType   = (Get-UDElement -Id $TableItemDataTypeIdSelectbox).Value
                                                            $TableItemMandatory  = (Get-UDElement -Id $TableItemMandatoryIdSelectbox).Value
                                                            
                                                            if($TableItemName -and $TableItemProperties){
                                                                if($TableItemProperties -ne 3){
                                                                    $TableItemKey = 'None'
                                                                }
                                                                if($TableItemProperties -eq 1 -or $TableItemProperties -eq 3){
                                                                    $TableItemDataType  = 'Int'
                                                                    $TableItemMandatory = $true
                                                                }

                                                                if(($null -eq $TableItemName -or 0 -eq $TableItemName -or '' -eq $TableItemName) -or ($null -eq $TableItemProperties -or 0 -eq $TableItemProperties -or '' -eq $TableItemProperties) -or ($null -eq $TableItemKey -or 0 -eq $TableItemKey -or '' -eq $TableItemKey) -or ($null -eq $TableItemDataType -or 0 -eq $TableItemDataType -or '' -eq $TableItemDataType) -or ($null -eq $TableItemMandatory -or 0 -eq $TableItemMandatory -or '' -eq $TableItemMandatory)){
                                                                    Show-UDToast -Message 'Not valid item parameters!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                }
                                                                else{
                                                                    $TableDataset = [PSCustomObject]@{
                                                                        TableId       = 'importitemuniqueid'
                                                                        ItemId        = $NewTableItemUniqueId
                                                                        ItemName      = $TableItemName
                                                                        ItemType      = $TableItemProperties
                                                                        ItemTypeKey   = $TableItemKey
                                                                        ItemTypeData  = $TableItemDataType
                                                                        ItemMandatory = $TableItemMandatory
                                                                    }
                                                                    [array]$Session:TableDatasets += $TableDataset
                                                                    
                                                                    
                                                                    $Session:LayoutChangeIncreaseSC|iex
                                                                    $GetIndexNumber  = [array]::indexof($Session:DatasetGridItemList.id,$ItemUniqueId)
                                                                    $AddItemUniqueId = ([guid]::NewGuid()).Guid
    
                                                                    [string]$NewGridItemSC = {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            New-UDElement -Tag 'td' -Content {
                                                                                New-UDLink -Children {
                                                                                    New-UDElement -Tag 'p' -Content {
                                                                                        New-UDTypography -Text 'importtableitemcontentname' -ClassName 'entity-center-box-grid-inner-title'
                                                                                        New-UDStyle -Id 'style-importtableitemcontentname' -Content {
                                                                                            New-UDHtml -Markup '<span class="spanstyle1"></span><span class="spanstyle1space"></span>'
                                                                                            New-UDHtml -Markup '<span class="spanstyle2"></span><span class="spanstyle2space"></span>'
                                                                                            New-UDHtml -Markup '<span class="spanstyle3"></span><span class="spanstyle3space"></span>'
                                                                                            New-UDHtml -Markup '<span class="spanstyle4"></span><span class="spanstyle4space"></span>'
                                                                                            New-UDHtml -Markup '<span class="spanstyle5"></span><span class="spanstyle5space"></span>'
                                                                                            New-UDHtml -Markup '<span class="spanstyle6"></span><span class="spanstyle6space"></span>'
                                                                                            New-UDHtml -Markup '<span class="spanstyle7"></span><span class="spanstyle7space"></span>'
                                                                                        } -Style 'none'
                                                                                    }
                                                                                } -OnClick {
                                                                                    Show-UDModal -Header {
                                                                                        New-UDTypography -Text 'Table Item Parameters' -ClassName 'entity-center-box-inner-title'
                                                                                    } -Content {
                                                                                        $TableIdTextbox                 = 'importitemuniqueid-TableIdTextBox'
                                                                                        $TableItemIndexNumber           = 'importtableitemindexnumber'
                                                                                        $TableItemUniqueId              = 'importportableuniqueid'
                                                                                        $TableItemNameIdTextbox         = 'ImportTableItemNameIdTextBox'
                                                                                        $TableItemPropertiesIdSelectbox = 'ImportPropertiesIdSelectBox'
                                                                                        $TableItemForeignKeyIdSelectbox = 'ImportkeyIdSelectBox'
                                                                                        $TableItemDataTypeIdSelectbox   = 'ImportDataTypeIdSelectBox'
                                                                                        $TableItemMandatoryIdSelectbox  = 'ImportMandatoryIdSelectBox'
                                                                                        New-UDElement -Tag 'div' -Content {
                                                                                            New-UDElement -Tag 'table' -Content {
                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTypography -Text 'Table Id' -ClassName 'entity-center-box-inner-title'
                                                                                                        }
                                                                                                    }
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTextbox -Id $TableIdTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'importitemuniqueid' -Disabled 
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTypography -Text 'Previous Item Name' -ClassName 'entity-center-box-inner-title'
                                                                                                        }
                                                                                                    }
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'importtableitemcontentname' -Disabled
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                if('importTableItemPropertiesValue' -eq 1){$PreviousItemProperties = 'Id'}
                                                                                                elseif('importTableItemPropertiesValue' -eq 2){$PreviousItemProperties = 'Standard'}
                                                                                                elseif('importTableItemPropertiesValue' -eq 3){$PreviousItemProperties = 'Foreign Key'}
                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTypography -Text 'Previous Item Properties' -ClassName 'entity-center-box-inner-title'
                                                                                                        }
                                                                                                    }
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTextbox -Type text -ClassName 'entity-center-box-long-text' -Value $PreviousItemProperties -Disabled
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTypography -Text 'Previous Foreign Key' -ClassName 'entity-center-box-inner-title'
                                                                                                        }
                                                                                                    }
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTextbox  -Type text -ClassName 'entity-center-box-long-text' -Value 'importTableItemkeyValue' -Disabled
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTypography -Text 'Previous Data Type' -ClassName 'entity-center-box-inner-title'
                                                                                                        }
                                                                                                    }
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'importTableItemDataTypeValue' -Disabled
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTypography -Text 'Previous Mandatory' -ClassName 'entity-center-box-inner-title'
                                                                                                        }
                                                                                                    }
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'importTableItemMandatoryValue' -Disabled
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTypography -Text 'Item Name' -ClassName 'entity-center-box-inner-title'
                                                                                                        }
                                                                                                    }
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTextbox -Id $TableItemNameIdTextbox -Type text -ClassName 'entity-center-box-long-text'
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDTypography -Text 'Item Properties' -ClassName 'entity-center-box-inner-title'
                                                                                                        }
                                                                                                    }
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDStyle -Content {
                                                                                                                New-UDSelect -Id $TableItemPropertiesIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                                                                    New-UDSelectOption -Name ' ' -Value 0
                                                                                                                    New-UDSelectOption -Name 'Id' -Value 1
                                                                                                                    New-UDSelectOption -Name 'Standard' -Value 2
                                                                                                                    New-UDSelectOption -Name 'Foreign Key' -Value 3
                                                                                                                } -OnChange {
                                                                                                                    Sync-UDElement -Id 'importportableuniqueid-DynamicForeignKey'
                                                                                                                    Sync-UDElement -Id 'importportableuniqueid-DynamicDataType'
                                                                                                                    Sync-UDElement -Id 'importportableuniqueid-DynamicMandatory'
                                                                                                                } -DefaultValue 0
                                                                                                            } -Style '
                                                                                                                label + .css-1ntzb12 {
                                                                                                                    margin-top: 0px;
                                                                                                                }
                                                                                                            '
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                New-UDDynamic -Id 'importportableuniqueid-DynamicForeignKey' -Content {
                                                                                                    if(((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value) -eq 3){
                                                                                                        $ForeignSC = {
                                                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                                                New-UDElement -Tag 'td' -Content {
                                                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                                                        New-UDTypography -Text 'Foreign Key' -ClassName 'entity-center-box-inner-title'
                                                                                                                    }
                                                                                                                }
                                                                                                                New-UDElement -Tag 'td' -Content {
                                                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                                                        New-UDStyle -Content {
                                                                                                                            New-UDSelect -Id $TableItemForeignKeyIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                                                                                New-UDSelectOption -Name ' ' -Value 0
                                                                                                                                if($null -ne $Session:TableDatasets){
                                                                                                                                    $ForeignKeyList = @()
                                                                                                                                    foreach ($Dataset in $Session:TableDatasets) {
                                                                                                                                        if('importportableuniqueid' -eq $Dataset.TableId){}
                                                                                                                                        else{
                                                                                                                                            $GetDataSetItemType = $Dataset.ItemType
                                                                                                                                            if($GetDataSetItemType -eq 1){
                                                                                                                                                $GetDataSetItemName = $Dataset.ItemName
                                                                                                                                                if($null -ne $GetDataSetItemName){
                                                                                                                                                    [array]$ForeignKeyList += $GetDataSetItemName    
                                                                                                                                                }
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                    if($null -ne $ForeignKeyList){
                                                                                                                                        foreach ($KeyName in $ForeignKeyList) {
                                                                                                                                            New-UDSelectOption -Name $KeyName -Value $KeyName
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            } -OnChange {
                                                                                                                                
                                                                                                                            } -DefaultValue 0
                                                                                                                        } -Style '
                                                                                                                            label + .css-1ntzb12 {
                                                                                                                                margin-top: 0px;
                                                                                                                            }
                                                                                                                        '
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                        $ForeignSC|iex
                                                                                                    }
                                                                                                    else{}
                                                                                                }
                                                                                                New-UDDynamic -Id 'importportableuniqueid-DynamicDataType' -Content {
                                                                                                    if((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 1 -or (Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 3){
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDElement -Tag 'td' -Content {
                                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                                    New-UDTypography -Text 'Data Type' -ClassName 'entity-center-box-inner-title'
                                                                                                                }
                                                                                                            }
                                                                                                            New-UDElement -Tag 'td' -Content {
                                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                                    New-UDStyle -Content {
                                                                                                                        New-UDSelect -Id $TableItemDataTypeIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                                                                            New-UDSelectOption -Name ' ' -Value 0
                                                                                                                            New-UDSelectOption -Name 'Array' -Value 'Array'
                                                                                                                            New-UDSelectOption -Name 'Bool' -Value 'Bool'
                                                                                                                            New-UDSelectOption -Name 'Byte' -Value 'Byte'
                                                                                                                            New-UDSelectOption -Name 'DateTime' -Value 'DateTime'
                                                                                                                            New-UDSelectOption -Name 'Decimal' -Value 'Decimal'
                                                                                                                            New-UDSelectOption -Name 'Double' -Value 'Double'
                                                                                                                            New-UDSelectOption -Name 'Hashtable' -Value 'Hashtable'
                                                                                                                            New-UDSelectOption -Name 'Char' -Value 'Char'
                                                                                                                            New-UDSelectOption -Name 'Int' -Value 'Int'
                                                                                                                            New-UDSelectOption -Name 'Long' -Value 'Long'
                                                                                                                            New-UDSelectOption -Name 'Single' -Value 'Single'
                                                                                                                            New-UDSelectOption -Name 'String' -Value 'String'                                                                            
                                                                                                                            New-UDSelectOption -Name 'Xml' -Value 'Xml'
                                                                                                                        } -OnChange {
                                                
                                                                                                                        } -DefaultValue 'Int' -Disabled
                                                                                                                    } -Style '
                                                                                                                        label + .css-1ntzb12 {
                                                                                                                            margin-top: 0px;
                                                                                                                        }
                                                                                                                    '
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                    if((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 2){
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDElement -Tag 'td' -Content {
                                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                                    New-UDTypography -Text 'Data Type' -ClassName 'entity-center-box-inner-title'
                                                                                                                }
                                                                                                            }
                                                                                                            New-UDElement -Tag 'td' -Content {
                                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                                    New-UDStyle -Content {
                                                                                                                        New-UDSelect -Id $TableItemDataTypeIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                                                                            New-UDSelectOption -Name ' ' -Value 0
                                                                                                                            New-UDSelectOption -Name 'Array' -Value 'Array'
                                                                                                                            New-UDSelectOption -Name 'Bool' -Value 'Bool'
                                                                                                                            New-UDSelectOption -Name 'Byte' -Value 'Byte'
                                                                                                                            New-UDSelectOption -Name 'DateTime' -Value 'DateTime'
                                                                                                                            New-UDSelectOption -Name 'Decimal' -Value 'Decimal'
                                                                                                                            New-UDSelectOption -Name 'Double' -Value 'Double'
                                                                                                                            New-UDSelectOption -Name 'Hashtable' -Value 'Hashtable'
                                                                                                                            New-UDSelectOption -Name 'Char' -Value 'Char'
                                                                                                                            New-UDSelectOption -Name 'Int' -Value 'Int'
                                                                                                                            New-UDSelectOption -Name 'Long' -Value 'Long'
                                                                                                                            New-UDSelectOption -Name 'Single' -Value 'Single'
                                                                                                                            New-UDSelectOption -Name 'String' -Value 'String'                                                                            
                                                                                                                            New-UDSelectOption -Name 'Xml' -Value 'Xml'
                                                                                                                        } -OnChange {
                                                
                                                                                                                        } -DefaultValue 0
                                                                                                                    } -Style '
                                                                                                                        label + .css-1ntzb12 {
                                                                                                                            margin-top: 0px;
                                                                                                                        }
                                                                                                                    '
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                    else{}
                                                                                                }
                                                                                                New-UDDynamic -Id ('importportableuniqueid-DynamicMandatory') -Content {
                                                                                                    if((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 2){
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDElement -Tag 'td' -Content {
                                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                                    New-UDTypography -Text 'Mandatory' -ClassName 'entity-center-box-inner-title'
                                                                                                                }
                                                                                                            }
                                                                                                            New-UDElement -Tag 'td' -Content {
                                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                                    New-UDStyle -Content {
                                                                                                                        New-UDSelect -Id $TableItemMandatoryIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                                                                            New-UDSelectOption -Name ' ' -Value 0
                                                                                                                            New-UDSelectOption -Name 'True' -Value 'True'
                                                                                                                            New-UDSelectOption -Name 'False' -Value 'False'
                                                                                                                        } -OnChange {
                                                
                                                                                                                        } -DefaultValue 0
                                                                                                                    } -Style '
                                                                                                                        label + .css-1ntzb12 {
                                                                                                                            margin-top: 0px;
                                                                                                                        }
                                                                                                                    '
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                    elseif(((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 1) -or ((Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value -eq 3)){
                                                                                                        New-UDElement -Tag 'tr' -Content {
                                                                                                            New-UDElement -Tag 'td' -Content {
                                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                                    New-UDTypography -Text 'Mandatory' -ClassName 'entity-center-box-inner-title'
                                                                                                                }
                                                                                                            }
                                                                                                            New-UDElement -Tag 'td' -Content {
                                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                                    New-UDStyle -Content {
                                                                                                                        New-UDSelect -Id $TableItemMandatoryIdSelectbox -ClassName 'entity-center-box-properties-long-select' - -Option {
                                                                                                                            New-UDSelectOption -Name ' ' -Value 0
                                                                                                                            New-UDSelectOption -Name 'True' -Value 'True'
                                                                                                                            New-UDSelectOption -Name 'False' -Value 'False'
                                                                                                                        } -OnChange {
                                                
                                                                                                                        } -DefaultValue 'True' -Disabled
                                                                                                                    } -Style '
                                                                                                                        label + .css-1ntzb12 {
                                                                                                                            margin-top: 0px;
                                                                                                                        }
                                                                                                                    '
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }                                                                                                
                                                                                                New-UDElement -Tag 'p' -Content {}
                                                                                            }
                                                                                            New-UDElement -Tag 'table' -Content {
                                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDButton -Text 'Save properties' -ClassName 'entity-center-box-btn' -OnClick {
                                                                                                            $EditItemName       = (Get-UDElement -Id $TableItemNameIdTextbox).Value
                                                                                                            $EditItemProperties = (Get-UDElement -Id $TableItemPropertiesIdSelectbox).Value
                                                                                                            $EditItemKey        = (Get-UDElement -Id $TableItemForeignKeyIdSelectbox).Value
                                                                                                            $EditItemDataType   = (Get-UDElement -Id $TableItemDataTypeIdSelectbox).Value
                                                                                                            $EditItemMandatory  = (Get-UDElement -Id $TableItemMandatoryIdSelectbox).Value

                                                                                                            if($EditItemName -and $EditItemProperties){
                                                                                                                if($EditItemProperties -ne 3){
                                                                                                                    $EditItemKey = 'None'
                                                                                                                }
                                                                                                                if($EditItemProperties -eq 1 -or $EditItemProperties -eq 3){
                                                                                                                    $EditItemDataType  = 'Int'
                                                                                                                    $EditItemMandatory = $true
                                                                                                                }

                                                                                                                if(($null -eq $EditItemName -or 0 -eq $EditItemName -or '' -eq $EditItemName) -or ($null -eq $EditItemProperties -or 0 -eq $EditItemProperties -or '' -eq $EditItemProperties) -or ($null -eq $EditItemKey -or 0 -eq $EditItemKey -or '' -eq $EditItemKey) -or ($null -eq $EditItemDataType -or 0 -eq $EditItemDataType -or '' -eq $EditItemDataType) -or ($null -eq $EditItemMandatory -or 0 -eq $EditItemMandatory -or '' -eq $EditItemMandatory)){
                                                                                                                    Show-UDToast -Message 'Not valid item parameters!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                                                                }
                                                                                                                else{
                                                                                                                    $ArrayDatasets = @()
                                                                                                                    foreach ($Dataset in $Session:TableDatasets) {
                                                                                                                        if($Dataset.TableId -eq 'importitemuniqueid' -and $Dataset.ItemId -eq 'importportableuniqueid'){
    
                                                                                                                        }
                                                                                                                        else{
                                                                                                                            $TableDataset = [PSCustomObject]@{
                                                                                                                                TableId       = $Dataset.TableId
                                                                                                                                ItemId        = $Dataset.ItemId
                                                                                                                                ItemName      = $Dataset.ItemName
                                                                                                                                ItemType      = $Dataset.ItemType
                                                                                                                                ItemTypeKey   = $Dataset.ItemTypeKey
                                                                                                                                ItemTypeData  = $Dataset.ItemTypeData
                                                                                                                                ItemMandatory = $Dataset.ItemMandatory
                                                                                                                            }
                                                                                                                            [array]$ArrayDatasets += $TableDataset
                                                                                                                        }
                                                                                                                    }
                                                                                                                    
                                                                                                                    $TableDataset = [PSCustomObject]@{
                                                                                                                        TableId       = 'importitemuniqueid'
                                                                                                                        ItemId        = 'importportableuniqueid'
                                                                                                                        ItemName      = $EditItemName
                                                                                                                        ItemType      = $EditItemProperties
                                                                                                                        ItemTypeKey   = $EditItemKey
                                                                                                                        ItemTypeData  = $EditItemDataType
                                                                                                                        ItemMandatory = $EditItemMandatory
                                                                                                                    }
                                                                                                                    
                                                                                                                    $Session:TableDatasets         = $null
                                                                                                                    [array]$Session:TableDatasets += $TableDataset
                                                                                                                    [array]$Session:TableDatasets += $ArrayDatasets
        
                                                                                                                    if($null -eq $EditItemProperties){
                                                                                                                        $EditItemProperties = 'importTableItemPropertiesValue'
                                                                                                                    }
                                                                                                                    $UddynamicUniqueId  = ('GridItemDynamicId'+'importitemuniqueid')
                                                                                                                    $ReplacerUddynamicUniqueId  = ('GridItemDynamicId'+'importitemuniqueid')
                                                                                                                    $ReplacerUniqueId   = 'importitemuniqueid'
                                                                                                                    $IndexNumber        = 'importtableitemindexnumber'
                                                                                                                    $AddIndexNumber     = 'importadditemid'
                                                                                                                    $String0  = 'replacer'+'tableitemcontentname'
                                                                                                                    $String1  = 'replacer'+'tableitemcontentproperties'
                                                                                                                    $String2  = 'replacer'+'tableitemkeyproperties'
                                                                                                                    $String3  = 'replacer'+'tableitemdatatypeproperties'
                                                                                                                    $String4  = 'replacer'+'tableitemmandatoryproperties'
                                                                                                                    $String5  = 'replacer'+'tableitemindexnumber'
                                                                                                                    $String6  = 'replacer'+'additemid'
                                                                                                                    $String7  = 'replacer'+'griditemdynamicid'
                                                                                                                    $String8  = 'replacer'+'layoutgriditemdynamicid'
                                                                                                                    $String9  = 'replacer'+'itemuniqueid'
                                                                                                                    $String10 = 'replacer'+'portableuniqueid'
            
                                                                                                                    [string]$StringGridItemSC = $Session:RecoveryNewGridItemSC
                                                                                                                    $ReplacerNewGridItemSC    = $StringGridItemSC -replace "$String0","$EditItemName" -replace "$String1","$EditItemProperties" -replace "$String2","$EditItemKey" -replace "$String3","$EditItemDataType" -replace "$String4","$EditItemMandatory" -replace "$String5","$IndexNumber" -replace "$String6","$AddIndexNumber" -replace "$String7","$ReplacerUddynamicUniqueId" -replace "$String8","$ReplacerUniqueId" -replace "$String9","$ReplacerUniqueId" -replace "$String10","$TableItemUniqueId"
            
                                                                                                                    $NewGridItemSCToJson = $ReplacerNewGridItemSC | ConvertTo-Json -Depth 100
                                                                                                                    $NewGridItemPSCO     = [PSCustomObject]@{
                                                                                                                        IdSC             = 'importadditemid'
                                                                                                                        ScriptBlock      = $NewGridItemSCToJson
                                                                                                                    }
                                                                                                                    $GetAddIdSC       = $NewGridItemPSCO.IdSC
                                                                                                                    $GetIndexAddIdSC  = [array]::indexof((($Session:DatasetGridItemList[$TableItemIndexNumber]).items).IdSC,$GetAddIdSC)
                                                                                                                    
                                                                                                                    ((($Session:DatasetGridItemList[$TableItemIndexNumber]).items)[$GetIndexAddIdSC]).ScriptBlock = $NewGridItemPSCO.ScriptBlock
            
                                                                                                                    $Session:InvokeGridItemsSC           = ((($Session:DatasetGridItemList[$TableItemIndexNumber]).items)).ScriptBlock
                                                                                                                    $Session:CallCreateGridItemCondition = $true
                                                                                                                    Sync-UDElement -Id $UddynamicUniqueId                                                                                                                    
                                                                                                                }
                                                                                                            }
                                                                                                            else{
                                                                                                                Show-UDToast -Message 'Not valid item parameters!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                                                            }
                                                                                                            Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                                                                                            Hide-UDModal
                                                                                                        }
                                                                                                    }
                                                                                                    New-UDElement -Tag 'td' -Content {
                                                                                                        New-UDButton -Text 'Remove Item' -ClassName 'entity-center-box-btn' -OnClick {
                                                                                                            $ArrayDatasets = @()
                                                                                                            foreach ($Dataset in $Session:TableDatasets) {
                                                                                                                if($Dataset.TableId -eq 'importitemuniqueid' -and $Dataset.ItemId -eq 'importportableuniqueid'){

                                                                                                                }
                                                                                                                else{
                                                                                                                    $TableDataset = [PSCustomObject]@{
                                                                                                                        TableId       = $Dataset.TableId
                                                                                                                        ItemId        = $Dataset.ItemId
                                                                                                                        ItemName      = $Dataset.ItemName
                                                                                                                        ItemType      = $Dataset.ItemType
                                                                                                                        ItemTypeKey   = $Dataset.ItemTypeKey
                                                                                                                        ItemTypeData  = $Dataset.ItemTypeData
                                                                                                                        ItemMandatory = $Dataset.ItemMandatory
                                                                                                                    }
                                                                                                                    [array]$ArrayDatasets += $TableDataset
                                                                                                                }
                                                                                                            }
                                                                                                            $Session:TableDatasets         = $null
                                                                                                            [array]$Session:TableDatasets += $ArrayDatasets
                                                                                                            $LayoutItemUniqueId   = ('grid-element-'+'importitemuniqueid')
                                                                                                            $UddynamicUniqueId    = ('GridItemDynamicId'+'importitemuniqueid')
                                                                                                            $GetAddIdSC           = 'importadditemid'
                                                                                                            $Collection           = $Session:DatasetGridItemList
                                                                                                            $Counter              = 0
                                                                                                            $CollectionCount      = $Collection.Count
                                                                                                            $NewTableList         = @()
                                                                                                            if($CollectionCount -gt 1){
                                                                                                                foreach ($Table in $Collection) {
                                                                                                                    $CounterItem  = 0
                                                                                                                    $ItemPSCO     = $null
                                                                                                                    $TablePSCO    = $null
                                                                                                                    $NewItemList  = @()
                                                                                                                    foreach ($Item in ($Table.Items)) {
                                                                                                                        if($Item.IdSC -eq $GetAddIdSC){}
                                                                                                                        else{
                                                                                                                            $ItemPSCO  = [PSCustomObject]@{
                                                                                                                                IdSC        = ($Item).IdSC
                                                                                                                                ScriptBlock = ($Item).ScriptBlock
                                                                                                                            }
                                                                                                                            $NewItemList += $ItemPSCO
                                                                                                                        }
                                                                                                                        $CounterItem++
                                                                                                                    }
                                                                                                                    $TablePSCO = [PSCustomObject]@{
                                                                                                                        Id    = ($Table).Id
                                                                                                                        Items = $NewItemList
                                                                                                                    }
                                                                                                                    $NewTableList += $TablePSCO
                                                                                                                    $Counter++
                                                                                                                }
                                                                                                            }
                                                                                                            elseif($CollectionCount -eq 1){
                                                                                                                $CounterItem  = 0
                                                                                                                $ItemPSCO     = $null
                                                                                                                $TablePSCO    = $null
                                                                                                                $NewItemList  = @()
                                                                                                                foreach ($Item in ($Collection.Items)) {
                                                                                                                    if($Item.IdSC -eq $GetAddIdSC){}
                                                                                                                    else{
                                                                                                                        $ItemPSCO  = [PSCustomObject]@{
                                                                                                                            IdSC        = ($Item).IdSC
                                                                                                                            ScriptBlock = ($Item).ScriptBlock
                                                                                                                        }
                                                                                                                        $NewItemList += $ItemPSCO
                                                                                                                    }
                                                                                                                    $CounterItem++
                                                                                                                }
                                                                                                                $TablePSCO = [PSCustomObject]@{
                                                                                                                    Id    = $Collection.Id
                                                                                                                    Items = $NewItemList
                                                                                                                }
                                                                                                                $NewTableList += $TablePSCO
                                                                                                                
                                                                                                            }
                                                                                                            else{
                                                                                                                
                                                                                                            }
                                                                                                                
                                                                                                            if($Session:DatasetGridItemList.Items -eq $null){
                                                                                                                $Session:CallCreateGridItemCondition = $false
                                                                                                            }
                                                                                                            else{
                                                                                                                $Session:CallCreateGridItemCondition = $true
                                                                                                            }
                                                                                                            [array]$Session:DatasetGridItemList = $NewTableList
                                                                                                            $Session:LayoutChangeDecreaseSC|iex
                                                                                                            Sync-UDElement -Id $UddynamicUniqueId
                                                                                                            Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                                                                                            Hide-UDModal
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                        Sync-UDElement -Id 'importportableuniqueid-DynamicForeignKey'
                                                                                        Sync-UDElement -Id 'importportableuniqueid-DynamicDataType'
                                                                                        Sync-UDElement -Id 'importportableuniqueid-DynamicMandatory'
                                                                                    } -Footer {
                                                                                        New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {Hide-UDModal}
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    } -replace 'importtableitemcontentname',$TableItemName -replace 'importtableitemindexnumber',"$GetIndexNumber" -replace 'importadditemid',"$AddItemUniqueId" -replace 'ImportTableItemNameIdTextBox',"$TableItemNameIdTextbox" -replace 'ImportPropertiesIdSelectBox',"$TableItemPropertiesIdSelectbox" -replace 'ImportkeyIdSelectBox',"$TableItemForeignKeyIdSelectbox" -replace 'importTableItemPropertiesValue',"$TableItemProperties" -replace 'importTableItemkeyValue',"$TableItemKey" -replace 'importTableItemDataTypeValue',"$TableItemDataType" -replace 'importTableItemMandatoryValue',"$TableItemMandatory" -replace 'importportableuniqueid',$NewTableItemUniqueId
    
                                                                    $NewGridItemSCToJson = $NewGridItemSC | ConvertTo-Json -Depth 100
                                                                    $NewGridItemPSCO     = [PSCustomObject]@{
                                                                        IdSC             = $AddItemUniqueId
                                                                        ScriptBlock      = $NewGridItemSCToJson
                                                                    }
                                                                    [array]($Session:DatasetGridItemList[$GetIndexNumber]).items += $NewGridItemPSCO
                                                                    
                                                                    $Session:InvokeGridItemsSC           = (($Session:DatasetGridItemList[$GetIndexNumber]).items).ScriptBlock
                                                                    $Session:CallCreateGridItemCondition = $true
                                                                    $UddynamicUniqueId = ('GridItemDynamicId'+'importitemuniqueid')
                                                                    Sync-UDElement -Id $UddynamicUniqueId
                                                                    Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                                                    Hide-UDModal
                                                                }
                                                            }
                                                            else{
                                                                Show-UDToast -Message 'Not valid item parameters!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        Sync-UDElement -Id ("$NewTableItemUniqueId"+'-DynamicForeignKey')
                                        Sync-UDElement -Id ("$NewTableItemUniqueId"+'-DynamicDataType')
                                        Sync-UDElement -Id ("$NewTableItemUniqueId"+'-DynamicMandatory')
                                    } -Footer {
                                        New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {Hide-UDModal}
                                    } -Persistent
                                }
                                New-UDLink -ClassName 'entity-center-box-logo-table-grid-link-minus' -Children {
                                    New-UDIcon -Icon Times -Border -Size '1x' -ClassName 'entity-center-box-logo-table-grid-minus'
                                } -OnClick {
                                    $ItemUniqueId = 'importitemuniqueid'
                                    $Session:LayoutRemoveSC | iex
                                    $ConvertFromJson            = $Session:LayoutGridItemsJson | ConvertFrom-Json -Depth 100
                                    $ConvertFromJsonLayoutItems = ($ConvertFromJson.Layout).Items | ? {$_.Id -eq $ItemUniqueId}
                                    if((($ConvertFromJson.Layout).Items).Count -eq 1){
                                        [array]$Session:GridItemListPSCO  = $null
                                        $Session:GridItemListJson         = $null
                                        $Session:LayoutGridItemsJson      = $null
                                        Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                    }
                                    else{
                                        if($null -ne $ConvertFromJsonLayoutItems){
                                            $GetIndexNumber = [array]::indexof(($ConvertFromJson.Layout).Items,$ConvertFromJsonLayoutItems)
                                            $CollectionItem = ($ConvertFromJson.Layout).Items
                                            $NewItemList = @()
                                            $num = 0
                                            foreach ($Item in $CollectionItem) {
                                                if($num -eq $GetIndexNumber){
                                                    $Item.Remove
                                                }
                                                else{
                                                    $NewItemList += $Item
                                                }
                                                $num++
                                            }
                                        }
                                        if($null -eq $NewItemList){
                                            Show-UDToast -Message 'Not found item list!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                        }
                                        else{
                                            [array]$Session:GridItemListPSCO  = $NewItemList
                                            $Session:GridItemListJson         = $NewItemList | ConvertTo-Json -Depth 100
                                            $Session:LayoutGridItemsJson      = '{'+"'"+'Layout'+"'"+':'+'['+'{'+"'"+'Items'+"'"+':'+"$Session:GridItemListJson"+'}'+']'+'}'
                                            Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                        }
                                    }
                                    $FindTableDatasets = $Session:TableDatasets | ? {$_.TableId -eq $ItemUniqueId}
                                    if($FindTableDatasets){
                                        $NewDatasetList = @()
                                        foreach ($Item in $Session:TableDatasets) {
                                            if($Item.TableId -eq $ItemUniqueId){}
                                            else{
                                                $NewDatasetList += $Item
                                            }
                                        }
                                        $Session:TableDatasets = $NewDatasetList
                                        Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                    }
                                    $FindDatasetGridItemList = $Session:DatasetGridItemList | ? {$_.Id -eq $ItemUniqueId}
                                    if($FindDatasetGridItemList){
                                        $NewDatasetGridItemList = @()
                                        foreach ($Item in $Session:DatasetGridItemList) {
                                            if($Item.Id -eq $ItemUniqueId){}
                                            else{
                                                $NewDatasetGridItemList += $Item
                                            }
                                        }
                                        $Session:DatasetGridItemList = $NewDatasetGridItemList
                                        Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                    }
                                }
                            }
                        } -Style '
                        div {
                            display: inline-block;
                            width: 100%;
                            padding: 0px;
                        }
                        '
                        New-UDElement -Tag 'div' -Content {
                            New-UDStyle -Content {
                                New-UDIcon -Icon Database
                            } -Style '
                            .svg-inline--fa.fa-fw {
                                width: var(--fa-fw-width, 0.6em);
                                padding-left: 4px;
                                padding-right: 2px;
                                color: gray;
                                float: left;
                            }
                            '
                            New-UDStyle -Content {
                                New-UDLink -Children {
                                    New-UDTypography -Id 'importitemuniqueid-GridMainTitle' -Text $ModelTableName -ClassName 'entity-center-box-grid-main-title'
                                } -OnClick {
                                    Show-UDModal -Header {
                                        New-UDTypography -Text 'Grid Main Title' -ClassName 'entity-center-box-inner-title'
                                    } -Content {
                                        New-UDElement -Tag 'div' -Content {
                                            New-UDElement -Tag 'table' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTypography -Text 'Table Id' -ClassName 'entity-center-box-inner-title'
                                                        }
                                                    }
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTextbox -Type text -ClassName 'entity-center-box-long-text' -Value 'importitemuniqueid' -Disabled 
                                                        }
                                                    }
                                                }
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTypography -Text 'Table Name' -ClassName 'entity-center-box-inner-title'
                                                        }
                                                    }
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDElement -Tag 'tr' -Content {
                                                            New-UDTextbox -Id 'importitemuniqueid-GridMainTitleIdTextBox' -Type text -ClassName 'entity-center-box-long-text'
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        New-UDElement -Tag 'p' -Content {}
                                        New-UDElement -Tag 'div' -Content {
                                            New-UDElement -Tag 'table' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDElement -Tag 'td' -Content {
                                                        New-UDButton -Text 'Save' -ClassName 'entity-center-box-btn' -OnClick {
                                                            $EditTableName = (Get-UDElement -Id 'importitemuniqueid-GridMainTitleIdTextBox').Value
                                                            if($EditTableName -and $EditTableName -notmatch ' '){
                                                                $GridItemPSCO = [PSCustomObject]@{
                                                                    Id      = $GetGritItemDataByIndex.Id
                                                                    Name    = $EditTableName
                                                                    Sc      = $GetGritItemDataByIndex.Sc
                                                                    Dataset = $GetGritItemDataByIndex.Dataset
                                                                }
                                                                $Session:GridItemListPSCO[$GetGritItemIndexById] = $GridItemPSCO
                                                                $Session:GridItemListJson                        = $Session:GridItemListPSCO | ConvertTo-Json -Depth 100
                                                                $Session:LayoutGridItemsJson                     = '{'+"'"+'Layout'+"'"+':'+'['+'{'+"'"+'Items'+"'"+':'+"$Session:GridItemListJson"+'}'+']'+'}'
                                                                Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                                                Hide-UDModal
                                                            }
                                                            else{
                                                                Show-UDToast -Message 'Not valid input format!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    } -Footer {
                                        New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {Hide-UDModal}
                                    } -Persistent
                                    Start-Sleep -Milliseconds 500
                                    $GetGridMainTitleId     = 'importitemuniqueid-GridMainTitle'
                                    $InvokeJavascriptString = {Invoke-UDJavaScript -JavaScript '
                                        var span_Text = document.getElementById("importgridmainttitleid").innerText;
                                        document.getElementById("importitemuniqueid-GridMainTitleIdTextBox").value = span_Text;
                                    '} -replace 'importgridmainttitleid',$GetGridMainTitleId
                                    $InvokeJavascriptString|iex
                                }
                            } -Style '
                                max-width: 100%;
                                min-width: 10px;
                                white-space: nowrap;
                                overflow: hidden;
                                text-overflow: ellipsis; 
                                line-height: 0.7;
                                color: gray;
                            }
                            '
                        }
                        New-UDStyle -Content {
                            New-UDElement -Tag 'table' -Content {
                                $UddynamicUniqueId       = ('GridItemDynamicId'+'importitemuniqueid')
                                $InvokerVariableUniqueId = 'importitemuniqueid'
                                New-UDDynamic -Id $UddynamicUniqueId -Content {
                                    if($Session:CallCreateGridItemCondition -eq $true){
                                        $GetIndexNumber = [array]::indexof($Session:DatasetGridItemList.id,$InvokerVariableUniqueId)
                                        $Collection     = (($Session:DatasetGridItemList[$GetIndexNumber]).Items).ScriptBlock
                                        if($null -eq $Collection){}
                                        else{
                                            foreach ($ItemScriptBlock in $Collection) {
                                                $ItemScriptBlock|ConvertFrom-Json|iex
                                            }
                                        }
                                    }
                                    elseif($Session:CallEditGridItemCondition -eq $true){
                                        $GetIndexNumber = [array]::indexof($Session:DatasetGridItemList.id,$InvokerVariableUniqueId)
                                        $Collection     = (($Session:DatasetGridItemList[$GetIndexNumber]).Items).ScriptBlock
                                        if($null -eq $Collection){}
                                        else{
                                            foreach ($ItemScriptBlock in $Collection) {
                                                $ItemScriptBlock|ConvertFrom-Json|iex
                                            }
                                        }
                                        $Session:CallEditGridItemCondition = $false
                                    }
                                    else{}
                                }
                            }
                        } -Style '
                        table {
                            word-break: break-word;
                            table-layout:fixed;
                            width: 100%;
                            border-collapse: collapse;
                            border-spacing: 0px;
                            padding-top: 0px;
                            padding-bottom: 0px;
                            padding-left: 0px;
                            padding-right: 0px;
                        }
                        td {
                            border: 1px solid #eeeeee;
                            padding-top: 1px;
                            padding-bottom: 0px;
                            padding-left: 0px;
                            padding-right: 0px;
                            line-height: 0.5;
                        }
                        td:hover {
                            background-color: #eeeeee;
                        }
                        p {
                            white-space: nowrap;
                            overflow: hidden;
                            text-overflow: ellipsis; 
                            line-height: 0.64;
                            margin: auto;
                            color:gray;
                            padding-top: 1px;
                            padding-bottom: 1px;
                            margin-top: -3px;
                        }
                        '
                    }
                } -Style 'width: 100%'
            }
        } -Elevation 1
    } -ClassName "entity-center-box-layout-grid"
}

$RestoreDatabaseSC = {
    $Session:TableDatasets               = $null
    $Session:GridItemLayoutList          = $null
    $Session:DatasetGridItemList         = $null
    $Session:GridItemListJson            = $null
    $Session:GridItemListPSCO            = $null
    $Session:LayoutGridItemsJson         = $null
    $Session:CreateGritLayoutJson        = $null
    $Session:CallCreateGridItemCondition = $null
    $Session:FirstLoad                   = $true
    $Session:LoadedGroupName             = $null
    $Session:LoadedModelName             = $null
    $Session:LoadedLastSaveTime          = $null
    $Session:SelectedGroupRow            = $null
    $Session:LoadedContent               = $null
    $Session:EntityModelControlButtonsNewCondition = $null
    $Session:EntityModelInfoButtonsCondition       = $null
}

$GroupListSC = {
    New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
        New-UDPaper -ClassName "entity-center-box-layout" -Square -Content {
            New-UDRow -Columns {
                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                    New-UDElement -Tag 'table' -Content {
                        New-UDElement -Tag 'tr' -Content {
                            New-UDElement -Tag 'td' -Content {
                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'entity-center-box-logo'
                            }
                            New-UDElement -Tag 'td' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDTypography -Text 'Entity Model Group List' -ClassName 'entity-center-box-title'
                                }
                            }
                        }
                    }
                    New-UDDynamic -Id 'EntityModelGroupListTableDynamicId' -Content {
                        New-UDStyle -Content {
                            New-UDElement -Tag 'div' -Content {
                                New-UDElement -Tag 'table' -Content {
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Entity Model Id' -ClassName 'entity-center-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                $ModelUniqueId = ([guid]::NewGuid()).Guid
                                                New-UDTextbox -Id 'EntityModelUniqueIdTextBox' -Type text -ClassName 'entity-center-box-long-text' -Value $ModelUniqueId -Disabled
                                            }
                                        }
                                    }
                                    New-UDElement -Tag 'tr' -Content {
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTypography -Text 'Entity Model Name' -ClassName 'entity-center-box-inner-title'
                                            }
                                        }
                                        New-UDElement -Tag 'td' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDTextbox -Id 'EntityModelNameIdTextBox' -Type text -ClassName 'entity-center-box-long-text'
                                            }
                                        }
                                    }
                                }
                            }
                            # DATA FORMAT
                            $Data = @()
    
                            # ENTITY GROUP LIST
                            $Cache:EntityCenterModelDatabaseSC|iex
                            $Session:EntityCenterModelDatabaseGroupListData = @(
                                if($null -ne $Cache:EntityCenterModelDatabaseGroupList){
                                    foreach ($Item in $Cache:EntityCenterModelDatabaseGroupList) {
                                        $DirName         = $Item.DirName
                                        $DirPath         = $Item.DirPath
                                        $DirPathGci      = gci $DirPath
                                        $DirPathDataJson = $DirPathGci|ConvertTo-Json
                                        $DirPathGciCount = $DirPathGci.Count
                                        @{Group = $DirName;Dataset = $DirPathGciCount;DatasetData = $DirPathDataJson}
                                    }
                                }
                            )
                            $Data += $Session:EntityCenterModelDatabaseGroupListData
    
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
                                    New-UDTableColumn -ShowSort -Property Group -Title 'Name' -IncludeInSearch -Render {
                                        New-UDTypography -Text "$($EventData.Group)"
                                    }
                                    New-UDTableColumn -Property Dataset -Title 'Datasets' -Render {
                                        New-UDTypography -Text "$($EventData.Dataset)"
                                    }
                                )
                                New-UDElement -Tag 'div' -Content {
                                    New-UDStyle -Content {
                                        New-UDTable -Id 'ModelGroupList_table' -Data $Data -Columns $Columns -Title 'Groups' -OnRowExpand {
                                            $DatasetDataTable = @()
                                            $DatasetData      = "$($EventData.DatasetData)"|ConvertFrom-Json
                                            $EntityCenterModelDatabaseGroupListDatasetData = @(
                                                if($null -ne $DatasetData){
                                                    foreach ($Item in $DatasetData) {
                                                        $DirName                    = $Item.Name
                                                        $DirPath                    = $Item.FullName
                                                        if(Test-Path ("$DirPath"+'\'+'tabledatasets'+'.json')){
                                                            $DatasetPathTablesGc        = gc ("$DirPath"+'\'+'tabledatasets'+'.json')
                                                            $DatasetPathTablesJson      = $DatasetPathTablesGc | ConvertFrom-Json -Depth 100
                                                            $DatasetTablesItemsCount    = $DatasetPathTablesJson.Count
                                                        }
                                                        else{
                                                            $DatasetTablesItemsCount    = 0
                                                        }
                                                        if(Test-Path ("$DirPath"+'\'+'tabledatasets'+'.json')){
                                                            $GridItemLayoutListGc       = gc ("$DirPath"+'\'+'GridItemLayoutList'+'.json')
                                                            $GridItemLayoutListJson     = $GridItemLayoutListGc | ConvertFrom-Json -Depth 100
                                                            $GridItemLayoutListCount    = $GridItemLayoutListJson.Count
                                                        }
                                                        else{
                                                            $GridItemLayoutListCount    = 0
                                                        }
                                                        @{Dataset = $DirName;Tables = $DatasetTablesItemsCount;Items = $GridItemLayoutListCount}
                                                    }
                                                }
                                            )
                                            $DatasetDataTable   = $EntityCenterModelDatabaseGroupListDatasetData
                                            $DatasetDataColumns = @(
                                                New-UDTableColumn -ShowSort -Property Dataset -Title 'Dataset Name' -IncludeInSearch -Render {
                                                    New-UDTypography -Text "$($EventData.Dataset)"
                                                }
                                                New-UDTableColumn -Property Tables -Title 'Tables' -Render {
                                                    New-UDTypography -Text "$($EventData.Tables)"
                                                }
                                                New-UDTableColumn -Property Items -Title 'Items' -Render {
                                                    New-UDTypography -Text "$($EventData.Items)"
                                                }
                                            )
                                            
                                            New-UDStyle -Content {
                                                New-UDTable -Id 'ModelGroupDetailList_table' -Data $DatasetDataTable -Columns $DatasetDataColumns -PageSize 100 -Dense
                                            } -Style '
                                                margin-left: -22px;
                                                .MuiTableRow-head {
                                                    background-color: #FFFFF0;
                                                }
                                                .MuiTypography-root {
                                                    font-size: 12px;
                                                    font-weight: 400;
                                                }
                                                .MuiTableCell-head {
                                                    padding 2px 0px 1px 5px;
                                                    font-size: 11px;
                                                }
                                                .MuiTableRow-root {
                                                    background-color: #FFFFF0;
                                                }
                                            '
                                        } -ShowSearch -ShowPagination -ShowSelection -DisableMultiSelect -Dense -OnRowSelection {
                                            $Session:SelectedGroupRow = $Body
                                        } -PageSize 20 -ShowRefresh
                                    } -Style '
                                    font-size: 7px;
                                    width: 97%;
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
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDButton -Text "Create New Model" -OnClick {
                                            $GroupName = ($Session:SelectedGroupRow|ConvertFrom-Json).Group
                                            $Session:SelectedGroupRow = $null
                                            $ModelId   = (Get-UDElement -Id 'EntityModelUniqueIdTextBox').Value
                                            $ModelName = (Get-UDElement -Id 'EntityModelNameIdTextBox').Value
                                            if($GroupName -and $ModelId -and $ModelName){
                                                $DatasetFormat               = '['+'{'+"'"+'GroupName'+"'"+':'+"'"+"$GroupName"+"'"+','+"'"+'ModelId'+"'"+':'+"'"+"$ModelId"+"'"+','+"'"+'ModelName'+"'"+':'+"'"+"$ModelName"+"'"+','+"'"+'Data'+"'"+':'+"'"+""+"'"+'}'+']'
                                                $CreatePath                  = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+"$ModelName"
                                                $Config                      = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+"$ModelName"+'\'+'Config'+'.json'
                                                $TableDatasets               = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+"$ModelName"+'\'+'TableDatasets'+'.json'
                                                $GridItemLayoutList          = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+"$ModelName"+'\'+'GridItemLayoutList'+'.json'
                                                $DatasetGridItemList         = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+"$ModelName"+'\'+'DatasetGridItemList'+'.json'
                                                $GridItemListJson            = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+"$ModelName"+'\'+'GridItemListJson'+'.json'
                                                $GridItemListPSCO            = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+"$ModelName"+'\'+'GridItemListPSCO'+'.json'
                                                $LayoutGridItemsJson         = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+"$ModelName"+'\'+'LayoutGridItemsJson'+'.json'
                                                $CreateGritLayoutJson        = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+"$ModelName"+'\'+'CreateGritLayoutJson'+'.json'
                                                $CallCreateGridItemCondition = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+"$ModelName"+'\'+'CallCreateGridItemCondition'+'.json'
                                                if(Test-Path $CreatePath){
                                                    Show-UDToast -Message 'Entity Model Name path is exist!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                }
                                                else{
                                                    $Save = New-Item -ItemType Directory $CreatePath
                                                    $Save = New-Item -ItemType File $Config -Value $DatasetFormat
                                                    $Save = New-Item -ItemType File $TableDatasets
                                                    $Save = New-Item -ItemType File $GridItemLayoutList
                                                    $Save = New-Item -ItemType File $DatasetGridItemList
                                                    $Save = New-Item -ItemType File $GridItemListJson
                                                    $Save = New-Item -ItemType File $GridItemListPSCO
                                                    $Save = New-Item -ItemType File $LayoutGridItemsJson
                                                    $Save = New-Item -ItemType File $CreateGritLayoutJson
                                                    $Save = New-Item -ItemType File $CallCreateGridItemCondition
                                                    Show-UDToast -Message 'Save Entity Model'
                                                    $Cache:EntityCenterModelDatabaseSC|iex
                                                    Invoke-UDRedirect -Url ("$Cache:ServerUrlAdress"+'app/'+"$Cache:RootControllerType"+'/createnewentitymodel')
                                                    
                                                }
                                            }
                                            else{
                                                Show-UDToast -Message 'Entity Model Form is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                            }
                                        } -ClassName 'entity-center-box-btn'
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDButton -Text "Create New Group" -OnClick {
                                            Show-UDModal -Header {
                                                New-UDTypography -Text 'Create New Model Group' -ClassName 'entity-center-box-inner-title'
                                            } -Content {
                                                $MainSC = {
                                                    New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                                                        New-UDPaper -ClassName "entity-center-box-layout" -Square -Content {
                                                            New-UDRow -Columns {
                                                                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            New-UDElement -Tag 'td' -Content {
                                                                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'entity-center-box-logo'
                                                                            }
                                                                            New-UDElement -Tag 'td' -Content {
                                                                                New-UDElement -Tag 'tr' -Content {
                                                                                    New-UDTypography -Text 'Create New Entity Group Form' -ClassName 'entity-center-box-title'
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                    New-UDElement -Tag 'div' -Content {
                                                                        New-UDElement -Tag 'table' -Content {
                                                                            New-UDElement -Tag 'tr' -Content {
                                                                                New-UDElement -Tag 'td' -Content {
                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                        New-UDTypography -Text 'Entity Group Name' -ClassName 'entity-center-box-inner-title'
                                                                                    }
                                                                                }
                                                                                New-UDElement -Tag 'td' -Content {
                                                                                    New-UDElement -Tag 'tr' -Content {
                                                                                        New-UDTextbox -Id 'EntityGroupNameIdTextBox' -Type text -ClassName 'entity-center-box-task-name-text'
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                    New-UDElement -Tag 'table' -Content {
                                                                        New-UDElement -Tag 'tr' -Content {
                                                                            New-UDElement -Tag 'td' -Content {
                                                                                New-UDButton -Text "Create New Group" -OnClick {
                                                                                    $EntityGroupName = (Get-UDElement -Id 'EntityGroupNameIdTextBox').Value
                                                                                    if($EntityGroupName){
                                                                                        $EntityGroupPath = ("$Cache:RootAppDirectory"+'database\'+"$Cache:RootControllerType"+'\modules\entitycenter\list\'+"$EntityGroupName")
                                                                                        if(Test-Path $EntityGroupPath){
                                                                                            Show-UDToast -Message 'Entity Group name is exist!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                                        }
                                                                                        else{
                                                                                            $New = New-Item -ItemType Directory $EntityGroupPath
                                                                                            Sync-UDElement -Id 'EntityModelListPanelDynamicId'
                                                                                            Hide-UDModal
                                                                                            Show-UDModal -Header {
                                                                                                New-UDTypography -Text 'New Entity Model Form' -ClassName 'entity-center-box-inner-title'
                                                                                            } -Content {
                                                                                                New-UDElement -Tag 'div' -Content {
                                                                                                    $GroupListSC|iex
                                                                                                    Sync-UDElement -Id 'EntityModelGroupListTableDynamicId'
                                                                                                }
                                                                                            } -Footer {
                                                                                                New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {
                                                                                                    $Cache:EntityCenterModelDatabaseSC|iex
                                                                                                    Hide-UDModal
                                                                                                }
                                                                                            } -Persistent
                                                                                        }
                                                                                    }
                                                                                    else{
                                                                                        Show-UDToast -Message 'Entity Group Form is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                                    }
                                                                                } -ClassName 'entity-center-box-btn'
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }                 
                                                        } -Elevation 1
                                                    }
                                                }
    
                                                New-UDGrid -Spacing 1 -Container -Content {
                                                    $Session:FirstRunNum=1
                                                    $MainSC|iex
                                                    
                                                }
                                            } -Footer {
                                                New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {Hide-UDModal}
                                            } -Persistent
                                        } -ClassName 'entity-center-box-btn'
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDButton -Text "Rename Group" -OnClick {
                                            if($Session:SelectedGroupRow){
                                                $GroupName = ($Session:SelectedGroupRow|ConvertFrom-Json).Group
                                                $GroupDataset  = ($Session:SelectedGroupRow|ConvertFrom-Json).Dataset
                                                $Session:SelectedGroupRow = $null
                                                Hide-UDModal
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Rename Group Form' -ClassName 'entity-center-box-inner-title'
                                                } -Content {
                                                    New-UDElement -Tag 'div' -Content {
                                                        New-UDElement -Tag 'table' -Content {
                                                            New-UDElement -Tag 'tr' -Content {
                                                                New-UDElement -Tag 'td' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDTypography -Text 'Original Name' -ClassName 'entity-center-box-inner-title'
                                                                    }
                                                                }
                                                                New-UDElement -Tag 'td' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDTextbox -Id 'EntityModelGroupOriginalNameTextBox' -Type text -ClassName 'entity-center-box-text' -Value $GroupName -Disabled
                                                                    }
                                                                }
                                                            }
                                                            New-UDElement -Tag 'tr' -Content {
                                                                New-UDElement -Tag 'td' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDTypography -Text 'New Name' -ClassName 'entity-center-box-inner-title'
                                                                    }
                                                                }
                                                                New-UDElement -Tag 'td' -Content {
                                                                    New-UDElement -Tag 'tr' -Content {
                                                                        New-UDTextbox -Id 'EntityModelGroupNewNameTextBox' -Type text -ClassName 'entity-center-box-text'
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                    New-UDButton -Text "Save" -OnClick {
                                                        if($GroupName){
                                                            $GroupNewName  = (Get-UDElement -Id 'EntityModelGroupNewNameTextBox').Value
                                                            $CreatePath    = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"
                                                            $NewPath       = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupNewName"
                                                            $Config        = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"+'\'+'*'+'\'+'Config'+'.json'
                                                            $CreatePathGci = gci $CreatePath
                                                            $GroupDataset  = $CreatePathGci.Count
                                                            if(Test-Path $CreatePath){
                                                                if($GroupDataset -eq 0){
                                                                    $CreateNewPath   = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupNewName"+'\'
                                                                    $Rename = Rename-Item $CreatePath $NewPath
                                                                    $Cache:EntityCenterModelDatabaseSC|iex
                                                                    Sync-UDElement -Id 'EntityModelListPanelDynamicId'
                                                                    Hide-UDModal
                                                                    Show-UDModal -Header {
                                                                        New-UDTypography -Text 'New Entity Model Form' -ClassName 'entity-center-box-inner-title'
                                                                    } -Content {
                                                                        New-UDElement -Tag 'div' -Content {
                                                                            $GroupListSC|iex
                                                                            Sync-UDElement -Id 'EntityModelGroupListTableDynamicId'
                                                                        }
                                                                    } -Footer {
                                                                        New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {
                                                                            $Cache:EntityCenterModelDatabaseSC|iex
                                                                            Hide-UDModal
                                                                        }
                                                                    } -Persistent
                                                                }
                                                                elseif(Test-Path $Config){
                                                                    $Rename        = Rename-Item $CreatePath $NewPath
                                                                    $Cache:EntityCenterModelDatabaseSC|iex
                                                                    Sync-UDElement -Id 'EntityModelListPanelDynamicId'
                                                                    $CreateNewPath = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupNewName"+'\'
                                                                    $CreatePathGci = gci $CreateNewPath
                                                                    foreach ($Item in $CreatePathGci) {
                                                                        $ConfigCreatPath = $Item.FullName+'\'+'Config'+'.json'
                                                                        if(Test-Path $ConfigCreatPath){
                                                                            $ConfigGc        = gc $ConfigCreatPath
                                                                            $ConfigJson      = $ConfigGc | ConvertFrom-Json -Depth 100
                                                                            $ConfigModelId   = $ConfigJson.ModelId
                                                                            $ConfigModelName = $ConfigJson.ModelName
                                                                            $ConfigData      = $ConfigJson.Data
                                                                            if($null-eq $ConfigData -or $ConfigData -eq ''){
                                                                                $DatasetFormat   = '['+'{'+"'"+'GroupName'+"'"+':'+"'"+"$GroupNewName"+"'"+','+"'"+'ModelId'+"'"+':'+"'"+"$ConfigModelId"+"'"+','+"'"+'ModelName'+"'"+':'+"'"+"$ConfigModelName"+"'"+','+"'"+'Data'+"'"+':'+"'"+''+"'"+'}'+']'
                                                                            }
                                                                            else{
                                                                                $DatasetFormat   = '['+'{'+"'"+'GroupName'+"'"+':'+"'"+"$GroupNewName"+"'"+','+"'"+'ModelId'+"'"+':'+"'"+"$ConfigModelId"+"'"+','+"'"+'ModelName'+"'"+':'+"'"+"$ConfigModelName"+"'"+','+"'"+'Data'+"'"+':'+"$ConfigData"+'}'+']'
                                                                            }
                                                                            $Save = Set-Content ($Item.FullName+'\'+'Config'+'.json') -Value $DatasetFormat
                                                                            Sync-UDElement -Id 'EntityModelListPanelDynamicId'
                                                                            Hide-UDModal
                                                                            Show-UDModal -Header {
                                                                                New-UDTypography -Text 'New Entity Model Form' -ClassName 'entity-center-box-inner-title'
                                                                            } -Content {
                                                                                New-UDElement -Tag 'div' -Content {
                                                                                    $GroupListSC|iex
                                                                                    Sync-UDElement -Id 'EntityModelGroupListTableDynamicId'
                                                                                }
                                                                            } -Footer {
                                                                                New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {
                                                                                    $Cache:EntityCenterModelDatabaseSC|iex
                                                                                    Hide-UDModal
                                                                                }
                                                                            } -Persistent
                                                                        }
                                                                        else{
                                                                            Show-UDToast -Message 'Model New Config Path is not valid!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000        
                                                                        }
                                                                    }
                                                                }
                                                                else{
                                                                    Show-UDToast -Message 'Model Config File is not exist!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                                }
                                                            }
                                                            else{
                                                                Show-UDToast -Message 'Group name directory is not exist!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                            }
                                                        }
                                                        else{
                                                            Show-UDToast -Message 'Group name is not selected!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                        }
                                                    } -ClassName 'entity-center-box-btn'
                                                } -Footer {
                                                    New-UDButton -Text "Close" -OnClick {
                                                        Hide-UDModal
                                                        Show-UDModal -Header {
                                                            New-UDTypography -Text 'New Entity Model Form' -ClassName 'entity-center-box-inner-title'
                                                        } -Content {
                                                            New-UDElement -Tag 'div' -Content {
                                                                $GroupListSC|iex
                                                                Sync-UDElement -Id 'EntityModelGroupListTableDynamicId'
                                                            }
                                                        } -Footer {
                                                            New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {
                                                                $Cache:EntityCenterModelDatabaseSC|iex
                                                                Hide-UDModal
                                                            }
                                                        } -Persistent
                                                    } -ClassName 'entity-center-box-btn'
                                                } -Persistent
                                            }
                                            else{
                                                Show-UDToast -Message 'Entity Model Group is not selected!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                            }
                                        } -ClassName 'entity-center-box-btn'
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDButton -Text "Remove Group" -OnClick {
                                            if($Session:SelectedGroupRow){
                                                $GroupName = ($Session:SelectedGroupRow|ConvertFrom-Json).Group
                                                $Session:SelectedGroupRow = $null
                                                $CreatePath   = "$Cache:EntityCenterModelDatabaseListPath"+"$GroupName"
                                                Hide-UDModal
                                                Show-UDModal -Header {
                                                    New-UDTypography -Text 'Remove Group' -ClassName 'entity-center-box-inner-title'
                                                } -Content {
                                                    New-UDButton -Text "Yes" -OnClick {
                                                        if(Test-Path $CreatePath){
                                                            $RemoveGci = gci $CreatePath
                                                            if($RemoveGci.Count -gt 1){
                                                                $Remove = Remove-Item $CreatePath -Force -Recurse -ErrorAction SilentlyContinue    
                                                                if(Test-Path $CreatePath){}
                                                                else{
                                                                    $Remove = Remove-Item $CreatePath -Force -Recurse -ErrorAction SilentlyContinue    
                                                                }
                                                            }
                                                            else{
                                                                $Remove = Remove-Item $CreatePath -Force -Recurse -ErrorAction SilentlyContinue    
                                                            }
                                                            Sync-UDElement -Id 'EntityModelListPanelDynamicId'
                                                            Hide-UDModal
                                                            Show-UDModal -Header {
                                                                New-UDTypography -Text 'New Entity Model Form' -ClassName 'entity-center-box-inner-title'
                                                            } -Content {
                                                                New-UDElement -Tag 'div' -Content {
                                                                    $GroupListSC|iex
                                                                    Sync-UDElement -Id 'EntityModelGroupListTableDynamicId'
                                                                }
                                                            } -Footer {
                                                                New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {
                                                                    $Cache:EntityCenterModelDatabaseSC|iex
                                                                    Hide-UDModal
                                                                }
                                                            } -Persistent
                                                        }
                                                    } -ClassName 'entity-center-box-btn'
                                                    New-UDButton -Text "No" -OnClick {
                                                        Hide-UDModal
                                                        Show-UDModal -Header {
                                                            New-UDTypography -Text 'New Entity Model Form' -ClassName 'entity-center-box-inner-title'
                                                        } -Content {
                                                            New-UDElement -Tag 'div' -Content {
                                                                $GroupListSC|iex
                                                                Sync-UDElement -Id 'EntityModelGroupListTableDynamicId'
                                                            }
                                                        } -Footer {
                                                            New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {
                                                                $Cache:EntityCenterModelDatabaseSC|iex
                                                                Hide-UDModal
                                                            }
                                                        } -Persistent
                                                    } -ClassName 'entity-center-box-btn'
                                                } -Footer {
                                                    New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {
                                                        $Cache:EntityCenterModelDatabaseSC|iex
                                                        Hide-UDModal
                                                    }
                                                } -Persistent
                                            }
                                            else{
                                                Show-UDToast -Message 'Entity Model Group is not selected!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                            }
                                        } -ClassName 'entity-center-box-btn'
                                    }
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
            }                 
        } -Elevation 1
    }
}

$ModelListSC = {
    New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
        New-UDPaper -ClassName "entity-center-box-layout" -Square -Content {
            New-UDRow -Columns {
                New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                    New-UDElement -Tag 'table' -Content {
                        New-UDElement -Tag 'tr' -Content {
                            New-UDElement -Tag 'td' -Content {
                                New-UDIcon -Icon 'Tasks' -Size '1x' -Border -ClassName 'entity-center-box-logo'
                            }
                            New-UDElement -Tag 'td' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDTypography -Text 'Entity Model Datasets List' -ClassName 'entity-center-box-title'
                                }
                            }
                        }
                    }
                    New-UDElement -Tag 'div' -Content {
                        # DATA FORMAT
                        $Data = @()

                        # ENTITY MODEL LIST
                        $Cache:EntityCenterModelDatabaseSC|iex
                        $Session:EntityCenterModelDatabaseListData = @(
                            if($null -ne $Cache:EntityCenterModelDatabaseList){
                                foreach ($Item in $Cache:EntityCenterModelDatabaseList) {
                                    $ProcessDirName                 = $Item.DirName
                                    $ProcessDirPath                 = $Item.DirPath
                                    $ProcessDataset                 = $Item.Dataset
                                    $ProcessDatasetPath             = $Item.DatasetPath
                                    $ProcessDatasetPathTablesGc     = gc ("$ProcessDatasetPath"+'\'+'tabledatasets'+'.json')
                                    $ProcessDatasetPathTablesJson   = $ProcessDatasetPathTablesGc | ConvertFrom-Json -Depth 100
                                    $ProcessDatasetTablesItemsCount = $ProcessDatasetPathTablesJson.Count
                                    $ProcessGridItemLayoutListGc    = gc ("$ProcessDatasetPath"+'\'+'GridItemLayoutList'+'.json')
                                    $ProcessGridItemLayoutListJson  = $ProcessGridItemLayoutListGc | ConvertFrom-Json -Depth 100
                                    $ProcessGridItemLayoutListCount = $ProcessGridItemLayoutListJson.Count
                                    @{Group = $ProcessDirName;Dataset = $ProcessDataset;Tables = $ProcessGridItemLayoutListCount;Items = $ProcessDatasetTablesItemsCount;Settings = 1}
                                }
                            }
                        )
                        $Data += $Session:EntityCenterModelDatabaseListData

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
                                New-UDTableColumn -ShowSort -Property Group -Title 'Group' -IncludeInSearch -Render {
                                    New-UDTypography -Text "$($EventData.Group)"
                                }
                                New-UDTableColumn -Property Dataset -Title 'Dataset' -IncludeInSearch -Render {
                                    New-UDTypography -Text "$($EventData.Dataset)"
                                }
                                New-UDTableColumn -Property Tables -Title 'Tables' -IncludeInSearch -Render {
                                    New-UDTypography -Text "$($EventData.Tables)"
                                }
                                New-UDTableColumn -Property Items -Title 'Items' -IncludeInSearch -Render {
                                    New-UDTypography -Text "$($EventData.Items)"
                                }
                            )
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'div' -Content {
                                            New-UDStyle -Content {
                                                New-UDTable -Id 'ModelGroupListFull_table' -Data $Data -Columns $Columns -Title 'Groups' -ShowSearch -ShowPagination -ShowSelection -DisableMultiSelect -Dense -OnRowSelection {
                                                    $Item = $EventData
                                                } -PageSize 20 -ClassName 'dashboard-list-of-transactions-table-class' -ShowRefresh 
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
                    New-UDElement -Tag 'p' -Content {}
                    New-UDElement -Tag 'p' -Content {}
                }
            }                 
        } -Elevation 1
    }
}


$RestoreDatabaseSC|iex

New-UDDynamic -Id 'EntityModelControlMethodActiveDynamicId' -Content {
    if($Session:LoadedContent -eq $true){
        $Session:EntityModelControlButtonsNewCondition = $true
        $Session:LoadedContent = $null
        Sync-UDElement -Id 'EntityModelControlActiveDynamicId'
        Sync-UDElement -Id 'EntityModelControlActiveInfoButtonsDynamicId'
    }
    else{
        $RestoreDatabaseSC|iex
    }

    if($Session:EntityModelControlButtonsNewCondition -eq $true){
        $Session:EntityModelControlButtonsNewCondition = $false
        $Session:EntityModelControlButtonsCondition = $true
        $Session:EntityModelInfoButtonsCondition    = $true
    }
    else{
        $Session:EntityModelControlButtonsCondition = $false
        $Session:EntityModelInfoButtonsCondition    = $false
    }
}





$Session:EntityModelListPanelCondition = $true
New-UDDynamic -Id 'EntityModelListPanelDynamicId' -Content {
    if($Session:EntityModelListPanelCondition -eq $false){

    }
    elseif($Session:EntityModelListPanelCondition -eq $True){
        $Session:FirstRunNum=1
        $ModelListSC|iex
    }
}



$UniqueId = ([guid]::NewGuid()).Guid
New-UDGrid -Id $UniqueId -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
    New-UDElement -Tag 'table' -Content {
        New-UDElement -Tag 'tr' -Content {
            New-UDElement -Tag 'td' -Content {
                New-UDDynamic -Id 'EntityModelListActiveDynamicId' {
                    if($Session:EntityModelListPanelCondition -eq $true){
                        New-UDButton -Text 'Close Entity Model Panel' -ClassName 'entity-center-box-btn' -OnClick {
                            $Session:EntityModelListPanelCondition = $false
                            Sync-UDElement -Id 'EntityModelListPanelDynamicId'
                            Sync-UDElement -Id 'EntityModelListActiveDynamicId'
                        }
                    }
                    else{
                        New-UDButton -Text 'Open Entity Model Panel' -ClassName 'entity-center-box-btn' -OnClick {
                            $Session:EntityModelListPanelCondition = $true
                            Sync-UDElement -Id 'EntityModelListPanelDynamicId'
                            Sync-UDElement -Id 'EntityModelListActiveDynamicId'
                        }
                    }
                }
            }
            New-UDElement -Tag 'td' -Content {
                New-UDButton -Text 'Load Marked Entity Model' -ClassName 'entity-center-box-btn' -OnClick {
                    $SelectedGroupName = ((Get-UDElement -id 'ModelGroupListFull_table').SelectedRows).Group
                    $SelectedModelName = ((Get-UDElement -id 'ModelGroupListFull_table').SelectedRows).Dataset
                    $SelectedFilePath  = "$Cache:EntityCenterModelDatabaseListPath"+"$SelectedGroupName"+'\'+"$SelectedModelName"+'\'
                    if(Test-Path $SelectedFilePath){
                        $PathConfig                      = "$SelectedFilePath"+'Config'+'.json'
                        $PathCallCreateGridItemCondition = "$SelectedFilePath"+'CallCreateGridItemCondition'+'.json'
                        $PathCreateGritLayoutJson        = "$SelectedFilePath"+'CreateGritLayoutJson'+'.json'
                        $PathDatasetGridItemList         = "$SelectedFilePath"+'DatasetGridItemList'+'.json'
                        $PathGridItemLayoutList          = "$SelectedFilePath"+'GridItemLayoutList'+'.json'
                        $PathGridItemListJson            = "$SelectedFilePath"+'GridItemListJson'+'.json'
                        $PathGridItemListPSCO            = "$SelectedFilePath"+'GridItemListPSCO'+'.json'
                        $PathLayoutGridItemsJson         = "$SelectedFilePath"+'LayoutGridItemsJson'+'.json'
                        $PathTableDatasets               = "$SelectedFilePath"+'TableDatasets'+'.json'

                        if(Test-Path $PathConfig){$Valid1 = $true}
                        else{Show-UDToast -Message 'Entity Model Config.json is not found!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000}
                        if(Test-Path $PathCallCreateGridItemCondition){$Valid2 = $true}
                        else{Show-UDToast -Message 'Entity Model CallCreateGridItemCondition.json is not found!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000}
                        if(Test-Path $PathCreateGritLayoutJson){$Valid3 = $true}
                        else{Show-UDToast -Message 'Entity Model CreateGritLayoutJson.json is not found!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000}
                        if(Test-Path $PathDatasetGridItemList){$Valid4 = $true}
                        else{Show-UDToast -Message 'Entity Model DatasetGridItemList.json is not found!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000}
                        if(Test-Path $PathGridItemLayoutList){$Valid5 = $true}
                        else{Show-UDToast -Message 'Entity Model GridItemLayoutList.json is not found!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000}
                        if(Test-Path $PathGridItemListJson){$Valid6 = $true}
                        else{Show-UDToast -Message 'Entity Model GridItemListJson.json is not found!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000}
                        if(Test-Path $PathGridItemListPSCO){$Valid7 = $true}
                        else{Show-UDToast -Message 'Entity Model GridItemListPSCO.json is not found!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000}
                        if(Test-Path $PathLayoutGridItemsJson){$Valid8 = $true}
                        else{Show-UDToast -Message 'Entity Model LayoutGridItemsJson.json is not found!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000}
                        if(Test-Path $PathTableDatasets){$Valid9 = $true}
                        else{Show-UDToast -Message 'Entity Model TableDatasets.json is not found!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000}

                        if($Valid1 -eq $true -and $Valid2 -eq $true -and $Valid3 -eq $true -and $Valid4 -eq $true -and $Valid5 -eq $true -and $Valid6 -eq $true -and $Valid7 -eq $true -and $Valid8 -eq $true -and $Valid9 -eq $true){
                            Show-UDToast -Message 'Entity Model is successfully loaded!' -MessageColor 'Black' -BackgroundColor 'green' -Icon 'Check' -Title 'Success:' -Duration 5000
                            $ValidCondition = $true
                        }

                        if($ValidCondition -eq $true){
                            $GetContentConfig                      = gc $PathConfig
                            $GetContentCallCreateGridItemCondition = gc $PathCallCreateGridItemCondition
                            $GetContentCreateGritLayoutJson        = gc $PathCreateGritLayoutJson
                            $GetContentDatasetGridItemList         = gc $PathDatasetGridItemList
                            $GetContentGridItemLayoutList          = gc $PathGridItemLayoutList
                            $GetContentPathGridItemListJson        = gc $PathGridItemListJson
                            $GetContentGridItemListPSCO            = gc $PathGridItemListPSCO
                            $GetContentLayoutGridItemsJson         = gc $PathLayoutGridItemsJson
                            $GetContentTableDatasets               = gc $PathTableDatasets

                            $Session:Config                      = $GetContentConfig|ConvertFrom-Json -Depth 100
                            $Session:CallCreateGridItemCondition = $GetContentCallCreateGridItemCondition|ConvertFrom-Json -Depth 100
                            $Session:CreateGritLayoutJson        = $GetContentCreateGritLayoutJson|ConvertFrom-Json -Depth 100
                            $Session:DatasetGridItemList         = $GetContentDatasetGridItemList|ConvertFrom-Json -Depth 100
                            $Session:GridItemLayoutList          = $GetContentGridItemLayoutList|ConvertFrom-Json -Depth 100
                            $Session:PathGridItemListJson        = $GetContentPathGridItemListJson|ConvertFrom-Json -Depth 100
                            $Session:GridItemListPSCO            = $GetContentGridItemListPSCO|ConvertFrom-Json -Depth 100
                            $Session:LayoutGridItemsJson         = $GetContentLayoutGridItemsJson|ConvertFrom-Json -Depth 100
                            $Session:TableDatasets               = $GetContentTableDatasets|ConvertFrom-Json -Depth 100
                            $Session:LoadedContent               = $true
                            $Session:LoadedGroupName             = $SelectedGroupName
                            $Session:LoadedModelName             = $SelectedModelName
                            $Session:LoadedLastSaveTime          = (gci $PathConfig).LastAccessTime
                            Sync-UDElement -Id 'EntityModelControlMethodActiveDynamicId'
                            Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                            Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                            Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                        }
                    }
                }
            }
            New-UDElement -Tag 'td' -Content {
                New-UDButton -Text 'Entity Model Center' -ClassName 'entity-center-box-btn' -OnClick {
                    Show-UDModal -Header {
                        New-UDTypography -Text 'Open Entity Model Center' -ClassName 'entity-center-box-inner-title'
                    } -Content {
                        New-UDButton -Text 'Yes' -ClassName 'entity-center-box-btn' -OnClick {
                            $RestoreDatabaseSC|iex
                            Sync-UDElement -id 'EntityCenterLayoutGridDynamicId'
                            Hide-UDModal
                            Show-UDModal -Header {
                                New-UDTypography -Text 'New Entity Model Form' -ClassName 'entity-center-box-inner-title'
                            } -Content {
                                New-UDElement -Tag 'div' -Content {
                                    $GroupListSC|iex
                                    Sync-UDElement -Id 'EntityModelGroupListTableDynamicId'
                                }
                            } -Footer {
                                New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {
                                    $Cache:EntityCenterModelDatabaseSC|iex
                                    Hide-UDModal
                                }
                            } -Persistent
                        }
                        New-UDButton -Text 'No' -ClassName 'entity-center-box-btn' -OnClick {Hide-UDModal}
                    } -Footer {
                        New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {Hide-UDModal}
                    } -Persistent
                }     
            }
            New-UDDynamic -Id 'EntityModelControlActiveDynamicId' {
                if($Session:EntityModelControlButtonsCondition -eq $true){
                    New-UDElement -Tag 'td' -Content {
                        New-UDButton -Text 'Save Entity Model' -ClassName 'entity-center-box-btn' -OnClick {
                            $SaveTableDatasets               = $Session:TableDatasets | ConvertTo-Json -Depth 100
                            $SaveGridItemLayoutList          = $Session:GridItemLayoutList | ConvertTo-Json -Depth 100
                            $SaveDatasetGridItemList         = $Session:DatasetGridItemList | ConvertTo-Json -Depth 100
                            $SaveGridItemListJson            = $Session:GridItemListJson | ConvertTo-Json -Depth 100
                            $SaveGridItemListPSCO            = $Session:GridItemListPSCO | ConvertTo-Json -Depth 100
                            $SaveLayoutGridItemsJson         = $Session:LayoutGridItemsJson | ConvertTo-Json -Depth 100
                            $SaveCreateGritLayoutJson        = $Session:CreateGritLayoutJson | ConvertTo-Json -Depth 100
                            $SaveCallCreateGridItemCondition = $Session:CallCreateGridItemCondition | ConvertTo-Json -Depth 100
                            $InfoGroupName     = ((Get-UDElement -id 'InfoButtonGroupNameId').Text) -replace 'Group: ',''
                            $InfoModelName     = ((Get-UDElement -id 'InfoButtonModelNameId').Text) -replace 'Model: ',''
                            $InfoLasSaveTime   = ((Get-UDElement -id 'InfoButtonLastSaveTimeId').Text) -replace 'Last Save: ',''
                            $SelectedFilePath  = "$Cache:EntityCenterModelDatabaseListPath"+"$InfoGroupName"+'\'+"$InfoModelName"+'\'
                            if(Test-Path $SelectedFilePath){
                                $PathCallCreateGridItemCondition = "$SelectedFilePath"+'CallCreateGridItemCondition'+'.json'
                                $PathCreateGritLayoutJson        = "$SelectedFilePath"+'CreateGritLayoutJson'+'.json'
                                $PathDatasetGridItemList         = "$SelectedFilePath"+'DatasetGridItemList'+'.json'
                                $PathGridItemLayoutList          = "$SelectedFilePath"+'GridItemLayoutList'+'.json'
                                $PathGridItemListJson            = "$SelectedFilePath"+'GridItemListJson'+'.json'
                                $PathGridItemListPSCO            = "$SelectedFilePath"+'GridItemListPSCO'+'.json'
                                $PathLayoutGridItemsJson         = "$SelectedFilePath"+'LayoutGridItemsJson'+'.json'
                                $PathTableDatasets               = "$SelectedFilePath"+'TableDatasets'+'.json'
        
                                if(Test-Path $PathCallCreateGridItemCondition){$Save = Set-Content $PathCallCreateGridItemCondition -Value $SaveCallCreateGridItemCondition}
                                else{$Save = New-Item -ItemType File $PathCallCreateGridItemCondition -Value $SaveCallCreateGridItemCondition}
                                if(Test-Path $PathCreateGritLayoutJson){$Save = Set-Content $PathCreateGritLayoutJson -Value $SaveCreateGritLayoutJson}
                                else{$Save = New-Item -ItemType File $PathCreateGritLayoutJson -Value $SaveCreateGritLayoutJson}
                                if(Test-Path $PathDatasetGridItemList){$Save = Set-Content $PathDatasetGridItemList -Value $SaveDatasetGridItemList}
                                else{$Save = New-Item -ItemType File $PathDatasetGridItemList -Value $SaveDatasetGridItemList}
                                if(Test-Path $PathGridItemLayoutList){$Save = Set-Content $PathGridItemLayoutList -Value $SaveGridItemLayoutList}
                                else{$Save = New-Item -ItemType File $PatPathGridItemLayoutListhConfig -Value $SaveGridItemLayoutList}
                                if(Test-Path $PathGridItemListJson){$Save = Set-Content $PathGridItemListJson -Value $SaveGridItemListJson}
                                else{$Save = New-Item -ItemType File $PathGridItemListJson -Value $SaveGridItemListJson}
                                if(Test-Path $PathGridItemListPSCO){$Save = Set-Content $PathGridItemListPSCO -Value $SaveGridItemListPSCO}
                                else{$Save = New-Item -ItemType File $PathGridItemListPSCO -Value $SaveGridItemListPSCO}
                                if(Test-Path $PathLayoutGridItemsJson){$Save = Set-Content $PathLayoutGridItemsJson -Value $SaveLayoutGridItemsJson}
                                else{$Save = New-Item -ItemType File $PathLayoutGridItemsJson -Value $SaveLayoutGridItemsJson}
                                if(Test-Path $PathTableDatasets){$Save = Set-Content $PathTableDatasets -Value $SaveTableDatasets}
                                else{$Save = New-Item -ItemType File $PathTableDatasets -Value $SaveTableDatasets}
        
                                # CREATE FUNCTIONS
                                if($Session:TableDatasets){

                                    $TableDatasetsData = $Session:TableDatasets
                                    $testnum = 0
                                    $MergeListDatasets = @()
                                    foreach ($Dataset in $TableDatasetsData) {
                                       
                                        if($false -ne $($MergeListDatasets.Id -match $Dataset.TableId)){
                                            $GetIndex       = [array]::indexof($MergeListDatasets.Id,$Dataset.TableId)
                                            $MergeListCount = (($MergeListDatasets[$GetIndex]).Datasets).Count
                                            $SubMergeList   = @()
                                            $num = 0
                                            1..$MergeListCount | % {
                                                $TableDataset = [PSCustomObject]@{
                                                    TableId       = ((($MergeListDatasets[$GetIndex]).Datasets)[$num]).TableId
                                                    ItemId        = ((($MergeListDatasets[$GetIndex]).Datasets)[$num]).ItemId
                                                    ItemName      = ((($MergeListDatasets[$GetIndex]).Datasets)[$num]).ItemName
                                                    ItemType      = ((($MergeListDatasets[$GetIndex]).Datasets)[$num]).ItemType
                                                    ItemTypeKey   = ((($MergeListDatasets[$GetIndex]).Datasets)[$num]).ItemTypeKey
                                                    ItemTypeData  = ((($MergeListDatasets[$GetIndex]).Datasets)[$num]).ItemTypeData
                                                    ItemMandatory = ((($MergeListDatasets[$GetIndex]).Datasets)[$num]).ItemMandatory
                                                }
                                                $SubMergeList += $TableDataset
                                                $num++
                                            }
                                            $SubMergeList += $Dataset
                                            ($MergeListDatasets[$GetIndex]).Datasets = $SubMergeList
                                        }
                                        else{
                                            $MergeListPSCO = [PSCustomObject]@{
                                                Id        = $Dataset.TableId
                                                Name      = $null
                                                Datasets  = $Dataset
                                                FunctionsGet    = $null
                                                FunctionsAdd    = $null
                                                FunctionsDelete = $null
                                                FunctionsUpdate = $null
                                            }
                                            $MergeListDatasets += $MergeListPSCO
                                        }
                                        $testnum++
                                    }

                                    $GridItemListData = $Session:GridItemListPSCO
                                    
                                    # GET MODEL TABLE NAME
                                    $EditListDatasets = @()
                                    if($null -ne $MergeListDatasets){
                                        foreach ($SelectDataset in $MergeListDatasets) {
                                            if($null -ne $GridItemListData){
                                                $GetGritItemIndexById   = [array]::indexof(($GridItemListData).Id,$SelectDataset.Id)
                                                $GetGritItemDataByIndex = $GridItemListData[$GetGritItemIndexById]
                                                $ModelTableName         = $GetGritItemDataByIndex.Name
                                                $NewSelectDataset       = [PSCustomObject]@{
                                                    Id        = $SelectDataset.Id
                                                    Name      = $ModelTableName
                                                    Datasets  = $SelectDataset.Datasets
                                                    FunctionsGet    = $null
                                                    FunctionsAdd    = $null
                                                    FunctionsDelete = $null
                                                    FunctionsUpdate = $null
                                                }
                                                $EditListDatasets += $NewSelectDataset
                                            }
                                        }
                                    }

                                    $EntityDataList = @()
                                    # CREATE FUNCTION
                                    foreach ($FunctionData in $EditListDatasets) {
                                        $FunctionDataId               = $FunctionData.Id
                                        $CacheFormatDataId            = $FunctionDataId -replace '-','_'
                                        $SuggestionForGetFunction     = 'Get-'+'PSUCA-'+$FunctionData.Name
                                        $SuggestionForAddFunction     = 'Add-'+'PSUCA-'+$FunctionData.Name
                                        $SuggestionForDeleteFunction  = 'Delete-'+'PSUCA-'+$FunctionData.Name
                                        $SuggestionForUpdateFunction  = 'Update-'+'PSUCA-'+$FunctionData.Name
                                        $ArgumentParameterList        = @()
                                        foreach ($Dataset in $FunctionData.Datasets) {
                                            $ParamName      = $Dataset.ItemName
                                            $ParamType      = $Dataset.ItemType
                                            $ParamTypeData  = $Dataset.ItemTypeData
                                            $ParamMandatory = $Dataset.ItemMandatory
                                            $Argument       = [PSCustomObject]@{
                                                Name      = $ParamName
                                                Type      = $ParamType
                                                TypeData  = $ParamTypeData
                                                Mandatory = $ParamMandatory
                                            }
                                            $ArgumentParameterList += $Argument
                                        }

                                        $PathConfig      = "$SelectedFilePath"+'Config'+'.json'
                                        $PathConfigGc    = gc $PathConfig
                                        $PathConfigJson  = $PathConfigGc|ConvertFrom-Json -Depth 100
                                        $GroupNewName    = $PathConfigJson.GroupName
                                        $ConfigModelId   = $PathConfigJson.ModelId
                                        $ConfigModelName = $PathConfigJson.ModelName

                                        $ArgumentParameterListToJson = $ArgumentParameterList | ConvertTo-Json -Compress

                                        # GET FUNCTION
                                        $GetSwitchScriptBlock = {
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
                                                                        $Arguments            = 'importargumentparameterlist'
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
    
                                                                            $Arguments            = 'importargumentparameterlist'
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
                                                                $RequestData = iwr ('importserverurladdress'+'api/stream') -Method Post -Body (@{Token='importpsuapptoken';ApiType='GET';;ApiArg='All';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content){
                                                                    $DatabaseList       = $RequestData.Content|ConvertFrom-Json -Depth 100
                                                                    if($DatabaseList){
                                                                        $Arguments            = 'importargumentparameterlist'
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
                                                                $RequestData = iwr ('importserverurladdress'+'api/stream') -Method Post -Body (@{Token='importpsuapptoken';ApiType='GET';;ApiArg='Selected';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content){
                                                                    $DatabaseList       = $RequestData.Content|ConvertFrom-Json -Depth 100
                                                                    if($DatabaseList){
                                                                        $Arguments            = 'importargumentparameterlist'
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
                                                                    $Arguments            = 'importargumentparameterlist'
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
    
                                                                        $Arguments            = 'importargumentparameterlist'
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
                                                                        $Arguments            = 'importargumentparameterlist'
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
    
                                                                            $Arguments            = 'importargumentparameterlist'
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
                                        } -replace 'importargumentparameterlist',"$ArgumentParameterListToJson" -replace 'importserverurladdress',"$Cache:ServerUrlAdress" -replace 'importpsuapptoken',"$Cache:GlobalApiAppToken"
                                        
                                        $ParameterStringList = @()
                                        $ParameterCacheMethod = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CacheMethod'
                                        $ParameterStringList += $ParameterCacheMethod
                                        $ParameterCacheType   = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CacheType'
                                        $ParameterStringList += $ParameterCacheType
                                        $ParameterCachePoint  = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CachePoint'
                                        $ParameterStringList += $ParameterCachePoint
                                        $ParameterData        = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'hashtable'+']'+'$'+'CacheData'
                                        $ParameterStringList += $ParameterData

                                        foreach ($Parameter in $ArgumentParameterList) {
                                            $ParameterString = '['+'Parameter'+'('+'Mandatory='+'$'+$Parameter.Mandatory+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+$Parameter.TypeData+']'+'$'+'Argument_'+$Parameter.Name
                                            $ParameterStringList += $ParameterString
                                        }

                                        $FunctionGetParametersString = $null
                                        if($ParameterStringList.Count -gt 1){
                                            $num = 0
                                            foreach ($ParameterString in $ParameterStringList) {
                                                if($num -eq ($ParameterStringList.Count-1)){
                                                    [string]$FunctionGetParametersString += $ParameterString
                                                }
                                                else{
                                                    [string]$FunctionGetParametersString += $ParameterString+','
                                                }
                                                $num++
                                            }
                                        }
                                        elseif($ParameterStringList.Count -eq 1){
                                            $FunctionGetParametersString = $ParameterStringList
                                        }

                                        $GetFunctionLayoutString = 'function'+' '+"$SuggestionForGetFunction"+' '+'{'+'['+'CmdletBinding'+'('+')'+']'+
                                                                   'Param'+'('+"$FunctionGetParametersString"+')'+
                                                                   'Begin'+'{'+
                                                                        '['+'string'+']'+'$'+'CacheModelId'+'='+"'"+"$ConfigModelId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CacheTableId'+'='+"'"+"$FunctionDataId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CachePSU'+'='+"'"+"$CachePoint"+'_'+"$CacheFormatDataId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CacheTerminal'+'='+"'"+'$'+'Global'+':'+"$CacheFormatDataId"+"'"+'}'+
                                                                   'Process'+'{'+"$GetSwitchScriptBlock"+'}'+
                                                                   'End'+'{'+'$'+'FunctionResult'+'}'+'}'

                                        # ADD FUNCTION
                                        $AddSwitchScriptBlock = {
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
                                                                $RequestData = iwr ('importserverurladdress'+'api/stream') -Method Post -Body (@{Token='importpsuapptoken';ApiType='ADD';;ApiArg='All';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
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
                                                                $RequestData = iwr ('importserverurladdress'+'api/stream') -Method Post -Body (@{Token='importpsuapptoken';ApiType='ADD';;ApiArg='Selected';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
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
                                        } -replace 'importargumentparameterlist',"$ArgumentParameterListToJson" -replace 'importserverurladdress',"$Cache:ServerUrlAdress" -replace 'importpsuapptoken',"$Cache:GlobalApiAppToken"

                                        $ParameterStringList = @()
                                        $ParameterCacheMethod = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CacheMethod'
                                        $ParameterStringList += $ParameterCacheMethod
                                        $ParameterCacheType   = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CacheType'
                                        $ParameterStringList += $ParameterCacheType
                                        $ParameterCachePoint  = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CachePoint'
                                        $ParameterStringList += $ParameterCachePoint
                                        $ParameterData        = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'hashtable'+']'+'$'+'CacheData'
                                        $ParameterStringList += $ParameterData

                                        <#
                                        foreach ($Parameter in $ArgumentParameterList) {
                                            $ParameterString = '['+'Parameter'+'('+'Mandatory='+'$'+$Parameter.Mandatory+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+$Parameter.TypeData+']'+'$'+'Argument_'+$Parameter.Name
                                            $ParameterStringList += $ParameterString
                                        }                                        
                                        #>

                                        $FunctionAddParametersString = $null
                                        if($ParameterStringList.Count -gt 1){
                                            $num = 0
                                            foreach ($ParameterString in $ParameterStringList) {
                                                if($num -eq ($ParameterStringList.Count-1)){
                                                    [string]$FunctionAddParametersString += $ParameterString
                                                }
                                                else{
                                                    [string]$FunctionAddParametersString += $ParameterString+','
                                                }
                                                $num++
                                            }
                                        }
                                        elseif($ParameterStringList.Count -eq 1){
                                            $FunctionAddParametersString = $ParameterStringList
                                        }

                                        $AddFunctionLayoutString = 'function'+' '+"$SuggestionForAddFunction"+' '+'{'+'['+'CmdletBinding'+'('+')'+']'+
                                                                   'Param'+'('+"$FunctionAddParametersString"+')'+
                                                                   'Begin'+'{'+
                                                                        '['+'string'+']'+'$'+'CacheModelId'+'='+"'"+"$ConfigModelId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CacheTableId'+'='+"'"+"$FunctionDataId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CachePSU'+'='+"'"+"$CachePoint"+'_'+"$CacheFormatDataId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CacheTerminal'+'='+"'"+'$'+'Global'+':'+"$CacheFormatDataId"+"'"+'}'+
                                                                    'Process'+'{'+"$AddSwitchScriptBlock"+'}'+
                                                                    'End'+'{'+'$'+'FunctionResult'+'}'+'}'


                                        # DELETE FUNCTION
                                        $DeleteSwitchScriptBlock = {
                                            switch ($CacheMethod) {
                                                'local'    {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $CachePath    = $CacheData.Path
                                                                $DatabasePath = "$CachePath"+"$CacheModelId"+'\'+"$CacheTableId"+'\'+"$CachePoint"+'\'+'data.db'
                                                                if(Test-Path $DatabasePath){
                                                                    $Delete = Set-Content $DatabasePath -Value $null
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
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CachePath      = $CacheData.Path
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

                                                                            if(($CacheArrayList).Count -eq 1){
                                                                                ($DatabaseList[$CCacheArrayList]) = $null
                                                                                $DatabaseList   = $DatabaseList.Where({ $null -ne $_ })
                                                                                $Delete         = Set-Content $DatabasePath -Value $DatabaseList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif(($CacheArrayList).Count -gt 1){
                                                                                foreach ($Index in $CacheArrayList) {
                                                                                    ($DatabaseList[$Index]) = $null
                                                                                }
                                                                                $DatabaseList   = $DatabaseList.Where({ $null -ne $_ })
                                                                                $Delete         = Set-Content $DatabasePath -Value $DatabaseList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            else{
                                                                                $FunctionResult = $false
                                                                            }
                                                                        }
                                                                        else{
                                                                            $FunctionResult = $true
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
                                                                $RequestData = iwr ('importserverurladdress'+'api/stream') -Method Post -Body (@{Token='importpsuapptoken';ApiType='DELETE';ApiArg='All';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content -eq 'Delete'){
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
                                                                    Content   = $null
                                                                }
                                                                $RequestData = iwr ('importserverurladdress'+'api/stream') -Method Post -Body (@{Token='importpsuapptoken';ApiType='DELETE';ApiArg='Selected';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content -eq 'Delete'){
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

                                                            }
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){

                                                            }
                                                        }
                                                    }
                                                }
                                                'terminal' {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                $Delete     = ("$CacheTerminal"+'='+'$'+'null')|iex
                                                                $DeleteData = $CacheTerminal|iex
                                                                if($null -eq $DeleteData){
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
                                                            if($CacheTableId){
                                                                $DatabasePath = $CacheTerminal|iex
                                                                $CacheArrayList   = $CacheData.ArrayList
                                                                if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                                                                    $DatabaseList = $DatabasePath
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
                                                                            ($DatabaseList[$CacheArrayList]) = $null
                                                                            $DatabaseList   = $DatabaseList.Where({ $null -ne $_ })
                                                                            $Delete         = ("$CacheTerminal"+'='+'$'+'DatabaseList')|iex
                                                                            $FunctionResult = $true
                                                                        }
                                                                        elseif(($CacheArrayList).Count -gt 1){
                                                                            foreach ($Index in $CacheArrayList) {
                                                                                ($DatabaseList[$Index]) = $null
                                                                            }
                                                                            $DatabaseList   = $DatabaseList.Where({ $null -ne $_ })
                                                                            $Delete         = ("$CacheTerminal"+'='+'$'+'DatabaseList')|iex
                                                                            $FunctionResult = $true
                                                                        }
                                                                        else{
                                                                            $FunctionResult = $false
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $true
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
                                                                    $Delete = Set-Content $DatabasePath -Value $null
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
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CachePath      = $CacheData.Path
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

                                                                            if(($CacheArrayList).Count -eq 1){
                                                                                ($DatabaseList[$CCacheArrayList]) = $null
                                                                                $DatabaseList   = $DatabaseList.Where({ $null -ne $_ })
                                                                                $Delete         = Set-Content $DatabasePath -Value $DatabaseList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif(($CacheArrayList).Count -gt 1){
                                                                                foreach ($Index in $CacheArrayList) {
                                                                                    ($DatabaseList[$Index]) = $null
                                                                                }
                                                                                $DatabaseList   = $DatabaseList.Where({ $null -ne $_ })
                                                                                $Delete         = Set-Content $DatabasePath -Value $DatabaseList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            else{
                                                                                $FunctionResult = $false
                                                                            }
                                                                        }
                                                                        else{
                                                                            $FunctionResult = $true
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
                                        } -replace 'importargumentparameterlist',"$ArgumentParameterListToJson" -replace 'importserverurladdress',"$Cache:ServerUrlAdress" -replace 'importpsuapptoken',"$Cache:GlobalApiAppToken"

                                        $ParameterStringList = @()
                                        $ParameterCacheMethod = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CacheMethod'
                                        $ParameterStringList += $ParameterCacheMethod
                                        $ParameterCacheType   = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CacheType'
                                        $ParameterStringList += $ParameterCacheType
                                        $ParameterCachePoint  = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CachePoint'
                                        $ParameterStringList += $ParameterCachePoint
                                        $ParameterData        = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'hashtable'+']'+'$'+'CacheData'
                                        $ParameterStringList += $ParameterData

                                        <#
                                        foreach ($Parameter in $ArgumentParameterList) {
                                            $ParameterString = '['+'Parameter'+'('+'Mandatory='+'$'+$Parameter.Mandatory+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+$Parameter.TypeData+']'+'$'+'Argument_'+$Parameter.Name
                                            $ParameterStringList += $ParameterString
                                        }                                        
                                        #>

                                        $FunctionDeleteParametersString = $null
                                        if($ParameterStringList.Count -gt 1){
                                            $num = 0
                                            foreach ($ParameterString in $ParameterStringList) {
                                                if($num -eq ($ParameterStringList.Count-1)){
                                                    [string]$FunctionDeleteParametersString += $ParameterString
                                                }
                                                else{
                                                    [string]$FunctionDeleteParametersString += $ParameterString+','
                                                }
                                                $num++
                                            }
                                        }
                                        elseif($ParameterStringList.Count -eq 1){
                                            $FunctionDeleteParametersString = $ParameterStringList
                                        }

                                        $DeleteFunctionLayoutString = 'function'+' '+"$SuggestionForDeleteFunction"+' '+'{'+'['+'CmdletBinding'+'('+')'+']'+
                                                                   'Param'+'('+"$FunctionDeleteParametersString"+')'+
                                                                   'Begin'+'{'+
                                                                        '['+'string'+']'+'$'+'CacheModelId'+'='+"'"+"$ConfigModelId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CacheTableId'+'='+"'"+"$FunctionDataId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CachePSU'+'='+"'"+"$CachePoint"+'_'+"$CacheFormatDataId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CacheTerminal'+'='+"'"+'$'+'Global'+':'+"$CacheFormatDataId"+"'"+'}'+
                                                                    'Process'+'{'+"$DeleteSwitchScriptBlock"+'}'+
                                                                    'End'+'{'+'$'+'FunctionResult'+'}'+'}'

                                        # UPDATE FUNCTION
                                        $UpdateSwitchScriptBlock = {
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
                                                                        $UpdateContent  = Set-Content $DatabasePath -Value $CacheContent
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
                                                                        $UpdateContent  = Set-Content $DatabasePath -Value $CacheContent
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

                                                                            if(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -gt 1){
                                                                                $DatabaseList[$CacheArrayList] = $CacheContent
                                                                                $UpdateContent  = Set-Content $DatabasePath -Value $DatabaseList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            if(($CacheArrayList).Count -gt 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Index in $CacheArrayList) {
                                                                                    $DatabaseList[$Index] = $CacheContent[$num]
                                                                                    $num++
                                                                                }
                                                                                $UpdateContent  = Set-Content $DatabasePath -Value $DatabaseList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -eq 1){
                                                                                if($CacheArrayList -eq 0){
                                                                                    $DatabaseList[$CacheArrayList] = $CacheContent
                                                                                    $UpdateContent  = Set-Content $DatabasePath -Value $DatabaseList
                                                                                    $FunctionResult = $true
                                                                                }
                                                                                elseif($CacheArrayList -gt 0){
                                                                                    $DatabaseList[$CacheArrayList] = $CacheContent
                                                                                    $UpdateContent  = Set-Content $DatabasePath -Value $DatabaseList
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
                                                                            $UpdateContent  = Set-Content $DatabasePath -Value $CacheContent
                                                                            $FunctionResult = $true
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                    $FunctionResult = $DatabaseList
                                                                }
                                                                else{
                                                                    if($CacheContent){
                                                                        $NewDir         = New-Item -ItemType Directory $DatabaseDir
                                                                        $NewFile        = New-Item -ItemType File $DatabasePath
                                                                        $UpdateContent  = Set-Content $DatabasePath -Value $CacheContent
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
                                                                $RequestData = iwr ('importserverurladdress'+'api/stream') -Method Post -Body (@{Token='importpsuapptoken';ApiType='UPDATE';ApiArg='All';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content -eq 'Update'){
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
                                                                $RequestData = iwr ('importserverurladdress'+'api/stream') -Method Post -Body (@{Token='importpsuapptoken';ApiType='UPDATE';ApiArg='Selected';ApiData=$ApiDataPSCO} | ConvertTo-Json -Depth 100) -ContentType 'application/json'
                                                                if($RequestData.Content -eq 'Update'){
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

                                                            }
                                                        }
                                                    }
                                                    elseif($CacheType -eq 'Selected'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){

                                                            }
                                                        }
                                                    }
                                                }
                                                'terminal' {
                                                    if($CacheType -eq 'All'){
                                                        if($CacheModelId){
                                                            if($CacheTableId){
                                                                if($CacheData){
                                                                    $UpdateContent = $CacheData.Content
                                                                    $Update        = ("$CacheTerminal"+'='+'$'+'UpdateContent')|iex
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
                                                            if($CacheTableId){
                                                                $CacheArrayList = $CacheData.ArrayList
                                                                $CacheContent   = $CacheData.Content
                                                                if($CacheArrayList -and $CacheContent){
                                                                    if($null -ne $($CacheArrayList -match "^[\d\.]+$") -and (($null -eq $($CacheArrayList -match '^[A-Z]+$')) -or ($false -eq $($CacheArrayList -match '^[A-Z]+$')))){
                                                                        $DatabaseList = $CacheTerminal|iex

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
                                                                            if(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -gt 1){
                                                                                ($DatabaseList[$CacheArrayList]) = $CacheContent
                                                                                $Update = ("$CacheTerminal"+'='+'$'+'DatabaseList')|iex
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif(($CacheArrayList).Count -gt 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Index in $CacheArrayList) {
                                                                                    ($DatabaseList[$Index]) = ($CacheContent)[$num]
                                                                                    $num++
                                                                                }
                                                                                $Update = ("$CacheTerminal"+'='+'$'+'DatabaseList')|iex
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -eq 1){
                                                                                ($DatabaseList[$CacheArrayList]) = $CacheContent
                                                                                $Update = ("$CacheTerminal"+'='+'$'+'DatabaseList')|iex
                                                                                $FunctionResult = $true
                                                                            }  
                                                                            else{
                                                                                $FunctionResult = $false
                                                                            }
                                                                        }
                                                                        else{
                                                                            $Update = ("$CacheTerminal"+'='+'$'+'CacheContent')|iex
                                                                            $FunctionResult = $true
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
                                                                        $UpdateContent  = Set-Content $DatabasePath -Value $CacheContent
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
                                                                        $UpdateContent  = Set-Content $DatabasePath -Value $CacheContent
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

                                                                            if(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -gt 1){
                                                                                $DatabaseList[$CacheArrayList] = $CacheContent
                                                                                $UpdateContent  = Set-Content $DatabasePath -Value $DatabaseList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            if(($CacheArrayList).Count -gt 1 -and ($CacheContent).Count -gt 1){
                                                                                $num = 0
                                                                                foreach ($Index in $CacheArrayList) {
                                                                                    $DatabaseList[$Index] = $CacheContent[$num]
                                                                                    $num++
                                                                                }
                                                                                $UpdateContent  = Set-Content $DatabasePath -Value $DatabaseList
                                                                                $FunctionResult = $true
                                                                            }
                                                                            elseif(($CacheArrayList).Count -eq 1 -and ($CacheContent).Count -eq 1){
                                                                                if($CacheArrayList -eq 0){
                                                                                    $DatabaseList[$CacheArrayList] = $CacheContent
                                                                                    $UpdateContent  = Set-Content $DatabasePath -Value $DatabaseList
                                                                                    $FunctionResult = $true
                                                                                }
                                                                                elseif($CacheArrayList -gt 0){
                                                                                    $DatabaseList[$CacheArrayList] = $CacheContent
                                                                                    $UpdateContent  = Set-Content $DatabasePath -Value $DatabaseList
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
                                                                            $UpdateContent  = Set-Content $DatabasePath -Value $CacheContent
                                                                            $FunctionResult = $true
                                                                        }
                                                                    }
                                                                    else{
                                                                        $FunctionResult = $false
                                                                    }
                                                                    $FunctionResult = $DatabaseList
                                                                }
                                                                else{
                                                                    if($CacheContent){
                                                                        $NewDir         = New-Item -ItemType Directory $DatabaseDir
                                                                        $NewFile        = New-Item -ItemType File $DatabasePath
                                                                        $UpdateContent  = Set-Content $DatabasePath -Value $CacheContent
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
                                        } -replace 'importargumentparameterlist',"$ArgumentParameterListToJson" -replace 'importserverurladdress',"$Cache:ServerUrlAdress" -replace 'importpsuapptoken',"$Cache:GlobalApiAppToken"

                                        $ParameterStringList = @()
                                        $ParameterCacheMethod = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CacheMethod'
                                        $ParameterStringList += $ParameterCacheMethod
                                        $ParameterCacheType   = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CacheType'
                                        $ParameterStringList += $ParameterCacheType
                                        $ParameterCachePoint  = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'string'+']'+'$'+'CachePoint'
                                        $ParameterStringList += $ParameterCachePoint
                                        $ParameterData        = '['+'Parameter'+'('+'Mandatory='+'$'+'true'+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+'hashtable'+']'+'$'+'CacheData'
                                        $ParameterStringList += $ParameterData

                                        <#
                                        foreach ($Parameter in $ArgumentParameterList) {
                                            $ParameterString = '['+'Parameter'+'('+'Mandatory='+'$'+$Parameter.Mandatory+','+'ValueFromPipelineByPropertyName'+')'+']'+'['+$Parameter.TypeData+']'+'$'+'Argument_'+$Parameter.Name
                                            $ParameterStringList += $ParameterString
                                        }                                        
                                        #>

                                        $FunctionUpdateParametersString = $null
                                        if($ParameterStringList.Count -gt 1){
                                            $num = 0
                                            foreach ($ParameterString in $ParameterStringList) {
                                                if($num -eq ($ParameterStringList.Count-1)){
                                                    [string]$FunctionUpdateParametersString += $ParameterString
                                                }
                                                else{
                                                    [string]$FunctionUpdateParametersString += $ParameterString+','
                                                }
                                                $num++
                                            }
                                        }
                                        elseif($ParameterStringList.Count -eq 1){
                                            $FunctionUpdateParametersString = $ParameterStringList
                                        }

                                        $UpdateFunctionLayoutString = 'function'+' '+"$SuggestionForUpdateFunction"+' '+'{'+'['+'CmdletBinding'+'('+')'+']'+
                                                                   'Param'+'('+"$FunctionUpdateParametersString"+')'+
                                                                   'Begin'+'{'+
                                                                        '['+'string'+']'+'$'+'CacheModelId'+'='+"'"+"$ConfigModelId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CacheTableId'+'='+"'"+"$FunctionDataId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CachePSU'+'='+"'"+"$CachePoint"+'_'+"$CacheFormatDataId"+"'"+';'+
                                                                        '['+'string'+']'+'$'+'CacheTerminal'+'='+"'"+'$'+'Global'+':'+"$CacheFormatDataId"+"'"+'}'+
                                                                    'Process'+'{'+"$UpdateSwitchScriptBlock"+'}'+
                                                                    'End'+'{'+'$'+'FunctionResult'+'}'+'}'

                                        $EntityDataPSCO = [PSCustomObject]@{
                                            Id              = $FunctionData.Id
                                            Name            = $FunctionData.Name
                                            Datasets        = $FunctionData.Datasets
                                            FunctionsGet    = $GetFunctionLayoutString
                                            FunctionsAdd    = $AddFunctionLayoutString
                                            FunctionsDelete = $DeleteFunctionLayoutString
                                            FunctionsUpdate = $UpdateFunctionLayoutString
                                        }
                                        $EntityDataList += $EntityDataPSCO

                                    }

                                    $ConfigData      = $EntityDataList|ConvertTo-Json -Depth 100

                                    if($null -eq $EntityDataList -or $EntityDataList -eq ''){
                                        $DatasetFormat   = '['+'{'+"'"+'GroupName'+"'"+':'+"'"+"$GroupNewName"+"'"+','+"'"+'ModelId'+"'"+':'+"'"+"$ConfigModelId"+"'"+','+"'"+'ModelName'+"'"+':'+"'"+"$ConfigModelName"+"'"+','+"'"+'Data'+"'"+':'+"'"+""+"'"+'}'+']'
                                    }
                                    else{
                                        $DatasetFormat   = '['+'{'+"'"+'GroupName'+"'"+':'+"'"+"$GroupNewName"+"'"+','+"'"+'ModelId'+"'"+':'+"'"+"$ConfigModelId"+"'"+','+"'"+'ModelName'+"'"+':'+"'"+"$ConfigModelName"+"'"+','+"'"+'Data'+"'"+':'+"$ConfigData"+'}'+']'
                                    }
                                    
                                    if(Test-Path $PathConfig){$Save = Set-Content $PathConfig -Value $DatasetFormat}
                                    else{$Save = New-Item -ItemType File $PathConfig -Value $DatasetFormat}

                                }
                                else{
                                    $PathConfig      = "$SelectedFilePath"+'Config'+'.json'
                                    $PathConfigGc    = gc $PathConfig
                                    $PathConfigJson  = $PathConfigGc|ConvertFrom-Json -Depth 100
                                    $GroupNewName    = $PathConfigJson.GroupName
                                    $ConfigModelId   = $PathConfigJson.ModelId
                                    $ConfigModelName = $PathConfigJson.ModelName
                                    $ConfigData      = $null

                                    if($null -eq $ConfigData -or $ConfigData -eq ''){
                                        $DatasetFormat   = '['+'{'+"'"+'GroupName'+"'"+':'+"'"+"$GroupNewName"+"'"+','+"'"+'ModelId'+"'"+':'+"'"+"$ConfigModelId"+"'"+','+"'"+'ModelName'+"'"+':'+"'"+"$ConfigModelName"+"'"+','+"'"+'Data'+"'"+':'+"'"+""+"'"+'}'+']'
                                    }
                                    else{
                                        $DatasetFormat   = '['+'{'+"'"+'GroupName'+"'"+':'+"'"+"$GroupNewName"+"'"+','+"'"+'ModelId'+"'"+':'+"'"+"$ConfigModelId"+"'"+','+"'"+'ModelName'+"'"+':'+"'"+"$ConfigModelName"+"'"+','+"'"+'Data'+"'"+':'+"$ConfigData"+'}'+']'
                                    }

                                    if(Test-Path $PathConfig){$Save = Set-Content $PathConfig -Value $DatasetFormat}
                                    else{$Save = New-Item -ItemType File $PathConfig -Value $DatasetFormat}
                                }

                                Show-UDToast -Message 'Entity Model is successfully loaded!' -MessageColor 'Black' -BackgroundColor 'green' -Icon 'Check' -Title 'Success:' -Duration 5000
                                Show-UDToast -Message $InfoLasSaveTime -MessageColor 'Black' -BackgroundColor 'green' -Icon 'Clock' -Title 'Save Time:' -Duration 5000
                                $Session:LoadedContent = $true
                                Sync-UDElement -Id 'EntityModelListPanelDynamicId'
                                Sync-UDElement -Id 'EntityModelControlMethodActiveDynamicId'
                            }
                            else{
                                Show-UDToast -Message 'Entity Model Path is not found!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                            }                            
                        }    
                    }
                    New-UDElement -Tag 'td' -Content {
                        New-UDButton -Text 'Update Entity Model' -ClassName 'entity-center-box-btn' -OnClick {
                            Sync-UDElement -id 'ItemForeignKeyColorDynamic'
                            Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                        } 
                    }
                    New-UDElement -Tag 'td' -Content {
                        New-UDButton -Text 'Add New Entity Table' -ClassName 'entity-center-box-btn' -OnClick {
                            Show-UDModal -Header {
                                New-UDTypography -Text 'Create New Entity Model Table' -ClassName 'entity-center-box-inner-title'
                            } -Content {
                                $UniqueId                  = ([guid]::NewGuid()).Guid
                                $NewModelTableUniqueId     = ("$UniqueId"+'-ModelTableIdTextBox')
                                $NewModelTableNameId       = ("$UniqueId"+'-ModelTableNameIdTextBox')
                                New-UDElement -Tag 'div' -Content {
                                    New-UDElement -Tag 'table' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDElement -Tag 'td' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDTypography -Text 'Model Table Id' -ClassName 'entity-center-box-inner-title'
                                                }
                                            }
                                            New-UDElement -Tag 'td' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDTextbox -Id $NewModelTableUniqueId -Type text -ClassName 'entity-center-box-long-text' -Value $UniqueId -Disabled 
                                                }
                                            }
                                        }
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDElement -Tag 'td' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDTypography -Text 'Model Table Name' -ClassName 'entity-center-box-inner-title'
                                                }
                                            }
                                            New-UDElement -Tag 'td' -Content {
                                                New-UDElement -Tag 'tr' -Content {
                                                    New-UDTextbox -Id $NewModelTableNameId -Type text -ClassName 'entity-center-box-long-text'
                                                }
                                            }
                                        }
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDElement -Tag 'td' -Content {
                                                New-UDButton -Text 'Add table' -ClassName 'entity-center-box-btn' -OnClick {
                                                    $ModelTableItemName = (Get-UDElement -Id $NewModelTableNameId).Value
                                                    if($ModelTableItemName){
                                                        $GetGridItemSC            = $Session:GridItemSC
                                                        $GridItemScriptBlockJson  = ($GetGridItemSC -replace 'importitemuniqueid',"$UniqueId") | ConvertTo-Json -Depth 100
                                                        $GridItemPSCO             = [PSCustomObject]@{
                                                            Id      = $UniqueId
                                                            Name    = $ModelTableItemName
                                                            Sc      = $GridItemScriptBlockJson
                                                            Dataset = $null
                                                        }
                                                        [array]$Session:GridItemListPSCO += $GridItemPSCO
                                                        $Session:GridItemListJson         = $Session:GridItemListPSCO | ConvertTo-Json -Depth 100
                                                        $Session:LayoutGridItemsJson      = '{'+"'"+'Layout'+"'"+':'+'['+'{'+"'"+'Items'+"'"+':'+"$Session:GridItemListJson"+'}'+']'+'}'
                                                        
                                                        $GridItemLayoutLgContentPSCO = [PSCustomObject]@{
                                                            w      = 2
                                                            h      = 6
                                                            x      = 7
                                                            y      = 0
                                                            i      = ('grid-element-'+"$UniqueId")
                                                            moved  = $true
                                                            static = $false
                                                        }
                                                        $GridItemLayoutLgContentToJson        = $GridItemLayoutLgContentPSCO | ConvertTo-Json -Depth 100
                
                                                        $GridItemLayoutMdContentPSCO = [PSCustomObject]@{
                                                            w      = 2
                                                            h      = 6
                                                            x      = 2
                                                            y      = 0
                                                            i      = ('grid-element-'+"$UniqueId")
                                                            moved  = $true
                                                            static = $false
                                                        }
                                                        $GridItemLayoutMdContentToJson        = $GridItemLayoutMdContentPSCO | ConvertTo-Json -Depth 100                                        
                
                                                        $GridItemLayoutSmContentPSCO = [PSCustomObject]@{
                                                            w      = 2
                                                            h      = 6
                                                            x      = 2
                                                            y      = 0
                                                            i      = ('grid-element-'+"$UniqueId")
                                                            moved  = $true
                                                            static = $false
                                                        }
                                                        $GridItemLayoutSmContentToJson        = $GridItemLayoutSmContentPSCO | ConvertTo-Json -Depth 100
                
                                                        $GridItemLayoutXsContentPSCO = [PSCustomObject]@{
                                                            w      = 2
                                                            h      = 6
                                                            x      = 1
                                                            y      = 0
                                                            i      = ('grid-element-'+"$UniqueId")
                                                            moved  = $true
                                                            static = $false
                                                        }
                                                        $GridItemLayoutXsContentToJson        = $GridItemLayoutXsContentPSCO | ConvertTo-Json -Depth 100                                        
                
                                                        $GridItemLayoutJson                 = '{'+'"'+'lg'+'"'+':'+'['+$GridItemLayoutLgContentToJson+']'+','+'"'+'md'+'"'+':'+'['+$GridItemLayoutMdContentToJson+']'+','+'"'+'sm'+'"'+':'+'['+$GridItemLayoutSmContentToJson+']'+','+'"'+'xs'+'"'+':'+'['+$GridItemLayoutXsContentToJson+']'+'}'
                                                        [array]$Session:GridItemLayoutList += $GridItemLayoutJson | ConvertFrom-Json -Depth 100
                                                        $GridItemLayoutListCount            = $Session:GridItemLayoutList.Count
                                                        if($GridItemLayoutListCount -gt 1){
                                                            $Collection   = $Session:GridItemLayoutList
                                                            $Num = 0
                                                            foreach ($LayoutItem in $Collection) {
                                                                $LayoutItemLgJson = $LayoutItem.lg|ConvertTo-Json -Depth 100
                                                                $LayoutItemMdJson = $LayoutItem.md|ConvertTo-Json -Depth 100
                                                                $LayoutItemSmJson = $LayoutItem.sm|ConvertTo-Json -Depth 100
                                                                $LayoutItemXsJson = $LayoutItem.xs|ConvertTo-Json -Depth 100
                
                                                                # LG SIZE
                                                                if($Num -eq ($GridItemLayoutListCount-1)){
                                                                    [string]$LayoutStringEnd = $LayoutItemLgJson+']'
                                                                    $LayoutCondition = 'end'
                                                                }
                                                                elseif($Num -eq 0){
                                                                    [string]$LayoutStringStart = '"'+'lg'+'"'+':'+'['+$LayoutItemLgJson
                                                                    $LayoutCondition = 'start'
                                                                }
                                                                else{
                                                                    [string]$LayoutStringMid = $LayoutItemLgJson
                                                                    $LayoutCondition = 'mid'
                                                                }
                
                                                                if($LayoutCondition -eq 'start'){
                                                                    [string]$LayoutStringLg += $LayoutStringStart
                                                                }
                                                                elseif($LayoutCondition -eq 'mid'){
                                                                    [string]$LayoutStringLg += ','+$LayoutStringMid
                                                                }
                                                                elseif($LayoutCondition -eq 'end'){
                                                                    [string]$LayoutStringLg += ','+$LayoutStringEnd
                                                                }
                
                                                                # MD SIZE
                                                                if($Num -eq ($GridItemLayoutListCount-1)){
                                                                    [string]$LayoutStringEnd = $LayoutItemMdJson+']'
                                                                    $LayoutCondition = 'end'
                                                                }
                                                                elseif($Num -eq 0){
                                                                    [string]$LayoutStringStart = '"'+'md'+'"'+':'+'['+$LayoutItemMdJson
                                                                    $LayoutCondition = 'start'
                                                                }
                                                                else{
                                                                    [string]$LayoutStringMid = $LayoutItemMdJson
                                                                    $LayoutCondition = 'mid'
                                                                }
                
                                                                if($LayoutCondition -eq 'start'){
                                                                    [string]$LayoutStringMd += $LayoutStringStart
                                                                }
                                                                elseif($LayoutCondition -eq 'mid'){
                                                                    [string]$LayoutStringMd += ','+$LayoutStringMid
                                                                }
                                                                elseif($LayoutCondition -eq 'end'){
                                                                    [string]$LayoutStringMd += ','+$LayoutStringEnd
                                                                }                                                
                
                                                                # SM SIZE
                                                                if($Num -eq ($GridItemLayoutListCount-1)){
                                                                    [string]$LayoutStringEnd = $LayoutItemSmJson+']'
                                                                    $LayoutCondition = 'end'
                                                                }
                                                                elseif($Num -eq 0){
                                                                    [string]$LayoutStringStart = '"'+'sm'+'"'+':'+'['+$LayoutItemSmJson
                                                                    $LayoutCondition = 'start'
                                                                }
                                                                else{
                                                                    [string]$LayoutStringMid = $LayoutItemSmJson
                                                                    $LayoutCondition = 'mid'
                                                                }
                
                                                                if($LayoutCondition -eq 'start'){
                                                                    [string]$LayoutStringSm += $LayoutStringStart
                                                                }
                                                                elseif($LayoutCondition -eq 'mid'){
                                                                    [string]$LayoutStringSm += ','+$LayoutStringMid
                                                                }
                                                                elseif($LayoutCondition -eq 'end'){
                                                                    [string]$LayoutStringSm += ','+$LayoutStringEnd
                                                                }
                
                                                                # XS SIZE
                                                                if($Num -eq ($GridItemLayoutListCount-1)){
                                                                    [string]$LayoutStringEnd = $LayoutItemXsJson+']'
                                                                    $LayoutCondition = 'end'
                                                                }
                                                                elseif($Num -eq 0){
                                                                    [string]$LayoutStringStart = '"'+'xs'+'"'+':'+'['+$LayoutItemXsJson
                                                                    $LayoutCondition = 'start'
                                                                }
                                                                else{
                                                                    [string]$LayoutStringMid = $LayoutItemXsJson
                                                                    $LayoutCondition = 'mid'
                                                                }
                
                                                                if($LayoutCondition -eq 'start'){
                                                                    [string]$LayoutStringXs += $LayoutStringStart
                                                                }
                                                                elseif($LayoutCondition -eq 'mid'){
                                                                    [string]$LayoutStringXs += ','+$LayoutStringMid
                                                                }
                                                                elseif($LayoutCondition -eq 'end'){
                                                                    [string]$LayoutStringXs += ','+$LayoutStringEnd
                                                                }                                                
                
                                                                $Num++
                                                            }
                
                                                            [string]$LayoutStringBuilder = '{'+"$LayoutStringLg"+','+"$LayoutStringMd"+','+"$LayoutStringSm"+','+"$LayoutStringXs"+'}'
                
                                                            $Session:CreateGritLayoutJson = $LayoutStringBuilder -replace '\s',''
                                                        }
                                                        elseif($GridItemLayoutListCount -eq 1){
                                                            $Session:CreateGritLayoutJson = $GridItemLayoutJson
                                                        }
                                                        else{
                                                            Show-UDToast -Message 'Not valid layout!' -MessageColor 'Black' -BackgroundColor 'darkred' -Icon Ban -Title 'Error:' -Duration 5000
                                                        }
                                                        Sync-UDElement -Id 'EntityCenterLayoutGridDynamicId'
                                                        Hide-UDModal
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            } -Footer {
                                New-UDButton -Text 'Close' -ClassName 'entity-center-box-btn' -OnClick {Hide-UDModal}
                            } -Persistent
                        }            
                    }
                }
            }
        }   
    }
    New-UDDynamic -Id 'EntityModelControlActiveInfoButtonsDynamicId' {
        if($Session:EntityModelInfoButtonsCondition -eq $true){
            New-UDElement -Tag 'table' -Content {
                New-UDElement -Tag 'tr' -Content {
                    New-UDElement -Tag 'td' -Content {
                        $GroupName    = $Session:LoadedGroupName
                        $ButtonString = 'Group: '+"$GroupName"
                        New-UDButton -Id 'InfoButtonGroupNameId' -Text $ButtonString -ClassName 'entity-center-box-green-btn'
                    }
                    New-UDElement -Tag 'td' -Content {
                        $ModelName    = $Session:LoadedModelName
                        $ButtonString = 'Model: '+"$ModelName"
                        New-UDButton -Id 'InfoButtonModelNameId' -Text $ButtonString -ClassName 'entity-center-box-green-btn'
                    }
                    New-UDElement -Tag 'td' -Content {
                        $LasSaveTime    = $Session:LoadedLastSaveTime
                        $ButtonString = 'Last Save: '+"$LasSaveTime"
                        New-UDButton -Id 'InfoButtonLastSaveTimeId' -Text $ButtonString -ClassName 'entity-center-box-green-btn'
                    }
                }
            }
        }
    }
} -ClassName "entity-center-box-layout-grid" 

New-UDStyle -Content {
    New-UDDynamic -Id 'EntityCenterLayoutGridDynamicId' -Content {
        if($Session:FirstLoad -eq $true){$Session:FirstLoad = $false}
        else{
            $NewUdGridLayoutSC = {
                $Session:ActualMainGridLayoutUniqueId = ([guid]::NewGuid()).Guid
                New-UDGridLayout -Id $Session:ActualMainGridLayoutUniqueId -LargeColumns 16 -MediumColumns 6 -SmallColumns 6 -ExtraSmallColumns 4 -Content {
                    if($null -ne $Session:LayoutGridItemsJson){
                        if($ConvertFromJsonLayoutItems -eq "$Session:LayoutGridItemsJson"){}
                        else{
                            if(($Session:LayoutGridItemsJson.ToString()).Length -gt 30){
                                $ConvertFromJson            = $Session:LayoutGridItemsJson | ConvertFrom-Json -Depth 100 -ErrorAction SilentlyContinue
                                $ConvertFromJsonLayoutItems = ($ConvertFromJson.Layout).Items
                                foreach ($GridItem in $ConvertFromJsonLayoutItems) {
                                    $GridItemScFromJson = $GridItem.Sc | ConvertFrom-Json
                                    $GridItemScFromJson | iex
                                }
                            }
                        }
                    }
                    else{
                        $Session:GridItemListJson         = $Session:GridItemListPSCO | ConvertTo-Json -Depth 100
                        $Session:LayoutGridItemsJson      = '{'+"'"+'Layout'+"'"+':'+'['+'{'+"'"+'Items'+"'"+':'+"$Session:GridItemListJson"+'}'+']'+'}'
                        if(($Session:LayoutGridItemsJson.ToString()).Length -gt 30){
                            $ConvertFromJson            = $Session:LayoutGridItemsJson | ConvertFrom-Json -Depth 100 -ErrorAction SilentlyContinue
                            $ConvertFromJsonLayoutItems = ($ConvertFromJson.Layout).Items
                            foreach ($GridItem in $ConvertFromJsonLayoutItems) {
                                $GridItemScFromJson = $GridItem.Sc | ConvertFrom-Json
                                $GridItemScFromJson | iex
                            }
                        }
                    }
                    $Session:CallCreateGridItemCondition = $true                    
                } -Draggable -Resizable -Layout $Session:CreateGritLayoutJson -rowheight 1
            }
            $NewUdGridLayoutSC|iex
        }
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
        Sync-UDElement -id 'ItemForeignKeyColorDynamic'
    }
} -Style '
.react-resizable-handle-se {
    margin-bottom: -4px;
    bottom: 0px !important;
    right: 2px !important;
    cursor: se-resize;
}
.react-resizable-handle {
    position: absolute;
    width: 5px;
    height: 5px;
    background-repeat: no-repeat;
    background-origin: content-box;
    box-sizing: border-box;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA2IDYiIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiNmZmZmZmYwMCIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSI2cHgiIGhlaWdodD0iNnB4Ij48ZyBvcGFjaXR5PSIwLjMwMiI+PHBhdGggZD0iTSA2IDYgTCAwIDYgTCAwIDQuMiBMIDQgNC4yIEwgNC4yIDQuMiBMIDQuMiAwIEwgNiAwIEwgNiA2IEwgNiA2IFoiIGZpbGw9IiMwMDAwMDAiLz48L2c+PC9zdmc+);
    background-position: bottom right;
    padding: 0 3px 3px 0;
}
.react-grid-item > .react-resizable-handle {
    position: absolute;
    width: 5px;
    height: 5px;
}
'
New-UDDynamic -id 'ItemForeignKeyColorDynamic' -Content {
    $ForeignKeyStyleSC = {
        if($null -ne $Session:TableDatasets){
            $BorderStyleColor1 = 'border: 1px solid importcolor1'
            $BorderStyleColor2 = 'border: 1px;border-style: solid;border-color: importcolor1 importcolor1 importcolor2 importcolor2;'
            $BorderStyleColor3 = 'border: 1px;border-style: solid;border-color: importcolor1 importcolor1 importcolor2 importcolor3;'
            $BorderStyleColor4 = 'border: 1px;border-style: solid;border-color: importcolor1 importcolor2 importcolor3 importcolor4;'
            $SpanStyleColor1   = '.spanstyle1 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor1;margin-bottom: 0px;};
                                  .spanstyle1space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                   margin-bottom:0px;margin-top:-8px;left:-1px;position:relative;'
            $SpanStyleColor2   = '.spanstyle1 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor1;margin-bottom: 0px;};
                                  .spanstyle1space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle2 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor2;margin-bottom: 0px;};
                                  .spanstyle2space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                   margin-bottom:0px;margin-top:-8px;left:-1px;position:relative;'
            $SpanStyleColor3   = '.spanstyle1 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor1;margin-bottom: 0px;};
                                  .spanstyle1space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle2 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor2;margin-bottom: 0px;};
                                  .spanstyle2space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle3 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor3;margin-bottom: 0px;}
                                  .spanstyle3space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                   margin-bottom:0px;margin-top:-8px;left:-1px;position:relative;'
            $SpanStyleColor4   = '.spanstyle1 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor1;margin-bottom: 0px;};
                                  .spanstyle1space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle2 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor2;margin-bottom: 0px;};
                                  .spanstyle2space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle3 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor3;margin-bottom: 0px;}
                                  .spanstyle3space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle4 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor4;margin-bottom: 0px;}
                                  .spanstyle4space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                   margin-bottom:0px;margin-top:-8px;left:-1px;position:relative;'
            $SpanStyleColor5   = '.spanstyle1 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor1;margin-bottom: 0px;};
                                  .spanstyle1space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle2 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor2;margin-bottom: 0px;};
                                  .spanstyle2space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle3 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor3;margin-bottom: 0px;}
                                  .spanstyle3space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle4 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor4;margin-bottom: 0px;}
                                  .spanstyle4space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle5 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor5;margin-bottom: 0px;};
                                  .spanstyle5space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                   margin-bottom:0px;margin-top:-8px;left:-1px;position:relative;'
            $SpanStyleColor6   = '.spanstyle1 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor1;margin-bottom: 0px;};
                                  .spanstyle1space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle2 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor2;margin-bottom: 0px;};
                                  .spanstyle2space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle3 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor3;margin-bottom: 0px;}
                                  .spanstyle3space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle4 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor4;margin-bottom: 0px;}
                                  .spanstyle4space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle5 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor5;margin-bottom: 0px;};
                                  .spanstyle5space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle6 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor6;margin-bottom: 0px;};
                                  .spanstyle6space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                   margin-bottom:0px;margin-top:-8px;left:-1px;position:relative;'
            $SpanStyleColor7   = '.spanstyle1 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor1;margin-bottom: 0px;};
                                  .spanstyle1space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle2 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor2;margin-bottom: 0px;};
                                  .spanstyle2space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle3 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor3;margin-bottom: 0px;}
                                  .spanstyle3space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle4 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor4;margin-bottom: 0px;}
                                  .spanstyle4space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle5 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor5;margin-bottom: 0px;};
                                  .spanstyle5space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle6 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor6;margin-bottom: 0px;};
                                  .spanstyle6space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                  .spanstyle7 {float:right;display: block;height: 8px;width: 8px;background-color: importcolor7;margin-bottom: 0px;};
                                  .spanstyle7space {float:right;display: block;height: 8px;width: 2px;background-color: transparent;margin-bottom: 0px;};
                                   margin-bottom:0px;margin-top:-8px;left:-1px;position:relative;'
                                  
            $ItemList = @()
            $num = 0
            
            foreach ($Dataset in $Session:TableDatasets) {
                if($Dataset.ItemTypeKey -ne 'None' -and $null -ne $Dataset.ItemTypeKey){
                    $ItemName            = $Dataset.ItemName     
                    $ItemKey             = $Dataset.ItemTypeKey
                    if($num -eq 0){$Color='red'}
                    elseif($num -eq 1){$Color='blue'}
                    elseif($num -eq 2){$Color='green'}
                    elseif($num -eq 3){$Color='yellow'}
                    elseif($num -eq 4){$Color='cyan'}
                    elseif($num -eq 5){$Color='magenta'}
                    elseif($num -eq 6){$Color='black'}
                    elseif($num -eq 7){$Color='orange'}
                    elseif($num -eq 8){$Color='indigo'}
                    elseif($num -eq 9){$Color='darkslategray'}
                    elseif($num -eq 10){$Color='gray'}
                    elseif($num -eq 11){$Color='ivory'}
                    elseif($num -eq 12){$Color='olive'}
                    elseif($num -eq 13){$Color='pink'}
    
                    # ITEM LIST
                    $ItemListPSCO = [PSCustomObject]@{
                        ItemKey  = $ItemKey
                        ItemName = $ItemName
                        Color    = $Color
                    }
                    $ItemList += $ItemListPSCO
                    $num++
                }
            }
    
            if($ItemList.Count -eq 1){
                $ItemNamePSCO = [PSCustomObject]@{
                    ItemName = $ItemList.ItemName
                    Color    = $ItemList.Color
                }
                $ItemNameList = $ItemNamePSCO

                $ItemKeyPSCO = [PSCustomObject]@{
                    ItemKey = $ItemList.ItemKey
                    Color   = $ItemList.Color
                }
                $ItemKeyList = $ItemKeyPSCO 
            }
            else{
                $ItemNameUsedList = @()
                $ItemNameList     = @()
                foreach ($Item in $ItemList) {
                    $ColorArray = $null
                    if($null -ne $($ItemNameUsedList -like $Item.ItemName)){}
                    else{
                        if($null -ne $($ItemList.ItemName -like $Item.ItemName)){
                            $ItemNameUsedList += $Item.ItemName
                            $ItemNameIndexList = 0..($ItemList.Count - 1) | ? { ($ItemList.ItemName)[$_] -eq $Item.ItemName}
                            foreach ($Index in $ItemNameIndexList) {
                                [array]$ColorArray += ($ItemList[$Index]).Color
                            }
                            $ItemNamePSCO = [PSCustomObject]@{
                                ItemName = $Item.ItemName
                                Color   = $ColorArray
                            }
                            $ItemNameList += $ItemNamePSCO 
                        }
                    }
                }
        
                $ItemKeyUsedList = @()
                $ItemKeyList     = @()
                foreach ($Item in $ItemList) {
                    $ColorArray = $null
                    if($null -ne $($ItemKeyUsedList -like $Item.ItemKey)){}
                    else{
                        if($null -ne $($ItemList.ItemKey -like $Item.ItemKey)){
                            $ItemKeyUsedList += $Item.ItemKey
                            $ItemKeyIndexList = 0..($ItemList.Count - 1) | ? { ($ItemList.ItemKey)[$_] -eq $Item.ItemKey}
                            foreach ($Index in $ItemKeyIndexList) {
                                [array]$ColorArray += ($ItemList[$Index]).Color
                            }
                            $ItemKeyPSCO = [PSCustomObject]@{
                                ItemKey = $Item.ItemKey
                                Color   = $ColorArray
                            }
                            $ItemKeyList += $ItemKeyPSCO 
                        }
                    }
                }
            }
    
    
            
            if($null -ne $ItemNameList -or '' -ne $ItemNameList){
                foreach ($Item in $ItemNameList) {
                    [string]$IdStyleItemName = $Item.ItemName
                    $IdStyle = 'style-'+"$IdStyleItemName"
                    
                    if(($Item.Color).Count -eq 1){$SpanStyle = $SpanStyleColor1 -replace 'importcolor1',$Item.Color}
                    if(($Item.Color).Count -eq 2){$SpanStyle = $SpanStyleColor2 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1]}
                    if(($Item.Color).Count -eq 3){$SpanStyle = $SpanStyleColor3 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1] -replace 'importcolor3',($Item.Color)[2]}
                    if(($Item.Color).Count -eq 4){$SpanStyle = $SpanStyleColor4 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1] -replace 'importcolor3',($Item.Color)[2] -replace 'importcolor4',($Item.Color)[3]}
                    if(($Item.Color).Count -eq 5){$SpanStyle = $SpanStyleColor5 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1] -replace 'importcolor3',($Item.Color)[2] -replace 'importcolor4',($Item.Color)[3] -replace 'importcolor5',($Item.Color)[4]}
                    if(($Item.Color).Count -eq 6){$SpanStyle = $SpanStyleColor6 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1] -replace 'importcolor3',($Item.Color)[2] -replace 'importcolor4',($Item.Color)[3] -replace 'importcolor5',($Item.Color)[4] -replace 'importcolor6',($Item.Color)[5]}
                    if(($Item.Color).Count -eq 7){$SpanStyle = $SpanStyleColor7 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1] -replace 'importcolor3',($Item.Color)[2] -replace 'importcolor4',($Item.Color)[3] -replace 'importcolor5',($Item.Color)[4] -replace 'importcolor6',($Item.Color)[5] -replace 'importcolor7',($Item.Color)[6]}
                    [string]$UDElementString = {Set-UDElement -Id 'importIdStyle' -Properties @{style='importspanstyle'}} -replace 'importspanstyle',$SpanStyle -replace 'importIdStyle',$IdStyle
                    $UDElementString|iex
                }
            }
            if($null -ne $ItemKeyList -or '' -ne $ItemKeyList){
                foreach ($Item in $ItemKeyList) {
                    [string]$IdStyleItemKey = $Item.ItemKey
                    $IdStyle = 'style-'+"$IdStyleItemKey"
                    
                    if(($Item.Color).Count -eq 1){$SpanStyle = $SpanStyleColor1 -replace 'importcolor1',$Item.Color}
                    if(($Item.Color).Count -eq 2){$SpanStyle = $SpanStyleColor2 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1]}
                    if(($Item.Color).Count -eq 3){$SpanStyle = $SpanStyleColor3 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1] -replace 'importcolor3',($Item.Color)[2]}
                    if(($Item.Color).Count -eq 4){$SpanStyle = $SpanStyleColor4 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1] -replace 'importcolor3',($Item.Color)[2] -replace 'importcolor4',($Item.Color)[3]}
                    if(($Item.Color).Count -eq 5){$SpanStyle = $SpanStyleColor5 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1] -replace 'importcolor3',($Item.Color)[2] -replace 'importcolor4',($Item.Color)[3] -replace 'importcolor5',($Item.Color)[4]}
                    if(($Item.Color).Count -eq 6){$SpanStyle = $SpanStyleColor6 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1] -replace 'importcolor3',($Item.Color)[2] -replace 'importcolor4',($Item.Color)[3] -replace 'importcolor5',($Item.Color)[4] -replace 'importcolor6',($Item.Color)[5]}
                    if(($Item.Color).Count -eq 7){$SpanStyle = $SpanStyleColor7 -replace 'importcolor1',($Item.Color)[0] -replace 'importcolor2',($Item.Color)[1] -replace 'importcolor3',($Item.Color)[2] -replace 'importcolor4',($Item.Color)[3] -replace 'importcolor5',($Item.Color)[4] -replace 'importcolor6',($Item.Color)[5] -replace 'importcolor7',($Item.Color)[6]}
                    [string]$UDElementString = {Set-UDElement -Id 'importIdStyle' -Properties @{style='importspanstyle'}} -replace 'importspanstyle',$SpanStyle -replace 'importIdStyle',$IdStyle
                    $UDElementString|iex
                }
            }
        }
    }
    $ForeignKeyStyleSC|iex
}
