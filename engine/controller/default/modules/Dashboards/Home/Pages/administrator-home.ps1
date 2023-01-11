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




# HOME PAGE - ADMINISTRATOR

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

    <!-- HOME PAGE MAIN SLIDESHOW -->
    <div class="col-xl-6 ecommerce-home-page-slideshow-carousel-col">

        <div class="card">
            <div class="card-body p-2">
                <div class="ecommerce-home-page-slideshow-carousel-item-box">
                    <div id="carouseliMainSlideshowItemIndicators" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner ecommerce-home-page-slideshow-carousel-item-inner-content">
                            
                            <div class="carousel-item active">
                                <div class="row justify-content-center">
                                    <img class="d-block slideshow-w-responsive justify-content-center carousel-slideshow-1-img" src="/app/root/db/img/category/00001.png" alt="Second slide">                   
                                </div>
                        
                            </div>

                            <div class="carousel-item">
                                <div class="row justify-content-center">
                                    <img class="d-block slideshow-w-responsive justify-content-center carousel-slideshow-1-img" src="/app/root/db/img/category/00001.png" alt="Second slide">                   
                                </div>
                        
                            </div>
                            
                            <div class="carousel-item">
                                <div class="row justify-content-center">
                                    <img class="d-block slideshow-w-responsive justify-content-center carousel-slideshow-1-img" src="/app/root/db/img/category/00001.png" alt="Second slide">                   
                                </div>
                        
                            </div>                            

                        </div>
                        <a class="carousel-slideshow-1-control-prev" href="#carouseliMainSlideshowItemIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-slideshow-1-control-next" href="#carouseliMainSlideshowItemIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="col px-0">

        
        <div class="col-lg-6 col-md-6 col-sm-6 float-left ecommerce-home-page-news-col">
            
            <div class="card ecommerce-news-layout">
                <div class="card-body p-2">    
                    <div class="row mb-0">
                        <div class="col">
                            <div class="ml-2 mt-2 ecommerce-inline-flex">
                                <i class="bx bx-store font-size-20 noti-icon pr-2 pb-1"></i>
                                <h4 key="t-news">News</h4>
                            </div>
                            <form class="mt-2 float-sm-right form-inline float-right">
                                <a href="javascript:void(0);" class="right-bar-toggle float-right mr-1 ecommerce-text-color-theme">
                                    <i class="bx bxs-right-arrow-square noti-icon ml-2 ecommerce-mt-0-5"></i>
                                    <p class="ml-1 float-left" key="t-news-view-all">View All</p>
                                </a>
                            </form>
                        </div>
                    </div>
                    <div data-simplebar style="max-height: 168px;margin-top: -12px;">
                        <a href="" class="col-12 text-reset notification-item">
                            <div class="media py-0 px-0">
                                <div class="avatar-xs mt-1 mr-2 ml-1">
                                    <span class="avatar-title bg-primary rounded-circle font-size-16">
                                        <i class="bx bx-cart"></i>
                                    </span>
                                </div>
                                <div class="media-body">
                                    <h6 class="mt-0 mb-1" key="t-your-order">Your order is placed</h6>
                                    <div class="font-size-12 text-muted">
                                        <p class="mb-1" key="t-grammer">If several languages coalesce the grammar</p>
                                        <p class="mb-0"><i class="mdi mdi-clock-outline"></i> 3 min ago</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                        <a href="" class="col-12 text-reset notification-item">
                            <div class="media py-0 px-0">
                                <div class="avatar-xs mt-1 mr-2 ml-1">
                                    <span class="avatar-title bg-primary rounded-circle font-size-16">
                                        <i class="bx bx-cart"></i>
                                    </span>
                                </div>
                                <div class="media-body">
                                    <h6 class="mt-0 mb-1" key="t-your-order">Your order is placed</h6>
                                    <div class="font-size-12 text-muted">
                                        <p class="mb-1" key="t-grammer">If several languages coalesce the grammar</p>
                                        <p class="mb-0"><i class="mdi mdi-clock-outline"></i> 3 min ago</p>
                                    </div>
                                </div>
                            </div>
                        </a>                    
                    </div>
                </div>    
            </div>
        </div>     


        <div class="col-lg-6 col-md-6 col-sm-6 float-left ecommerce-home-page-services-col">
            
            <div class="card ecommerce-services-layout">
                <div class="card-body p-2">    
                    <div class="row mb-0">
                        <div class="col">
                            <div class="ml-2 mt-2 ecommerce-inline-flex">
                                <i class="bx bxs-phone-call font-size-20 noti-icon pr-2 pb-1"></i>
                                <h4 key="t-services">Services</h4>
                            </div>
                            <form class="mt-2 float-sm-right form-inline float-right">
                                <a href="javascript:void(0);" class="right-bar-toggle float-right mr-1 ecommerce-text-color-theme">
                                    <i class="bx bxs-right-arrow-square noti-icon ml-2 ecommerce-mt-0-5"></i>
                                    <p class="ml-1 float-left" key="t-services-view-all">View All</p>
                                </a>
                            </form>                        
                        </div>
                    </div>
                </div>    
                <div class="ecommerce-services-carousel-item-box">
                    <div id="carouseliServicesSlideshowItemIndicators" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner ecommerce-services-carousel-item-inner-content">
                            
                            <div class="carousel-item active">
                                <div class="row justify-content-center">

                                    <div class="col ecommerce-services-carousel-item p-0">
                                        <div class="media text-center">
                                            <div class="media-body">
                                                <h5 key="t-chat-bot">Chat bot</h5>
                                                <p class="text-muted" key="t-chat-bot-description">You have questions ?</p>
                                            </div>
                                        </div>
                                        <div class="py-1 text-center">
                                            <h2 key="t-chat-bot-information">Free</h2>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>

                            <div class="carousel-item">
                                <div class="row justify-content-center">

                                    <div class="col ecommerce-services-carousel-item p-0">
                                        <div class="media text-center">
                                            <div class="media-body">
                                                <h5 key="t-call-center-description">Call center</h5>
                                                <p class="text-muted" key="t-call-center-descriptionr">+420 123 456 789</p>
                                            </div>
                                        </div>
                                        <div class="py-1 text-center">
                                            <h2 key="t-call-center-information">Free</h2>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>

                            <div class="carousel-item">
                                <div class="row justify-content-center">

                                    <div class="col ecommerce-services-carousel-item p-0">
                                        <div class="media text-center">
                                            <div class="media-body">
                                                <h5 key="t-business-assistant">Business Assistant</h5>
                                                <p class="text-muted" key="t-business-assistant-description">+420 123 456 789</p>
                                            </div>
                                        </div>
                                        <div class="py-1 text-center">
                                            <h2 key="t-business-assistant-information">Free</h2>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>


                        </div>
                        <a class="carousel-services-control-prev" href="#carouseliServicesSlideshowItemIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-services-control-next" href="#carouseliServicesSlideshowItemIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
                        </a>

                    </div>
                </div>                
                                    




                <div class="col text-center justify-content-center mb-3">
                    <a class="btn btn-primary btn-sm" href="#" role="button">
                        <span key="t-services-sign-up-now">Sign up Now</span>
                    </a>
                </div>             
            </div>
        </div>   



        <div class="col-lg-12 col-md-12 col-sm-12 float-left">
            
            <div class="card ecommerce-home-page-info-panel-layout">
                <div class="card-body p-2">    
                    <div class="row mb-0">
                        <div class="col">
                            <div class="ml-2 mt-2 ecommerce-inline-flex">
                                <i class="bx bx-time font-size-20 noti-icon pr-2 pb-1"></i>
                                <h4 key="key="t-info-panel-title">Limited Offer</h4>
                            </div>

                            <div class="mt-4 text-center ecommerce-home-page-offer-box">
                                <h2 key="t-info-panel-description">11 : 23 : 45</h2>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
        </div>


    </div>



    <div id="ecommerce-home-page-slideshow-2-id" class="col-xl-6 ecommerce-home-page-slideshow-2-carousel-col">

        <div class="card">
            <div class="card-body p-2">
                <div class="ecommerce-home-page-slideshow-2-carousel-item-box">
                    <div id="carouseliMainSlideshow2ItemIndicators" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner ecommerce-home-page-slideshow-carousel-item-inner-content">
                            
                            <div class="carousel-item active">
                                <div class="row justify-content-center">
                                    <img class="d-block slideshow-w-responsive justify-content-center carousel-slideshow-2-img" src="/app/root/db/img/category/00001.png" alt="Second slide">                   
                                </div>
                        
                            </div>

                            <div class="carousel-item">
                                <div class="row justify-content-center">
                                    <img class="d-block slideshow-w-responsive justify-content-center carousel-slideshow-2-img" src="/app/root/db/img/category/00001.png" alt="Second slide">                   
                                </div>
                        
                            </div>
                            
                            <div class="carousel-item">
                                <div class="row justify-content-center">
                                    <img class="d-block slideshow-w-responsive justify-content-center carousel-slideshow-2-img" src="/app/root/db/img/category/00001.png" alt="Second slide">                   
                                </div>
                        
                            </div>                            

                        </div>
                        <a class="carousel-slideshow-2-control-prev" href="#carouseliMainSlideshow2ItemIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-slideshow-2-control-next" href="#carouseliMainSlideshow2ItemIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>











    <div class="col-lg-12">
        <div class="card">
            <div class="card-body p-2">
                

                <div class="row mb-0">
                    <div class="col">
                        <div class="ml-2 mt-2 ecommerce-inline-flex">
                            <i class="bx bxs-hot font-size-20 noti-icon pr-2 pb-1"></i>
                            <h4>Best Seller</h4>
                        </div>
                        <form class="mt-2 float-sm-right form-inline float-right">
                            <a href="javascript:void(0);" class="right-bar-toggle float-right mr-1 ecommerce-text-color-theme">
                                <i class="bx bxs-right-arrow-square noti-icon ml-2 ecommerce-mt-0-5"></i>
                                <p class="ml-1 float-left" key="t-mini-cart-title">View All</p>
                            </a>
                        </form>
                    </div>
                </div>
                <div class="row justify-content-center px-3">

                <!-- HOME PAGE BEST SELLER SLIDESHOW -->

                    <div>
                        <div class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner ecommerce-best-seller-item-inner-content">
                             
                            
                                <div id="best-seller-slide-1" class="slide-1 slide-style carousel-item active">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-1.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>


                                <div id="best-seller-slide-2" class="slide-2 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-2.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>    
                                
                                
                                <div id="best-seller-slide-3" class="slide-3 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-3.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>     
                                
                                
                                <div id="best-seller-slide-4" class="slide-4 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-4.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>                                 
                          

                                <div id="best-seller-slide-5" class="slide-5 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-5.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>       
                                
                                
                                <div id="best-seller-slide-6" class="slide-6 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-6.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>  
                                
                                
                                <div id="best-seller-slide-7" class="slide-7 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-7.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>
                                
                                
                                <div id="best-seller-slide-8" class="slide-8 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>     
                                
                                
                                <div id="best-seller-slide-9" class="slide-9 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="best-seller-slide-10" class="slide-10 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="best-seller-slide-11" class="slide-11 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 

                                
                                <div id="best-seller-slide-12" class="slide-12 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="best-seller-slide-13" class="slide-13 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="best-seller-slide-14" class="slide-14 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>                                 


                            </div>
                        </div>
                    </div>                        

                    <a class="carousel-product-slideshow-control-prev" onclick="slideshowBtnLeftSide('ecommerce-best-seller-item-inner-content')" role="button">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-product-slideshow-control-next" onclick="slideshowBtnRightSide('ecommerce-best-seller-item-inner-content')" role="button">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

                </div>
            </div>
        </div>
    </div>       








    <div class="col-lg-12">
        <div class="card">
            <div class="card-body p-2">
                

                <div class="row mb-0">
                    <div class="col">
                        <div class="ml-2 mt-2 ecommerce-inline-flex">
                            <i class="bx bx-star font-size-20 noti-icon pr-2 pb-1"></i>
                            <h4>Favourites</h4>
                        </div>
                        <form class="mt-2 float-sm-right form-inline float-right">
                            <a href="javascript:void(0);" class="right-bar-toggle float-right mr-1 ecommerce-text-color-theme">
                                <i class="bx bxs-right-arrow-square noti-icon ml-2 ecommerce-mt-0-5"></i>
                                <p class="ml-1 float-left" key="t-mini-cart-title">View All</p>
                            </a>
                        </form>
                    </div>
                </div>
                <div class="row justify-content-center px-3">
                <!-- HOME PAGE DISCOUNT SLIDESHOW -->


                    <div>
                        <div id="carouseliDiscountSlideshowItemIndicators" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner ecommerce-favourites-item-inner-content">
                             
                            
                                <div id="favourites-slide-1" class="slide-1 slide-style carousel-item active">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-1.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>


                                <div id="favourites-slide-2" class="slide-2 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-2.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>    
                                
                                
                                <div id="favourites-slide-3" class="slide-3 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-3.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>     
                                
                                
                                <div id="favourites-slide-4" class="slide-4 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-4.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>                                 
                          

                                <div id="favourites-slide-5" class="slide-5 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-5.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>       
                                
                                
                                <div id="favourites-slide-6" class="slide-6 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-6.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>  
                                
                                
                                <div id="favourites-slide-7" class="slide-7 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-7.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>
                                
                                
                                <div id="favourites-slide-8" class="slide-8 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>     
                                
                                
                                <div id="favourites-slide-9" class="slide-9 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="favourites-slide-10" class="slide-10 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="favourites-slide-11" class="slide-11 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 

                                
                                <div id="favourites-slide-12" class="slide-12 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="favourites-slide-13" class="slide-13 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="favourites-slide-14" class="slide-14 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>                                 


                            </div>
                        </div>
                    </div>                        

                    <a class="carousel-product-slideshow-control-prev" onclick="slideshowBtnLeftSide('ecommerce-favourites-item-inner-content')" role="button">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-product-slideshow-control-next" onclick="slideshowBtnRightSide('ecommerce-favourites-item-inner-content')" role="button">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

                </div>
            </div>
        </div>
    </div>     










    <div class="col-lg-12">
        <div class="card">
            <div class="card-body p-2">
                

                <div class="row mb-0">
                    <div class="col">
                        <div class="ml-2 mt-2 ecommerce-inline-flex">
                            <i class="bx bx-wind font-size-20 noti-icon pr-2 pb-1"></i>
                            <h4>Discount</h4>
                        </div>
                        <form class="mt-2 float-sm-right form-inline float-right">
                            <a href="javascript:void(0);" class="right-bar-toggle float-right mr-1 ecommerce-text-color-theme">
                                <i class="bx bxs-right-arrow-square noti-icon ml-2 ecommerce-mt-0-5"></i>
                                <p class="ml-1 float-left" key="t-mini-cart-title">View All</p>
                            </a>
                        </form>
                    </div>
                </div>
                <div class="row justify-content-center px-3">
                <!-- HOME PAGE DISCOUNT SLIDESHOW -->


                    <div class="ecommerce-discount-carousel-item-box">
                        <div id="carouseliDiscountSlideshowItemIndicators" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner ecommerce-discount-carousel-item-inner-content">
                             
                            
                                <div id="discount-slide-1" class="slide-1 slide-style carousel-item active">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-1.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>


                                <div id="discount-slide-2" class="slide-2 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-2.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>    
                                
                                
                                <div id="discount-slide-3" class="slide-3 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-3.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>     
                                
                                
                                <div id="discount-slide-4" class="slide-4 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-4.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>                                 
                          

                                <div id="discount-slide-5" class="slide-5 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-5.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>       
                                
                                
                                <div id="discount-slide-6" class="slide-6 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-6.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>  
                                
                                
                                <div id="discount-slide-7" class="slide-7 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-7.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>
                                
                                
                                <div id="discount-slide-8" class="slide-8 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>     
                                
                                
                                <div id="discount-slide-9" class="slide-9 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="discount-slide-10" class="slide-10 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="discount-slide-11" class="slide-11 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 

                                
                                <div id="discount-slide-12" class="slide-12 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="discount-slide-13" class="slide-13 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div> 
                                
                                
                                <div id="discount-slide-14" class="slide-14 slide-style carousel-item">
                                    <div class="ecommerce-product-list-item-size justify-content-center">
                                        <div class="p-0">
                                            <div class="container px-0">
                                                <div class="container p-1 pb-1">
                                                    <div class="product-img position-relative">
                                                        <div class="avatar-sm product-ribbon">
                                                            <span class="avatar-title rounded-circle  bg-primary">
                                                                - 25 %
                                                            </span>
                                                        </div>
                                                        <img src="/app/root/assets/images/product/img-8.png" alt="" class="img-fluid mx-auto d-block">
                                                    </div>
                                                    <div class="text-center">
                                                        <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                                            <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                                                        </h5>
                                                        <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>
                            
                                                        <div class="pt-2 text-center">
                                                            <a class="btn btn-primary btn-sm" href="#" role="button">
                                                                <span>Add to</span>
                                                                <i class="bx bx-cart mt-1"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                    
                                    </div>
                                </div>                                 


                            </div>
                        </div>
                    </div>                        

                    <a class="carousel-product-slideshow-control-prev" onclick="slideshowBtnLeftSide('ecommerce-discount-carousel-item-inner-content')" role="button">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-product-slideshow-control-next" onclick="slideshowBtnRightSide('ecommerce-discount-carousel-item-inner-content')" role="button">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

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
</div>
<!-- /Right-bar -->
<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

            







<!-- Preloader content end -->
</div>












'@
)




