if($Cache:AccessCondition -eq $true){
    $DashboardName = 'Category_List'
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
        # DEFAULT CATEGORY LIST PAGE
        $Cache:DefaultCategoryListPageAccessAdministrator = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\administrator-category-list.ps1'+'"'
        # DEFAULT CATEGORY LIST PAGE
        $Cache:DefaultCategoryListPageAccessCustomer = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\customer-category-list.ps1'+'"'
        # DEFAULT CATEGORY LIST PAGE
        $Cache:DefaultCategoryListPageAccessVisitor = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\visitor-category-list.ps1'+'"'

        # DEFAULT CATEGORY PRODUCT LIST PAGE
        $Cache:DefaultCategoryProductListPageAccessAdministrator = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\administrator-category-product-list.ps1'+'"'
        # DEFAULT CATEGORY PRODUCT LIST PAGE
        $Cache:DefaultCategoryProductListPageAccessCustomer = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\customer-category-product-list.ps1'+'"'
        # DEFAULT CATEGORY PRODUCT LIST PAGE
        $Cache:DefaultCategoryProductListPageAccessVisitor = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\visitor-category-product-list.ps1'+'"'        
    #endregion PART PAGES VARIABLES

    #region PART DASHBOARD
        New-UDDashboard -Title "Category List" -Pages @(
            New-UDPage -Blank -DefaultHomePage -Id 'Default-Category-List-Page-Id' -Name 'Category List Page' -Url '/' -Title 'Category List Page' -Content {
                $Cache:VerificationIdentitySC|iex
                if($Session:ssidLock -eq $true){
                    Invoke-UDRedirect -Url ("$Cache:RootAppConnectionLink"+'app/authentication/lockscreen')
                }
                elseif($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'ac')){
                    $Cache:DefaultCategoryListPageAccessAdministrator|iex
                }
                elseif($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'cc')){
                    $Cache:DefaultCategoryListPageAccessCustomer|iex
                }
                elseif($Session:ssidVr -eq $false -and ($Session:ssidCred -eq 'ac')){
                    $Cache:DefaultCategoryListPageAccessVisitor|iex
                }
                elseif($Session:ssidVr -eq $false -and ($Session:ssidCred -eq 'cc')){
                    $Cache:DefaultCategoryListPageAccessVisitor|iex
                }
                elseif($Session:ssidVr -eq $false -and ($Session:ssidCred -eq 'vc')){
                    $Cache:DefaultCategoryListPageAccessVisitor|iex
                }                                
                else{
                    Invoke-UDRedirect -Url '/'
                }
            }
            New-UDPage -Blank -DefaultHomePage -Id 'Default-Category-Product-List-Page-Id' -Name 'Category Product List Page' -Url '/product-list' -Title 'Category Product List Page' -Content {
                $Cache:VerificationIdentitySC|iex
                if($Session:ssidLock -eq $true){
                    Invoke-UDRedirect -Url ("$Cache:RootAppConnectionLink"+'app/authentication/lockscreen')
                }
                elseif($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'ac')){
                    $Cache:DefaultCategoryProductListPageAccessAdministrator|iex
                }
                elseif($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'cc')){
                    $Cache:DefaultCategoryProductListPageAccessCustomer|iex
                }
                elseif($Session:ssidVr -eq $false -and ($Session:ssidCred -eq 'ac')){
                    $Cache:DefaultCategoryProductListPageAccessVisitor|iex
                }
                elseif($Session:ssidVr -eq $false -and ($Session:ssidCred -eq 'cc')){
                    $Cache:DefaultCategoryProductListPageAccessVisitor|iex
                }
                elseif($Session:ssidVr -eq $false -and ($Session:ssidCred -eq 'vc')){
                    $Cache:DefaultCategoryProductListPageAccessVisitor|iex
                }                                
                else{
                    Invoke-UDRedirect -Url '/'
                }
            }            
        ) -Stylesheets $StyleSheetsHash -Scripts $ScriptHash
    #endregion PART DASHBOARD
}
elseif($Cache:AccessCondition -eq $false){
    New-UDDashboard -Title "Home" -Pages @(
        New-UDPage -DefaultHomePage -Id 'Error' -Name 'Error' -Url '/' -Content {
            New-UDTypography -Text 'Access Condition is not valid!' -Variant h2
        }
    )
}