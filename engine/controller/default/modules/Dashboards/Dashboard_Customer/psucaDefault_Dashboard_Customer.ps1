if($Cache:AccessCondition -eq $true){
    $DashboardName = 'Dashboard_Customer'
    $StyleSheetsHash = @(
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/default.validation.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/bootstrap.min.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/icons.min.css';
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+'/css/app.min.css';
    )
    $ScriptHash = @(
        "$Cache:ServerUrlAdress"+"$Cache:DefaultAssetsPath"+"/js/stream.js.data.dashboard.saas.js";
    )
    #region PART PAGES VARIABLES
        # DASHBOARD CUSTOMER PAGE - DASHBOARD
        $Cache:DefaultDashboardCustomerPageDashboard  = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\dashboard\dashboard.ps1'+'"'
    #endregion PART PAGES VARIABLES
    
    #region PART DASHBOARD
        New-UDDashboard -Title "Dashboard_Customer" -Pages @(
            New-UDPage -Blank -Id 'Default-Dashboard_Customer-Page-Dashboard-Id' -Name 'Dashboard Customer Page' -Url '/' -Title 'Dashboard Page' -Content {
                $Cache:VerificationIdentitySC|iex
                if($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'cc')){
                    $Cache:DefaultDashboardCustomerPageDashboard|iex
                }
                else{
                    Invoke-UDRedirect -Url ("$Cache:RootAppConnectionLink"+'app/authentication/login')
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