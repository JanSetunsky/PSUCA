$Cache:RootAppDirectory       = 'd:\PSUCA\'
$Cache:RootAppConnectionLink  = 'http://localhost:5000/'
$Cache:RootAppName            = 'admin'
$Cache:GlobalSettingsJsonPath = "$Cache:RootAppDirectory"+'engine\controller\global_settings.json'
if(Test-Path $Cache:GlobalSettingsJsonPath){
    $GlobalSettingsGc                   = gc $Cache:GlobalSettingsJsonPath;
    $GlobalSettingJson                  = $GlobalSettingsGc|ConvertFrom-Json
    $Cache:ServerUrlAdress              = $GlobalSettingJson.ServerUrlAdress
    $Cache:GlobalApiAppToken            = $GlobalSettingJson.GlobalApiAppToken
    $Cache:GlobalApiStreamToken         = $GlobalSettingJson.GlobalApiStreamToken
    $Cache:WwwRootPath                  = $GlobalSettingJson.GlobalWwwRootPath
    $Cache:DefaultAssetsPath            = "$Cache:WwwRootPath"+'/assets'
    $Cache:DefaultDatabasePath          = "$Cache:RootAppDirectory"+'database\'
    $Cache:DefaultDatabaseAccountsPath  = "$Cache:DefaultDatabasePath"+'modules\accountsmanagement\'
    $Cache:DefaultCredentialsPath       = "$Cache:DefaultDatabasePath"+'modules\authentication\credentials\'
    $Cache:DefaultCookiesDbDirOld       = "$Cache:DefaultDatabasePath"+'modules\authentication\cookies\old\'
    $Cache:DefaultCookiesDbDirNew       = "$Cache:DefaultDatabasePath"+'modules\authentication\cookies\new\'
    $Cache:DefaultDashboardsPath        = "$Cache:RootAppDirectory"+'engine\controller\default\modules\Dashboards\'
    $ConnectPSUServerResult             = Connect-PSUServer -ComputerName $GlobalSettingJson.ServerUrlAdress -AppToken $GlobalSettingJson.GlobalApiAppToken
    if( $ConnectPSUServerResult.Mode -eq 'Server' -and $ConnectPSUServerResult.Roles -eq 'Administrator' -and $ConnectPSUServerResult.OneWayGitSync -eq $false -and $ConnectPSUServerResult.BuiltInRole -eq $true -and ($ConnectPSUServerResult.AccessControls).Scripts -eq 'All'){
        $Cache:AccessCondition = $true
    }
    else{
        $Cache:AccessCondition = $false
    }
}

