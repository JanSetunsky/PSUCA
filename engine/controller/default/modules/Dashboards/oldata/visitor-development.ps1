# HOME PAGE VISITOR


New-UDHtml -Markup (
@'

<!-- Begin page -->
<div id="layout-wrapper" style="margin-top: 0px;">
<header id="page-topbar">
<div class="navbar-header">
    <div class="d-flex">
        <!-- LOGO -->
        <div class="navbar-brand-box">
            <a href="/" class="logo logo-dark">
                <span class="logo-sm">
                    <img src="/app/root/assets/images/ecommerce-logo-mini-e-light.png" alt="" height="22">
                </span>
                <span class="logo-lg">
                    <img src="/app/root/assets/images/ecommerce-logo-long-e-light.png" alt="" height="17">
                </span>
            </a>

            <a href="/" class="logo logo-light">
                <span class="logo-sm">
                    <img src="/app/root/assets/images/ecommerce-logo-mini-e-dark.png" alt="" height="22">
                </span>
                <span class="logo-lg">
                    <img src="/app/root/assets/images/ecommerce-logo-long-e-dark.png" alt="" height="19">
                </span>
            </a>
        </div>

        <button type="button" class="btn btn-sm px-3 font-size-20 header-item waves-effect pl-4 pr-4" id="vertical-menu-btn">
            <i class="fa fa-fw fa-bars"></i>
        </button>

        <!-- App Search-->
        <form class="app-search d-none d-lg-block">
            <div class="position-relative">
                <input type="text" class="form-control" placeholder="Search...">
                <span class="bx bx-search-alt"></span>
            </div>
        </form>

        <div class="dropdown dropdown-mega d-none d-lg-block ml-2">
            <button type="button" class="btn header-item waves-effect" data-toggle="dropdown" aria-haspopup="false" aria-expanded="false">
                <span key="t-megamenu">Main Menu</span>
                <i class="mdi mdi-chevron-down"></i>
            </button>
            <div class="dropdown-menu dropdown-megamenu">
                <div class="row">
                    <div class="col-sm-8">

                        <div class="row">
                            <div class="col-md-4">
                                <h5 class="font-size-14 mt-0" key="t-ui-components">UI Components</h5>
                                <ul class="list-unstyled megamenu-list">
                                    <li>
                                        <a href="javascript:void(0);" key="t-lightbox">Lightbox</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-range-slider">Range Slider</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-sweet-alert">Sweet Alert</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-rating">Rating</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-forms">Forms</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-tables">Tables</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-charts">Charts</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="col-md-4">
                                <h5 class="font-size-14 mt-0" key="t-applications">Applications</h5>
                                <ul class="list-unstyled megamenu-list">
                                    <li>
                                        <a href="javascript:void(0);" key="t-ecommerce">Ecommerce</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-calendar">Calendar</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-email">Email</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-projects">Projects</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-tasks">Tasks</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-contacts">Contacts</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="col-md-4">
                                <h5 class="font-size-14 mt-0" key="t-extra-pages">Extra Pages</h5>
                                <ul class="list-unstyled megamenu-list">
                                    <li>
                                        <a href="javascript:void(0);" key="t-light-sidebar">Light Sidebar</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-compact-sidebar">Compact Sidebar</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-horizontal">Horizontal layout</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-maintenance">Maintenance</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-coming-soon">Coming Soon</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-timeline">Timeline</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-faqs">FAQs</a>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="row">
                            <div class="col-sm-6">
                                <h5 class="font-size-14 mt-0" key="t-ui-components">UI Components</h5>
                                <ul class="list-unstyled megamenu-list">
                                    <li>
                                        <a href="javascript:void(0);" key="t-lightbox">Lightbox</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-range-slider">Range Slider</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-sweet-alert">Sweet Alert</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-rating">Rating</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-forms">Forms</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-tables">Tables</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" key="t-charts">Charts</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="col-sm-5">
                                <div>
                                    <img src="/app/root/assets/images/megamenu-img.png" alt="" class="img-fluid mx-auto d-block">
                                </div>
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
                                <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item waves-effect ecommerce-navbar-btn-effect"
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

        <div class="dropdown d-none d-lg-inline-block ml-1">
            <button type="button" class="btn header-item noti-icon waves-effect ecommerce-navbar-btn-effect"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="bx bx-customize mt-1"></i>
            </button>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <div class="px-lg-2">
                    <div class="row no-gutters">
                        <div class="col">
                            <a class="dropdown-icon-item" href="#">
                                <img src="/app/root/assets/images/brands/github.png" alt="Github">
                                <span>GitHub</span>
                            </a>
                        </div>
                        <div class="col">
                            <a class="dropdown-icon-item" href="#">
                                <img src="/app/root/assets/images/brands/bitbucket.png" alt="bitbucket">
                                <span>Bitbucket</span>
                            </a>
                        </div>
                        <div class="col">
                            <a class="dropdown-icon-item" href="#">
                                <img src="/app/root/assets/images/brands/dribbble.png" alt="dribbble">
                                <span>Dribbble</span>
                            </a>
                        </div>
                    </div>

                    <div class="row no-gutters">
                        <div class="col">
                            <a class="dropdown-icon-item" href="#">
                                <img src="/app/root/assets/images/brands/dropbox.png" alt="dropbox">
                                <span>Dropbox</span>
                            </a>
                        </div>
                        <div class="col">
                            <a class="dropdown-icon-item" href="#">
                                <img src="/app/root/assets/images/brands/mail_chimp.png" alt="mail_chimp">
                                <span>Mail Chimp</span>
                            </a>
                        </div>
                        <div class="col">
                            <a class="dropdown-icon-item" href="#">
                                <img src="/app/root/assets/images/brands/slack.png" alt="slack">
                                <span>Slack</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="dropdown d-none d-lg-inline-block ml-1">
            <button type="button" class="btn header-item noti-icon waves-effect ecommerce-navbar-btn-effect" data-toggle="fullscreen">
                <i class="bx bx-fullscreen mt-1"></i>
            </button>
        </div>

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item noti-icon waves-effect ecommerce-navbar-btn-effect" id="page-header-notifications-dropdown"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="bx bx-bell bx-tada mt-1"></i>
                <span class="badge badge-danger badge-pill mt-1">5</span>
            </button>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0"
                 aria-labelledby="page-header-notifications-dropdown">
                <div class="p-3">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="m-0" key="t-notifications-title"> Notifications </h6>
                        </div>
                        <div class="col-auto">
                            <a href="#!" class="small" key="t-notification-view-all"> View All</a>
                        </div>
                    </div>
                </div>
                <div data-simplebar style="max-height: 230px;">
                    <a href="" class="text-reset notification-item">
                        <div class="media">
                            <div class="avatar-xs mr-3">
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
                    <a href="" class="text-reset notification-item">
                        <div class="media">
                            <img src="/app/root/assets/images/users/avatar-3.jpg" asp-append-version="true"
                                 class="mr-3 rounded-circle avatar-xs" alt="user-pic">
                            <div class="media-body">
                                <h6 class="mt-0 mb-1">James Lemire</h6>
                                <div class="font-size-12 text-muted">
                                    <p class="mb-1" key="t-simplified">It will seem like simplified English.</p>
                                    <p class="mb-0"><i class="mdi mdi-clock-outline"></i> 1 hours ago</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="" class="text-reset notification-item">
                        <div class="media">
                            <div class="avatar-xs mr-3">
                                <span class="avatar-title bg-success rounded-circle font-size-16">
                                    <i class="bx bx-badge-check"></i>
                                </span>
                            </div>
                            <div class="media-body">
                                <h6 class="mt-0 mb-1" key="t-shipped">Your item is shipped</h6>
                                <div class="font-size-12 text-muted">
                                    <p class="mb-1" key="t-grammer">If several languages coalesce the grammar</p>
                                    <p class="mb-0"><i class="mdi mdi-clock-outline"></i> 3 min ago</p>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a href="" class="text-reset notification-item">
                        <div class="media">
                            <img src="/app/root/assets/images/users/avatar-4.jpg" asp-append-version="true"
                                 class="mr-3 rounded-circle avatar-xs" alt="user-pic">
                            <div class="media-body">
                                <h6 class="mt-0 mb-1">Salena Layfield</h6>
                                <div class="font-size-12 text-muted">
                                    <p class="mb-1" key="t-occidental">As a skeptical Cambridge friend of mine occidental.</p>
                                    <p class="mb-0"><i class="mdi mdi-clock-outline"></i> 1 hours ago</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="p-2 border-top">
                    <a class="btn btn-sm btn-link font-size-14 btn-block text-center" href="javascript:void(0)">
                        <i class="mdi mdi-arrow-right-circle mr-1"></i>
                        <p class="mb-0 ecommerce-inline-block" key="t-notification-view-more">View More..</p>
                    </a>
                </div>
            </div>
        </div>

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect ecommerce-navbar-btn-effect">
                <i class="bx bx-cart-alt mt-1"></i>
                <span class="badge badge-danger badge-pill mt-1">30</span>
            </button>
        </div>

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item waves-effect ecommerce-navbar-btn-effect" id="page-header-user-dropdown"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img class="rounded-circle header-profile-user" src="/app/root/assets/images/users/avatar-1.jpg" asp-append-version="true"
                     alt="Header Avatar">
                <span class="d-none d-xl-inline-block ml-1" key="t-user-name">Henry</span>
                <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
            </button>
            <div class="dropdown-menu dropdown-menu-right">
                <!-- item-->
                <a class="dropdown-item" href="#"><i class="bx bx-user font-size-16 align-middle mr-1"></i> <span key="t-profile">Profile</span></a>
                <a class="dropdown-item" href="#"><i class="bx bx-wallet font-size-16 align-middle mr-1"></i> <span key="t-my-wallet">My Wallet</span></a>
                <a class="dropdown-item d-block" href="#"><span class="badge badge-success float-right">11</span><i class="bx bx-wrench font-size-16 align-middle mr-1"></i> <span key="t-settings">Settings</span></a>
                <a class="dropdown-item" href="#"><i class="bx bx-lock-open font-size-16 align-middle mr-1"></i> <span key="t-lock-screen">Lock screen</span></a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item text-danger" href="#"><i class="bx bx-power-off font-size-16 align-middle mr-1 text-danger"></i> <span key="t-logout">Logout</span></a>
            </div>
        </div>

    </div>
</div>
</header>
<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

<div data-simplebar class="h-100">

    <!--- Sidemenu -->
    <div id="sidebar-menu">
        <!-- Left Menu Start -->
        <ul class="metismenu list-unstyled" id="side-menu">
            <li class="menu-title" key="t-menu">Menu</li>

            <li>
                <a href="/" class=" waves-effect">
                    <i class="bx bx-home"></i>
                    <span key="t-home">Home</span>
                </a>
            </li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-list-ul"></i>
                    <span key="t-layouts">Categories</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-vertical">Components</a>
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
                        <a href="javascript: void(0);" class="has-arrow" key="t-horizontal">Monitors</a>
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
            
            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-gift"></i>
                    <span key="t-layouts">Gifts</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-vertical">Components</a>
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
                        <a href="javascript: void(0);" class="has-arrow" key="t-horizontal">Monitors</a>
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

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-heart"></i>
                    <span key="t-layouts">Favourites</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-vertical">Components</a>
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
                        <a href="javascript: void(0);" class="has-arrow" key="t-horizontal">Monitors</a>
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

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="bx bx-help-circle"></i>
                    <span key="t-layouts">Help</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li>
                        <a href="javascript: void(0);" class="has-arrow" key="t-vertical">Components</a>
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
                        <a href="javascript: void(0);" class="has-arrow" key="t-horizontal">Monitors</a>
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

    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

<!-- start page title -->







<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body p-2">
                <div class="ecommerce-subcategory-carousel-item-box">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner ecommerce-subcategory-carousel-item-inner-content">
                            
                            <div class="carousel-item active">
                                <div class="row justify-content-center">
                                    <img class="d-block slideshow-w-responsive justify-content-center" src="/app/root/db/img/category/00001.png" alt="Second slide">                   
                                </div>
                        
                            </div>

                            <div class="carousel-item">
                                <div class="row justify-content-center">
                                    <img class="d-block slideshow-w-responsive justify-content-center" src="/app/root/db/img/category/00001.png" alt="Second slide">                   
                                </div>
                        
                            </div>
                            
                            <div class="carousel-item">
                                <div class="row justify-content-center">
                                    <img class="d-block slideshow-w-responsive justify-content-center" src="/app/root/db/img/category/00001.png" alt="Second slide">                   
                                </div>
                        
                            </div>                            

                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body pl-2 pr-2 pt-1 pb-1">
                <div class="row pl-2 pr-2 pt-0">
                    <div class="col-6 p-1">
                        <a class="col btn btn-light" data-toggle="collapse" href="#multiCollapseSubCategory" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Subcategory</a>
                    </div>
                    <div class="col-6 p-1">
                        <a class="col btn btn-light" data-toggle="collapse" href="#multiCollapseSorting" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Sorting</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="collapse multi-collapse mb-2" id="multiCollapseSubCategory">
                            <div class="card card-body mb-0 pl-2 pr-2 pb-0 pt-0">
                                <div class="row p-1">
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 p-1">
                                        <a class="ecommerce-subcategory-item-link" href="#">
                                            <div class="ecommerce-subcategory-item-box border">
                                                <div class="ecommerce-subcategory-item-img">
                                                    <img src="/app/root/db/img/category/00001.jpg" class="ecommerce-subcategory-item-img img-fluid mx-auto d-block float-left" alt="...">
                                                </div>
                                                <div class="ecommerce-subcategory-item-text">
                                                    <p class="pl-3 mb-0 text-left">T-Shirt Specific Category</p>
                                                </div>                                            
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 p-1">
                                        <a class="ecommerce-subcategory-item-link" href="#">
                                            <div class="ecommerce-subcategory-item-box border">
                                                <div class="ecommerce-subcategory-item-img">
                                                    <img src="/app/root/db/img/category/00001.jpg" class="ecommerce-subcategory-item-img img-fluid mx-auto d-block float-left" alt="...">
                                                </div>
                                                <div class="ecommerce-subcategory-item-text">
                                                    <p class="pl-3 mb-0 text-left">T-Shirt Specific Category</p>
                                                </div>                                            
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 p-1">
                                        <a class="ecommerce-subcategory-item-link" href="#">
                                            <div class="ecommerce-subcategory-item-box border">
                                                <div class="ecommerce-subcategory-item-img">
                                                    <img src="/app/root/db/img/category/00001.jpg" class="ecommerce-subcategory-item-img img-fluid mx-auto d-block float-left" alt="...">
                                                </div>
                                                <div class="ecommerce-subcategory-item-text">
                                                    <p class="pl-3 mb-0 text-left">T-Shirt Specific Category</p>
                                                </div>                                            
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 p-1">
                                        <a class="ecommerce-subcategory-item-link" href="#">
                                            <div class="ecommerce-subcategory-item-box border">
                                                <div class="ecommerce-subcategory-item-img">
                                                    <img src="/app/root/db/img/category/00001.jpg" class="ecommerce-subcategory-item-img img-fluid mx-auto d-block float-left" alt="...">
                                                </div>
                                                <div class="ecommerce-subcategory-item-text">
                                                    <p class="pl-3 mb-0 text-left">T-Shirt Specific Category</p>
                                                </div>                                            
                                            </div>
                                        </a>
                                    </div>                                                                        
                                </div>
                            </div>
                        </div>

                        <div class="collapse multi-collapse mb-2" id="multiCollapseSorting">
                            <div class="card card-body mb-0 pl-2 pr-2 pb-0 pt-0">
                                <div class="row p-1">

                                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 p-1">

                                        <div class="p-0">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="p-3">
                                                        <h5 class="font-size-14 mb-3 mt-0">Price</h5>
                                                        <input type="text" id="range_03">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="row p-3">
                                                        
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                                <div class="custom-control custom-radio mb-3">
                                                                    <input onclick="" type="radio" id="ecommerce-product-list-sort-default-radio" name="ecommerce-product-list-sort-type-radio" class="custom-control-input" checked="">
                                                                    <label class="custom-control-label" for="ecommerce-product-list-sort-default-radio">
                                                                        Default
                                                                    </label>
                                                                </div>                                                            
                                                            </div>
                                                
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                                <div class="custom-control custom-radio mb-3">
                                                                <input onclick="" type="radio" id="ecommerce-product-list-sort-best-seller-radio" name="ecommerce-product-list-sort-type-radio" class="custom-control-input">
                                                                    <label class="custom-control-label" for="ecommerce-product-list-sort-best-seller-radio">
                                                                        Best Seller
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                                <div class="custom-control custom-radio mb-3">
                                                                <input onclick="" type="radio" id="ecommerce-product-list-sort-most-expensive-radio" name="ecommerce-product-list-sort-type-radio" class="custom-control-input">
                                                                    <label class="custom-control-label" for="ecommerce-product-list-sort-most-expensive-radio">
                                                                        Most Expensive
                                                                    </label>
                                                                </div>    
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                                <div class="custom-control custom-radio mb-3">
                                                                <input onclick="" type="radio" id="ecommerce-product-list-sort-most-cheapest-radio" name="ecommerce-product-list-sort-type-radio" class="custom-control-input">
                                                                    <label class="custom-control-label" for="ecommerce-product-list-sort-most-cheapest-radio">
                                                                        Most Cheapest
                                                                    </label>
                                                                </div>    
                                                            </div>                                                        
                                                        
                                                    </div>                                                
                                                </div>                                                
                                            </div>
                                        </div>
                                    </div>                                

                                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12 p-1">

                                        <div class="p-3">
                                            <h5 class="font-size-14 mb-3">Discount</h5>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck1">
                                                <label class="custom-control-label" for="productdiscountCheck1">Less than 10%</label>
                                            </div>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck2">
                                                <label class="custom-control-label" for="productdiscountCheck2">10% or more</label>
                                            </div>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck3" checked>
                                                <label class="custom-control-label" for="productdiscountCheck3">20% or more</label>
                                            </div>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck4">
                                                <label class="custom-control-label" for="productdiscountCheck4">30% or more</label>
                                            </div>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck5">
                                                <label class="custom-control-label" for="productdiscountCheck5">40% or more</label>
                                            </div>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck6">
                                                <label class="custom-control-label" for="productdiscountCheck6">50% or more</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12 p-1">
                                        <div class="p-3">
                                            <h5 class="font-size-14 mb-3">Rating</h5>
                                            <div>
                                                <div class="custom-control custom-checkbox mt-2">
                                                    <input type="checkbox" class="custom-control-input" id="productratingCheck1">
                                                    <label class="custom-control-label" for="productratingCheck1">4 <i class="bx bx-star text-warning"></i>  & Above</label>
                                                </div>
                                                <div class="custom-control custom-checkbox mt-2">
                                                    <input type="checkbox" class="custom-control-input" id="productratingCheck2">
                                                    <label class="custom-control-label" for="productratingCheck2">3 <i class="bx bx-star text-warning"></i>  & Above</label>
                                                </div>
                                                <div class="custom-control custom-checkbox mt-2">
                                                    <input type="checkbox" class="custom-control-input" id="productratingCheck3">
                                                    <label class="custom-control-label" for="productratingCheck3">2 <i class="bx bx-star text-warning"></i>  & Above</label>
                                                </div>
                                                <div class="custom-control custom-checkbox mt-2">
                                                    <input type="checkbox" class="custom-control-input" id="productratingCheck4">
                                                    <label class="custom-control-label" for="productratingCheck4">1 <i class="bx bx-star text-warning"></i></label>
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
        </div>

    </div>


    <div class="col-lg-12">

        <div class="row mb-3">
            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 col-6">
                <div class="mt-2">
                    <h5>Clothes</h5>
                </div>
            </div>
            <div class="col-xl-10 col-lg-9 col-md-8 col-sm-6 col-6">
                <form class="mt-sm-0 float-sm-right form-inline float-right">
                    <ul class="nav nav-pills product-view-nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="#"><i class="bx bx-grid-alt"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="bx bx-list-ul"></i></a>
                        </li>
                    </ul>


                </form>
            </div>
        </div>
        <div class="row">








            <div class="col-xl-2-1400px col-lg-3-1100px col-md-4 col-sm-6 col-sm-6-480-580px">
                <div class="card">
                    <div class="card-body p-1 pb-3">
                        <div class="product-img position-relative">
                            <div class="avatar-sm product-ribbon">
                                <span class="avatar-title rounded-circle  bg-primary">
                                    - 25 %
                                </span>
                            </div>
                            <img src="/app/root/assets/images/product/img-1.png" alt="" class="img-fluid mx-auto d-block">
                        </div>
                        <div class="mt-4 text-center">
                            <h5 class="mb-3 pl-1 pr-1 ecommerce-product-desc">
                                <a href="#" class="text-dark">Diesel Super Red Half sleeve T-shirt + Diesel logo</a>
                            </h5>
                            <p class="text-muted">
                                <i class="bx bx-star text-warning"></i>
                                <i class="bx bx-star text-warning"></i>
                                <i class="bx bx-star text-warning"></i>
                                <i class="bx bx-star text-warning"></i>
                                <i class="bx bx-star text-warning"></i>
                            </p>
                            <h5 class="my-0"><span class="text-muted mr-2"><del>$500</del></span> <b>$450</b></h5>

                            <div class="pt-2 text-center">
                                <a class="btn btn-primary" href="#" role="button">
                                    <span>Add to</span>
                                    <i class="bx bx-cart mt-1"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


           
            



        </div>
        <!-- end row -->

        <div class="row">
            <div class="col-lg-12">
                <ul class="pagination pagination-rounded justify-content-center mt-4">
                    <li class="page-item disabled">
                        <a href="#" class="page-link"><i class="mdi mdi-chevron-left"></i></a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link">1</a>
                    </li>
                    <li class="page-item active">
                        <a href="#" class="page-link">2</a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link">3</a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link">4</a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link">5</a>
                    </li>
                    <li class="page-item">
                        <a href="#" class="page-link"><i class="mdi mdi-chevron-right"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- end row -->








            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->

<footer class="footer">
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-6">
            © PSUCA.
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
    <div class="rightbar-title px-3 py-4 bg-white sticky-top" style="min-height:68px">
        <a href="javascript:void(0);" class="right-bar-toggle float-right mr-3">
            <i class="mdi mdi-close noti-icon"></i>
        </a>
        <h5 class="m-0 float-left">My cart</h5>
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
                                    <th class="ecommerce-cart-product-img-th-desktop">Product</th>
                                    <th>Product Desc</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th colspan="2">Total</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td class="ecommerce-cart-product-img-td-desktop">
                                        <img src="/app/root/assets/images/product/img-1.png" alt="product-img" title="product-img" class="avatar-md">
                                    </td>
                                    <td>
                                        <h5 class="font-size-14 text-truncate"><a href="" app="" builder="" ecommerceproductdetail""="" class="text-dark">Half sleeve T-shirt</a></h5>
                                        <p class="mb-0">Color : <span class="font-weight-medium">Maroon</span></p>
                                    </td>
                                    <td>
                                        $ 450
                                    </td>
                                    <td>
                                        <div style="width: 60px;">
                                            <input type="text" class="form-control" name="input-value">
                                        </div>
                                    </td>
                                    <td>
                                        $ 900
                                    </td>
                                    <td>
                                        <a href="javascript:void(0);" class="action-icon text-danger"> <i class="mdi mdi-trash-can font-size-18"></i></a>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="row mt-4">
                        <div class="col-sm-6">
                            <a href="" app="" builder="" ecommerceproducts""="" class="btn btn-secondary">
                                <i class="mdi mdi-arrow-left mr-1"></i> Continue Shopping
                            </a>
                        </div> <!-- end col -->
                        <div class="col-sm-6">
                            <div class="text-sm-right mt-2 mt-sm-0">
                                <a href="" app="" builder="" ecommercecheckout""="" class="btn btn-success">
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
                                    <th class="ecommerce-cart-product-img-th-mobile">Product</th>
                                    <th class="ecommerce-cart-product-desc-th-mobile">Product Desc</th>
                                    <th>Price</th>
                                    <th class="ecommerce-cart-product-quantity-th-mobile">Quantity</th>
                                    <th colspan="2">Total</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td class="ecommerce-cart-product-img-td-mobile">
                                        <img src="/app/root/assets/images/product/img-1.png" alt="product-img" title="product-img" class="avatar-md">
                                    </td>
                                    <td class="ecommerce-cart-product-desc-td-mobile">
                                        <h5 class="font-size-14 text-truncate"><a href="" app="" builder="" ecommerceproductdetail""="" class="text-dark">Half sleeve T-shirt</a></h5>
                                        <p class="mb-0">Color : <span class="font-weight-medium">Maroon</span></p>
                                    </td>
                                    <td>
                                        $ 450
                                    </td>
                                    <td class="ecommerce-cart-product-quantity-td-mobile">
                                        <div style="width: 60px;">
                                            <input type="text" class="form-control" name="input-value">
                                        </div>
                                    </td>
                                    <td>
                                        $ 900
                                    </td>
                                    <td class="ecommerce-cart-product-trash-td-mobile">
                                        <a href="javascript:void(0);" class="action-icon text-danger"> <i class="mdi mdi-trash-can font-size-18"></i></a>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="ecommerce-cart-product-img-td-mobile">
                                        <img src="/app/root/assets/images/product/img-1.png" alt="product-img" title="product-img" class="avatar-md">
                                    </td>
                                    <td class="ecommerce-cart-product-desc-td-mobile">
                                        <h5 class="font-size-14 text-truncate"><a href="" app="" builder="" ecommerceproductdetail""="" class="text-dark">Half sleeve T-shirt</a></h5>
                                        <p class="mb-0">Color : <span class="font-weight-medium">Maroon</span></p>
                                    </td>
                                    <td>
                                        $ 450
                                    </td>
                                    <td class="ecommerce-cart-product-quantity-td-mobile">
                                        <div style="width: 60px;">
                                            <input type="text" class="form-control" name="input-value">
                                        </div>
                                    </td>
                                    <td>
                                        $ 900
                                    </td>
                                    <td class="ecommerce-cart-product-trash-td-mobile">
                                        <a href="javascript:void(0);" class="action-icon text-danger"> <i class="mdi mdi-trash-can font-size-18"></i></a>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="ecommerce-cart-product-img-td-mobile">
                                        <img src="/app/root/assets/images/product/img-1.png" alt="product-img" title="product-img" class="avatar-md">
                                    </td>
                                    <td class="ecommerce-cart-product-desc-td-mobile">
                                        <h5 class="font-size-14 text-truncate"><a href="" app="" builder="" ecommerceproductdetail""="" class="text-dark">Half sleeve T-shirt</a></h5>
                                        <p class="mb-0">Color : <span class="font-weight-medium">Maroon</span></p>
                                    </td>
                                    <td>
                                        $ 450
                                    </td>
                                    <td class="ecommerce-cart-product-quantity-td-mobile">
                                        <div style="width: 60px;">
                                            <input type="text" class="form-control" name="input-value">
                                        </div>
                                    </td>
                                    <td>
                                        $ 900
                                    </td>
                                    <td class="ecommerce-cart-product-trash-td-mobile">
                                        <a href="javascript:void(0);" class="action-icon text-danger"> <i class="mdi mdi-trash-can font-size-18"></i></a>
                                    </td>
                                </tr>                                
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="ecommerce-cart-buttons-row-mobile mt-4">
                        <div class="">
                            <a href="" app="" builder="" ecommerceproducts""="" class="btn btn-secondary">
                                <i class="mdi mdi-arrow-left mr-1"></i> Continue Shopping
                            </a>
                        </div> <!-- end col -->
                        <div class="col pr-0 pl-0">
                            <div class="text-sm-right float-right">
                                <a href="" app="" builder="" ecommercecheckout""="" class="btn btn-success">
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
                <h4 class="card-title mb-3">Order Summary</h4>

                <div class="table-responsive">
                    <table class="table mb-0">
                        <tbody>
                            <tr>
                                <td>Grand Total :</td>
                                <td>$ 1,857</td>
                            </tr>
                            <tr>
                                <td>Discount : </td>
                                <td>- $ 157</td>
                            </tr>
                            <tr>
                                <td>Shipping Charge :</td>
                                <td>$ 25</td>
                            </tr>
                            <tr>
                                <td>Estimated Tax : </td>
                                <td>$ 19.22</td>
                            </tr>
                            <tr class="thead-light">
                                <th>Total :</th>
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

            





















'@
)


