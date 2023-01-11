
if($Cache:AccessCondition -eq $true){
    $DashboardName = 'Dashboard_Admin'
    $StyleSheetsHash = @(
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/default.validation.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/bootstrap.min.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/icons.min.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/app.min.css';

        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/libs/ion-rangeslider/css/ion.rangeSlider.min.css';

        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/libs/owl.carousel/assets/owl.theme.default.min.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/libs/owl.carousel/assets/owl.carousel.min.css';

        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/ecommerce.min.css';
    )
    $ScriptHash = @(
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+"/js/stream/ecommerce/home.page.js";
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+"/js/stream/ecommerce/home.page.slideshow.js";
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+"/js/stream/ecommerce/responsive.js";
    )
    #region PART PAGES VARIABLES
        # DASHBOARD CUSTOMER PAGE - DASHBOARD
        $Cache:DefaultDashboardAdminPageVerification  = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\administrator-verificiation.ps1'+'"'

        # DASHBOARD CUSTOMER PAGE - DASHBOARD
        $Cache:DefaultDashboardAdminPageDashboard  = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\administrator-dashboard-developer.ps1'+'"'
    #endregion PART PAGES VARIABLES
    
    #region PART DASHBOARD
        New-UDDashboard -Title "Dashboard_Admin" -Pages @(
            New-UDPage -Blank -Id 'Default-Dashboard_Admin-Page-Id' -Name 'Dashboard Admin Page' -Url '/' -Title 'Dashboard Admin Page' -Content {
                $Cache:VerificationIdentitySC|iex
                $NotValidAccesSC = {
                    Show-UDToast -Message $VerificationPath
                    $ssid = $Session.Id
                    $ssidData = Get-PSUCache -Key $ssid -Integrated -ErrorAction Stop
                    $Uid = $ssidData.Uid
                    Show-UDToast -Message $uid
                    New-UDContainer -Children {
                        New-UDTypography -Text 'Access Verify Condition is not valid!' -Variant display4 -ErrorAction Stop
                    }
                    New-UDContainer -Children {
                        New-UDTypography -Text ('Error: '+"$ErrorType") -Variant display4 -ErrorAction Stop
                    }
                    New-UDContainer -Children {
                        New-UDTypography -Text ('Please contact support: support@'+"$Cache:RootAppName") -Variant display4 -ErrorAction Stop
                    }            
                }
                $ssid = $Session.Id
                $ssidData = Get-PSUCache -Key $ssid -Integrated -ErrorAction Stop
                $Uid = $ssidData.Uid
                if($Uid -match ('@'+'admin')){
                    $VerificationPath = "$Cache:DefaultDatabaseAccountsPath"+"$Uid"+'\admin.json'
                    if(Test-Path $VerificationPath -ErrorAction Stop){
                        $VerificationData   = gc $VerificationPath -ErrorAction Stop|ConvertFrom-Json -ErrorAction Stop
                        $Session:AdministratorVerificationData = $VerificationData
                        $VerificationExpire = $VerificationData.Expire
                        $DateTicks          = (Get-Date -ErrorAction Stop).Ticks
                        if($DateTicks -lt $VerificationExpire){
                            $VerificationCred = $VerificationData.Cred
                            $CredentialsPath  = "$Cache:DefaultCredentialsPath"+"$VerificationCred"
                            if(Test-Path $CredentialsPath){
                                $DashboardPath = '.'+'"'+"$Cache:DefaultDashboardsPath"+'Dashboard_Admin\Pages\Page-Creator\'+'dashboard'+'-'+"$VerificationCred"+'.ps1'+'"'
                                if($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'ac')){
                                    $DashboardPath|iex
                                }
                                else{
                                    Invoke-UDRedirect -Url ("$Cache:RootAppConnectionLink"+'app/authentication/login')
                                }       
                            }
                            else{
                                $ErrorType = 'Credentials'
                                $NotValidAccesSC|iex                    
                            }
                        }
                        else{
                            $ErrorType = 'Expiration'
                            $NotValidAccesSC|iex    
                        }
                    }
                    else{
                        $ErrorType = 'Path'
                        $NotValidAccesSC|iex
                    }
                }
                else{
                    $ErrorType = 'Format'
                    $NotValidAccesSC|iex
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