if($Cache:AccessCondition -eq $true){
    $DashboardName = 'Home'
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
        # DEFAULT HOME PAGE
        $Cache:DefaultHomePageAccessAdministrator = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\administrator-home.ps1'+'"'
        # DEFAULT HOME PAGE
        $Cache:DefaultHomePageAccessCustomer      = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\customer-home.ps1'+'"'
        # DEFAULT HOME PAGE
        $Cache:DefaultHomePageAccessVisitor       = '.'+'"'+"$Cache:DefaultDashboardsPath"+"$DashboardName"+'\pages\visitor-home.ps1'+'"'
    #endregion PART PAGES VARIABLES

    #region PART DOWNLOAD COOKIES DATABASE BLOCK SCRIPT BLOCK
    $Cache:CookiesDatabaseSC = {
        # COOKIE NAME - Default
        if(($true -ne $(Test-Path $Cache:DefaultCookiesDbDirOld))){
            $New = New-Item -ItemType Directory $Cache:DefaultCookiesDbDirOld -Force -ErrorAction Stop
        }
        if(($true -ne $(Test-Path $Cache:DefaultCookiesDbDirNew))){
            $New = New-Item -ItemType Directory $Cache:DefaultCookiesDbDirNew -Force -ErrorAction Stop
        }        
        if(($true -eq $(Test-Path $Cache:DefaultCookiesDbDirOld)) -and ($true -eq $(Test-Path $Cache:DefaultCookiesDbDirNew))){
            $DefaultCookieCondition = $true
        }
        if($DefaultCookieCondition -eq $true){
            $Cache:DefaultCookiesGlobalOptions = @{
                Name     = 'cd','ci','cn','ct','ce';
                Domain   = 'localhost';
                Path     = '/';
                Expire   = 365;
                Secure   = $false;
                SameSite = 'strict'
            }
            $CookiesOldDbGci = gci $Cache:DefaultCookiesDbDirOld -Force -ErrorAction Stop
            $CookiesNewDbGci = gci $Cache:DefaultCookiesDbDirNew -Force -ErrorAction Stop
            if($CookiesOldDbGci.Count -eq 0 -and $CookiesNewDbGci.Count -eq 0){
                $Cache:OldTicks = (Get-Date).Ticks
                $CookieAnalysisCondition = $false
            }
            elseif($CookiesOldDbGci.Count -ge 0 -and $CookiesNewDbGci.Count -gt 0){
                $Cache:OldTicks  = (Get-Date).Ticks
                $CookieOldPath   = ("$Cache:DefaultCookiesDbDirOld"+"$Cache:OldTicks")
                $NewCookieOldDir = New-Item -ItemType Directory $CookieOldPath -Force -ErrorAction Stop
                if(Test-Path $CookieOldPath){
                    foreach ($Cookie in $CookiesNewDbGci) {
                        $CookieFullName = $Cookie.FullName
                        $CookieMoveItem = Move-Item $CookieFullName $CookieOldPath -Force -ErrorAction Stop
                    }
                }
                $CookiesOldDbGci = gci $Cache:DefaultCookiesDbDirOld -Force -ErrorAction Stop
                $CookiesNewDbGci = gci $Cache:DefaultCookiesDbDirNew -Force -ErrorAction Stop
                if($CookiesNewDbGci.Count -eq 0){
                    $CookieAnalysisCondition = $true
                }
                else{
                    $CookieAnalysisCondition = $false
                }
            }
            else{
                $CookieAnalysisCondition = $true
            }
            
            if($CookieAnalysisCondition -eq $false){}
            else{
                foreach ($CookieTicks in $CookiesOldDbGci) {
                    $CookieTicksName = $CookieTicks.Name
                    $CookieTickGci   = (gci $CookieTicks.FullName -Force -ErrorAction Stop)
                    foreach ($Cookie in $CookieTickGci) {
                        $CookieFullName = $Cookie.FullName
                        $CookieGc       = gc $CookieFullName
                        $CookieIex      = $CookieGc|iex
                        if($CookieIex.Count -eq 1){
                            if($CookieIex.Cred -eq 'ac'){
                                $CookieId      = $CookieIex.Id
                                $CookieCreated = $CookieIex.Created
                                $CookieExpire  = $CookieIex.Expire
                                $CookieCred    = $CookieIex.Cred
                                $CookieLock    = $CookieIex.Lock
                                $CookieVr      = $CookieIex.Vr
                                $CookieUid     = $CookieIex.Uid
                                $CookiePwd     = $CookieIex.Pwd
                                [array]$Cache:CTA += @{Id=$CookieId;Created=$CookieCreated;Expire=$CookieExpire;Cred=$CookieCred;Lock=$CookieLock;Vr=$CookieVr;Uid=$CookieUid;Pwd=$CookiePwd}
                            }
                            elseif($CookieIex.Cred -eq 'cc'){
                                $CookieId      = $CookieIex.Id
                                $CookieCreated = $CookieIex.Created
                                $CookieExpire  = $CookieIex.Expire
                                $CookieCred    = $CookieIex.Cred
                                $CookieLock    = $CookieIex.Lock
                                $CookieVr      = $CookieIex.Vr
                                $CookieUid     = $CookieIex.Uid
                                $CookiePwd     = $CookieIex.Pwd
                                [array]$Cache:CTC += @{Id=$CookieId;Created=$CookieCreated;Expire=$CookieExpire;Cred=$CookieCred;Lock=$CookieLock;Vr=$CookieVr;Uid=$CookieUid;Pwd=$CookiePwd}
                            }
                            elseif($CookieIex.Cred -eq 'vc'){
                                $CookieId      = $CookieIex.Id
                                $CookieCreated = $CookieIex.Created
                                $CookieExpire  = $CookieIex.Expire
                                $CookieCred    = $CookieIex.Cred
                                $CookieLock    = $CookieIex.Lock
                                $CookieVr      = $CookieIex.Vr
                                $CookieUid     = $CookieIex.Uid
                                $CookiePwd     = $CookieIex.Pwd
                                [array]$Cache:CTV += @{Id=$CookieId;Created=$CookieCreated;Expire=$CookieExpire;Cred=$CookieCred;Lock=$CookieLock;Vr=$CookieVr;Uid=$CookieUid;Pwd=$CookiePwd}
                            }
                        }
                        elseif($CookieIex.Count -gt 1){
                            foreach ($MultiCookie in $CookieIex) {
                                if($CookieIex.Cred -eq 'ac'){
                                    $CookieId      = $MultiCookie.Id
                                    $CookieCreated = $MultiCookie.Created
                                    $CookieExpire  = $MultiCookie.Expire
                                    $CookieCred    = $MultiCookie.Cred
                                    $CookieLock    = $MultiCookie.Lock
                                    $CookieVr      = $MultiCookie.Vr
                                    $CookieUid     = $MultiCookie.Uid
                                    $CookiePwd     = $MultiCookie.Pwd
                                    [array]$Cache:CTA += @{Id=$CookieId;Created=$CookieCreated;Expire=$CookieExpire;Cred=$CookieCred;Lock=$CookieLock;Vr=$CookieVr;Uid=$CookieUid;Pwd=$CookiePwd}
                                }
                                elseif($CookieIex.Cred -eq 'cc'){
                                    $CookieId      = $MultiCookie.Id
                                    $CookieCreated = $MultiCookie.Created
                                    $CookieExpire  = $MultiCookie.Expire
                                    $CookieCred    = $MultiCookie.Cred
                                    $CookieLock    = $MultiCookie.Lock
                                    $CookieVr      = $MultiCookie.Vr
                                    $CookieUid     = $MultiCookie.Uid
                                    $CookiePwd     = $MultiCookie.Pwd
                                    [array]$Cache:CTC += @{Id=$CookieId;Created=$CookieCreated;Expire=$CookieExpire;Cred=$CookieCred;Lock=$CookieLock;Vr=$CookieVr;Uid=$CookieUid;Pwd=$CookiePwd}
                                }
                                elseif($CookieIex.Cred -eq 'vc'){
                                    $CookieId      = $MultiCookie.Id
                                    $CookieCreated = $MultiCookie.Created
                                    $CookieExpire  = $MultiCookie.Expire
                                    $CookieCred    = $MultiCookie.Cred
                                    $CookieLock    = $MultiCookie.Lock
                                    $CookieVr      = $MultiCookie.Vr
                                    $CookieUid     = $MultiCookie.Uid
                                    $CookiePwd     = $MultiCookie.Pwd
                                    [array]$Cache:CTV += @{Id=$CookieId;Created=$CookieCreated;Expire=$CookieExpire;Cred=$CookieCred;Lock=$CookieLock;Vr=$CookieVr;Uid=$CookieUid;Pwd=$CookiePwd}
                                }
                            }
                        }
                        else{

                        }
                    }
                }
                $Cache:OldTicks = $CookieTicksName            
            }
        }
        else{
            $ErrorMessage = 'Cookies database is not valid!'
        }
    }
    $Cache:CookiesDatabaseSC|iex
    #endregion PART DOWNLOAD COOKIES DATABASE BLOCK SCRIPT BLOCK

    #region PART VERIFICATION IDENTITY SCRIPT BLOCK
    $Cache:VerificationIdentitySC = {
        $Session:Ticks = (Get-Date).Ticks
        $cdCon    = $Cookies.ContainsKey('cd')
        $ciCon    = $Cookies.ContainsKey('ci')
        $cnCon    = $Cookies.ContainsKey('cn')
        $ctCon    = $Cookies.ContainsKey('ct')
        $ceCon    = $Cookies.ContainsKey('ce')
        $ssid     = $Session.Id
        $ssidData = Get-PSUCache -Key $ssid -Integrated -ErrorAction Stop
        if($cdCon -eq $true -and $ciCon -eq $true -and $cnCon -eq $true -and $ctCon -eq $true -and $ceCon -eq $true -and $ssidData.count -eq 0){
            $cdGet = $Cookies.Item('cd')
            $ciGet = $Cookies.Item('ci')
            $cnGet = $Cookies.Item('cn')
            $ctGet = $Cookies.Item('ct')
            $ceGet = $Cookies.Item('ce')
            if($cdGet -eq 'importcddata' -or $ciGet -eq 'importcidata' -or $cnGet -eq 'importcndata' -or $ctGet -eq 'importctdata' -or $ceGet -eq 'importcedata'){
                $cdcicnctceCon = $false
            }
            else{
                $cdcicnctceCon = $true
            }
            # VALIDATION COOKIE VALUES
            if($cdcicnctceCon -eq $true -and $cdGet.length -ge 1 -and $ciGet.length -ge 1 -and $cnGet.length -ge 1 -and $ctGet.length -ge 1 -and $ceGet.length -ge 1){
                if($cdGet -gt $Cache:OldTicks){
                    $CookiePath = "$Cache:DefaultCookiesDbDirNew"+"$cdGet"+'.ck'
                    if(Test-Path $CookiePath){
                        $CookieData = (gc $CookiePath -Force -ErrorAction Stop)|iex -ErrorAction Stop
                        if($ctGet -eq 'vc'){
                            # VISITOR
                            if(($true -eq $($CookieData.Id -eq $ciGet)) -and ($true -eq $($CookieData.Created -eq $cdGet))){
                                $Session:ssidCkid   = $CookieData.Id
                                $Session:ssidCred   = $CookieData.Cred
                                $Session:ssidLock   = $CookieData.Lock
                                $Session:ssidVr     = $CookieData.Vr
                                $Session:ssidCkInit = $true
                                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                            }
                            else{
                                $Session:ssidCred = 'vc'
                                $Session:ssidLock = $false
                                $Session:ssidVr   = $false
                            }
                        }
                        elseif($ctGet -eq 'cc'){
                            # CUSTOMER
                            if(($true -eq $($CookieData.Id -eq $ciGet)) -and ($true -eq $($CookieData.Created -eq $cdGet))){
                                $Session:ssidCkid   = $CookieData.Id
                                $Session:ssidCred   = $CookieData.Cred
                                $Session:ssidLock   = $CookieData.Lock
                                $Session:ssidVr     = $CookieData.Vr
                                $Session:ssidCkInit = $true
                                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                            }
                            else{
                                $Session:ssidCred = 'vc'
                                $Session:ssidLock = $false
                                $Session:ssidVr   = $false
                            }                
                        }
                        elseif($ctGet -eq 'ac'){
                            # ADMINISTRATOR
                            if(($true -eq $($CookieData.Id -eq $ciGet)) -and ($true -eq $($CookieData.Created -eq $cdGet))){
                                $Session:ssidCkid   = $CookieData.Id
                                $Session:ssidCred   = $CookieData.Cred
                                $Session:ssidLock   = $CookieData.Lock
                                $Session:ssidVr     = $CookieData.Vr
                                $Session:ssidCkInit = $true
                                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                            }
                            else{
                                $Session:ssidCred = 'vc'
                                $Session:ssidLock = $false
                                $Session:ssidVr   = $false
                            }
                        }
                        else{
                            $Session:ssidCred = 'vc'
                            $Session:ssidLock = $false
                            $Session:ssidVr   = $false
                        }                        
                    }
                    else{
                        $Session:ssidCred = 'vc'
                        $Session:ssidLock = $false
                        $Session:ssidVr   = $false
                    }
                }
                elseif($cdGet -lt $Cache:OldTicks){
                    if($ctGet -eq 'vc'){
                        # VISITOR
                        if($Cache:CTV.Id.Count -gt 1 -and ($true -eq $(($Cache:CTV[$cnGet]).Id -eq $ciGet)) -and ($true -eq $(($Cache:CTV[$cnGet]).Created -eq $cdGet))){
                            $CookieData         = $Cache:CTV[$cnGet]
                            $Session:ssidCkid   = $CookieData.Id
                            $Session:ssidCred   = $CookieData.Cred
                            $Session:ssidLock   = $CookieData.Lock
                            $Session:ssidVr     = $CookieData.Vr
                            $Session:ssidCkInit = $true
                            $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                        }
                        elseif($cnGet.Length -eq 18 -and ($true -eq $($Cache:CTV.Id -match $ciGet)) -and ($true -eq $($Cache:CTV.Created -match $cdGet))){
                            # GLOBAL UTC DATE
                            $Date = Get-Date
                            $Expire = $Cache:DefaultCookiesGlobalOptions.Expire
                            [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                            [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                            $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'
                            # ADD INDEX NUMBER TO COOKIE FOR NEXT VISIT ON PAGE
                            $IndexNumber = [array]::IndexOf($Cache:CTV.Id, $ciGet)
                            if($IndexNumber -ge 0 -and $IndexNumber.Count -eq 1){
                                # UPDATE DOCUMENT.COOKIE VARIABLE CN
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importcndata',$IndexNumber -replace 'importdomaindata',$Cache:DefaultCookiesGlobalOptions.Domain -replace 'importpathdata',$Cache:DefaultCookiesGlobalOptions.Path -replace 'importexpiredate',$ExpireDateUtc -replace 'importsecuredata',$Cache:DefaultCookiesGlobalOptions.Secure -replace 'importsamesitedata',$Cache:DefaultCookiesGlobalOptions.SameSite
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*'+'\'+"$cdGet"+'.ck')) -and $Cache:CTV.Id.Count -gt 1){
                                    $CookieData         = $Cache:CTV[$IndexNumber]
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $UpdateHash = Set-Content $FindHashCookie.FullName -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                elseif((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTV.Id.Count -eq 1){
                                    $CookieData         = $Cache:CTV
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                }                                
                                else{

                                }
                            }
                            else{
                                $Session:ssidCred = 'vc'
                                $Session:ssidLock = $false
                                $Session:ssidVr   = $false
                            }
                        }
                        elseif(($Cache:CTV.Id.Count -eq 1 -and ($true -eq $($Cache:CTV.Id -eq $ciGet))) -and ($Cache:CTV.Created.Count -eq 1 -and ($true -eq $($Cache:CTV.Created -eq $cdGet)))){
                            $CookieData         = $Cache:CTV
                            $Session:ssidCkid   = $CookieData.Id
                            $Session:ssidCred   = $CookieData.Cred
                            $Session:ssidLock   = $CookieData.Lock
                            $Session:ssidVr     = $CookieData.Vr
                            $Session:ssidCkInit = $true
                            $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                        }
                        else{
                            $Session:ssidCred = 'vc'
                            $Session:ssidLock = $false
                            $Session:ssidVr   = $false
                        }
                    }
                    elseif($ctGet -eq 'cc'){
                        # CUSTOMER
                        if($Cache:CTC.Id.Count -gt 1 -and ($true -eq $(($Cache:CTC[$cnGet]).Id -eq $ciGet)) -and ($true -eq $(($Cache:CTC[$cnGet]).Created -eq $cdGet))){
                            $CookieData         = $Cache:CTC[$cnGet]
                            $Session:ssidCkid   = $CookieData.Id
                            $Session:ssidCred   = $CookieData.Cred
                            $Session:ssidLock   = $CookieData.Lock
                            $Session:ssidVr     = $CookieData.Vr
                            $Session:ssidCkInit = $true
                            $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                        }
                        elseif($cnGet.Length -eq 18 -and ($true -eq $($Cache:CTC.Id -match $ciGet)) -and ($true -eq $($Cache:CTC.Created -match $cdGet))){
                            # GLOBAL UTC DATE
                            $Date = Get-Date
                            $Expire = $Cache:DefaultCookiesGlobalOptions.Expire
                            [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                            [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                            $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'                            
                            # ADD INDEX NUMBER TO COOKIE FOR NEXT VISIT ON PAGE
                            $IndexNumber = [array]::IndexOf($Cache:CTC.Id, $ciGet)
                            if($IndexNumber -ge 0 -and $IndexNumber.Count -eq 1){
                                # UPDATE DOCUMENT.COOKIE VARIABLE CN
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importcndata',$IndexNumber -replace 'importdomaindata',$Cache:DefaultCookiesGlobalOptions.Domain -replace 'importpathdata',$Cache:DefaultCookiesGlobalOptions.Path -replace 'importexpiredate',$ExpireDateUtc -replace 'importsecuredata',$Cache:DefaultCookiesGlobalOptions.Secure -replace 'importsamesitedata',$Cache:DefaultCookiesGlobalOptions.SameSite
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTC.Id.Count -gt 1){
                                    $CookieData         = $Cache:CTC[$IndexNumber]
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $UpdateHash = Set-Content $FindHashCookie.FullName -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                elseif((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTC.Id.Count -eq 1){
                                    $CookieData         = $Cache:CTC
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                }                                
                                else{

                                }                                
                            }
                            else{
                                $Session:ssidCred = 'vc'
                                $Session:ssidLock = $false
                                $Session:ssidVr   = $false
                            }
                        }
                        elseif(($Cache:CTC.Id.Count -eq 1 -and ($true -eq $($Cache:CTC.Id -eq $ciGet))) -and ($Cache:CTC.Created.Count -eq 1 -and ($true -eq $($Cache:CTC.Created -eq $cdGet)))){
                            $CookieData         = $Cache:CTC
                            $Session:ssidCkid   = $CookieData.Id
                            $Session:ssidCred   = $CookieData.Cred
                            $Session:ssidLock   = $CookieData.Lock
                            $Session:ssidVr     = $CookieData.Vr
                            $Session:ssidCkInit = $true
                            $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                        }
                        else{
                            $Session:ssidCred = 'vc'
                            $Session:ssidLock = $false
                            $Session:ssidVr   = $false
                        }                
                    }
                    elseif($ctGet -eq 'ac'){
                        # ADMINISTRATOR
                        if($Cache:CTA.Id.Count -gt 1 -and ($true -eq $(($Cache:CTA[$cnGet]).Id -eq $ciGet)) -and ($true -eq $(($Cache:CTA[$cnGet]).Created -eq $cdGet))){
                            $CookieData         = $Cache:CTA[$cnGet]
                            $Session:ssidCkid   = $CookieData.Id
                            $Session:ssidCred   = $CookieData.Cred
                            $Session:ssidLock   = $CookieData.Lock
                            $Session:ssidVr     = $CookieData.Vr
                            $Session:ssidCkInit = $true
                            $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                        }
                        elseif($cnGet.Length -eq 18 -and ($true -eq $($Cache:CTA.Id -match $ciGet)) -and ($true -eq $($Cache:CTA.Created -match $cdGet))){
                            # GLOBAL UTC DATE
                            $Date = Get-Date
                            $Expire = $Cache:DefaultCookiesGlobalOptions.Expire
                            [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                            [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                            $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'                            
                            # ADD INDEX NUMBER TO COOKIE FOR NEXT VISIT ON PAGE
                            $IndexNumber = [array]::IndexOf($Cache:CTA.Id, $ciGet)
                            if($IndexNumber -ge 0 -and $IndexNumber.Count -eq 1){
                                # UPDATE DOCUMENT.COOKIE VARIABLE CN
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importcndata',$IndexNumber -replace 'importdomaindata',$Cache:DefaultCookiesGlobalOptions.Domain -replace 'importpathdata',$Cache:DefaultCookiesGlobalOptions.Path -replace 'importexpiredate',$ExpireDateUtc -replace 'importsecuredata',$Cache:DefaultCookiesGlobalOptions.Secure -replace 'importsamesitedata',$Cache:DefaultCookiesGlobalOptions.SameSite
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTA.Id.Count -gt 1){
                                    $CookieData         = $Cache:CTA[$IndexNumber]
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $UpdateHash = Set-Content $FindHashCookie.FullName -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                elseif((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTA.Id.Count -eq 1){
                                    $CookieData         = $Cache:CTA
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                }                                
                                else{

                                }                                
                            }
                        }
                        elseif(($Cache:CTA.Id.Count -eq 1 -and ($true -eq $($Cache:CTA.Id -eq $ciGet))) -and ($Cache:CTA.Created.Count -eq 1 -and ($true -eq $($Cache:CTA.Created -eq $cdGet)))){
                            $CookieData         = $Cache:CTA
                            $Session:ssidCkid   = $CookieData.Id
                            $Session:ssidCred   = $CookieData.Cred
                            $Session:ssidLock   = $CookieData.Lock
                            $Session:ssidVr     = $CookieData.Vr
                            $Session:ssidCkInit = $true
                            $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                        }
                        else{
                            $Session:ssidCred = 'vc'
                            $Session:ssidLock = $false
                            $Session:ssidVr   = $false
                        }
                    }
                    else{
                        $Session:ssidCred = 'vc'
                        $Session:ssidLock = $false
                        $Session:ssidVr   = $false
                    }
                }
                else{
                    $Session:ssidCred = 'vc'
                    $Session:ssidLock = $false
                    $Session:ssidVr   = $false
                }
            }
            else{
                $Session:ssidCkid   = $ssid
                $Session:ssidCred   = 'vc'
                $Session:ssidLock   = $false
                $Session:ssidVr     = $false
                $Session:ssidCkInit = $false
                $CookieData         = @{Id=$ssid;Created='null';Expire='null';Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
            }
        }
        elseif($cdCon -eq $true -and $ciCon -eq $true -and $cnCon -eq $true -and $ctCon -eq $true -and $ceCon -eq $true -and $ssidData.count -gt 0){
            $cdGet = $Cookies.Item('cd')
            $ciGet = $Cookies.Item('ci')
            $cnGet = $Cookies.Item('cn')
            $ctGet = $Cookies.Item('ct')
            $ceGet = $Cookies.Item('ce')
            if($cdGet -eq 'importcddata' -or $ciGet -eq 'importcidata' -or $cnGet -eq 'importcndata' -or $ctGet -eq 'importctdata' -or $ceGet -eq 'importcedata'){
                $cdcicnctceCon = $false
            }
            else{
                $cdcicnctceCon = $true
            }
            if($cdcicnctceCon -eq $true -and $cdGet.length -ge 1 -and $ciGet.length -ge 1 -and $cnGet.length -ge 1 -and $ctGet.length -ge 1 -and $ceGet.length -ge 1){
                if($cdGet -gt $Cache:OldTicks){
                    $CookiePath = "$Cache:DefaultCookiesDbDirNew"+"$cdGet"+'.ck'
                    if(Test-Path $CookiePath){
                        $CookieData = (gc $CookiePath -Force -ErrorAction Stop)|iex -ErrorAction Stop
                        if($ctGet -eq 'vc'){
                            # VISITOR
                            if(($true -eq $($CookieData.Id -eq $ciGet)) -and ($true -eq $($CookieData.Created -eq $cdGet))){
                                if(($true -ne ($CookieData.Id -eq $ssidData.Id)) -or ($true -ne ($CookieData.Cred -eq $ssidData.Cred)) -or ($true -ne ($CookieData.Lock -eq $ssidData.Lock)) -or ($true -ne ($CookieData.Vr -eq $ssidData.Vr)) -or ($true -ne ($CookieData.Uid -eq $ssidData.Uid)) -or ($true -ne ($CookieData.Pwd -eq $ssidData.Pwd)) -or ($true -ne ($CookieData.Expire -eq $ssidData.Expire)) -or ($true -ne ($CookieData.Created -eq $ssidData.Created))){
                                    # GLOBAL COOKIES OPTIONS 
                                    [string]$Domain   = $Cache:DefaultCookiesGlobalOptions.Domain
                                    [string]$Path     = $Cache:DefaultCookiesGlobalOptions.Path
                                    [double]$Expire   = $Cache:DefaultCookiesGlobalOptions.Expire
                                    [string]$Secure   = $Cache:DefaultCookiesGlobalOptions.Secure
                                    [string]$SameSite = $Cache:DefaultCookiesGlobalOptions.SameSite
                                    $Date = Get-Date
                                    $CookieCreated = $Date.Ticks
                                    $CookieExpire  = ($Date.AddDays($Expire)).Ticks
                                    
                                    # GLOBAL UTC DATE
                                    [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                                    [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                                    $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'

                                    # VALIDATION SESSION NAD COOKIES
                                    # UID VARIABLE
                                    if($ssidData.Uid -eq 'null'){
                                        $CookieUid = $CookieData.Uid
                                    }
                                    else{
                                        $CookieUid = $ssidData.Uid
                                    }
                                    # PWD VARIABLE
                                    if($ssidData.Pwd -eq 'null'){
                                        $CookiePwd = $CookieData.Pwd
                                    }
                                    else{
                                        $CookiePwd = $ssidData.Pwd
                                    }
                                    # VR VARIABLE
                                    if($CookieData.Vr -eq $true -and $ssidData.Vr -eq $true){
                                        $CookieVr = $true
                                    }
                                    elseif($CookieData.Vr -eq $true -and $ssidData.Vr -eq $false){
                                        $CookieVr = $false
                                    }
                                    elseif($CookieData.Vr -eq $false -and $ssidData.Vr -eq $true){
                                        $CookieVr = $True
                                    }
                                    else{
                                        $CookieVr = $false
                                    }
                                    # LOCK VARIABLE
                                    if($CookieData.Lock -eq $true -and $ssidData.Lock -eq $true){
                                        $CookieLock = $true
                                    }
                                    elseif($CookieData.Lock -eq $true -and $ssidData.Lock -eq $false){
                                        $CookieLock = $false
                                    }
                                    elseif($CookieData.Lock -eq $false -and $ssidData.Lock -eq $true){
                                        $CookieLock = $True
                                    }
                                    else{
                                        $CookieLock = $false
                                    } 
                                    # CRED VARIABLE
                                    if($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'vc'){
                                        $CookieCred = 'cc'
                                    }
                                    elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'cc'){
                                        $CookieCred = 'cc'
                                    }
                                    elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'ac'){
                                        $CookieCred = 'ac'
                                    }
                                    elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'vc'){
                                        $CookieCred = 'vc'
                                    }
                                    elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'cc'){
                                        $CookieCred = 'cc'
                                    }
                                    elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'ac'){
                                        $CookieCred = 'ac'
                                    } 
                                    elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'vc'){
                                        $CookieCred = 'ac'
                                    }
                                    elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'cc'){
                                        $CookieCred = 'ac'
                                    }
                                    elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'ac'){
                                        $CookieCred = 'ac'
                                    }                                                                                                                                                                                                                                
                                    else{
                                        $CookieCred = 'vc'
                                    }
    
                                    $CookieId     = $CookieData.Id
                                    $CookieNumber = $CookieCreated
    
                                    
                                    # UPDATE DOCUMENT.COOKIE ALL VARIABLES
                                    $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                        document.cookie = "cd=importcddata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "ci=importcidata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "ct=importctdata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "ce=importcedata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                    )} -replace 'importdomaindata',"$Domain" -replace 'importpathdata',"$Path" -replace 'importexpiredate',"$ExpireDateUtc" -replace 'importsecuredata',"$Secure" -replace 'importsamesitedata',"$SameSite" -replace 'importcddata',"$CookieCreated" -replace 'importcidata',"$CookieId" -replace 'importcndata',"$CookieNumber" -replace 'importctdata',"$CookieCred" -replace 'importcedata',"$CookieExpire"
                                    
                                    $sc|iex

                                    $Session:ssidCkid   = $CookieId
                                    $Session:ssidCred   = $CookieCred
                                    $Session:ssidLock   = $CookieLock
                                    $Session:ssidVr     = $CookieVr
                                    $Session:ssidCkInit = $true
                                    $CookieData         = @{Id=$CookieId;Created=$CookieCreated;Expire=$CookieExpire;Cred=$CookieCred;Lock=$CookieLock;Vr=$CookieVr;Uid=$CookieUid;Pwd=$CookiePwd}
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieId+"'"+';Created='+"'"+$CookieCreated+"'"+';Expire='+"'"+$CookieExpire+"'"+';Cred='+"'"+$CookieCred+"'"+';Lock='+"'"+$CookieLock+"'"+';Vr='+"'"+$CookieVr+"'"+';Uid='+"'"+$CookieUid+"'"+';Pwd='+"'"+$CookiePwd+"'"+'}'
                                    $FindHashCookie     = gci $CookiePath -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $RemoveCookie = Remove-Item $FindHashCookie.FullName -Force -ErrorAction Stop
                                        $CreateCookie = New-Item -ItemType File ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -ErrorAction Stop
                                        $UpdateHash   = Set-Content ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }                            
                                }
                                else{
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                }
                            }
                            else{
                                $Session:ssidCred = 'vc'
                                $Session:ssidLock = $false
                                $Session:ssidVr   = $false
                            }
                        }
                        elseif($ctGet -eq 'cc'){
                            # CUSTOMER
                            if(($true -eq $($CookieData.Id -eq $ciGet)) -and ($true -eq $($CookieData.Created -eq $cdGet))){
                                if(($true -ne ($CookieData.Id -eq $ssidData.Id)) -or ($true -ne ($CookieData.Cred -eq $ssidData.Cred)) -or ($true -ne ($CookieData.Lock -eq $ssidData.Lock)) -or ($true -ne ($CookieData.Vr -eq $ssidData.Vr)) -or ($true -ne ($CookieData.Uid -eq $ssidData.Uid)) -or ($true -ne ($CookieData.Pwd -eq $ssidData.Pwd)) -or ($true -ne ($CookieData.Expire -eq $ssidData.Expire)) -or ($true -ne ($CookieData.Created -eq $ssidData.Created))){
                                    # GLOBAL COOKIES OPTIONS 
                                    [string]$Domain   = $Cache:DefaultCookiesGlobalOptions.Domain
                                    [string]$Path     = $Cache:DefaultCookiesGlobalOptions.Path
                                    [double]$Expire   = $Cache:DefaultCookiesGlobalOptions.Expire
                                    [string]$Secure   = $Cache:DefaultCookiesGlobalOptions.Secure
                                    [string]$SameSite = $Cache:DefaultCookiesGlobalOptions.SameSite
                                    $Date = Get-Date
                                    $CookieCreated = $Date.Ticks
                                    $CookieExpire  = ($Date.AddDays($Expire)).Ticks

                                    # GLOBAL UTC DATE
                                    [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                                    [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                                    $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'

                                    # VALIDATION SESSION NAD COOKIES
                                    # UID VARIABLE
                                    if($ssidData.Uid -eq 'null'){
                                        $CookieUid = $CookieData.Uid
                                    }
                                    else{
                                        $CookieUid = $ssidData.Uid
                                    }
                                    # PWD VARIABLE
                                    if($ssidData.Pwd -eq 'null'){
                                        $CookiePwd = $CookieData.Pwd
                                    }
                                    else{
                                        $CookiePwd = $ssidData.Pwd
                                    }
                                    # VR VARIABLE
                                    if($CookieData.Vr -eq $true -and $ssidData.Vr -eq $true){
                                        $CookieVr = $true
                                    }
                                    elseif($CookieData.Vr -eq $true -and $ssidData.Vr -eq $false){
                                        $CookieVr = $false
                                    }
                                    elseif($CookieData.Vr -eq $false -and $ssidData.Vr -eq $true){
                                        $CookieVr = $True
                                    }
                                    else{
                                        $CookieVr = $false
                                    }
                                    # LOCK VARIABLE
                                    if($CookieData.Lock -eq $true -and $ssidData.Lock -eq $true){
                                        $CookieLock = $true
                                    }
                                    elseif($CookieData.Lock -eq $true -and $ssidData.Lock -eq $false){
                                        $CookieLock = $false
                                    }
                                    elseif($CookieData.Lock -eq $false -and $ssidData.Lock -eq $true){
                                        $CookieLock = $True
                                    }
                                    else{
                                        $CookieLock = $false
                                    } 
                                    # CRED VARIABLE
                                    if($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'vc'){
                                        $CookieCred = 'cc'
                                    }
                                    elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'cc'){
                                        $CookieCred = 'cc'
                                    }
                                    elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'ac'){
                                        $CookieCred = 'ac'
                                    }
                                    elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'vc'){
                                        $CookieCred = 'vc'
                                    }
                                    elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'cc'){
                                        $CookieCred = 'cc'
                                    }
                                    elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'ac'){
                                        $CookieCred = 'ac'
                                    } 
                                    elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'vc'){
                                        $CookieCred = 'ac'
                                    }
                                    elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'cc'){
                                        $CookieCred = 'ac'
                                    }
                                    elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'ac'){
                                        $CookieCred = 'ac'
                                    }                                                                                                                                                                                                                                
                                    else{
                                        $CookieCred = 'vc'
                                    }                                 
    
                                    $CookieId     = $CookieData.Id
                                    $CookieNumber = $CookieCreated
    
                                    
                                    # UPDATE DOCUMENT.COOKIE ALL VARIABLES
                                    $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                        document.cookie = "cd=importcddata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "ci=importcidata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "ct=importctdata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "ce=importcedata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                    )} -replace 'importdomaindata',"$Domain" -replace 'importpathdata',"$Path" -replace 'importexpiredate',"$ExpireDateUtc" -replace 'importsecuredata',"$Secure" -replace 'importsamesitedata',"$SameSite" -replace 'importcddata',"$CookieCreated" -replace 'importcidata',"$CookieId" -replace 'importcndata',"$CookieNumber" -replace 'importctdata',"$CookieCred" -replace 'importcedata',"$CookieExpire"
                                    
                                    $sc|iex

                                    $Session:ssidCkid   = $CookieId
                                    $Session:ssidCred   = $CookieCred
                                    $Session:ssidLock   = $CookieLock
                                    $Session:ssidVr     = $CookieVr
                                    $Session:ssidCkInit = $true
                                    $CookieData         = @{Id=$CookieId;Created=$CookieCreated;Expire=$CookieExpire;Cred=$CookieCred;Lock=$CookieLock;Vr=$CookieVr;Uid=$CookieUid;Pwd=$CookiePwd}
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieId+"'"+';Created='+"'"+$CookieCreated+"'"+';Expire='+"'"+$CookieExpire+"'"+';Cred='+"'"+$CookieCred+"'"+';Lock='+"'"+$CookieLock+"'"+';Vr='+"'"+$CookieVr+"'"+';Uid='+"'"+$CookieUid+"'"+';Pwd='+"'"+$CookiePwd+"'"+'}'
                                    $FindHashCookie     = gci $CookiePath -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $RemoveCookie = Remove-Item $FindHashCookie.FullName -Force -ErrorAction Stop
                                        $CreateCookie = New-Item -ItemType File ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -ErrorAction Stop
                                        $UpdateHash   = Set-Content ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }                            
                                }
                                else{
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                }
                            }
                            else{
                                $Session:ssidCred = 'vc'
                                $Session:ssidLock = $false
                                $Session:ssidVr   = $false
                            }                
                        }
                        elseif($ctGet -eq 'ac'){
                            # ADMINISTRATOR
                            if(($true -eq $($CookieData.Id -eq $ciGet)) -and ($true -eq $($CookieData.Created -eq $cdGet))){
                                if(($true -ne ($CookieData.Id -eq $ssidData.Id)) -or ($true -ne ($CookieData.Cred -eq $ssidData.Cred)) -or ($true -ne ($CookieData.Lock -eq $ssidData.Lock)) -or ($true -ne ($CookieData.Vr -eq $ssidData.Vr)) -or ($true -ne ($CookieData.Uid -eq $ssidData.Uid)) -or ($true -ne ($CookieData.Pwd -eq $ssidData.Pwd)) -or ($true -ne ($CookieData.Expire -eq $ssidData.Expire)) -or ($true -ne ($CookieData.Created -eq $ssidData.Created))){
                                    # GLOBAL COOKIES OPTIONS 
                                    [string]$Domain   = $Cache:DefaultCookiesGlobalOptions.Domain
                                    [string]$Path     = $Cache:DefaultCookiesGlobalOptions.Path
                                    [double]$Expire   = $Cache:DefaultCookiesGlobalOptions.Expire
                                    [string]$Secure   = $Cache:DefaultCookiesGlobalOptions.Secure
                                    [string]$SameSite = $Cache:DefaultCookiesGlobalOptions.SameSite
                                    $Date = Get-Date
                                    $CookieCreated = $Date.Ticks
                                    $CookieExpire  = ($Date.AddDays($Expire)).Ticks

                                    # GLOBAL UTC DATE
                                    [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                                    [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                                    $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'

                                    # VALIDATION SESSION NAD COOKIES
                                    # UID VARIABLE
                                    if($ssidData.Uid -eq 'null'){
                                        $CookieUid = $CookieData.Uid
                                    }
                                    else{
                                        $CookieUid = $ssidData.Uid
                                    }
                                    # PWD VARIABLE
                                    if($ssidData.Pwd -eq 'null'){
                                        $CookiePwd = $CookieData.Pwd
                                    }
                                    else{
                                        $CookiePwd = $ssidData.Pwd
                                    }
                                    # VR VARIABLE
                                    if($CookieData.Vr -eq $true -and $ssidData.Vr -eq $true){
                                        $CookieVr = $true
                                    }
                                    elseif($CookieData.Vr -eq $true -and $ssidData.Vr -eq $false){
                                        $CookieVr = $false
                                    }
                                    elseif($CookieData.Vr -eq $false -and $ssidData.Vr -eq $true){
                                        $CookieVr = $True
                                    }
                                    else{
                                        $CookieVr = $false
                                    }
                                    # LOCK VARIABLE
                                    if($CookieData.Lock -eq $true -and $ssidData.Lock -eq $true){
                                        $CookieLock = $true
                                    }
                                    elseif($CookieData.Lock -eq $true -and $ssidData.Lock -eq $false){
                                        $CookieLock = $false
                                    }
                                    elseif($CookieData.Lock -eq $false -and $ssidData.Lock -eq $true){
                                        $CookieLock = $True
                                    }
                                    else{
                                        $CookieLock = $false
                                    } 
                                    # CRED VARIABLE
                                    if($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'vc'){
                                        $CookieCred = 'cc'
                                    }
                                    elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'cc'){
                                        $CookieCred = 'cc'
                                    }
                                    elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'ac'){
                                        $CookieCred = 'ac'
                                    }
                                    elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'vc'){
                                        $CookieCred = 'vc'
                                    }
                                    elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'cc'){
                                        $CookieCred = 'cc'
                                    }
                                    elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'ac'){
                                        $CookieCred = 'ac'
                                    } 
                                    elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'vc'){
                                        $CookieCred = 'ac'
                                    }
                                    elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'cc'){
                                        $CookieCred = 'ac'
                                    }
                                    elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'ac'){
                                        $CookieCred = 'ac'
                                    }                                                                                                                                                                                                                                
                                    else{
                                        $CookieCred = 'vc'
                                    }                                
    
                                    $CookieId     = $CookieData.Id
                                    $CookieNumber = $CookieCreated
    
                                    
                                    # UPDATE DOCUMENT.COOKIE ALL VARIABLES
                                    $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                        document.cookie = "cd=importcddata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "ci=importcidata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "ct=importctdata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                        document.cookie = "ce=importcedata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                    )} -replace 'importdomaindata',"$Domain" -replace 'importpathdata',"$Path" -replace 'importexpiredate',"$ExpireDateUtc" -replace 'importsecuredata',"$Secure" -replace 'importsamesitedata',"$SameSite" -replace 'importcddata',"$CookieCreated" -replace 'importcidata',"$CookieId" -replace 'importcndata',"$CookieNumber" -replace 'importctdata',"$CookieCred" -replace 'importcedata',"$CookieExpire"
                                    
                                    $sc|iex

                                    $Session:ssidCkid   = $CookieId
                                    $Session:ssidCred   = $CookieCred
                                    $Session:ssidLock   = $CookieLock
                                    $Session:ssidVr     = $CookieVr
                                    $Session:ssidCkInit = $true
                                    $CookieData         = @{Id=$CookieId;Created=$CookieCreated;Expire=$CookieExpire;Cred=$CookieCred;Lock=$CookieLock;Vr=$CookieVr;Uid=$CookieUid;Pwd=$CookiePwd}
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieId+"'"+';Created='+"'"+$CookieCreated+"'"+';Expire='+"'"+$CookieExpire+"'"+';Cred='+"'"+$CookieCred+"'"+';Lock='+"'"+$CookieLock+"'"+';Vr='+"'"+$CookieVr+"'"+';Uid='+"'"+$CookieUid+"'"+';Pwd='+"'"+$CookiePwd+"'"+'}'
                                    $FindHashCookie     = gci $CookiePath -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $RemoveCookie = Remove-Item $FindHashCookie.FullName -Force -ErrorAction Stop
                                        $CreateCookie = New-Item -ItemType File ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -ErrorAction Stop
                                        $UpdateHash   = Set-Content ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }                            
                                }
                                else{
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                }
                            }
                            else{
                                $Session:ssidCred = 'vc'
                                $Session:ssidLock = $false
                                $Session:ssidVr   = $false
                            }
                        }
                        else{
                            $Session:ssidCred = 'vc'
                            $Session:ssidLock = $false
                            $Session:ssidVr   = $false
                        }                        
                    }
                    else{
                        $Session:ssidCred = 'vc'
                        $Session:ssidLock = $false
                        $Session:ssidVr   = $false
                    }
                }
                elseif($cdGet -lt $Cache:OldTicks){
                    if($ctGet -eq 'vc'){
                        # VISITOR
                        if($Cache:CTV.Id.Count -gt 1 -and ($true -eq $(($Cache:CTV[$cnGet]).Id -eq $ciGet)) -and ($true -eq $(($Cache:CTV[$cnGet]).Created -eq $cdGet))){
                            $CookieData = $Cache:CTV[$cnGet]
                            if(($true -ne ($CookieData.Id -eq $ssidData.Id)) -or ($true -ne ($CookieData.Cred -eq $ssidData.Cred)) -or ($true -ne ($CookieData.Lock -eq $ssidData.Lock)) -or ($true -ne ($CookieData.Vr -eq $ssidData.Vr)) -or ($true -ne ($CookieData.Uid -eq $ssidData.Uid)) -or ($true -ne ($CookieData.Pwd -eq $ssidData.Pwd)) -or ($true -ne ($CookieData.Expire -eq $ssidData.Expire)) -or ($true -ne ($CookieData.Created -eq $ssidData.Created))){
                                # INDEX IN ARRAY
                                $IndexNumber = $cnGet                                
                                # GLOBAL COOKIES OPTIONS 
                                [string]$Domain   = $Cache:DefaultCookiesGlobalOptions.Domain
                                [string]$Path     = $Cache:DefaultCookiesGlobalOptions.Path
                                [double]$Expire   = $Cache:DefaultCookiesGlobalOptions.Expire
                                [string]$Secure   = $Cache:DefaultCookiesGlobalOptions.Secure
                                [string]$SameSite = $Cache:DefaultCookiesGlobalOptions.SameSite
                                $Date = Get-Date
                                $CookieCreated = $Date.Ticks
                                $CookieExpire  = ($Date.AddDays($Expire)).Ticks

                                # GLOBAL UTC DATE
                                [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                                [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                                $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'

                                # VALIDATION SESSION NAD COOKIES
                                # UID VARIABLE
                                if($ssidData.Uid -eq 'null'){
                                    $CookieUid = $CookieData.Uid
                                }
                                else{
                                    $CookieUid = $ssidData.Uid
                                }
                                # PWD VARIABLE
                                if($ssidData.Pwd -eq 'null'){
                                    $CookiePwd = $CookieData.Pwd
                                }
                                else{
                                    $CookiePwd = $ssidData.Pwd
                                }
                                # VR VARIABLE
                                if($CookieData.Vr -eq $true -and $ssidData.Vr -eq $true){
                                    $CookieVr = $true
                                }
                                elseif($CookieData.Vr -eq $true -and $ssidData.Vr -eq $false){
                                    $CookieVr = $false
                                }
                                elseif($CookieData.Vr -eq $false -and $ssidData.Vr -eq $true){
                                    $CookieVr = $True
                                }
                                else{
                                    $CookieVr = $false
                                }
                                # LOCK VARIABLE
                                if($CookieData.Lock -eq $true -and $ssidData.Lock -eq $true){
                                    $CookieLock = $true
                                }
                                elseif($CookieData.Lock -eq $true -and $ssidData.Lock -eq $false){
                                    $CookieLock = $false
                                }
                                elseif($CookieData.Lock -eq $false -and $ssidData.Lock -eq $true){
                                    $CookieLock = $True
                                }
                                else{
                                    $CookieLock = $false
                                } 
                                # CRED VARIABLE
                                if($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'vc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                } 
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }                                                                                                                                                                                                                                
                                else{
                                    $CookieCred = 'vc'
                                }

                                $CookieId     = $CookieData.Id
                                $CookieNumber = $CookieCreated

                                
                                # UPDATE DOCUMENT.COOKIE ALL VARIABLES
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cd=importcddata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ci=importcidata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ct=importctdata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ce=importcedata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importdomaindata',"$Domain" -replace 'importpathdata',"$Path" -replace 'importexpiredate',"$ExpireDateUtc" -replace 'importsecuredata',"$Secure" -replace 'importsamesitedata',"$SameSite" -replace 'importcddata',"$CookieCreated" -replace 'importcidata',"$CookieId" -replace 'importcndata',"$CookieNumber" -replace 'importctdata',"$CookieCred" -replace 'importcedata',"$CookieExpire"
                                
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTV.Id.Count -gt 1){
                                    ($Cache:CTV[$IndexNumber]).Id      = $CookieId
                                    ($Cache:CTV[$IndexNumber]).Cred    = $CookieCred
                                    ($Cache:CTV[$IndexNumber]).Lock    = $CookieLock
                                    ($Cache:CTV[$IndexNumber]).Vr      = $CookieVr
                                    ($Cache:CTV[$IndexNumber]).Uid     = $CookieUid
                                    ($Cache:CTV[$IndexNumber]).Pwd     = $CookiePwd
                                    ($Cache:CTV[$IndexNumber]).Created = $CookieCreated
                                    ($Cache:CTV[$IndexNumber]).Expire  = $CookieExpire
                                    $CookieData         = $Cache:CTV[$IndexNumber]
                                    $Session:ssidCkid   = $CookieId
                                    $Session:ssidCred   = $CookieCred
                                    $Session:ssidLock   = $CookieLock
                                    $Session:ssidVr     = $CookieVr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieId+"'"+';Created='+"'"+$CookieCreated+"'"+';Expire='+"'"+$CookieExpire+"'"+';Cred='+"'"+$CookieCred+"'"+';Lock='+"'"+$CookieLock+"'"+';Vr='+"'"+$CookieVr+"'"+';Uid='+"'"+$CookieUid+"'"+';Pwd='+"'"+$CookiePwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $RemoveCookie = Remove-Item $FindHashCookie.FullName -Force -ErrorAction Stop
                                        $CreateCookie = New-Item -ItemType File ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -ErrorAction Stop
                                        $UpdateHash   = Set-Content ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                else{

                                }                                
                            }
                            else{
                                $Session:ssidCkid   = $CookieData.Id
                                $Session:ssidCred   = $CookieData.Cred
                                $Session:ssidLock   = $CookieData.Lock
                                $Session:ssidVr     = $CookieData.Vr
                                $Session:ssidCkInit = $true
                                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                            }
                        }
                        elseif($cnGet.Length -eq 18 -and ($true -eq $($Cache:CTV.Id -match $ciGet)) -and ($true -eq $($Cache:CTV.Created -match $cdGet))){
                            # GLOBAL UTC DATE
                            $Date = Get-Date
                            $Expire = $Cache:DefaultCookiesGlobalOptions.Expire
                            [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                            [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                            $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'                            
                            # ADD INDEX NUMBER TO COOKIE FOR NEXT VISIT ON PAGE
                            $IndexNumber = [array]::IndexOf($Cache:CTV.Id, $ciGet)
                            if($IndexNumber -ge 0 -and $IndexNumber.Count -eq 1){
                                # UPDATE DOCUMENT.COOKIE VARIABLE CN
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importcndata',$IndexNumber -replace 'importdomaindata',$Cache:DefaultCookiesGlobalOptions.Domain -replace 'importpathdata',$Cache:DefaultCookiesGlobalOptions.Path -replace 'importexpiredate',$ExpireDateUtc -replace 'importsecuredata',$Cache:DefaultCookiesGlobalOptions.Secure -replace 'importsamesitedata',$Cache:DefaultCookiesGlobalOptions.SameSite
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTV.Id.Count -gt 1){
                                    $CookieData         = $Cache:CTV[$IndexNumber]
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $UpdateHash = Set-Content $FindHashCookie.FullName -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                elseif((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTV.Id.Count -eq 1){
                                    $CookieData         = $Cache:CTV
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                }                                
                                else{

                                }                                
                            }
                        }
                        elseif(($Cache:CTV.Id.Count -eq 1 -and ($true -eq $($Cache:CTV.Id -eq $ciGet))) -and ($Cache:CTV.Created.Count -eq 1 -and ($true -eq $($Cache:CTV.Created -eq $cdGet)))){
                            $CookieData         = $Cache:CTV
                            if(($true -ne ($CookieData.Id -eq $ssidData.Id)) -or ($true -ne ($CookieData.Cred -eq $ssidData.Cred)) -or ($true -ne ($CookieData.Lock -eq $ssidData.Lock)) -or ($true -ne ($CookieData.Vr -eq $ssidData.Vr)) -or ($true -ne ($CookieData.Uid -eq $ssidData.Uid)) -or ($true -ne ($CookieData.Pwd -eq $ssidData.Pwd)) -or ($true -ne ($CookieData.Expire -eq $ssidData.Expire)) -or ($true -ne ($CookieData.Created -eq $ssidData.Created))){
                                # GLOBAL COOKIES OPTIONS 
                                [string]$Domain   = $Cache:DefaultCookiesGlobalOptions.Domain
                                [string]$Path     = $Cache:DefaultCookiesGlobalOptions.Path
                                [double]$Expire   = $Cache:DefaultCookiesGlobalOptions.Expire
                                [string]$Secure   = $Cache:DefaultCookiesGlobalOptions.Secure
                                [string]$SameSite = $Cache:DefaultCookiesGlobalOptions.SameSite
                                $Date = Get-Date
                                $CookieCreated = $Date.Ticks
                                $CookieExpire  = ($Date.AddDays($Expire)).Ticks

                                # GLOBAL UTC DATE
                                [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                                [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                                $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'

                                # VALIDATION SESSION NAD COOKIES
                                # UID VARIABLE
                                if($ssidData.Uid -eq 'null'){
                                    $CookieUid = $CookieData.Uid
                                }
                                else{
                                    $CookieUid = $ssidData.Uid
                                }
                                # PWD VARIABLE
                                if($ssidData.Pwd -eq 'null'){
                                    $CookiePwd = $CookieData.Pwd
                                }
                                else{
                                    $CookiePwd = $ssidData.Pwd
                                }
                                # VR VARIABLE
                                if($CookieData.Vr -eq $true -and $ssidData.Vr -eq $true){
                                    $CookieVr = $true
                                }
                                elseif($CookieData.Vr -eq $true -and $ssidData.Vr -eq $false){
                                    $CookieVr = $false
                                }
                                elseif($CookieData.Vr -eq $false -and $ssidData.Vr -eq $true){
                                    $CookieVr = $True
                                }
                                else{
                                    $CookieVr = $false
                                }
                                # LOCK VARIABLE
                                if($CookieData.Lock -eq $true -and $ssidData.Lock -eq $true){
                                    $CookieLock = $true
                                }
                                elseif($CookieData.Lock -eq $true -and $ssidData.Lock -eq $false){
                                    $CookieLock = $false
                                }
                                elseif($CookieData.Lock -eq $false -and $ssidData.Lock -eq $true){
                                    $CookieLock = $True
                                }
                                else{
                                    $CookieLock = $false
                                } 
                                # CRED VARIABLE
                                if($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'vc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                } 
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }                                                                                                                                                                                                                                
                                else{
                                    $CookieCred = 'vc'
                                }                                   

                                $CookieId     = $CookieData.Id
                                $CookieNumber = $CookieCreated

                                
                                # UPDATE DOCUMENT.COOKIE ALL VARIABLES
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cd=importcddata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ci=importcidata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ct=importctdata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ce=importcedata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importdomaindata',"$Domain" -replace 'importpathdata',"$Path" -replace 'importexpiredate',"$ExpireDateUtc" -replace 'importsecuredata',"$Secure" -replace 'importsamesitedata',"$SameSite" -replace 'importcddata',"$CookieCreated" -replace 'importcidata',"$CookieId" -replace 'importcndata',"$CookieNumber" -replace 'importctdata',"$CookieCred" -replace 'importcedata',"$CookieExpire"
                                
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTV.Id.Count -EQ 1){
                                    $Cache:CTV.Id       = $CookieId
                                    $Cache:CTV.Cred     = $CookieCred
                                    $Cache:CTV.Lock     = $CookieLock
                                    $Cache:CTV.Vr       = $CookieVr
                                    $Cache:CTV.Uid      = $CookieUid
                                    $Cache:CTV.Pwd      = $CookiePwd
                                    $Cache:CTV.Created  = $CookieCreated
                                    $Cache:CTV.Expire   = $CookieExpire
                                    $CookieData         = $Cache:CTV
                                    $Session:ssidCkid   = $CookieId
                                    $Session:ssidCred   = $CookieCred
                                    $Session:ssidLock   = $CookieLock
                                    $Session:ssidVr     = $CookieVr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieId+"'"+';Created='+"'"+$CookieCreated+"'"+';Expire='+"'"+$CookieExpire+"'"+';Cred='+"'"+$CookieCred+"'"+';Lock='+"'"+$CookieLock+"'"+';Vr='+"'"+$CookieVr+"'"+';Uid='+"'"+$CookieUid+"'"+';Pwd='+"'"+$CookiePwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $RemoveCookie = Remove-Item $FindHashCookie.FullName -Force -ErrorAction Stop
                                        $CreateCookie = New-Item -ItemType File ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -ErrorAction Stop
                                        $UpdateHash   = Set-Content ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                else{

                                }                                
                            }
                            else{
                                $Session:ssidCkid   = $CookieData.Id
                                $Session:ssidCred   = $CookieData.Cred
                                $Session:ssidLock   = $CookieData.Lock
                                $Session:ssidVr     = $CookieData.Vr
                                $Session:ssidCkInit = $true
                                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                            }
                        }                        
                        else{
                            $Session:ssidCred = 'vc'
                            $Session:ssidLock = $false
                            $Session:ssidVr   = $false
                        }
                    }
                    elseif($ctGet -eq 'cc'){
                        # CUSTOMER
                        if($Cache:CTC.Id.Count -gt 1 -and (($true -eq $(($Cache:CTC[$cnGet]).Id -eq $ciGet)) -or ($Cache:CTC.Id.Count -eq 1 -and ($true -eq $($Cache:CTC.Id -eq $ciGet)))) -and (($true -eq $(($Cache:CTC[$cnGet]).Created -eq $cdGet)) -or ($Cache:CTC.Created.Count -eq 1 -and ($true -eq $($Cache:CTC.Created -eq $cdGet))))){
                            $CookieData = $Cache:CTC[$cnGet]
                            if(($true -ne ($CookieData.Id -eq $ssidData.Id)) -or ($true -ne ($CookieData.Cred -eq $ssidData.Cred)) -or ($true -ne ($CookieData.Lock -eq $ssidData.Lock)) -or ($true -ne ($CookieData.Vr -eq $ssidData.Vr)) -or ($true -ne ($CookieData.Uid -eq $ssidData.Uid)) -or ($true -ne ($CookieData.Pwd -eq $ssidData.Pwd)) -or ($true -ne ($CookieData.Expire -eq $ssidData.Expire)) -or ($true -ne ($CookieData.Created -eq $ssidData.Created))){
                                # INDEX IN ARRAY
                                $IndexNumber = $cnGet
                                # GLOBAL COOKIES OPTIONS 
                                [string]$Domain   = $Cache:DefaultCookiesGlobalOptions.Domain
                                [string]$Path     = $Cache:DefaultCookiesGlobalOptions.Path
                                [double]$Expire   = $Cache:DefaultCookiesGlobalOptions.Expire
                                [string]$Secure   = $Cache:DefaultCookiesGlobalOptions.Secure
                                [string]$SameSite = $Cache:DefaultCookiesGlobalOptions.SameSite
                                $Date = Get-Date
                                $CookieCreated = $Date.Ticks
                                $CookieExpire  = ($Date.AddDays($Expire)).Ticks

                                # GLOBAL UTC DATE
                                [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                                [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                                $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'

                                # VALIDATION SESSION NAD COOKIES
                                # UID VARIABLE
                                if($ssidData.Uid -eq 'null'){
                                    $CookieUid = $CookieData.Uid
                                }
                                else{
                                    $CookieUid = $ssidData.Uid
                                }
                                # PWD VARIABLE
                                if($ssidData.Pwd -eq 'null'){
                                    $CookiePwd = $CookieData.Pwd
                                }
                                else{
                                    $CookiePwd = $ssidData.Pwd
                                }
                                # VR VARIABLE
                                if($CookieData.Vr -eq $true -and $ssidData.Vr -eq $true){
                                    $CookieVr = $true
                                }
                                elseif($CookieData.Vr -eq $true -and $ssidData.Vr -eq $false){
                                    $CookieVr = $false
                                }
                                elseif($CookieData.Vr -eq $false -and $ssidData.Vr -eq $true){
                                    $CookieVr = $True
                                }
                                else{
                                    $CookieVr = $false
                                }
                                # LOCK VARIABLE
                                if($CookieData.Lock -eq $true -and $ssidData.Lock -eq $true){
                                    $CookieLock = $true
                                }
                                elseif($CookieData.Lock -eq $true -and $ssidData.Lock -eq $false){
                                    $CookieLock = $false
                                }
                                elseif($CookieData.Lock -eq $false -and $ssidData.Lock -eq $true){
                                    $CookieLock = $True
                                }
                                else{
                                    $CookieLock = $false
                                } 
                                # CRED VARIABLE
                                if($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'vc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                } 
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }                                                                                                                                                                                                                                
                                else{
                                    $CookieCred = 'vc'
                                }                                    

                                $CookieId     = $CookieData.Id
                                $CookieNumber = $CookieCreated

                                
                                # UPDATE DOCUMENT.COOKIE ALL VARIABLES
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cd=importcddata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ci=importcidata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ct=importctdata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ce=importcedata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importdomaindata',"$Domain" -replace 'importpathdata',"$Path" -replace 'importexpiredate',"$ExpireDateUtc" -replace 'importsecuredata',"$Secure" -replace 'importsamesitedata',"$SameSite" -replace 'importcddata',"$CookieCreated" -replace 'importcidata',"$CookieId" -replace 'importcndata',"$CookieNumber" -replace 'importctdata',"$CookieCred" -replace 'importcedata',"$CookieExpire"
                                
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTC.Id.Count -gt 1){
                                    ($Cache:CTC[$IndexNumber]).Id      = $CookieId
                                    ($Cache:CTC[$IndexNumber]).Cred    = $CookieCred
                                    ($Cache:CTC[$IndexNumber]).Lock    = $CookieLock
                                    ($Cache:CTC[$IndexNumber]).Vr      = $CookieVr
                                    ($Cache:CTC[$IndexNumber]).Uid     = $CookieUid
                                    ($Cache:CTC[$IndexNumber]).Pwd     = $CookiePwd
                                    ($Cache:CTC[$IndexNumber]).Created = $CookieCreated
                                    ($Cache:CTC[$IndexNumber]).Expire  = $CookieExpire
                                    $CookieData         = $Cache:CTC[$IndexNumber]
                                    $Session:ssidCkid   = $CookieId
                                    $Session:ssidCred   = $CookieCred
                                    $Session:ssidLock   = $CookieLock
                                    $Session:ssidVr     = $CookieVr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieId+"'"+';Created='+"'"+$CookieCreated+"'"+';Expire='+"'"+$CookieExpire+"'"+';Cred='+"'"+$CookieCred+"'"+';Lock='+"'"+$CookieLock+"'"+';Vr='+"'"+$CookieVr+"'"+';Uid='+"'"+$CookieUid+"'"+';Pwd='+"'"+$CookiePwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $RemoveCookie = Remove-Item $FindHashCookie.FullName -Force -ErrorAction Stop
                                        $CreateCookie = New-Item -ItemType File ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -ErrorAction Stop
                                        $UpdateHash   = Set-Content ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                else{

                                }      
                            }
                            else{
                                $Session:ssidCkid   = $CookieData.Id
                                $Session:ssidCred   = $CookieData.Cred
                                $Session:ssidLock   = $CookieData.Lock
                                $Session:ssidVr     = $CookieData.Vr
                                $Session:ssidCkInit = $true
                                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                            }
                        }
                        elseif($cnGet.Length -eq 18 -and ($true -eq $($Cache:CTC.Id -match $ciGet)) -and ($true -eq $($Cache:CTC.Created -match $cdGet))){
                            # GLOBAL UTC DATE
                            $Date = Get-Date
                            $Expire = $Cache:DefaultCookiesGlobalOptions.Expire
                            [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                            [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                            $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'                            
                            # ADD INDEX NUMBER TO COOKIE FOR NEXT VISIT ON PAGE
                            $IndexNumber = [array]::IndexOf($Cache:CTC.Id, $ciGet)
                            if($IndexNumber -ge 0 -and $IndexNumber.Count -eq 1){
                                # UPDATE DOCUMENT.COOKIE VARIABLE CN
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importcndata',$IndexNumber -replace 'importdomaindata',$Cache:DefaultCookiesGlobalOptions.Domain -replace 'importpathdata',$Cache:DefaultCookiesGlobalOptions.Path -replace 'importexpiredate',$ExpireDateUtc -replace 'importsecuredata',$Cache:DefaultCookiesGlobalOptions.Secure -replace 'importsamesitedata',$Cache:DefaultCookiesGlobalOptions.SameSite
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTC.Id.Count -gt 1){
                                    $CookieData         = $Cache:CTC[$IndexNumber]
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $UpdateHash = Set-Content $FindHashCookie.FullName -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                elseif((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTC.Id.Count -eq 1){
                                    $CookieData         = $Cache:CTC
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                }                                
                                else{

                                }                                
                            }
                        }
                        elseif(($Cache:CTC.Id.Count -eq 1 -and ($true -eq $($Cache:CTC.Id -eq $ciGet))) -and ($Cache:CTC.Created.Count -eq 1 -and ($true -eq $($Cache:CTC.Created -eq $cdGet)))){
                            $CookieData         = $Cache:CTC
                            if(($true -ne ($CookieData.Id -eq $ssidData.Id)) -or ($true -ne ($CookieData.Cred -eq $ssidData.Cred)) -or ($true -ne ($CookieData.Lock -eq $ssidData.Lock)) -or ($true -ne ($CookieData.Vr -eq $ssidData.Vr)) -or ($true -ne ($CookieData.Uid -eq $ssidData.Uid)) -or ($true -ne ($CookieData.Pwd -eq $ssidData.Pwd)) -or ($true -ne ($CookieData.Expire -eq $ssidData.Expire)) -or ($true -ne ($CookieData.Created -eq $ssidData.Created))){
                                # GLOBAL COOKIES OPTIONS 
                                [string]$Domain   = $Cache:DefaultCookiesGlobalOptions.Domain
                                [string]$Path     = $Cache:DefaultCookiesGlobalOptions.Path
                                [double]$Expire   = $Cache:DefaultCookiesGlobalOptions.Expire
                                [string]$Secure   = $Cache:DefaultCookiesGlobalOptions.Secure
                                [string]$SameSite = $Cache:DefaultCookiesGlobalOptions.SameSite
                                $Date = Get-Date
                                $CookieCreated = $Date.Ticks
                                $CookieExpire  = ($Date.AddDays($Expire)).Ticks

                                # GLOBAL UTC DATE
                                [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                                [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                                $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'

                                # VALIDATION SESSION NAD COOKIES
                                # UID VARIABLE
                                if($ssidData.Uid -eq 'null'){
                                    $CookieUid = $CookieData.Uid
                                }
                                else{
                                    $CookieUid = $ssidData.Uid
                                }
                                # PWD VARIABLE
                                if($ssidData.Pwd -eq 'null'){
                                    $CookiePwd = $CookieData.Pwd
                                }
                                else{
                                    $CookiePwd = $ssidData.Pwd
                                }
                                # VR VARIABLE
                                if($CookieData.Vr -eq $true -and $ssidData.Vr -eq $true){
                                    $CookieVr = $true
                                }
                                elseif($CookieData.Vr -eq $true -and $ssidData.Vr -eq $false){
                                    $CookieVr = $false
                                }
                                elseif($CookieData.Vr -eq $false -and $ssidData.Vr -eq $true){
                                    $CookieVr = $True
                                }
                                else{
                                    $CookieVr = $false
                                }
                                # LOCK VARIABLE
                                if($CookieData.Lock -eq $true -and $ssidData.Lock -eq $true){
                                    $CookieLock = $true
                                }
                                elseif($CookieData.Lock -eq $true -and $ssidData.Lock -eq $false){
                                    $CookieLock = $false
                                }
                                elseif($CookieData.Lock -eq $false -and $ssidData.Lock -eq $true){
                                    $CookieLock = $True
                                }
                                else{
                                    $CookieLock = $false
                                } 
                                # CRED VARIABLE
                                if($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'vc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                } 
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }                                                                                                                                                                                                                                
                                else{
                                    $CookieCred = 'vc'
                                }                                    

                                $CookieId     = $CookieData.Id
                                $CookieNumber = $CookieCreated

                                
                                # UPDATE DOCUMENT.COOKIE ALL VARIABLES
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cd=importcddata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ci=importcidata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ct=importctdata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ce=importcedata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importdomaindata',"$Domain" -replace 'importpathdata',"$Path" -replace 'importexpiredate',"$ExpireDateUtc" -replace 'importsecuredata',"$Secure" -replace 'importsamesitedata',"$SameSite" -replace 'importcddata',"$CookieCreated" -replace 'importcidata',"$CookieId" -replace 'importcndata',"$CookieNumber" -replace 'importctdata',"$CookieCred" -replace 'importcedata',"$CookieExpire"
                                
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTC.Id.Count -EQ 1){
                                    $Cache:CTC.Id       = $CookieId
                                    $Cache:CTC.Cred     = $CookieCred
                                    $Cache:CTC.Lock     = $CookieLock
                                    $Cache:CTC.Vr       = $CookieVr
                                    $Cache:CTC.Uid      = $CookieUid
                                    $Cache:CTC.Pwd      = $CookiePwd
                                    $Cache:CTC.Created  = $CookieCreated
                                    $Cache:CTC.Expire   = $CookieExpire
                                    $CookieData         = $Cache:CTC
                                    $Session:ssidCkid   = $CookieId
                                    $Session:ssidCred   = $CookieCred
                                    $Session:ssidLock   = $CookieLock
                                    $Session:ssidVr     = $CookieVr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieId+"'"+';Created='+"'"+$CookieCreated+"'"+';Expire='+"'"+$CookieExpire+"'"+';Cred='+"'"+$CookieCred+"'"+';Lock='+"'"+$CookieLock+"'"+';Vr='+"'"+$CookieVr+"'"+';Uid='+"'"+$CookieUid+"'"+';Pwd='+"'"+$CookiePwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $RemoveCookie = Remove-Item $FindHashCookie.FullName -Force -ErrorAction Stop
                                        $CreateCookie = New-Item -ItemType File ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -ErrorAction Stop
                                        $UpdateHash   = Set-Content ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                else{

                                }                                
                            }
                            else{
                                $Session:ssidCkid   = $CookieData.Id
                                $Session:ssidCred   = $CookieData.Cred
                                $Session:ssidLock   = $CookieData.Lock
                                $Session:ssidVr     = $CookieData.Vr
                                $Session:ssidCkInit = $true
                                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                            }
                        }                        
                        else{
                            $Session:ssidCred = 'vc'
                            $Session:ssidLock = $false
                            $Session:ssidVr   = $false
                        }                
                    }
                    elseif($ctGet -eq 'ac'){
                        # ADMINISTRATOR
                        if($Cache:CTA.Id.Count -gt 1 -and (($true -eq $(($Cache:CTA[$cnGet]).Id -eq $ciGet)) -or ($Cache:CTA.Id.Count -eq 1 -and ($true -eq $($Cache:CTA.Id -eq $ciGet)))) -and (($true -eq $(($Cache:CTA[$cnGet]).Created -eq $cdGet)) -or ($Cache:CTA.Created.Count -eq 1 -and ($true -eq $($Cache:CTA.Created -eq $cdGet))))){
                            $CookieData         = $Cache:CTA[$cnGet]
                            if(($true -ne ($CookieData.Id -eq $ssidData.Id)) -or ($true -ne ($CookieData.Cred -eq $ssidData.Cred)) -or ($true -ne ($CookieData.Lock -eq $ssidData.Lock)) -or ($true -ne ($CookieData.Vr -eq $ssidData.Vr)) -or ($true -ne ($CookieData.Uid -eq $ssidData.Uid)) -or ($true -ne ($CookieData.Pwd -eq $ssidData.Pwd)) -or ($true -ne ($CookieData.Expire -eq $ssidData.Expire)) -or ($true -ne ($CookieData.Created -eq $ssidData.Created))){
                                # INDEX IN ARRAY
                                $IndexNumber = $cnGet                                
                                # GLOBAL COOKIES OPTIONS 
                                [string]$Domain   = $Cache:DefaultCookiesGlobalOptions.Domain
                                [string]$Path     = $Cache:DefaultCookiesGlobalOptions.Path
                                [double]$Expire   = $Cache:DefaultCookiesGlobalOptions.Expire
                                [string]$Secure   = $Cache:DefaultCookiesGlobalOptions.Secure
                                [string]$SameSite = $Cache:DefaultCookiesGlobalOptions.SameSite
                                $Date = Get-Date
                                $CookieCreated = $Date.Ticks
                                $CookieExpire  = ($Date.AddDays($Expire)).Ticks

                                # GLOBAL UTC DATE
                                [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                                [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                                $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'

                                # VALIDATION SESSION NAD COOKIES
                                # UID VARIABLE
                                if($ssidData.Uid -eq 'null'){
                                    $CookieUid = $CookieData.Uid
                                }
                                else{
                                    $CookieUid = $ssidData.Uid
                                }
                                # PWD VARIABLE
                                if($ssidData.Pwd -eq 'null'){
                                    $CookiePwd = $CookieData.Pwd
                                }
                                else{
                                    $CookiePwd = $ssidData.Pwd
                                }
                                # VR VARIABLE
                                if($CookieData.Vr -eq $true -and $ssidData.Vr -eq $true){
                                    $CookieVr = $true
                                }
                                elseif($CookieData.Vr -eq $true -and $ssidData.Vr -eq $false){
                                    $CookieVr = $false
                                }
                                elseif($CookieData.Vr -eq $false -and $ssidData.Vr -eq $true){
                                    $CookieVr = $True
                                }
                                else{
                                    $CookieVr = $false
                                }
                                # LOCK VARIABLE
                                if($CookieData.Lock -eq $true -and $ssidData.Lock -eq $true){
                                    $CookieLock = $true
                                }
                                elseif($CookieData.Lock -eq $true -and $ssidData.Lock -eq $false){
                                    $CookieLock = $false
                                }
                                elseif($CookieData.Lock -eq $false -and $ssidData.Lock -eq $true){
                                    $CookieLock = $True
                                }
                                else{
                                    $CookieLock = $false
                                } 
                                # CRED VARIABLE
                                if($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'vc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                } 
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }                                                                                                                                                                                                                                
                                else{
                                    $CookieCred = 'vc'
                                }                                  

                                $CookieId     = $CookieData.Id
                                $CookieNumber = $CookieCreated

                                
                                # UPDATE DOCUMENT.COOKIE ALL VARIABLES
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cd=importcddata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ci=importcidata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ct=importctdata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ce=importcedata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importdomaindata',"$Domain" -replace 'importpathdata',"$Path" -replace 'importexpiredate',"$ExpireDateUtc" -replace 'importsecuredata',"$Secure" -replace 'importsamesitedata',"$SameSite" -replace 'importcddata',"$CookieCreated" -replace 'importcidata',"$CookieId" -replace 'importcndata',"$CookieNumber" -replace 'importctdata',"$CookieCred" -replace 'importcedata',"$CookieExpire"
                                
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTA.Id.Count -gt 1){
                                    ($Cache:CTA[$IndexNumber]).Id      = $CookieId
                                    ($Cache:CTA[$IndexNumber]).Cred    = $CookieCred
                                    ($Cache:CTA[$IndexNumber]).Lock    = $CookieLock
                                    ($Cache:CTA[$IndexNumber]).Vr      = $CookieVr
                                    ($Cache:CTA[$IndexNumber]).Uid     = $CookieUid
                                    ($Cache:CTA[$IndexNumber]).Pwd     = $CookiePwd
                                    ($Cache:CTA[$IndexNumber]).Created = $CookieCreated
                                    ($Cache:CTA[$IndexNumber]).Expire  = $CookieExpire
                                    $CookieData         = $Cache:CTA[$IndexNumber]
                                    $Session:ssidCkid   = $CookieId
                                    $Session:ssidCred   = $CookieCred
                                    $Session:ssidLock   = $CookieLock
                                    $Session:ssidVr     = $CookieVr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieId+"'"+';Created='+"'"+$CookieCreated+"'"+';Expire='+"'"+$CookieExpire+"'"+';Cred='+"'"+$CookieCred+"'"+';Lock='+"'"+$CookieLock+"'"+';Vr='+"'"+$CookieVr+"'"+';Uid='+"'"+$CookieUid+"'"+';Pwd='+"'"+$CookiePwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $RemoveCookie = Remove-Item $FindHashCookie.FullName -Force -ErrorAction Stop
                                        $CreateCookie = New-Item -ItemType File ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -ErrorAction Stop
                                        $UpdateHash   = Set-Content ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                else{

                                }      
                            }
                            else{
                                $Session:ssidCkid   = $CookieData.Id
                                $Session:ssidCred   = $CookieData.Cred
                                $Session:ssidLock   = $CookieData.Lock
                                $Session:ssidVr     = $CookieData.Vr
                                $Session:ssidCkInit = $true
                                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                            }
                        }
                        elseif($cnGet.Length -eq 18 -and ($true -eq $($Cache:CTA.Id -match $ciGet)) -and ($true -eq $($Cache:CTA.Created -match $cdGet))){
                            # GLOBAL UTC DATE
                            $Date = Get-Date
                            $Expire = $Cache:DefaultCookiesGlobalOptions.Expire
                            [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                            [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                            $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'                            
                            # ADD INDEX NUMBER TO COOKIE FOR NEXT VISIT ON PAGE
                            $IndexNumber = [array]::IndexOf($Cache:CTA.Id, $ciGet)
                            if($IndexNumber -ge 0 -and $IndexNumber.Count -eq 1){
                                # UPDATE DOCUMENT.COOKIE VARIABLE CN
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importcndata',$IndexNumber -replace 'importdomaindata',$Cache:DefaultCookiesGlobalOptions.Domain -replace 'importpathdata',$Cache:DefaultCookiesGlobalOptions.Path -replace 'importexpiredate',$ExpireDateUtc -replace 'importsecuredata',$Cache:DefaultCookiesGlobalOptions.Secure -replace 'importsamesitedata',$Cache:DefaultCookiesGlobalOptions.SameSite
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTA.Id.Count -gt 1){
                                    $CookieData         = $Cache:CTA[$IndexNumber]
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $UpdateHash = Set-Content $FindHashCookie.FullName -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                elseif((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTA.Id.Count -eq 1){
                                    $CookieData         = $Cache:CTA
                                    $Session:ssidCkid   = $CookieData.Id
                                    $Session:ssidCred   = $CookieData.Cred
                                    $Session:ssidLock   = $CookieData.Lock
                                    $Session:ssidVr     = $CookieData.Vr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieData.Id+"'"+';Created='+"'"+$CookieData.Created+"'"+';Expire='+"'"+$CookieData.Expire+"'"+';Cred='+"'"+$CookieData.Cred+"'"+';Lock='+"'"+$CookieData.Lock+"'"+';Vr='+"'"+$CookieData.Vr+"'"+';Uid='+"'"+$CookieData.Uid+"'"+';Pwd='+"'"+$CookieData.Pwd+"'"+'}'
                                }                                
                                else{

                                }                                
                            }
                        }
                        elseif(($Cache:CTA.Id.Count -eq 1 -and ($true -eq $($Cache:CTA.Id -eq $ciGet))) -and ($Cache:CTA.Created.Count -eq 1 -and ($true -eq $($Cache:CTA.Created -eq $cdGet)))){
                            $CookieData         = $Cache:CTA
                            if(($true -ne ($CookieData.Id -eq $ssidData.Id)) -or ($true -ne ($CookieData.Cred -eq $ssidData.Cred)) -or ($true -ne ($CookieData.Lock -eq $ssidData.Lock)) -or ($true -ne ($CookieData.Vr -eq $ssidData.Vr)) -or ($true -ne ($CookieData.Uid -eq $ssidData.Uid)) -or ($true -ne ($CookieData.Pwd -eq $ssidData.Pwd)) -or ($true -ne ($CookieData.Expire -eq $ssidData.Expire)) -or ($true -ne ($CookieData.Created -eq $ssidData.Created))){
                                # GLOBAL COOKIES OPTIONS 
                                [string]$Domain   = $Cache:DefaultCookiesGlobalOptions.Domain
                                [string]$Path     = $Cache:DefaultCookiesGlobalOptions.Path
                                [double]$Expire   = $Cache:DefaultCookiesGlobalOptions.Expire
                                [string]$Secure   = $Cache:DefaultCookiesGlobalOptions.Secure
                                [string]$SameSite = $Cache:DefaultCookiesGlobalOptions.SameSite
                                $Date = Get-Date
                                $CookieCreated = $Date.Ticks
                                $CookieExpire  = ($Date.AddDays($Expire)).Ticks

                                # GLOBAL UTC DATE
                                [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                                [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                                $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'

                                # VALIDATION SESSION NAD COOKIES
                                # UID VARIABLE
                                if($ssidData.Uid -eq 'null'){
                                    $CookieUid = $CookieData.Uid
                                }
                                else{
                                    $CookieUid = $ssidData.Uid
                                }
                                # PWD VARIABLE
                                if($ssidData.Pwd -eq 'null'){
                                    $CookiePwd = $CookieData.Pwd
                                }
                                else{
                                    $CookiePwd = $ssidData.Pwd
                                }
                                # VR VARIABLE
                                if($CookieData.Vr -eq $true -and $ssidData.Vr -eq $true){
                                    $CookieVr = $true
                                }
                                elseif($CookieData.Vr -eq $true -and $ssidData.Vr -eq $false){
                                    $CookieVr = $false
                                }
                                elseif($CookieData.Vr -eq $false -and $ssidData.Vr -eq $true){
                                    $CookieVr = $True
                                }
                                else{
                                    $CookieVr = $false
                                }
                                # LOCK VARIABLE
                                if($CookieData.Lock -eq $true -and $ssidData.Lock -eq $true){
                                    $CookieLock = $true
                                }
                                elseif($CookieData.Lock -eq $true -and $ssidData.Lock -eq $false){
                                    $CookieLock = $false
                                }
                                elseif($CookieData.Lock -eq $false -and $ssidData.Lock -eq $true){
                                    $CookieLock = $True
                                }
                                else{
                                    $CookieLock = $false
                                } 
                                # CRED VARIABLE
                                if($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'cc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'vc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'cc'
                                }
                                elseif($CookieData.Cred -eq 'vc' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                } 
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'vc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'cc'){
                                    $CookieCred = 'ac'
                                }
                                elseif($CookieData.Cred -eq 'ac' -and $ssidData.Cred -eq 'ac'){
                                    $CookieCred = 'ac'
                                }                                                                                                                                                                                                                                
                                else{
                                    $CookieCred = 'vc'
                                }                                   

                                $CookieId     = $CookieData.Id
                                $CookieNumber = $CookieCreated

                                
                                # UPDATE DOCUMENT.COOKIE ALL VARIABLES
                                $sc = {Invoke-UDJavaScript -JavaScript (
@'
                                    document.cookie = "cd=importcddata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ci=importcidata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ct=importctdata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
                                    document.cookie = "ce=importcedata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
'@
                                )} -replace 'importdomaindata',"$Domain" -replace 'importpathdata',"$Path" -replace 'importexpiredate',"$ExpireDateUtc" -replace 'importsecuredata',"$Secure" -replace 'importsamesitedata',"$SameSite" -replace 'importcddata',"$CookieCreated" -replace 'importcidata',"$CookieId" -replace 'importcndata',"$CookieNumber" -replace 'importctdata',"$CookieCred" -replace 'importcedata',"$CookieExpire"
                                
                                $sc|iex
                                if((Test-Path ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck')) -and $Cache:CTA.Id.Count -EQ 1){
                                    $Cache:CTA.Id       = $CookieId
                                    $Cache:CTA.Cred     = $CookieCred
                                    $Cache:CTA.Lock     = $CookieLock
                                    $Cache:CTA.Vr       = $CookieVr
                                    $Cache:CTA.Uid      = $CookieUid
                                    $Cache:CTA.Pwd      = $CookiePwd
                                    $Cache:CTA.Created  = $CookieCreated
                                    $Cache:CTA.Expire   = $CookieExpire
                                    $CookieData         = $Cache:CTA
                                    $Session:ssidCkid   = $CookieId
                                    $Session:ssidCred   = $CookieCred
                                    $Session:ssidLock   = $CookieLock
                                    $Session:ssidVr     = $CookieVr
                                    $Session:ssidCkInit = $true
                                    $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                                    $HashString         = '@{Id='+"'"+$CookieId+"'"+';Created='+"'"+$CookieCreated+"'"+';Expire='+"'"+$CookieExpire+"'"+';Cred='+"'"+$CookieCred+"'"+';Lock='+"'"+$CookieLock+"'"+';Vr='+"'"+$CookieVr+"'"+';Uid='+"'"+$CookieUid+"'"+';Pwd='+"'"+$CookiePwd+"'"+'}'
                                    $FindHashCookie     = gci ("$Cache:DefaultCookiesDbDirOld"+'*/'+"$cdGet"+'.ck') -Force -ErrorAction Stop
                                    if($FindHashCookie.Count -eq 1){
                                        $RemoveCookie = Remove-Item $FindHashCookie.FullName -Force -ErrorAction Stop
                                        $CreateCookie = New-Item -ItemType File ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -ErrorAction Stop
                                        $UpdateHash   = Set-Content ("$Cache:DefaultCookiesDbDirNew"+"$CookieCreated"+'.ck') -Value $HashString -Force -ErrorAction Stop
                                    }
                                    else{
                                        # ADD TO BAD REQUEST LIST
                                    }
                                }
                                else{

                                }                                
                            }
                            else{
                                $Session:ssidCkid   = $CookieData.Id
                                $Session:ssidCred   = $CookieData.Cred
                                $Session:ssidLock   = $CookieData.Lock
                                $Session:ssidVr     = $CookieData.Vr
                                $Session:ssidCkInit = $true
                                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
                            }
                        }                        
                        else{
                            $Session:ssidCred = 'vc'
                            $Session:ssidLock = $false
                            $Session:ssidVr   = $false
                        }
                    }
                    else{
                        $Session:ssidCred = 'vc'
                        $Session:ssidLock = $false
                        $Session:ssidVr   = $false
                    }
                }
                else{
                    $Session:ssidCred = 'vc'
                    $Session:ssidLock = $false
                    $Session:ssidVr   = $false
                }
            }
            else{
                $Session:ssidCkid   = $ssid
                $Session:ssidCred   = 'vc'
                $Session:ssidLock   = $false
                $Session:ssidVr     = $false
                $Session:ssidCkInit = $false
                $CookieData         = @{Id=$ssid;Created='null';Expire='null';Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
            }            
        }
        elseif($cdCon -eq $false -and $ciCon -eq $false -and $cnCon -eq $false -and $ctCon -eq $false -and $ceCon -eq $false -and $ssidData.count -gt 0){
            if($ssidData.Vr -eq $true -and $ssidData.Cred -eq 'cc'){
                # SPECIFIC SESSION COOKIE
                $Session:ssidCkid   = $ssidData.Id
                $Session:ssidCred   = $ssidData.Cred
                $Session:ssidLock   = $ssidData.Lock
                $Session:ssidVr     = $ssidData.Vr
                $Session:ssidCkInit = $false
            }
            elseif($ssidData.Vr -eq $true -and $ssidData.Cred -eq 'ac'){
                # SPECIFIC SESSION COOKIE
                $Session:ssidCkid   = $ssidData.Id
                $Session:ssidCred   = $ssidData.Cred
                $Session:ssidLock   = $ssidData.Lock
                $Session:ssidVr     = $ssidData.Vr
                $Session:ssidCkInit = $false
            }            
            else{
                # SPECIFIC SESSION COOKIE
                $Session:ssidCkid   = $ssid
                $Session:ssidCred   = 'vc'
                $Session:ssidLock   = $false
                $Session:ssidVr     = $false
                $Session:ssidCkInit = $false
                $CookieData         = @{Id=$ssid;Created='null';Expire='null';Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
                $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
            }
        }                
        elseif($cdCon -eq $false -and $ciCon -eq $false -and $cnCon -eq $false -and $ctCon -eq $false -and $ceCon -eq $false -and $ssidData.count -eq 0){
            # SPECIFIC SESSION COOKIE
            $Session:ssidCkid   = $ssid
            $Session:ssidCred   = 'vc'
            $Session:ssidLock   = $false
            $Session:ssidVr     = $false
            $Session:ssidCkInit = $false
            $CookieData         = @{Id=$ssid;Created='null';Expire='null';Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
            $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
        }        
        else{
            $Session:ssidCkid   = $ssid
            $Session:ssidCred   = 'vc'
            $Session:ssidLock   = $false
            $Session:ssidVr     = $false
            $Session:ssidCkInit = $false
            $CookieData         = @{Id=$ssid;Created='null';Expire='null';Cred='vc';Lock=$false;Vr=$false;Uid='null';Pwd='null'}
            $ssidPSUCookie      = Set-PSUCache -Key $ssid -Value $CookieData -Integrated -ErrorAction Stop
        }
        $Cache:GlobalConfirmCookies|iex
    }
    #endregion PART VERIFICATION IDENTITY SCRIPT BLOCK

    #region PART LOCK SCREEN SCRIPT BLOCK
    $Cache:LockScreenSC = {
        $ssid     = $Session.Id
        $ssidData = Get-PSUCache -Key $ssid -Integrated
        if($ssidData.Vr -eq $true -and ($ssidData.Cred -eq 'ac' -or $ssidData.Cred -eq 'cc')){
            $ssidData.Lock = $true
            $savedData = Set-PSUCache -Key $ssid -Value $ssidData -Integrated
        }
        $Session:ssidCred = $ssidData.Cred
        $Session:ssidLock = $ssidData.Lock
        $Session:ssidVr   = $ssidData.Vr
    }
    #endregion PART LOCK SCREEN SCRIPT BLOCK

    #region PART CONFIRM COOKIES BLOCK
    $Cache:GlobalConfirmCookies = {
        if($Session:ssidCkInit -eq $false){
            New-UDButton -Id 'confirm-cookies' -Text 'Confirm Cookies' -OnClick {
                $ssid = $Session.Id
                $ssidData = Get-PSUCache -Key $ssid -Integrated -ErrorAction Stop
                $Date = (Get-Date)
                $Ticks = $Date.Ticks
                $CookieFilePath = ("$Cache:DefaultCookiesDbDirNew"+"$Ticks"+'.ck')
                if(Test-Path $CookieFilePath){
                    $Date = (Get-Date)
                    $Ticks = $Date.Ticks
                    $CookieFilePath = ("$Cache:DefaultCookiesDbDirNew"+"$Ticks"+'.ck')
                    if(Test-Path $CookieFilePath){
                        $Date = (Get-Date)
                        $Ticks = $Date.Ticks
                        $CookieFilePath = ("$Cache:DefaultCookiesDbDirNew"+"$Ticks"+'.ck')
                        if(Test-Path $CookieFilePath){
                            $CookieTestPathCondition = $false
                        }
                        else{
                            $CookieTestPathCondition = $true
                        }                            
                    }
                    else{
                        $CookieTestPathCondition = $true
                    }                        
                }
                else{
                    $CookieTestPathCondition = $true
                }
                
                $cd = $Ticks
                $ci = ([guid]::NewGuid()).Guid
                $cn = $Ticks
                $ct = $ssidData.Cred
                $CookieValid = $true
                
                if($CookieValid -eq $true){
                    # GLOBAL COOKIES OPTIONS 
                    [string]$Domain   = $Cache:DefaultCookiesGlobalOptions.Domain
                    [string]$Path     = $Cache:DefaultCookiesGlobalOptions.Path
                    [double]$Expire   = $Cache:DefaultCookiesGlobalOptions.Expire
                    [string]$Secure   = $Cache:DefaultCookiesGlobalOptions.Secure
                    [string]$SameSite = $Cache:DefaultCookiesGlobalOptions.SameSite

                    $ExpireDateTicks = ($Date.AddDays($Expire)).Ticks

                    [System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-US"
                    [System.Threading.Thread]::CurrentThread.CurrentCulture = "en-US"
                    $ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'
                    
                    #[System.Threading.Thread]::CurrentThread.CurrentUICulture = "en-GB"
                    #[System.Threading.Thread]::CurrentThread.CurrentCulture = "en-GB"
                    #$ExpireDateUtc = $Date.AddDays($Expire).ToUniversalTime().ToString('ddd, dd MMM yyyy hh:mm:ss')+' GMT'

                    $sc = {Invoke-UDJavaScript -JavaScript (
@'
document.cookie = "cd=importcddata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
document.cookie = "ci=importcidata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
document.cookie = "cn=importcndata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
document.cookie = "ct=importctdata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
document.cookie = "ce=importcedata; domain=importdomaindata; path=importpathdata; expires=importexpiredate; secure=importsecuredata; samesite=importsamesitedata";
document.getElementById("confirm-cookies-verification-container").style.display = 'none';
console.log('importexpiredate');
'@
                    )} -replace 'importdomaindata',"$Domain" -replace 'importpathdata',"$Path" -replace 'importexpiredate',"$ExpireDateUtc" -replace 'importsecuredata',"$Secure" -replace 'importsamesitedata',"$SameSite" -replace 'importcddata',"$cd" -replace 'importcidata',"$ci" -replace 'importcndata',"$cn" -replace 'importctdata',"$ct" -replace 'importcedata',"$ExpireDateTicks"
                    
                    $sc|iex
                    $NewCookie         = New-Item -ItemType File $CookieFilePath -Force -ErrorAction Stop
                    $CookieValue       = @{Id=$ci;Created=$Ticks;Expire=$ExpireDateTicks;Cred=$ssidData.Cred;Lock=$ssidData.Lock;Vr=$ssidData.Vr;Uid=$ssidData.Uid;Pwd=$ssidData.Pwd}
                    $SavessidData      = Set-PSUCache -Key $ssid -Value $CookieValue -Integrated -ErrorAction Stop
                    $CookieValueString = '@{Id='+"'"+$ci+"'"+';Created='+"'"+$Ticks+"'"+';Expire='+"'"+$ExpireDateTicks+"'"+';Cred='+"'"+$ssidData.Cred+"'"+';Lock='+"'"+$ssidData.Lock+"'"+';Vr='+"'"+$ssidData.Vr+"'"+';Uid='+"'"+$ssidData.Uid+"'"+';Pwd='+"'"+$ssidData.Pwd+"'"+'}'
                    $SaveCookie        = Set-Content $CookieFilePath -Value $CookieValueString -Force -ErrorAction Stop
                    Show-UDToast -message 'Confirm Cookies is Valid!' -Duration 5000
                }
                $Cache:VerificationIdentitySC|iex
            } -Style @{display='none'}

            New-UDHtml -Markup (
@'
    <div id="confirm-cookies-verification-container" style="z-index:100;display:block;position:fixed;left:0;bottom:0">
        <div class="p-1 bg-light" style="border:1px #ced4da solid">
            <div class="row pl-3 pr-3 pt-1 mb-0">
                <div class="p-1">
                    <p class="mb-0">Cookies Terms of Conditions</p>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="p-1">
                    <a class="font-weight-medium text-primary" onclick="$('#cookiesConditionsModal').modal('toggle');$('#cookiesConditionsModal').modal('show');$('#cookiesConditionsModal').modal('hide');" style="cursor:pointer">Read here</a>
                </div>
            </div>
            <div class="row pl-3 pr-3 pb-1 justify-content-center">
                <div class="p-1">
                    <button onclick="document.getElementById('confirm-cookies').click();" class="btn btn-primary btn-block waves-effect waves-light" type="button">Confirm Cookies</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal for personal conditions --> 
    <div class="modal fade" id="cookiesConditionsModal" tabindex="-1" role="dialog" aria-labelledby="cookiesConditionsModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cookiesConditionsModalLongTitle">Cookies Data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Conditions content</p>    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>    
'@)
        }
    }
    #endregion PART CONFIRM COOKIES BLOCK

    #region PART VERIFICATION INTEGRITY SCRIPT BLOCK
    $VerificationIntegritySC = {
        New-UDDynamic -Id 'Dynamic-Verification-Actual-Identity' -Content {
            if($Session:ssidVr -eq $false -and (($Session:ssidCred -eq 'ac') -or ($Session:ssidCred -eq 'cc'))){
                Invoke-UDRedirect -Url "$Cache:RootAppConnectionLink"
            }
        } -AutoRefresh -AutoRefreshInterval 60
    }
    #endregion PART VERIFICATION INTEGRITY SCRIPT BLOCK

    #region PART DASHBOARD
        New-UDDashboard -Title "Home" -Pages @(
            New-UDPage -Blank -DefaultHomePage -Id 'Default-Home-Page-Id' -Name 'Home Page' -Url '/' -Title 'Home Page' -Content {
                $Cache:VerificationIdentitySC|iex
                if($Session:ssidLock -eq $true){
                    Invoke-UDRedirect -Url ("$Cache:RootAppConnectionLink"+'app/authentication/lockscreen')
                }
                elseif($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'ac')){
                    $Cache:DefaultHomePageAccessAdministrator|iex
                }
                elseif($Session:ssidVr -eq $true -and ($Session:ssidCred -eq 'cc')){
                    $Cache:DefaultHomePageAccessCustomer|iex
                }
                elseif($Session:ssidVr -eq $false -and ($Session:ssidCred -eq 'ac')){
                    $Cache:DefaultHomePageAccessVisitor|iex
                }
                elseif($Session:ssidVr -eq $false -and ($Session:ssidCred -eq 'cc')){
                    $Cache:DefaultHomePageAccessVisitor|iex
                }
                elseif($Session:ssidVr -eq $false -and ($Session:ssidCred -eq 'vc')){
                    $Cache:DefaultHomePageAccessVisitor|iex
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