# ASYNC INVOKE JAVASCRIPT SCRIPTBLOCK
$Uid         = $Session:AdministratorVerificationData.Uid
$FirstName   = $Session:AdministratorVerificationData.FirstName
$LastName    = $Session:AdministratorVerificationData.LastName
$Credentials = $Session:AdministratorVerificationData.Cred

Invoke-UDJavaScript -JavaScript (
@"
    setTimeout(function(){
        document.getElementById("dashboard-user-name").innerHTML = '$FirstName'+' '+'$LastName';
        document.getElementById("dashboard-user-credentials").innerHTML = '$Credentials';
    },500)
"@
)



# MODAL - PRODUCT ADD HTML SOURCE HIDDEN PROCESS
New-UDButton -Id 'psu-add-product' -Text 'Add Product' -OnClick {
    Invoke-UDJavaScript -JavaScript (
@"
        setTimeout(function(){
            /* document.getElementById("ecommerce-dashboard-universals-modal-title-long-key").key = 't-ecomercedashboarduniversalmodal-long-title-product-add'; */
            document.getElementById("ecommerce-dashboard-universals-modal-long-title").innerHTML = 'Product Add';
            document.getElementById("ecommerce-dashboard-universal-modal-inner-html").innerHTML = '$Session:ProductAddHtmlSource';
        },500)
"@
    )    
} -Style @{display='none'}





# AUTHENTICATION HIDDEN PROCESS
New-UDButton -Id 'psu-navigation-user-lock-screen' -Text 'Lock Screen' -OnClick {
    $SessionData = Get-PSUCache -Key $Session.Id -Integrated
    $SessionHash = @{Id=$SessionData.Id;Created=$SessionData.Created;Expire=$SessionData.Expire;Cred=$SessionData.Cred;Lock=$true;Vr=$true;Uid=$SessionData.Uid;Pwd=$SessionData.Pwd}
    $SessionSave = Set-PSUCache -Key $Session.Id -Value $SessionHash -Integrated
    Invoke-UDRedirect -Url ("$Cache:RootAppConnectionLink"+'app/authentication/lockscreen')
} -Style @{display='none'}

New-UDButton -Id 'psu-navigation-user-logout' -Text 'Logout' -OnClick {
    $SessionData = Get-PSUCache -Key $Session.Id -Integrated
    $SessionHash = @{Id=$SessionData.Id;Created=$SessionData.Created;Expire=$SessionData.Expire;Cred=$SessionData.Cred;Lock=$false;Vr=$false;Uid=$SessionData.Uid;Pwd=$SessionData.Pwd}
    $SessionSave = Set-PSUCache -Key $Session.Id -Value $SessionHash -Integrated
    Invoke-UDRedirect -Url $Cache:RootAppConnectionLink
} -Style @{display='none'}




# DASHBOARD - ADMINISTRATOR - DEVELOPER

