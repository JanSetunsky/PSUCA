
# CATEGORY PAGE - VISITOR

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

        <div class="ecommerce-navbar-brand-box-long">
            <a href="/" class="logo logo-dark">
                <span class="logo-sm">
                    <img src="/app/root/assets/images/ecommerce-logo-long-e-light.png" alt="" height="22">
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
                                <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
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

        <div class="dropdown d-none d-lg-inline-block ml-1">
            <button type="button" class="btn header-item noti-icon waves-effect ecommerce-navbar-btn-effect" data-toggle="fullscreen">
                <i class="bx bx-fullscreen mt-1"></i>
            </button>
        </div>

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect ecommerce-navbar-btn-effect">
                <i class="bx bx-cart-alt mt-1"></i>
                <span class="badge badge-danger badge-pill mt-1"></span>
            </button>
        </div>

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item noti-icon waves-effect ecommerce-navbar-btn-effect" id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="bx bx-lock ecommerce-mt-0-5"></i>
            </button>
          
            <div class="dropdown-menu dropdown-menu-right">
                <!-- item-->
                <a class="dropdown-item" href="/app/authentication/register"><i class="bx bx-id-card font-size-16 align-middle mr-1"></i> <span key="t-register">Register</span></a>
                <a class="dropdown-item" href="/app/authentication/login"><i class="bx bx-lock-open font-size-16 align-middle mr-1"></i> <span key="t-login">Login</span></a>
                <a class="dropdown-item" href="/app/authentication/recovery"><i class="bx bx-check-shield font-size-16 align-middle mr-1"></i> <span key="t-forgotpassword">Forgot Password</span></a>
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
        <div class="dropdown d-inline-block ecommerce-menu-mobile-language-box float-right">
            <button type="button" class="btn header-item waves-effect ecommerce-menu-mobile-language-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
        <ul class="metismenu list-unstyled" id="side-menu">
            <li class="menu-title" key="t-menu">Menu</li>

            <li>
                <a href="/" class=" waves-effect">
                    <i class="bx bx-home"></i>
                    <span key="t-home">Home</span>
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

    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

<!-- start page title -->







<div class="row">
    <div class="col-lg-12">

        <!-- SLIDESHOW -->

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
                                    
                                    <!-- SUBCATEGORY BUTTONS -->

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

                                                        
                                                        <input type="text" id="range_03" value="5">
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="row p-3">
                                                        
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                                <div class="custom-control custom-radio mb-3">
                                                                    <input onclick="" type="radio" id="ecommerce-product-list-sort-default-radio" name="ecommerce-product-list-sort-type-radio" class="custom-control-input" checked="">
                                                                    <label class="custom-control-label" for="ecommerce-product-list-sort-default-radio" key="t-default-price-filter">
                                                                        Default
                                                                    </label>
                                                                </div>                                                            
                                                            </div>
                                                
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                                <div class="custom-control custom-radio mb-3">
                                                                <input onclick="" type="radio" id="ecommerce-product-list-sort-best-seller-radio" name="ecommerce-product-list-sort-type-radio" class="custom-control-input">
                                                                    <label class="custom-control-label" for="ecommerce-product-list-sort-best-seller-radio" key="t-best-seller-price-filter">
                                                                        Best Seller
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                                <div class="custom-control custom-radio mb-3">
                                                                <input onclick="" type="radio" id="ecommerce-product-list-sort-most-expensive-radio" name="ecommerce-product-list-sort-type-radio" class="custom-control-input">
                                                                    <label class="custom-control-label" for="ecommerce-product-list-sort-most-expensive-radio" key="t-most-expensive-price-filter">
                                                                        Most Expensive
                                                                    </label>
                                                                </div>    
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                                                <div class="custom-control custom-radio mb-3">
                                                                <input onclick="" type="radio" id="ecommerce-product-list-sort-most-cheapest-radio" name="ecommerce-product-list-sort-type-radio" class="custom-control-input">
                                                                    <label class="custom-control-label" for="ecommerce-product-list-sort-most-cheapest-radio" key="t-most-cheapes-price-filter">
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
                                                <label class="custom-control-label" for="productdiscountCheck1" key="t-sorting-discount-1-filter">Less than 10%</label>
                                            </div>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck2">
                                                <label class="custom-control-label" for="productdiscountCheck2" key="t-sorting-discount-2-filter">10% or more</label>
                                            </div>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck3">
                                                <label class="custom-control-label" for="productdiscountCheck3" key="t-sorting-discount-3-filter">20% or more</label>
                                            </div>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck4">
                                                <label class="custom-control-label" for="productdiscountCheck4" key="t-sorting-discount-4-filter">30% or more</label>
                                            </div>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck5">
                                                <label class="custom-control-label" for="productdiscountCheck5" key="t-sorting-discount-5-filter">40% or more</label>
                                            </div>
                                            <div class="custom-control custom-checkbox mt-2">
                                                <input type="checkbox" class="custom-control-input" id="productdiscountCheck6">
                                                <label class="custom-control-label" for="productdiscountCheck6" key="t-sorting-discount-6-filter">50% or more</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12 p-1">
                                        <div class="p-3">
                                            <h5 class="font-size-14 mb-3">Rating</h5>
                                            <div>
                                                <div class="custom-control custom-checkbox mt-2">
                                                    <input type="checkbox" class="custom-control-input" id="productratingCheck1">
                                                    <label class="custom-control-label" for="productratingCheck1" key="t-sorting-rating-4-star-up-filter">4 <i class="bx bx-star text-warning"></i>  & Above</label>
                                                </div>
                                                <div class="custom-control custom-checkbox mt-2">
                                                    <input type="checkbox" class="custom-control-input" id="productratingCheck2">
                                                    <label class="custom-control-label" for="productratingCheck2" key="t-sorting-rating-3-star-up-filter">3 <i class="bx bx-star text-warning"></i>  & Above</label>
                                                </div>
                                                <div class="custom-control custom-checkbox mt-2">
                                                    <input type="checkbox" class="custom-control-input" id="productratingCheck3">
                                                    <label class="custom-control-label" for="productratingCheck3" key="t-sorting-rating-2-star-up-filter">2 <i class="bx bx-star text-warning"></i>  & Above</label>
                                                </div>
                                                <div class="custom-control custom-checkbox mt-2">
                                                    <input type="checkbox" class="custom-control-input" id="productratingCheck4">
                                                    <label class="custom-control-label" for="productratingCheck4" key="t-sorting-rating-1-star-up-filter">1 <i class="bx bx-star text-warning"></i></label>
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
                    <h5><!-- CATEGORY NAME --></h5>
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




        <!-- CATEGORY PRODUCTS -->
            



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
                    <!-- CATEGORY PRODUCTS PAGES NUMBER -->
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
    <div class="rightbar-title px-3 py-4 bg-white sticky-top" style="min-height:68px">
        <a href="javascript:void(0);" class="right-bar-toggle float-right mr-3">
            <i class="mdi mdi-close noti-icon"></i>
        </a>
        <h5 class="m-0 float-left" key="t-mini-cart-title">My cart</h5>
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

            





















'@
)


