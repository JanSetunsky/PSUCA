if($Cache:AccessCondition -eq $true){
    $DashboardName = 'Authentication'
    $StyleSheetsHash = @(
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/libs/twitter-bootstrap-wizard/prettify.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/ecommerce-auth.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/default.validation.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/bootstrap.min.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/icons.min.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/app.min.css';
    )
    $ScriptHash = @(
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+"/js/stream/authentication/auth.login.js";
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+"/js/stream/authentication/auth.session.js";
    )
    #region PART PAGES VARIABLES
        # AUTHENTICATION PAGE - AuthLogin
        $Cache:DefaultAuthenticationPageAuthLogin  = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\AuthLogin\login.ps1'+'"'
        # AUTHENTICATION PAGE - AuthLogin 2
        $Cache:DefaultAuthenticationPageAuthLogin2 = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\AuthLogin2\login.ps1'+'"'

        # AUTHENTICATION PAGE - AuthRecovery
        $Cache:DefaultAuthenticationPageAuthRecovery  = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\AuthRecoverypw\recovery.ps1'+'"'
        # AUTHENTICATION PAGE - AuthRecovery 2
        $Cache:DefaultAuthenticationPageAuthRecovery2 = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\AuthRecoverypw2\recovery.ps1'+'"'

        # AUTHENTICATION PAGE - AuthRegister
        $Cache:DefaultAuthenticationPageAuthRegister  = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\AuthRegister\register.ps1'+'"'
        # AUTHENTICATION PAGE - AuthRegister 2
        $Cache:DefaultAuthenticationPageAuthRegister2 = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\AuthRegister2\register.ps1'+'"'

        # AUTHENTICATION PAGE - LockScreen
        $Cache:DefaultAuthenticationPageLockScreen  = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\AuthLockScreen\lockscreen.ps1'+'"'
        # AUTHENTICATION PAGE - LockScreen 2
        $Cache:DefaultAuthenticationPageLockScreen2 = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\AuthLockScreen\lockscreen.ps1'+'"'        
    #endregion PART PAGES VARIABLES
    
    #region PART DASHBOARD
        New-UDDashboard -Title "Authentication" -Pages @(
            New-UDPage -Blank -DefaultHomePage -Id 'Default-Authentication-Page-Auth-Login-Id' -Name 'Login Page' -Url '/login' -Title 'Login Page' -Content {
                $Cache:VerificationIdentitySC|iex
                if($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'ac')){
                    Invoke-UDRedirect -Url $Cache:RootAppConnectionLink
                }
                elseif($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'cc')){
                    Invoke-UDRedirect -Url $Cache:RootAppConnectionLink
                }
                else{
                    $Cache:DefaultAuthenticationPageAuthLogin|iex
                }
            }
            New-UDPage -Blank -Id 'Default-Authentication-Page-Auth-Recovery-Id' -Name 'Recovery Password Page' -Url '/recovery' -Title 'Recovery Page' -Content {
                $Cache:VerificationIdentitySC|iex
                if($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'ac')){
                    Invoke-UDRedirect -Url $Cache:RootAppConnectionLink
                }
                elseif($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'cc')){
                    Invoke-UDRedirect -Url $Cache:RootAppConnectionLink
                }
                else{
                    $Cache:DefaultAuthenticationPageAuthRecovery|iex
                }
            }            
            New-UDPage -Blank -Id 'Default-Authentication-Page-Auth-Register-Id' -Name 'Register Page' -Url '/register' -Title 'Register Page' -Content {
                $Cache:VerificationIdentitySC|iex
                if($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'ac')){
                    Invoke-UDRedirect -Url $Cache:RootAppConnectionLink
                }
                elseif($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'cc')){
                    Invoke-UDRedirect -Url $Cache:RootAppConnectionLink
                }
                else{
                    $Cache:DefaultAuthenticationPageAuthRegister|iex
                }
            }
            New-UDPage -Blank -Id 'Default-Authentication-Page-Auth-Lock-Screen-Id' -Name 'Lock Screen Page' -Url '/lockscreen' -Title 'Lock Screen Page' -Content {
                $Cache:VerificationIdentitySC|iex
                if($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'ac')){
                    $Cache:DefaultAuthenticationPageLockScreen|iex
                }
                elseif($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'cc')){
                    $Cache:DefaultAuthenticationPageLockScreen|iex
                }
                else{
                    Invoke-UDRedirect -Url $Cache:RootAppConnectionLink
                }
            }              
        ) -Stylesheets $StyleSheetsHash -Scripts $ScriptHash
    #endregion PART DASHBOARD
}
elseif($Cache:AccessCondition -eq $false){
    New-UDPage -DefaultHomePage -Id 'Error' -Name 'Error' -Url '/' -Content {
        New-UDTypography -Text 'Access Condition is not valid!' -Variant h2
    }
}