New-UDHtml -Markup (
@'

<!-- Preloader page -->
<div id="preloader">
    <div id="status">
        <div class="spinner-chase">
            <div class="chase-dot"></div>
            <div class="chase-dot"></div>
            <div class="chase-dot"></div>
            <div class="chase-dot"></div>
            <div class="chase-dot"></div>
            <div class="chase-dot"></div>
        </div>
    </div>
</div>

















<!-- Preloader content -->
<div id="preloader-content" style="display:none">


<!-- Begin page -->
<div id="layout-wrapper" style="margin-top: 0px;">
<header id="page-topbar">
<div id="navbar-header-id" class="navbar-header" style="width:1200px">
    <div class="d-flex">
        <!-- LOGO -->
        <div id="navbar-brand-box-id" class="navbar-brand-box ecomerce-brand-logo-ml-3 p-0">
            <a href="/" class="logo logo-dark">
                <span id="logo-1-span-id" class="logo-sm">
                    <img id="logo-1-id" src="/app/root/assets/images/ecommerce-logo-mini-e-light.png" alt="" height="22">
                </span>
                <span id="logo-2-span-id" class="logo-lg">
                    <img id="logo-2-id" src="/app/root/assets/images/ecommerce-logo-long-e-light.png" alt="" height="17">
                </span>
            </a>

            <a href="/" class="logo logo-light">
                <span id="logo-3-span-id" class="logo-sm">
                    <img id="logo-3-id" src="/app/root/assets/images/ecommerce-logo-mini-e-dark.png" alt="" height="22">
                </span>
                <span id="logo-4-span-id" class="logo-lg">
                    <img id="logo-4-id" src="/app/root/assets/images/ecommerce-logo-long-e-dark.png" alt="" height="19">
                </span>
            </a>
        </div>

        <div id="navbar-brand-box-long-id" class="ecommerce-navbar-brand-box-long px-0">
            <a href="/" class="logo logo-dark">
                <span id="logo-5-span-id" class="logo-sm">
                    <img id="logo-5-id" src="/app/root/assets/images/ecommerce-logo-mini-e-light.png" alt="" height="22">
                </span>
                <span id="logo-6-span-id" class="logo-lg">
                    <img id="logo-6-id" src="/app/root/assets/images/ecommerce-logo-long-e-light.png" alt="" height="17">
                </span>
            </a>

            <a href="/" class="logo logo-light">
                <span id="logo-7-span-id" class="logo-sm">
                    <img id="logo-7-id" src="/app/root/assets/images/ecommerce-logo-mini-e-dark.png" alt="" height="22">
                </span>
                <span id="logo-8-span-id" class="logo-lg">
                    <img id="logo-8-id" src="/app/root/assets/images/ecommerce-logo-long-e-dark.png" alt="" height="19">
                </span>
            </a>
        </div>        

        <button type="button" class="btn btn-sm px-4 font-size-20 header-item waves-effect" id="vertical-menu-btn" onclick="verticalMenuControl()">
            <i class="fa fa-fw fa-bars"></i>
        </button>

        <!-- App Search-->
        <form class="app-search d-none d-lg-block ml-3">
            <div class="position-relative">
                <input type="text" class="form-control" placeholder="Search...">
                <span class="bx bx-search-alt"></span>
            </div>
        </form>

        <div id="mega-menu-dropdown-id" class="dropdown dropdown-mega d-none d-lg-block ml-2">
            <button id="main-menu-id" type="button" class="btn header-item waves-effect" data-toggle="dropdown" aria-haspopup="false" aria-expanded="false">
                <span key="t-megamenu">Main Menu</span>
                <i class="mdi mdi-chevron-down"></i>
            </button>
            <div class="dropdown-menu dropdown-megamenu">
                <div class="row">
                    <div class="col-12">

                        <div class="row">
                            <div class="col-md-3">
                                <h5 class="font-size-14 mt-0" key="t-ui-components">
                                    <!-- MAIN CATEGORY NAME 1 -->
                                </h5>
                                <ul class="list-unstyled megamenu-list">
                                    <!-- MAIN CATEGORY NAME 1 - LI -->
                                </ul>
                            </div>

                            <div class="col-md-3">
                                <h5 class="font-size-14 mt-0" key="t-ui-components">
                                    <!-- MAIN CATEGORY NAME 2 -->
                                </h5>
                                <ul class="list-unstyled megamenu-list">
                                    <!-- MAIN CATEGORY NAME 2 - LI -->
                                </ul>
                            </div>

                            <div class="col-md-3">
                                <h5 class="font-size-14 mt-0" key="t-ui-components">
                                    <!-- MAIN CATEGORY NAME 3 -->
                                </h5>
                                <ul class="list-unstyled megamenu-list">
                                    <!-- MAIN CATEGORY NAME 3 - LI -->
                                </ul>
                            </div>

                            <div class="col-md-3">
                                <h5 class="font-size-14 mt-0" key="t-ui-components">
                                    <!-- MAIN CATEGORY NAME 4 -->
                                </h5>
                                <ul class="list-unstyled megamenu-list">
                                    <!-- MAIN CATEGORY NAME 4 - LI -->
                                </ul>
                            </div>                            
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <div class="d-flex">

        <div class="dropdown d-inline-block d-lg-none ml-2">
            <button type="button" class="btn header-item noti-icon waves-effect ecommerce-navbar-btn-effect" id="page-header-search-dropdown"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="mdi mdi-magnify"></i>
            </button>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0"
                 aria-labelledby="page-header-search-dropdown">

                <form class="p-3">
                    <div class="form-group m-0">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                            <div class="input-group-append">
                                <button class="btn btn-primary btn-sm" type="submit"><i class="mdi mdi-magnify"></i></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item waves-effect ecommerce-navbar-btn-effect ecommerce-navbar-desktop-language-btn"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img id="header-lang-img" src="/app/root/assets/images/flags/us.jpg" alt="Header Language" height="16">
            </button>
            <div class="dropdown-menu dropdown-menu-right">

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" onclick="setLanguage('en')">
                    <img src="/app/root/assets/images/flags/us.jpg" alt="user-image" class="mr-1" height="12" asp-append-version="true"> <span class="align-middle">English</span>
                </a>
                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" onclick="setLanguage('sp')">
                    <img src="/app/root/assets/images/flags/spain.jpg" alt="user-image" class="mr-1" height="12" asp-append-version="true"> <span class="align-middle">Spanish</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" onclick="setLanguage('gr')">
                    <img src="/app/root/assets/images/flags/germany.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">German</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" onclick="setLanguage('it')">
                    <img src="/app/root/assets/images/flags/italy.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Italian</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" onclick="setLanguage('ru')">
                    <img src="/app/root/assets/images/flags/russia.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Russian</span>
                </a>
            </div>
        </div>


        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item noti-icon waves-effect ecommerce-navbar-btn-effect" id="page-header-screen-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i id="ecommerce-navigation-cog-i" class="bx bx-cog ecommerce-mt-0-5"></i>
            </button>
          
            <div class="dropdown-menu dropdown-menu-right">
                <!-- item-->
                <a class="dropdown-item cursor-pointer" onclick="multiOpenModal('ecommerceThemeSettingsModal')"><i class="bx bx-adjust font-size-16 align-middle mr-1"></i> <span key="t-theme">Theme</span></a>
                <a class="dropdown-item cursor-pointer" data-toggle="fullscreen"><i class="bx bx-fullscreen font-size-16 align-middle mr-1"></i> <span key="t-fullscreen">Fullscreen</span></a>
                <a class="dropdown-item cursor-pointer" onclick="fixedWidthResponsive();verticalMenuControlFixedWidth();resizeListener();changeAppColor('fixed')">
                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="left-right" class="mr-1 svg-inline--fa fa-left-right fa-fw fa-1x fa-pull-" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" id="c020e8c9-d79f-437f-bf49-8741cdbb61c4" type="icon"><path fill="currentColor" d="M503.1 273.6l-112 104c-6.984 6.484-17.17 8.219-25.92 4.406s-14.41-12.45-14.41-22v-56l-192 .001V360c0 9.547-5.656 18.19-14.41 22c-8.75 3.812-18.94 2.078-25.92-4.406l-112-104c-9.781-9.094-9.781-26.09 0-35.19l112-104c6.984-6.484 17.17-8.219 25.92-4.406C154 133.8 159.7 142.5 159.7 152v55.1l192-.001v-56c0-9.547 5.656-18.19 14.41-22s18.94-2.078 25.92 4.406l112 104C513.8 247.5 513.8 264.5 503.1 273.6z"></path></svg>
                    <span key="t-fixed-responsive">Fixed Responsive</span>
                </a>
                <a class="dropdown-item cursor-pointer" onclick="fullWidthResponsive();verticalMenuControlFullWidth();resizeListener();changeAppColor('full')">
                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="up-down-left-right" class="mr-1 mb-1 svg-inline--fa fa-up-down-left-right fa-fw fa-1x fa-pull-" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" id="ceb6aa8a-14e9-4681-9063-c3f45cafe5ea" type="icon"><path fill="currentColor" d="M512 256c0 6.797-2.891 13.28-7.938 17.84l-80 72C419.6 349.9 413.8 352 408 352c-3.312 0-6.625-.6875-9.766-2.078C389.6 346.1 384 337.5 384 328V288h-96v96l40-.0013c9.484 0 18.06 5.578 21.92 14.23s2.25 18.78-4.078 25.83l-72 80C269.3 509.1 262.8 512 255.1 512s-13.28-2.89-17.84-7.937l-71.1-80c-6.328-7.047-7.938-17.17-4.078-25.83s12.44-14.23 21.92-14.23l39.1 .0013V288H128v40c0 9.484-5.578 18.06-14.23 21.92C110.6 351.3 107.3 352 104 352c-5.812 0-11.56-2.109-16.06-6.156l-80-72C2.891 269.3 0 262.8 0 256s2.891-13.28 7.938-17.84l80-72C95 159.8 105.1 158.3 113.8 162.1C122.4 165.9 128 174.5 128 184V224h95.1V128l-39.1-.0013c-9.484 0-18.06-5.578-21.92-14.23S159.8 94.99 166.2 87.94l71.1-80c9.125-10.09 26.56-10.09 35.69 0l72 80c6.328 7.047 7.938 17.17 4.078 25.83s-12.44 14.23-21.92 14.23l-40 .0013V224H384V184c0-9.484 5.578-18.06 14.23-21.92c8.656-3.812 18.77-2.266 25.83 4.078l80 72C509.1 242.7 512 249.2 512 256z"></path></svg>
                    <span key="t-full-responsive">Full Responsive</span>
                </a>                
            </div>
        </div>        

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item waves-effect ecommerce-navbar-btn-effect" id="page-header-user-dropdown"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img class="rounded-circle header-profile-user" src="/app/root/assets/images/users/avatar-1.jpg" asp-append-version="true"
                     alt="Header Avatar">
            </button>
            <div class="dropdown-menu dropdown-menu-right">
                <!-- item-->
                <a class="dropdown-item cursor-pointer" href="/app/dashboard/admin"><i class="bx bxs-dashboard font-size-16 align-middle mr-1"></i> <span key="t-profile">Dashboard</span></a>
                <a class="dropdown-item cursor-pointer" href="#"><i class="bx bx-user font-size-16 align-middle mr-1"></i> <span key="t-profile">Profile</span></a>
                <a class="dropdown-item cursor-pointer" href="#"><i class="bx bx-wallet font-size-16 align-middle mr-1"></i> <span key="t-my-wallet">My Wallet</span></a>
                <a class="dropdown-item d-block cursor-pointer" href="#"><span class="badge badge-success float-right">11</span><i class="bx bx-wrench font-size-16 align-middle mr-1"></i> <span key="t-settings">Settings</span></a>
                <a class="dropdown-item cursor-pointer" onclick="userLockScreen()"><i class="bx bx-lock-open font-size-16 align-middle mr-1"></i> <span key="t-lock-screen">Lock screen</span></a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item text-danger cursor-pointer " onclick="userLogout()"><i class="bx bx-power-off font-size-16 align-middle mr-1 text-danger"></i> <span key="t-logout">Logout</span></a>
            </div>
        </div>        

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect ecommerce-navbar-btn-effect" id="page-header-cart-dropdown">
                <i id="ecommerce-navigation-cart-i" class="bx bx-cart-alt mt-1"></i>
                <span class="badge badge-danger badge-pill mt-1"></span>
            </button>
        </div>

    </div>
</div>
</header>

<!-- Modal for Theme Settings --> 
<div class="modal fade " id="ecommerceThemeSettingsModal" tabindex="-1" role="dialog" aria-labelledby="ecommerceThemeSettingsModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ecommerceThemeSettingsModalLongTitle">Theme Settings</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row ecommerce-page-screen-text-center">
                    <div class="col-sm-4 pb-4">
                        <h4>Colored</h4>
                        <a id="colored-theme-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('colored-theme')},100);">
                            <span key="t-colored-theme">Theme</span>
                        </a>
                        <a id="colored-navigation-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('colored-navigation')},100);">
                            <span key="t-colored-theme-navigation">Navigation</span>
                        </a>     
                        <a id="colored-sidebar-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('colored-sidebar')},100);">
                            <span key="t-colored-theme-sidebar">Side Bar</span>
                        </a>
                        <a id="colored-brand-sm-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('colored-brand-sm')},100);">
                            <span key="t-colored-theme-brand-small">Brand Small</span>
                        </a>                        
                        <a id="colored-brand-lg-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('colored-brand-lg')},100);">
                            <span key="t-colored-theme-brand-large">Brand Large</span>
                        </a>                                                
                    </div>
                    <div class="col-sm-4 pb-4">
                        <h4>Dark</h4>
                        <a id="dark-theme-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('dark-theme')},100);">
                            <span key="t-dark-theme">Theme</span>
                        </a>
                        <a id="dark-navigation-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('dark-navigation')},100);">
                            <span key="t-dark-theme-navigation">Navigation</span>
                        </a>
                        <a id="dark-sidebar-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('dark-sidebar')},100);">
                            <span key="t-dark-theme-sidebar">Side Bar</span>
                        </a>
                        <a id="dark-brand-sm-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('dark-brand-sm')},100);">
                            <span key="t-dark-theme-brand-small">Brand Small</span>
                        </a>                        
                        <a id="dark-brand-lg-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('dark-brand-lg')},100);">
                            <span key="t-dark-theme-brand-large">Brand Large</span>
                        </a>
                    </div>
                    <div class="col-sm-4 pb-4">
                        <h4>Light</h4>
                        <a id="light-theme-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('light-theme')},100);">
                            <span key="t-light-theme">Theme</span>
                        </a>
                        <a id="light-navigation-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('light-navigation')},100);">
                            <span key="t-light-theme-navigation">Navigation</span>
                        </a>                        
                        <a id="light-sidebar-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('light-sidebar')},100);">
                            <span key="t-light-theme-sidebar">Side Bar</span>
                        </a>                        
                        <a id="light-brand-sm-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('light-brand-sm')},100);">
                            <span key="t-light-theme-brand-small">Brand Small</span>
                        </a>                        
                        <a id="light-brand-lg-link-id" class="dropdown-item cursor-pointer px-1" onclick="preloaderScreen('show',100,true);setTimeout(()=>{changeAppColor('light-brand-lg')},100);">
                            <span key="t-light-theme-brand-large">Brand Large</span>
                        </a>                      
                    </div>                                       
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- ========== Left Sidebar Start ========== -->
<div id="vertical-menu-id" class="vertical-menu">

<div data-simplebar class="h-100">

    <!--- Sidemenu -->
    <div id="sidebar-menu">
        <!-- Left Menu Start -->
        <div class="dropdown d-inline-block ecommerce-menu-mobile-language-box float-right">
            <button type="button" class="btn header-item waves-effect ecommerce-menu-mobile-language-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img id="header-lang-img" src="/app/root/assets/images/flags/us.jpg" alt="Header Language" height="16">
            </button>
            <div class="dropdown-menu dropdown-menu-right ecommerce-dropdown-language">

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" onclick="setLanguage('en')">
                    <img src="/app/root/assets/images/flags/us.jpg" alt="user-image" class="mr-1" height="12" asp-append-version="true"> <span class="align-middle">English</span>
                </a>
                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" onclick="setLanguage('sp')">
                    <img src="/app/root/assets/images/flags/spain.jpg" alt="user-image" class="mr-1" height="12" asp-append-version="true"> <span class="align-middle">Spanish</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" onclick="setLanguage('gr')">
                    <img src="/app/root/assets/images/flags/germany.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">German</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" onclick="setLanguage('it')">
                    <img src="/app/root/assets/images/flags/italy.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Italian</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item" onclick="setLanguage('ru')">
                    <img src="/app/root/assets/images/flags/russia.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Russian</span>
                </a>
            </div>
        </div>        
        <ul class="metismenu list-unstyled" id="side-menu">
            <li class="menu-title" key="t-menu">Menu</li>

            <li>
                <a href="/" class=" waves-effect">
                    <i id="ecomnerce-navigation-home-i" class="bx bx-home"></i>
                    <span id="ecomnerce-navigation-home-span" key="t-home">Home</span>
                </a>
            </li>
   
            <li class="menu-title" key="t-apps">Apps</li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-analyse"></i>
                    <span key="t-sortiment-manager">Analysis</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-category">Analysis</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Add Analysis</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Analysis</a></li>                        
                        </ul>
                    </li>  
           
                </ul>
            </li>      

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-user"></i>
                    <span key="t-sortiment-manager">Client</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Clients</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Client</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Client</a></li>                              
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Client Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Client Group</a></li>                               
                        </ul>
                    </li>    

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Documents</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Document</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Document</a></li>                        
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Document Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Document Group</a></li>      
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Document Layout</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Document Layout</a></li>                                                    
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Document Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Document Type</a></li>                              
                        </ul>
                    </li>                      

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Parameter</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Group</a></li>                            
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Parameter Name</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Parameter Name</a></li>                            
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Type</a></li>
                        </ul>
                    </li>                    

                </ul>
            </li>     

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-chat"></i>
                    <span key="t-sortiment-manager">Communication</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" key="t-product">Chat</a>
                    </li>   

                    <li>
                        <a href="javascript: void(0);" key="t-product">Voice Chat</a>
                    </li>                                     

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Members</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Member</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Member</a></li>                              
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Member Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Member Group</a></li>                               
                        </ul>
                    </li>   

                </ul>
            </li>  

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-slideshow"></i>
                    <span key="t-sortiment-manager">Content Management</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-category">Advertisements</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Add Advertisement</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Advertisement</a></li>                        
                        </ul>
                    </li>

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">News</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add New</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit New</a></li>                              
                        </ul>
                    </li>    

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Services</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Service</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Service</a></li>                        
                        </ul>
                    </li>                      

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Terms of conditions</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Cookies Document</a></li>
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Ecommerce Document</a></li>
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Personal Data Document</a></li>
                        </ul>
                    </li>                                        

                </ul>
            </li>   

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bxs-dashboard"></i>
                    <span key="t-sortiment-manager">Dashboard Center</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Dashboards</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Dashboard</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Dashboard</a></li>                              
                        </ul>
                    </li>    

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Monitor Control Panel</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Find Dashboard</a></li>
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">List of Events</a></li>
                        </ul>
                    </li>                        

                </ul>
            </li>                                 

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-box"></i>
                    <span key="t-sortiment-manager">Delivery</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-category">Delivery</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Add Delivery</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Delivery</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Add Delivery Layout</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Delivery Layout</a></li>                            
                        </ul>
                    </li>  

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Documents</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Document</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Document</a></li>                        
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Document Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Document Group</a></li>      
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Document Layout</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Document Layout</a></li>                                                    
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Document Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Document Type</a></li>                              
                        </ul>
                    </li>         

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-category">Shipping List</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Add Shipping List</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Shipping List</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Add Shipping List Layout</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Shipping List Layout</a></li>                            
                        </ul>
                    </li>                                   

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Parameter</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Group</a></li>                            
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Parameter Name</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Parameter Name</a></li>                            
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Type</a></li>
                        </ul>
                    </li>                    

                </ul>
            </li>   

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-bookmarks"></i>
                    <span key="t-sortiment-manager">Financial Accounting</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Documents</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Document</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Document</a></li>                        
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Document Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Document Group</a></li>      
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Document Layout</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Document Layout</a></li>                                                    
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Document Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Document Type</a></li>                              
                        </ul>
                    </li>                      

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Parameter</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Group</a></li>                            
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Parameter Name</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Parameter Name</a></li>                            
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Type</a></li>
                        </ul>
                    </li>                    

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Tax</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Tax</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Tax</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Tax Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Tax Type</a></li>
                        </ul>
                    </li>                    

                </ul>
            </li>  

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-wallet"></i>
                    <span key="t-sortiment-manager">Payment</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Payments</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Payment Method</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Payment Method</a></li>                              
                        </ul>
                    </li>    

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Transactions</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Find Transaction</a></li>
                        </ul>
                    </li>                        

                </ul>
            </li>             

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-lock-alt"></i>
                    <span key="t-sortiment-manager">Secure</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Accounts</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Account</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Account</a></li>                              
                        </ul>
                    </li>    

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Credentials</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Credential</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Credential</a></li>                              
                        </ul>
                    </li>    

                </ul>
            </li>                
     
            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-book-bookmark"></i>
                    <span key="t-sortiment-manager">Sortiment</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-category">Category</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Category Tree</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Add Category Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Category Group</a></li>                        
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Category Name</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Category Name</a></li>
                        </ul>
                    </li>  

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-manufacturer">Manufacturer</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Manufacturer Brand</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Manufacturer Brand</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Manufacturer Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Manufacturer Group</a></li>                            
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Manufacturer Name</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Manufacturer Name</a></li>                              
                        </ul>
                    </li>    

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Parameter</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Group</a></li>                            
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Parameter Name</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Parameter Name</a></li>                            
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Type</a></li>
                        </ul>
                    </li>                    

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Price List</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Price List</a></li>
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Edit Price List</a></li>
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Price List Type</a></li>
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Edit Price List Type</a></li>                            
                        </ul>
                    </li>      

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Sortiment</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Sortiment Card</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Sortiment Card</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Sortiment Layout</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Sortiment Layout</a></li>
                        </ul>
                    </li>
           
                </ul>
            </li>   

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-store-alt"></i>
                    <span key="t-sortiment-manager">Store</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-category">Orders</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Add Order</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Order</a></li>                        
                        </ul>
                    </li>  

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Parameter</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Group</a></li>                            
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Parameter Name</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Parameter Name</a></li>                            
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Type</a></li>
                        </ul>
                    </li>                    
           
                </ul>
            </li>   

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-task"></i>
                    <span key="t-sortiment-manager">Tasks</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Parameter</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Group</a></li>                            
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Parameter Name</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Parameter Name</a></li>                            
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Type</a></li>
                        </ul>
                    </li>                    

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Task</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Task</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Task</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Task Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Task Type</a></li>
                        </ul>
                    </li>                    

                </ul>
            </li>               

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-building-house"></i>
                    <span key="t-sortiment-manager">Warehouse</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Documents</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Document</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Document</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Document Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Document Group</a></li>      
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Document Layout</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Document Layout</a></li>                                                           
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Document Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Document type</a></li>                               
                        </ul>
                    </li>                    

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-category">Item List</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Analysis Item List</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Find Item</a></li>
                        </ul>
                    </li>                        

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-product">Parameter</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Group</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Group</a></li>                            
                            <li><a class="cursor-pointer" onclick="multiOpenModal('ecommerce-dashboard-universals-modal')" key="t-product-add">Add Parameter Name</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Parameter Name</a></li>                            
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Add Parameter Type</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-layout">Edit Parameter Type</a></li>
                        </ul>
                    </li>       

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-category">Warehouse</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Add Warehouse</a></li>
                            <li><a class="cursor-pointer" onclick="" key="t-product-edit">Edit Warehouse</a></li>
                        </ul>
                    </li>  

                </ul>
            </li>   





            <!-- CATEGORIES LI -->

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-help-circle"></i>
                    <span key="t-layouts">Help</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-questions">Questions</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a href="/app/LayoutsLightSidebar" key="t-light-sidebar">Light Sidebar</a></li>
                            <li><a href="/app/LayoutsCompactSidebar" key="t-compact-sidebar">Compact Sidebar</a></li>
                            <li><a href="/app/LayoutsIconSidebar" key="t-icon-sidebar">Icon Sidebar</a></li>
                            <li><a href="/app/LayoutsBoxed" key="t-boxed-width">Boxed Width</a></li>
                            <li><a href="/app/LayoutsPreloader" key="t-preloader">Preloader</a></li>
                            <li><a href="/app/LayoutsColoredSidebar" key="t-colored-sidebar">Colored Sidebar</a></li>
                            <li><a href="/app/LayoutsScrollable" key="t-scrollable">Scrollable</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-about">About</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a href="/app/LayoutsHorizontal" key="t-horizontal">Horizontal</a></li>
                            <li><a href="/app/LayoutsHTopbarLight" key="t-topbar-light">Topbar light</a></li>
                            <li><a href="/app/LayoutsHBoxed" key="t-boxed-width">Boxed width</a></li>
                            <li><a href="/app/LayoutHoriPreloader" key="t-preloader">Preloader</a></li>
                            <li><a href="/app/LayoutsHColored" key="t-colored-topbar">Colored Header</a></li>
                            <li><a href="/app/LayoutsHoriScrollable" key="t-scrollable">Scrollable</a></li>
                        </ul>
                    </li>
                </ul>
            </li>    




         </ul>
    </div>
    <!-- Sidebar -->
</div>
</div>
<!-- Left Sidebar End -->

    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->

    <div id="main-content-id" class="main-content">
        <div class="page-content">
            <div class="container-fluid">

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="mb-0 font-size-18">Administration</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboard</a></li>
                    <li class="breadcrumb-item active">Administration</li>
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->



<div class="row">
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-lg-4">
                    <div class="media">
                        <div class="mr-3">
                            <img src="/app/builder/root/assets/images/users/avatar-1.jpg" alt="" class="avatar-md rounded-circle img-thumbnail">
                        </div>
                        <div class="media-body align-self-center">
                            <div class="text-muted">
                                <p class="mb-2">Welcome to dashboard</p>
                                <h5 id="dashboard-user-name" class="mb-1"></h5>
                                <p id="dashboard-user-credentials" class="mb-0"></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 align-self-center">
                    <div class="text-lg-center mt-4 mt-lg-0">
                        <div class="row">
                            <div class="col-sm-4">
                                <div>
                                    <p class="text-muted text-truncate mb-2">Total Tasks</p>
                                    <h5 class="mb-0">58</h5>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div>
                                    <p class="text-muted text-truncate mb-2">In Process</p>
                                    <h5 class="mb-0">40</h5>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div>
                                    <p class="text-muted text-truncate mb-2">Upcoming</p>
                                    <h5 class="mb-0">18</h5>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 d-none d-lg-block">
                    <div class="clearfix  mt-4 mt-lg-0">
                        <div class="dropdown float-right">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="bx bxs-cog align-middle mr-1"></i> Setting
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end row -->
        </div>
    </div>
</div>
</div>
<!-- end row -->

<div class="row">
<div class="col-xl-12">
    <div class="row">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex align-items-center mb-3">
                        <div class="avatar-xs mr-3">
                            <span class="avatar-title rounded-circle bg-soft-primary text-primary font-size-18">
                                <i class="bx bx-copy-alt"></i>
                            </span>
                        </div>
                        <h5 class="font-size-14 mb-0">Orders</h5>
                    </div>
                    <div class="text-muted mt-4">
                        <h4>1,452 <i class="mdi mdi-chevron-up ml-1 text-success"></i></h4>
                        <div class="d-flex">
                            <span class="badge badge-soft-success font-size-12"> + 0.2% </span> <span class="ml-2 text-truncate">From previous period</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex align-items-center mb-3">
                        <div class="avatar-xs mr-3">
                            <span class="avatar-title rounded-circle bg-soft-primary text-primary font-size-18">
                                <i class="bx bx-archive-in"></i>
                            </span>
                        </div>
                        <h5 class="font-size-14 mb-0">Revenue</h5>
                    </div>
                    <div class="text-muted mt-4">
                        <h4>$ 28,452 <i class="mdi mdi-chevron-up ml-1 text-success"></i></h4>
                        <div class="d-flex">
                            <span class="badge badge-soft-success font-size-12"> + 0.2% </span> <span class="ml-2 text-truncate">From previous period</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex align-items-center mb-3">
                        <div class="avatar-xs mr-3">
                            <span class="avatar-title rounded-circle bg-soft-primary text-primary font-size-18">
                                <i class="bx bx-purchase-tag-alt"></i>
                            </span>
                        </div>
                        <h5 class="font-size-14 mb-0">Average Price</h5>
                    </div>
                    <div class="text-muted mt-4">
                        <h4>$ 16.2 <i class="mdi mdi-chevron-up ml-1 text-success"></i></h4>

                        <div class="d-flex">
                            <span class="badge badge-soft-warning font-size-12"> 0% </span> <span class="ml-2 text-truncate">From previous period</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
</div>
</div>

<div class="row">
<div class="col-xl-8">
    <div class="card">
        <div class="card-body">
            <div class="clearfix">
                <div class="float-right">
                    <div class="input-group input-group-sm">
                        <select class="custom-select custom-select-sm">
                            <option selected>Jan</option>
                            <option value="1">Dec</option>
                            <option value="2">Nov</option>
                            <option value="3">Oct</option>
                        </select>
                        <div class="input-group-append">
                            <label class="input-group-text">Month</label>
                        </div>
                    </div>
                </div>
                <h4 class="card-title mb-4">Earning</h4>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <div class="text-muted">
                        <div class="mb-4">
                            <p>This month</p>
                            <h4>$2453.35</h4>
                            <div><span class="badge badge-soft-success font-size-12 mr-1"> + 0.2% </span> From previous period</div>
                        </div>

                        <div>
                            <a href="#" class="btn btn-primary waves-effect waves-light btn-sm">View Details <i class="mdi mdi-chevron-right ml-1"></i></a>
                        </div>

                        <div class="mt-4">
                            <p class="mb-2">Last month</p>
                            <h5>$2281.04</h5>
                        </div>

                    </div>
                </div>

                <div class="col-lg-8">
                    <div id="line-chart" class="apex-charts" dir="ltr"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-xl-4">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title mb-4">Sales Analytics</h4>

            <div>
                <div id="donut-chart" class="apex-charts"></div>
            </div>

            <div class="text-center text-muted">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="mt-4">
                            <p class="mb-2 text-truncate"><i class="mdi mdi-circle text-primary mr-1"></i> Category A</p>
                            <h5>$ 2,132</h5>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="mt-4">
                            <p class="mb-2 text-truncate"><i class="mdi mdi-circle text-success mr-1"></i> Category B</p>
                            <h5>$ 1,763</h5>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="mt-4">
                            <p class="mb-2 text-truncate"><i class="mdi mdi-circle text-danger mr-1"></i> Category C</p>
                            <h5>$ 973</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- end row -->

<div class="row">
<div class="col-xl-4">
    <div class="card">
        <div class="card-body">
            <div class="clearfix">
                <div class="float-right">
                    <div class="input-group input-group-sm">
                        <select class="custom-select custom-select-sm">
                            <option selected>Jan</option>
                            <option value="1">Dec</option>
                            <option value="2">Nov</option>
                            <option value="3">Oct</option>
                        </select>
                        <div class="input-group-append">
                            <label class="input-group-text">Month</label>
                        </div>
                    </div>
                </div>
                <h4 class="card-title mb-4">Top Selling Category</h4>
            </div>

            <div class="text-muted text-center">
                <p class="mb-2">Category A</p>
                <h4>$ 6385</h4>
                <p class="mt-4 mb-0"><span class="badge badge-soft-success font-size-11 mr-2"> 0.6% <i class="mdi mdi-arrow-up"></i> </span> From previous period</p>
            </div>

            <div class="table-responsive mt-4">
                <table class="table table-centered mb-0">
                    <tbody>
                        <tr>
                            <td>
                                <h5 class="font-size-14 mb-1">Category A</h5>
                                <p class="text-muted mb-0">Neque quis est</p>
                            </td>

                            <td>
                                <div id="radialchart-1" class="apex-charts"></div>
                            </td>
                            <td>
                                <p class="text-muted mb-1">Sales</p>
                                <h5 class="mb-0">37 %</h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5 class="font-size-14 mb-1">Category B</h5>
                                <p class="text-muted mb-0">Quis autem iure</p>
                            </td>

                            <td>
                                <div id="radialchart-2" class="apex-charts"></div>
                            </td>
                            <td>
                                <p class="text-muted mb-1">Sales</p>
                                <h5 class="mb-0">72 %</h5>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5 class="font-size-14 mb-1">Category C</h5>
                                <p class="text-muted mb-0">Sed aliquam mauris.</p>
                            </td>

                            <td>
                                <div id="radialchart-3" class="apex-charts"></div>
                            </td>
                            <td>
                                <p class="text-muted mb-1">Sales</p>
                                <h5 class="mb-0">54 %</h5>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="col-xl-4">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title mb-4">Tasks</h4>

            <ul class="nav nav-pills bg-light rounded">
                <li class="nav-item">
                    <a class="nav-link active" href="#">In Process</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Upcoming</a>
                </li>
            </ul>

            <div class="mt-4">
                <div data-simplebar style="max-height: 250px;">

                    <div class="table-responsive">
                        <table class="table table-nowrap table-centered table-hover mb-0">
                            <tbody>
                                <tr>
                                    <td style="width: 50px;">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck1" checked>
                                            <label class="custom-control-label" for="customCheck1"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14 mb-1"><a href="#" class="text-dark">Skote Saas Dashboard</a></h5>
                                        <p class="text-muted mb-0">Assigned to Mark</p>
                                    </td>
                                    <td style="width: 90px;">
                                        <div>
                                            <ul class="list-inline mb-0 font-size-16">
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-success p-1"><i class="bx bxs-edit-alt"></i></a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-danger p-1"><i class="bx bxs-trash"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck2">
                                            <label class="custom-control-label" for="customCheck2"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14 mb-1"><a href="#" class="text-dark">New Landing UI</a></h5>
                                        <p class="text-muted mb-0">Assigned to Team A</p>
                                    </td>
                                    <td>
                                        <div>
                                            <ul class="list-inline mb-0 font-size-16">
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-success p-1"><i class="bx bxs-edit-alt"></i></a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-danger p-1"><i class="bx bxs-trash"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck3">
                                            <label class="custom-control-label" for="customCheck3"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14 mb-1"><a href="#" class="text-dark">Brand logo design</a></h5>
                                        <p class="text-muted mb-0">Assigned to Janis</p>
                                    </td>
                                    <td>
                                        <div>
                                            <ul class="list-inline mb-0 font-size-16">
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-success p-1"><i class="bx bxs-edit-alt"></i></a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-danger p-1"><i class="bx bxs-trash"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck4">
                                            <label class="custom-control-label" for="customCheck4"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14 mb-1"><a href="#" class="text-dark">Blog Template UI</a></h5>
                                        <p class="text-muted mb-0">Assigned to Dianna</p>
                                    </td>
                                    <td>
                                        <div>
                                            <ul class="list-inline mb-0 font-size-16">
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-success p-1"><i class="bx bxs-edit-alt"></i></a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-danger p-1"><i class="bx bxs-trash"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck5">
                                            <label class="custom-control-label" for="customCheck5"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14 mb-1"><a href="#" class="text-dark">Multipurpose Landing</a></h5>
                                        <p class="text-muted mb-0">Assigned to Team B</p>
                                    </td>
                                    <td>
                                        <div>
                                            <ul class="list-inline mb-0 font-size-16">
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-success p-1"><i class="bx bxs-edit-alt"></i></a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-danger p-1"><i class="bx bxs-trash"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck6">
                                            <label class="custom-control-label" for="customCheck6"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14 mb-1"><a href="#" class="text-dark">Redesign - Landing page</a></h5>
                                        <p class="text-muted mb-0">Assigned to Jerry</p>
                                    </td>
                                    <td>
                                        <div>
                                            <ul class="list-inline mb-0 font-size-16">
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-success p-1"><i class="bx bxs-edit-alt"></i></a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-danger p-1"><i class="bx bxs-trash"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck7">
                                            <label class="custom-control-label" for="customCheck7"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <h5 class="text-truncate font-size-14 mb-1"><a href="#" class="text-dark">Skote Crypto Dashboard</a></h5>
                                        <p class="text-muted mb-0">Assigned to Eric</p>
                                    </td>
                                    <td>
                                        <div>
                                            <ul class="list-inline mb-0 font-size-16">
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-success p-1"><i class="bx bxs-edit-alt"></i></a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="text-danger p-1"><i class="bx bxs-trash"></i></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-footer bg-transparent border-top">
            <div class="text-center">
                <a onclick="d('find','products','detail','string');" class="btn btn-primary waves-effect waves-light"> Add new Task</a>
                <a onclick="d('get','products','detail','id');" class="btn btn-primary waves-effect waves-light"> Add new Task</a>
            </div>
        </div>
    </div>
</div>

<div class="col-xl-4">
    <div class="card">
        <div class="card-body border-bottom">
            <div class="row">
                <div class="col-md-4 col-9">
                    <h5 class="font-size-15 mb-1">Steven Franklin</h5>
                    <p class="text-muted mb-0"><i class="mdi mdi-circle text-success align-middle mr-1"></i> Active now</p>
                </div>
                <div class="col-md-8 col-3">
                    <ul class="list-inline user-chat-nav text-right mb-0">
                        <li class="list-inline-item d-none d-sm-inline-block">
                            <div class="dropdown">
                                <button class="btn nav-btn dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="bx bx-search-alt-2"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-md">
                                    <form class="p-3">
                                        <div class="form-group m-0">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </li>
                        <li class="list-inline-item  d-none d-sm-inline-block">
                            <div class="dropdown">
                                <button class="btn nav-btn dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="bx bx-cog"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#">View Profile</a>
                                    <a class="dropdown-item" href="#">Clear chat</a>
                                    <a class="dropdown-item" href="#">Muted</a>
                                    <a class="dropdown-item" href="#">Delete</a>
                                </div>
                            </div>
                        </li>

                        <li class="list-inline-item">
                            <div class="dropdown">
                                <button class="btn nav-btn dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="bx bx-dots-horizontal-rounded"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else</a>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="card-body pb-0">
            <div>
                <div class="chat-conversation">
                    <ul class="list-unstyled" data-simplebar style="max-height: 260px;">
                        <li>
                            <div class="chat-day-title">
                                <span class="title">Today</span>
                            </div>
                        </li>
                        <li>
                            <div class="conversation-list">
                                <div class="dropdown">

                                    <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Copy</a>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Forward</a>
                                        <a class="dropdown-item" href="#">Delete</a>
                                    </div>
                                </div>
                                <div class="ctext-wrap">
                                    <div class="conversation-name">Steven Franklin</div>
                                    <p>
                                        Hello!
                                    </p>
                                    <p class="chat-time mb-0"><i class="bx bx-time-five align-middle mr-1"></i> 10:00</p>
                                </div>

                            </div>
                        </li>

                        <li class="right">
                            <div class="conversation-list">
                                <div class="dropdown">

                                    <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Copy</a>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Forward</a>
                                        <a class="dropdown-item" href="#">Delete</a>
                                    </div>
                                </div>
                                <div class="ctext-wrap">
                                    <div class="conversation-name">Henry Wells</div>
                                    <p>
                                        Hi, How are you? What about our next meeting?
                                    </p>

                                    <p class="chat-time mb-0"><i class="bx bx-time-five align-middle mr-1"></i> 10:02</p>
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="conversation-list">
                                <div class="dropdown">

                                    <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Copy</a>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Forward</a>
                                        <a class="dropdown-item" href="#">Delete</a>
                                    </div>
                                </div>
                                <div class="ctext-wrap">
                                    <div class="conversation-name">Steven Franklin</div>
                                    <p>
                                        Yeah everything is fine
                                    </p>

                                    <p class="chat-time mb-0"><i class="bx bx-time-five align-middle mr-1"></i> 10:06</p>
                                </div>

                            </div>
                        </li>

                        <li class="last-chat">
                            <div class="conversation-list">
                                <div class="dropdown">

                                    <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Copy</a>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Forward</a>
                                        <a class="dropdown-item" href="#">Delete</a>
                                    </div>
                                </div>
                                <div class="ctext-wrap">
                                    <div class="conversation-name">Steven Franklin</div>
                                    <p>& Next meeting tomorrow 10.00AM</p>
                                    <p class="chat-time mb-0"><i class="bx bx-time-five align-middle mr-1"></i> 10:06</p>
                                </div>

                            </div>
                        </li>

                        <li class=" right">
                            <div class="conversation-list">
                                <div class="dropdown">

                                    <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="bx bx-dots-vertical-rounded"></i>
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">Copy</a>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Forward</a>
                                        <a class="dropdown-item" href="#">Delete</a>
                                    </div>
                                </div>
                                <div class="ctext-wrap">
                                    <div class="conversation-name">Henry Wells</div>
                                    <p>
                                        Wow that's great
                                    </p>

                                    <p class="chat-time mb-0"><i class="bx bx-time-five align-middle mr-1"></i> 10:07</p>
                                </div>
                            </div>
                        </li>


                    </ul>
                </div>

            </div>
        </div>

        <div class="p-3 chat-input-section">
            <div class="row">
                <div class="col">
                    <div class="position-relative">
                        <input type="text" class="form-control rounded chat-input" placeholder="Enter Message...">
                        <div class="chat-input-links">
                            <ul class="list-inline mb-0">
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Emoji"><i class="mdi mdi-emoticon-happy-outline"></i></a></li>
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Images"><i class="mdi mdi-file-image-outline"></i></a></li>
                                <li class="list-inline-item"><a href="#" data-toggle="tooltip" data-placement="top" title="Add Files"><i class="mdi mdi-file-document-outline"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary chat-send w-md waves-effect waves-light"><span class="d-none d-sm-inline-block mr-2">Send</span> <i class="mdi mdi-send"></i></button>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
<!-- end row -->







                
            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->

<footer id="footer-id" class="footer">
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-6">
            2022 © PSUCA.
        </div>
        <div class="col-sm-6">
            <div class="text-sm-right d-none d-sm-block">
                Develop by PowerShell Universal
            </div>
        </div>
    </div>
</div>
</footer>
    
    </div>
    <!-- end main content-->

</div>



<!-- END layout-wrapper -->
<!-- Right Sidebar -->
<div class="right-bar ecommerce-right-bar">
<div data-simplebar class="h-100">
    <div class="rightbar-title px-3 py-4 bg-primary sticky-top" style="min-height:68px">
        <a href="javascript:void(0);" class="right-bar-toggle float-right mr-3">
            <i class="mdi mdi-close noti-icon"></i>
        </a>
        <h5 class="m-0 text-white float-left" key="t-mini-cart-title">My cart</h5>
    </div>

    <!-- Settings -->
    <hr class="mt-0" />

    <div class="container-xl p-0">
        <div class="col-xl-12 ecommerce-right-bar-desktop p-0">
            <div class="card">
                <div class="card-body pt-1">
                    <div class="table-responsive">
                        <table class="table table-centered mb-0 table-nowrap">
                            <thead class="thead-light">
                                <tr>
                                    <th class="ecommerce-cart-product-img-th-desktop" key="t-mini-cart-table-desktop-product">Product</th>
                                    <th key="t-mini-cart-table-desktop-product-desc">Product Desc</th>
                                    <th key="t-mini-cart-table-desktop-product-price">Price</th>
                                    <th key="t-mini-cart-table-desktop-product-quantity">Quantity</th>
                                    <th colspan="2" key="t-mini-cart-table-desktop-product-total">Total</th>
                                </tr>
                            </thead>
                            <tbody>

                                <!-- DESKTOP MINI CART PRODUCT -->
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="row mt-4">
                        <div class="col-sm-6">
                            <a href="" app="" builder="" ecommerceproducts""="" class="btn btn-secondary" key="t-mini-cart-desktop-continue-shopping">
                                <i class="mdi mdi-arrow-left mr-1"></i> Continue Shopping
                            </a>
                        </div> <!-- end col -->
                        <div class="col-sm-6">
                            <div class="text-sm-right mt-2 mt-sm-0">
                                <a href="" app="" builder="" ecommercecheckout""="" class="btn btn-success" key="t-mini-cart-desktop-checkout">
                                    <i class="mdi mdi-cart-arrow-right mr-1"></i> Checkout
                                </a>
                            </div>
                        </div> <!-- end col -->
                    </div> <!-- end row-->
                </div>
            </div>
        </div>

        <div class="col-xl-12 ecommerce-right-bar-mobile p-0">
            <div class="card">
                <div class="card-body-cart-mobile pt-1">
                    <div class="table-responsive">
                        <table class="table table-centered mb-0 table-nowrap">
                            <thead class="thead-light">
                                <tr>
                                    <th class="ecommerce-cart-product-img-th-mobile" key="t-mini-cart-table-mobile-product">Product</th>
                                    <th class="ecommerce-cart-product-desc-th-mobile" key="t-mini-cart-table-mobile-product-desc">Product Desc</th>
                                    <th key="t-mini-cart-table-mobile-product-price">Price</th>
                                    <th class="ecommerce-cart-product-quantity-th-mobile" key="t-mini-cart-table-mobile-product-quantity">Quantity</th>
                                    <th colspan="2" key="t-mini-cart-table-mobile-product-total">Total</th>
                                </tr>
                            </thead>
                            <tbody>

                            <!-- MOBILE MINI CART PRODUCT -->
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="ecommerce-cart-buttons-row-mobile mt-4">
                        <div class="">
                            <a href="" app="" builder="" ecommerceproducts""="" class="btn btn-secondary" key="t-mini-cart-mobile-continue-shopping">
                                <i class="mdi mdi-arrow-left mr-1"></i> Continue Shopping
                            </a>
                        </div> <!-- end col -->
                        <div class="col pr-0 pl-0">
                            <div class="text-sm-right float-right">
                                <a href="" app="" builder="" ecommercecheckout""="" class="btn btn-success" key="t-mini-cart-mobile-checkout">
                                    <i class="mdi mdi-cart-arrow-right mr-1"></i> Checkout
                                </a>
                            </div>
                        </div> <!-- end col -->
                    </div> <!-- end row-->
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body pt-1">
                <h4 class="card-title mb-3" key="t-mini-cart-order-summary-title">Order Summary</h4>

                <div class="table-responsive">
                    <table class="table mb-0">
                        <tbody>
                            <tr>
                                <td key="t-mini-cart-order-sumary-grand-total">Grand Total :</td>
                                <td>$ 1,857</td>
                            </tr>
                            <tr key="t-mini-cart-order-sumary-discount">
                                <td>Discount : </td>
                                <td>- $ 157</td>
                            </tr>
                            <tr>
                                <td key="t-mini-cart-order-sumary-chipping-charge">Shipping Charge :</td>
                                <td>$ 25</td>
                            </tr>
                            <tr>
                                <td key="t-mini-cart-order-sumary-estimated-tax">Estimated Tax : </td>
                                <td>$ 19.22</td>
                            </tr>
                            <tr class="thead-light">
                                <th key="t-mini-cart-order-summary-total">Total :</th>
                                <th>$ 1744.22</th>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- end table-responsive -->
            </div>
        </div>
        <!-- end card -->
    </div>
</div>

</div> <!-- end slimscroll-menu-->






<!-- Modal Section -->
<!-- Modal PRODUCT ADD HTML SOURCE --> 
<div class="modal fade " id="ecommerce-dashboard-universals-modal" tabindex="-1" role="dialog" aria-labelledby="ecommerce-dashboard-universals-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ecommerce-dashboard-universals-modal-long-title" key="ecommerce-dashboard-universals-modal-title-key">Product Manager</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                
                <div id="ecommerce-dashboard-universal-modal-inner-html">
                    <div class="page-content p-0">
                        <div class="container-fluid">

                            <!-- start page title -->
                            <div class="row">
                                <div class="col-12">
                                    <div class="page-title-box d-flex align-items-center justify-content-between">
                                        <h4 class="mb-0 font-size-18">Add Product</h4>

                                        <div class="page-title-right">
                                            <ol class="breadcrumb m-0">
                                                <li class="breadcrumb-item"><a href="javascript: void(0);">Ecommerce</a></li>
                                                <li class="breadcrumb-item active">Add Product</li>
                                            </ol>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- end page title -->





                            <!-- select2 css -->
                            <link href="/app/root/assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css">

                            <!-- dropzone css -->
                            <link href="/app/root/assets/libs/dropzone/min/dropzone.min.css" rel="stylesheet" type="text/css">


                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body p-0">

                                            <h4 class="card-title">Basic Information</h4>
                                            <p class="card-title-desc">Fill all information below</p>

                                            <form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for"product-layout">Product layout</label>
                                                            <select id="product-layout" class="form-control select2-ajax"></select>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="product-name">Product Name</label>
                                                            <input id="product-name" name="productname" type="text" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="manufacturer-name">Manufacturer Name</label>
                                                            <select id="manufacturer-name" class="form-control select2-ajax"></select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="manufacturer-brand">Manufacturer Brand</label>
                                                            <select id="manufacturer-brand" class="form-control select2-ajax"></select>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="product-main-category" class="control-label">Main Category</label>
                                                            <select id="product-main-category" class="form-control select2-ajax"></select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="product-sub-category" class="control-label">Sub Category</label>
                                                            <select id="product-sub-category" class="form-control select2-ajax"></select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="product-description">Product Description</label>
                                                            <textarea class="form-control" id="product-description" rows="5"></textarea>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="product-tax">Tax</label>
                                                            <select id="product-tax" class="form-control select2-ajax"></select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="product-price">Price</label>
                                                            <input id="product-price" name="product-price" type="text" class="form-control">
                                                        </div>                                                        
                                                    </div>
                                                </div>

                                                <button type="submit" class="btn btn-primary mr-1 waves-effect waves-light">Save Changes</button>
                                                <button type="submit" class="btn btn-secondary waves-effect">Cancel</button>
                                            </form>

                                        </div>
                                    </div>

                                    <div class="card">
                                        <div class="card-body p-0">
                                            <h4 class="card-title mb-3">Product Images</h4>

                                            <form action="/" method="post" class="dropzone">
                                                <div class="fallback">
                                                    <input name="file" type="file" multiple="">
                                                </div>

                                                <div class="dz-message needsclick">
                                                    <div class="mb-3">
                                                        <i class="display-4 text-muted bx bxs-cloud-upload"></i>
                                                    </div>

                                                    <h4>Drop files here or click to upload.</h4>
                                                </div>
                                            </form>
                                        </div>

                                    </div> <!-- end card-->

                                    <div class="card">
                                        <div class="card-body p-0">

                                            <h4 class="card-title">Meta Data</h4>
                                            <p class="card-title-desc">Fill all information below</p>

                                            <form>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="metatitle">Meta title</label>
                                                            <input id="metatitle" name="productname" type="text" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="metakeywords">Meta Keywords</label>
                                                            <input id="metakeywords" name="manufacturername" type="text" class="form-control">
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="metadescription">Meta Description</label>
                                                            <textarea class="form-control" id="metadescription" rows="5"></textarea>
                                                        </div>
                                                    </div>
                                                </div>

                                                <button type="submit" class="btn btn-primary mr-1 waves-effect waves-light">Save Changes</button>
                                                <button type="submit" class="btn btn-secondary waves-effect">Cancel</button>

                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end row -->
                        </div>
                        <!-- container-fluid -->
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>








</div>
<!-- /Right-bar -->
<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

          




<!-- Preloader content end -->
</div>












'@
)




