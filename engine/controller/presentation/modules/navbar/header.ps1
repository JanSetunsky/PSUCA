$Cache:RunspaceLoadingProgressUniqueIdList = @{List=@()}

$HeaderContent = {
    
    New-UDContainer -ClassName 'navbar-container-headerpaddingright' -Children {

    
        if($Session:AuthenticationResult -eq $true){
            if($Session:AuthenticationCredential -eq 'User'){
                
                    #------------------------------------------------------------------------------#
                    #- NOTIFICATION ---------------------------------------------------------------#
                    #------------------------------------------------------------------------------#
                    
                    $NotificationNewItemSC = {
                        New-UDCardBody -ClassName "navbar-notification-dropdown-btn-message-layout" -Content {
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDButton -Text '' -ClassName "navbar-notification-dropdown-btn-delete" -Icon (New-UDIcon -Icon 'TrashAlt' -Size 1x -Color 'Gray' -ClassName "navbar-notification-dropdown-btn-delete-icon")  
                                    New-UDButton -Text "$NotificationItemType" -ClassName "navbar-notification-dropdown-btn-message-info"
                                    New-UDTypography -Text "$NotificationItemName" -ClassName 'navbar-notification-dropdown-message-title'
                                }
                            }
                            New-UDRow -Columns {
                                New-UDColumn -SmallSize 10 -MediumSize 10 -LargeSize 10 -Content {
                                    New-UDTypography -Text "$NotificationItemName" -ClassName 'navbar-notification-dropdown-message-text'
                                }
                            }
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDTypography -Text (New-Object System.DateTime $NotificationItemTicks) -ClassName 'navbar-notification-dropdown-message-date'
                                    New-UDTypography -Text $NotificationItemCredential -ClassName 'navbar-notification-dropdown-message-user'
                                }
                            }            
                        }
                    }

                    New-UDDynamic -Content {
                        $GetDataNotificationPathPath       = gc $Cache:NotificationDataPath
                        $GetDataNotificationPathJson       = $GetDataNotificationPathPath | ConvertFrom-Json
                        $GetDataNotificationPathJsonList   = $GetDataNotificationPathJson.NotificationList
                        $GetDataNotificationPathJsonCount  = $GetDataNotificationPathJsonList.Count
                        New-UDLink -Children {
                            New-UDBadge -BadgeContent { $GetDataNotificationPathJsonCount }  -Children {
                                New-UdIcon -Icon 'Bell' -Size 1x -ClassName 'navbar-notification-color'
                            } -Color Info -Id 'navbar-btn-header-bell'
                        } -OnClick { Invoke-UDJavaScript -JavaScript '
                            function notificationDrop() {
                                var dropcondition = document.getElementById("navbar-notification-dropdown").style.display;
                                if (dropcondition == "block") {
                                    document.getElementById("navbar-notification-dropdown").style.display = "none";
                                } else {
                                    document.getElementById("navbar-status-dropdown").style.display = "none";
                                    document.getElementById("navbar-auth-dropdown").style.display = "none";
                                    document.getElementById("navbar-notification-dropdown").style.display = "block";
                                }
                            }
                            notificationDrop();        
                        ' 
                        }

                        if($GetDataNotificationPathJsonCount -gt 0){
                            New-UDCardBody -Id "navbar-notification-dropdown" -Content {
                                New-UDRow -Columns {
                                    New-UDColumn -Content {
                                        New-UDButton -Text 'Clear All Notifications' -ClassName "navbar-notification-dropdown-btn-trash" -Icon (New-UDIcon -Icon 'TrashAlt' -Size 1x -Color 'DarkRed' -ClassName "navbar-notification-dropdown-btn-trash-icon")
                                        New-UDButton -Text 'View All' -ClassName "navbar-notification-dropdown-btn-eye" -Icon (New-UDIcon -Icon 'Eye' -Size 1x -Color 'Gray' -ClassName "navbar-notification-dropdown-btn-eye-icon")
                                    }
                                }
                                foreach ($NotificationItem in $GetDataNotificationPathJsonList) {
                                    $NotificationItemType       = $NotificationItem.Type
                                    $NotificationItemName       = $NotificationItem.Name
                                    $NotificationItemDesc       = $NotificationItem.Desc
                                    $NotificationItemTicks      = $NotificationItem.Ticks
                                    $NotificationItemCredential = $NotificationItem.Credential
                                    $NotificationItemPath       = $NotificationItem.Path
                                    $NotificationNewItemSC|iex
                                }
                                New-UDCardBody -ClassName "navbar-notification-dropdown-btn-message-layout-footer" -Content {}
                            }
                        }
                        

                    } -AutoRefresh -AutoRefreshInterval 10


                    #------------------------------------------------------------------------------#
                    #- AUTHENTICATION -------------------------------------------------------------#
                    #------------------------------------------------------------------------------#

                    $AuthenticationNewItemSC = {
                        New-UDElement -Tag 'div' -Content {
                            New-UDLink -Children {
                                New-UdIcon -Id 'navbar-btn-header-auth' -Icon 'UserCircle' -Size 1x -ClassName 'navbar-auth-color'
                            } -OnClick { Invoke-UDJavaScript -JavaScript '
                                function authDrop() {
                                    var dropcondition = document.getElementById("navbar-auth-dropdown").style.display;
                                    if (dropcondition == "block") {
                                        document.getElementById("navbar-auth-dropdown").style.display = "none";
                                    } else {
                                        document.getElementById("navbar-status-dropdown").style.display = "none";
                                        document.getElementById("navbar-notification-dropdown").style.display = "none";
                                        document.getElementById("navbar-auth-dropdown").style.display = "block";
                                    }
                                }
                                authDrop();        
                            '
                    
                            }
                        } -Id 'navbar-btn-header-auth-div'
                        New-UDCardBody -Id "navbar-auth-dropdown" -Content {
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDElement -Tag 'div' -Content {
                                        New-UDLink -Children {
                                            New-UDImage -Url '/assets/img/blank-user-img.png' -Width 30 -Height 30
                                        } -OnClick {} -ClassName 'navbar-auth-dropdown-btn-account-user-img-link'
                                    } -Id 'navbar-auth-dropdown-btn-account-user-img'
                                }
                            }
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDLink -Children {
                                        New-UDTypography -Text $Session:AuthenticationLoginEmail -ClassName "navbar-auth-dropdown-btn-account-email"
                                    } -OnClick {}
                                }
                            }
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDButton -Text 'Account Settings' -ClassName "navbar-auth-dropdown-btn-account-settings" -Icon (New-UDIcon -Icon 'UserCog' -Size 1x -Color 'Gray' -ClassName "navbar-auth-dropdown-btn-account-settings-icon") -OnClick {
    
                                    }
                                }
                            }
                            New-UDRow -Columns {
                                New-UDColumn -Content {
                                    New-UDButton -Text 'Sign Out' -ClassName "navbar-auth-dropdown-btn-sign-out" -Icon (New-UDIcon -Icon 'SignOutAlt' -Size 1x -Color 'Gray' -ClassName "navbar-auth-dropdown-btn-sign-out-icon") -OnClick {
                                        $Session:AuthenticationResult = $null
                                        Invoke-UDJavaScript -JavaScript '
                                            function ReloadPage() {
                                                window.location.reload();
                                            }
                                            ReloadPage();
                                        '
                                    }
                                }
                            }
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                
                                    } 
                                }                
                            }
                            New-UDCardBody -ClassName "navbar-auth-dropdown-btn-message-layout-footer" -Content {}
                        }
                    }

                    $AuthenticationNewItemSC|iex

            }
        }
    }
}




