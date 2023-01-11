function onClickStyleMainMenuId() {
    var element = document.getElementById('main-menu-id')
    if(element.ariaExpanded === 'false'){
        document.addEventListener('mouseup',()=>{
            var element = document.getElementById('main-menu-id')
            element.style.color = 'white';
            element.classList = 'btn header-item waves-effect ecommerce-text-white'
        });
        setTimeout(function(){
            element.style.color = '#556ee6';
            element.classList = 'btn header-item waves-effect ecommerce-text-primary'
        },50)
    }
    else if(element.ariaExpanded === 'true'){
        element.style.color = 'white';
        element.classList = 'btn header-item waves-effect ecommerce-text-white'
    }       
    else{
        element.style.color = '#556ee6';
    }
}
function onClickStyleMainMenu2Id() {
    var element = document.getElementById('main-menu-id')
    if(element.ariaExpanded === 'false'){
        document.addEventListener('mouseup',()=>{
            var element = document.getElementById('main-menu-id')
            element.style.color = '#555b6d';
            element.classList = 'btn header-item waves-effect ecommerce-text-noti-icon'
        });
        setTimeout(function(){
            element.style.color = 'white';
            element.classList = 'btn header-item waves-effect ecommerce-text-white'
        },50)
    }
    else if(element.ariaExpanded === 'true'){
        element.style.color = '#555b6d';
        element.classList = 'btn header-item waves-effect ecommerce-text-noti-icon'
    }       
    else{
        element.style.color = 'white';
    }
}
function onClickStyleNavigationCogId() {
    var elementBtn = document.getElementById('page-header-screen-dropdown')
    var elementIcon = document.getElementById('ecommerce-navigation-cog-i')
    if(elementBtn.ariaExpanded === 'true'){
        document.addEventListener('mouseup',()=>{
            var elementIcon = document.getElementById('ecommerce-navigation-cog-i')
            elementIcon.style.color = 'white';
            elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
        });
        setTimeout(function(){
            elementIcon.style.color = '#556ee6';
            elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-primary'
        },100)
    }
    else if(elementBtn.ariaExpanded === 'false'){
        elementIcon.style.color = 'white';
        elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
    }       
    else{
        elementIcon.style.color = '#556ee6';
    }
}
function onClickStyleNavigationCog2Id() {
    var elementBtn = document.getElementById('page-header-screen-dropdown')
    var elementIcon = document.getElementById('ecommerce-navigation-cog-i')
    if(elementBtn.ariaExpanded === 'true'){
        document.addEventListener('mouseup',()=>{
            var elementIcon = document.getElementById('ecommerce-navigation-cog-i')
            elementIcon.style.color = '#555b6d';
            elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-noti-icon'
        });
        setTimeout(function(){
            elementIcon.style.color = 'white';
            elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
        },100)
    }
    else if(elementBtn.ariaExpanded === 'false'){
        elementIcon.style.color = '#555b6d';
        elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-noti-icon'
    }       
    else{
        elementIcon.style.color = 'white';
    }
}

function onClickStyleNavigationCartId() {
    var elementBtn = document.getElementById('page-header-cart-dropdown')
    var elementIcon = document.getElementById('ecommerce-navigation-cart-i')
    if(elementBtn.ariaExpanded === 'false'){
        document.addEventListener('mouseup',()=>{
            var elementIcon = document.getElementById('ecommerce-navigation-cart-i')
            elementIcon.style.color = 'white';
            elementIcon.classList = 'bx bx-cart-alt mt-1 ecommerce-text-white-opacity-0-9'
        });
        setTimeout(function(){
            elementIcon.style.color = '#556ee6';
            elementIcon.classList = 'bx bx-cart-alt mt-1 ecommerce-text-primary'
        },50)
    }
    else if(elementBtn.ariaExpanded === 'true'){
        elementIcon.style.color = 'white';
        elementIcon.classList = 'bx bx-cart-alt mt-1 ecommerce-text-white-opacity-0-9'
    }       
    else{
        elementIcon.style.color = '#556ee6';
    }
}
function onClickStyleNavigationCart2Id() {
    var elementBtn = document.getElementById('page-header-cart-dropdown')
    var elementIcon = document.getElementById('ecommerce-navigation-cart-i')
    if(elementBtn.ariaExpanded === 'false'){
        document.addEventListener('mouseup',()=>{
            var elementIcon = document.getElementById('ecommerce-navigation-cart-i')
            elementIcon.style.color = '#555b6d';
            elementIcon.classList = 'bx bx-cart-alt mt-1 commerce-text-noti-icon'
        });
        setTimeout(function(){
            elementIcon.style.color = 'white';
            elementIcon.classList = 'bx bx-cart-alt mt-1 ecommerce-text-white-opacity-0-9'
        },50)
    }
    else if(elementBtn.ariaExpanded === 'true'){
        elementIcon.style.color = '#555b6d';
        elementIcon.classList = 'bx bx-cart-alt mt-1 commerce-text-noti-icon'
    }       
    else{
        elementIcon.style.color = 'white';
    }
}

function onClickStyleNavigationLockId() {
    var elementBtn = document.getElementById('page-header-user-dropdown')
    var elementIcon = document.getElementById('ecommerce-navigation-lock-i')
    if(elementBtn.ariaExpanded === 'false'){
        document.addEventListener('mouseup',()=>{
            var elementIcon = document.getElementById('ecommerce-navigation-lock-i')
            elementIcon.style.color = 'white';
            elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
        });
        setTimeout(function(){
            elementIcon.style.color = '#556ee6';
            elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-primary'
        },50)
    }
    else if(elementBtn.ariaExpanded === 'true'){
        elementIcon.style.color = 'white';
        elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
    }       
    else{
        elementIcon.style.color = '#556ee6';
    }
}
function onClickStyleNavigationLock2Id() {
    var elementBtn = document.getElementById('page-header-user-dropdown')
    var elementIcon = document.getElementById('ecommerce-navigation-lock-i')
    if(elementBtn.ariaExpanded === 'false'){
        document.addEventListener('mouseup',()=>{
            var elementIcon = document.getElementById('ecommerce-navigation-lock-i')
            elementIcon.style.color = '#555b6d';
            elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 commerce-text-noti-icon'
        });
        setTimeout(function(){
            elementIcon.style.color = 'white';
            elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
        },50)
    }
    else if(elementBtn.ariaExpanded === 'true'){
        elementIcon.style.color = '#555b6d';
        elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 commerce-text-noti-icon'
    }       
    else{
        elementIcon.style.color = 'white';
    }
}





function changeAppColor(arg,from) {
    if(arg === 'colored-theme'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme','colored');
        document.body.setAttribute('data-theme-navigation','colored');
        document.body.setAttribute('data-theme-sidebar','colored');
        document.body.setAttribute('data-theme-brand','colored');
        document.body.setAttribute('data-theme-brand-sm','colored');
        document.body.setAttribute('data-theme-brand-lg','colored');        

        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-topbar','dark');
        document.body.setAttribute('data-sidebar','colored');
        document.body.setAttribute('data-sidebar-size','large');
        document.body.setAttribute('data-layout','vertical');

        if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){
            var editHeadInnerHtml = document.head.innerHTML.replace('app.min.css','app-dark.min.css').replace('bootstrap.min.css','bootstrap-dark.min.css');
            document.head.innerHTML = editHeadInnerHtml;
        }
        else if(document.head.innerHTML.match('app-dark.min.css') !== null && document.head.innerHTML.match('bootstrap-dark.min.css') !== null){

        }        

        /* STYLES */
        document.getElementById("page-topbar").classList = '';
        document.getElementById("navbar-header-id").classList = 'navbar-header';
        document.getElementById("ecomnerce-navigation-home-span").style.color = 'white';
        document.getElementById("ecomnerce-navigation-home-i").style = 'color:white!important;opacity:0.8;';
        document.getElementById("vertical-menu-btn").classList = 'btn btn-sm px-4 font-size-20 header-item waves-effect';
        document.getElementById("main-menu-id").classList = 'btn header-item waves-effect ';
        document.getElementById("main-menu-id").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-cog-i").classList = 'bx bx-cog ecommerce-mt-0-5 ';
        document.getElementById("page-header-screen-dropdown").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-cart-i").classList = 'bx bx-cart-alt mt-1 ';
        document.getElementById("page-header-cart-dropdown").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ';
        document.getElementById("page-header-user-dropdown").setAttribute('onclick','');

        /* LOGO SM */
        document.getElementById("logo-1-span-id").classList = 'logo-sm bg-primary';   
        document.getElementById("logo-3-span-id").classList = 'logo-sm bg-primary';
        document.getElementById("logo-5-span-id").classList = 'logo-sm bg-primary';
        document.getElementById("logo-7-span-id").classList = 'logo-sm bg-primary';
        document.getElementById("logo-1-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';   
        document.getElementById("logo-3-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';
        document.getElementById("logo-5-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';        
        document.getElementById("logo-7-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';     
        
        /* LOGO LG */
        document.getElementById("logo-2-span-id").classList = 'logo-lg bg-primary';   
        document.getElementById("logo-4-span-id").classList = 'logo-lg bg-primary';
        document.getElementById("logo-6-span-id").classList = 'logo-lg bg-primary';
        document.getElementById("logo-8-span-id").classList = 'logo-lg bg-primary';
        document.getElementById("logo-2-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';   
        document.getElementById("logo-4-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';
        document.getElementById("logo-6-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';        
        document.getElementById("logo-8-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';            

        /* REPAIR ONCLICK ARGUMENTS */
        document.getElementById("colored-theme-link-id").setAttribute('onclick','changeAppColor("colored-theme","colored-theme")');
        document.getElementById("colored-navigation-link-id").setAttribute('onclick','changeAppColor("colored-navigation","colored-theme")');
        document.getElementById("colored-sidebar-link-id").setAttribute('onclick','changeAppColor("colored-sidebar","colored-theme")');
        document.getElementById("dark-theme-link-id").setAttribute('onclick','changeAppColor("dark-theme","colored-theme")');
        document.getElementById("dark-navigation-link-id").setAttribute('onclick','changeAppColor("dark-navigation","colored-theme")');
        document.getElementById("dark-sidebar-link-id").setAttribute('onclick','changeAppColor("dark-sidebar","colored-theme")');
        document.getElementById("light-theme-link-id").setAttribute('onclick','changeAppColor("light-theme","colored-theme")');
        document.getElementById("light-navigation-link-id").setAttribute('onclick','changeAppColor("light-navigation","colored-theme")');
        document.getElementById("light-sidebar-link-id").setAttribute('onclick','changeAppColor("light-sidebar","colored-theme")');                
    }
    else if(arg === 'colored-navigation'){
        /* DEFUALT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-navigation','colored');
        document.body.setAttribute('data-theme-brand-sm','colored');
        document.body.setAttribute('data-theme-brand-lg','colored');

        document.getElementById("navbar-header-id").classList = 'navbar-header';
            
        if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){
            /* APP THEME DESCRIPTION */
            document.body.setAttribute('data-topbar','light');
            document.body.setAttribute('data-sidebar','colored');
            document.body.setAttribute('data-sidebar-size','large');
            document.body.setAttribute('data-layout','vertical');

            /* STYLES */
            document.getElementById("ecomnerce-navigation-home-span").style = 'color:white!important';
            document.getElementById("ecomnerce-navigation-home-i").style = 'color:white!important;opacity:0.8';
            document.getElementById("page-topbar").classList = 'bg-primary';
            document.getElementById("vertical-menu-btn").classList = 'btn btn-sm px-4 font-size-20 header-item waves-effect text-white';
            document.getElementById("main-menu-id").classList = 'btn header-item waves-effect ecommerce-text-white';
            document.getElementById("main-menu-id").setAttribute('onclick','onClickStyleMainMenuId()');
            document.getElementById("ecommerce-navigation-cog-i").classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9';
            document.getElementById("page-header-screen-dropdown").setAttribute('onclick','onClickStyleNavigationCogId()');
            document.getElementById("ecommerce-navigation-cart-i").classList = 'bx bx-cart-alt mt-1 ecommerce-text-white-opacity-0-9';
            document.getElementById("page-header-cart-dropdown").setAttribute('onclick','onClickStyleNavigationCartId()');
            document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9';
            document.getElementById("page-header-user-dropdown").setAttribute('onclick','onClickStyleNavigationLockId()');
        }
        else if(document.head.innerHTML.match('app-dark.min.css') !== null && document.head.innerHTML.match('bootstrap-dark.min.css') !== null){
            /* APP THEME DESCRIPTION */
            document.body.setAttribute('data-topbar','dark');
            document.body.setAttribute('data-sidebar','colored');
            document.body.setAttribute('data-sidebar-size','large');
            document.body.setAttribute('data-layout','vertical');

            /* STYLES */
            document.getElementById("ecomnerce-navigation-home-span").style = 'color:white!important';
            document.getElementById("ecomnerce-navigation-home-i").style = 'color:white!important;opacity:0.8';
            document.getElementById("page-topbar").classList = 'bg-primary';
            document.getElementById("vertical-menu-btn").classList = 'btn btn-sm px-4 font-size-20 header-item waves-effect text-white';
            document.getElementById("main-menu-id").classList = 'btn header-item waves-effect ecommerce-text-white';
            document.getElementById("main-menu-id").setAttribute('onclick','onClickStyleMainMenuId()');
            document.getElementById("ecommerce-navigation-cog-i").classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9';
            document.getElementById("page-header-screen-dropdown").setAttribute('onclick','onClickStyleNavigationCogId()');
            document.getElementById("ecommerce-navigation-cart-i").classList = 'bx bx-cart-alt mt-1 ecommerce-text-white-opacity-0-9';
            document.getElementById("page-header-cart-dropdown").setAttribute('onclick','onClickStyleNavigationCartId()');
            document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9';
            document.getElementById("page-header-user-dropdown").setAttribute('onclick','onClickStyleNavigationLockId()');
        }

        /* LOGO SM */
        document.getElementById("logo-1-span-id").classList = 'logo-sm bg-primary';   
        document.getElementById("logo-3-span-id").classList = 'logo-sm bg-primary';
        document.getElementById("logo-5-span-id").classList = 'logo-sm bg-primary';
        document.getElementById("logo-7-span-id").classList = 'logo-sm bg-primary';
        document.getElementById("logo-1-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';   
        document.getElementById("logo-3-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';
        document.getElementById("logo-5-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';        
        document.getElementById("logo-7-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';     
        
        /* LOGO LG */
        document.getElementById("logo-2-span-id").classList = 'logo-lg bg-primary';   
        document.getElementById("logo-4-span-id").classList = 'logo-lg bg-primary';
        document.getElementById("logo-6-span-id").classList = 'logo-lg bg-primary';
        document.getElementById("logo-8-span-id").classList = 'logo-lg bg-primary';
        document.getElementById("logo-2-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';   
        document.getElementById("logo-4-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';
        document.getElementById("logo-6-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';        
        document.getElementById("logo-8-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';          

        /* REPAIR ONCLICK ARGUMENTS */
        document.getElementById("colored-theme-link-id").setAttribute('onclick','changeAppColor("colored-theme","colored-theme")');
        document.getElementById("colored-navigation-link-id").setAttribute('onclick','changeAppColor("colored-navigation","colored-theme")');
        document.getElementById("colored-sidebar-link-id").setAttribute('onclick','changeAppColor("colored-sidebar","colored-theme")');
        document.getElementById("dark-theme-link-id").setAttribute('onclick','changeAppColor("dark-theme","colored-theme")');
        document.getElementById("dark-navigation-link-id").setAttribute('onclick','changeAppColor("dark-navigation","colored-theme")');
        document.getElementById("dark-sidebar-link-id").setAttribute('onclick','changeAppColor("dark-sidebar","colored-theme")');
        document.getElementById("light-theme-link-id").setAttribute('onclick','changeAppColor("light-theme","colored-theme")');
        document.getElementById("light-navigation-link-id").setAttribute('onclick','changeAppColor("light-navigation","colored-theme")');
        document.getElementById("light-sidebar-link-id").setAttribute('onclick','changeAppColor("light-sidebar","colored-theme")');              
    }    
    else if(arg === 'colored-sidebar'){
        /* DEFAULT OLD THEME*/
        var oldDataThemeNavigation = document.body.getAttribute('data-theme-navigation');

        /* THEME DESCRIPTION */
        document.body.setAttribute('data-theme-sidebar','colored');

        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-sidebar','colored');

        /* REPAIR ONCLICK ARGUMENTS */
        document.getElementById("colored-theme-link-id").setAttribute('onclick','changeAppColor("colored-theme","colored-theme")');
        document.getElementById("colored-navigation-link-id").setAttribute('onclick','changeAppColor("colored-navigation","colored-theme")');
        document.getElementById("colored-sidebar-link-id").setAttribute('onclick','changeAppColor("colored-sidebar","colored-theme")');
        document.getElementById("dark-theme-link-id").setAttribute('onclick','changeAppColor("dark-theme","colored-theme")');
        document.getElementById("dark-navigation-link-id").setAttribute('onclick','changeAppColor("dark-navigation","colored-theme")');
        document.getElementById("dark-sidebar-link-id").setAttribute('onclick','changeAppColor("dark-sidebar","colored-theme")');
        document.getElementById("light-theme-link-id").setAttribute('onclick','changeAppColor("light-theme","colored-theme")');
        document.getElementById("light-navigation-link-id").setAttribute('onclick','changeAppColor("light-navigation","colored-theme")');
        document.getElementById("light-sidebar-link-id").setAttribute('onclick','changeAppColor("light-sidebar","colored-theme")');              
    }
    else if(arg === 'colored-brand-sm'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-brand-sm','colored');
        document.getElementById("logo-1-span-id").classList = 'logo-sm bg-primary';   
        document.getElementById("logo-3-span-id").classList = 'logo-sm bg-primary';
        document.getElementById("logo-5-span-id").classList = 'logo-sm bg-primary';
        document.getElementById("logo-7-span-id").classList = 'logo-sm bg-primary';
        document.getElementById("logo-1-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';   
        document.getElementById("logo-3-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';
        document.getElementById("logo-5-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';        
        document.getElementById("logo-7-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';         
    }    
    else if(arg === 'colored-brand-lg'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-brand-lg','colored');
        document.getElementById("logo-2-span-id").classList = 'logo-lg bg-primary';   
        document.getElementById("logo-4-span-id").classList = 'logo-lg bg-primary';
        document.getElementById("logo-6-span-id").classList = 'logo-lg bg-primary';
        document.getElementById("logo-8-span-id").classList = 'logo-lg bg-primary';
        document.getElementById("logo-2-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';   
        document.getElementById("logo-4-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';
        document.getElementById("logo-6-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';        
        document.getElementById("logo-8-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';         
    }        
    else if(arg === 'dark-theme'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme','dark');
        document.body.setAttribute('data-theme-navigation','dark');
        document.body.setAttribute('data-theme-sidebar','dark');
        document.body.setAttribute('data-theme-brand','dark');
        document.body.setAttribute('data-theme-brand-sm','dark');
        document.body.setAttribute('data-theme-brand-lg','dark');

        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-topbar','light');
        document.body.setAttribute('data-sidebar','dark');
        document.body.setAttribute('data-sidebar-size','large');
        document.body.setAttribute('data-layout','vertical');
    
        if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){
            var editHeadInnerHtml = document.head.innerHTML.replace('app.min.css','app-dark.min.css').replace('bootstrap.min.css','bootstrap-dark.min.css');
            document.head.innerHTML = editHeadInnerHtml;
        }
        else if(document.head.innerHTML.match('app-dark.min.css') !== null && document.head.innerHTML.match('bootstrap-dark.min.css') !== null){

        }

        /* STYLES */
        document.getElementById("page-topbar").classList = 'ecommerce-bg-dark';
        document.getElementById("navbar-header-id").classList = 'navbar-header ecommerce-bg-dark';
        document.getElementById("ecomnerce-navigation-home-span").style = '';
        document.getElementById("ecomnerce-navigation-home-i").style = '';
        document.getElementById("vertical-menu-btn").classList = 'btn btn-sm px-4 font-size-20 header-item waves-effect';
        document.getElementById("main-menu-id").classList = 'btn header-item waves-effect ';
        document.getElementById("main-menu-id").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-cog-i").classList = 'bx bx-cog ecommerce-mt-0-5 ';
        document.getElementById("page-header-screen-dropdown").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-cart-i").classList = 'bx bx-cart-alt mt-1 ';
        document.getElementById("page-header-cart-dropdown").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ';
        document.getElementById("page-header-user-dropdown").setAttribute('onclick','');

        /* LOGO SM */
        document.getElementById("logo-1-span-id").classList = 'logo-sm ecommerce-bg-dark';   
        document.getElementById("logo-3-span-id").classList = 'logo-sm ecommerce-bg-dark';
        document.getElementById("logo-5-span-id").classList = 'logo-sm ecommerce-bg-dark';
        document.getElementById("logo-7-span-id").classList = 'logo-sm ecommerce-bg-dark';
        document.getElementById("logo-1-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';   
        document.getElementById("logo-3-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';
        document.getElementById("logo-5-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';        
        document.getElementById("logo-7-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';          

        /* LOGO LG */
        document.getElementById("logo-2-span-id").classList = 'logo-lg ecommerce-bg-dark';   
        document.getElementById("logo-4-span-id").classList = 'logo-lg ecommerce-bg-dark';
        document.getElementById("logo-6-span-id").classList = 'logo-lg ecommerce-bg-dark';
        document.getElementById("logo-8-span-id").classList = 'logo-lg ecommerce-bg-dark';
        document.getElementById("logo-2-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';   
        document.getElementById("logo-4-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';
        document.getElementById("logo-6-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';        
        document.getElementById("logo-8-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';         

        /* REPAIR ONCLICK ARGUMENTS */
        document.getElementById("colored-theme-link-id").setAttribute('onclick','changeAppColor("colored-theme","dark-theme")');
        document.getElementById("colored-navigation-link-id").setAttribute('onclick','changeAppColor("colored-navigation","dark-theme")');
        document.getElementById("colored-sidebar-link-id").setAttribute('onclick','changeAppColor("colored-sidebar","dark-theme")');
        document.getElementById("dark-theme-link-id").setAttribute('onclick','changeAppColor("dark-theme","dark-theme")');
        document.getElementById("dark-navigation-link-id").setAttribute('onclick','changeAppColor("dark-navigation","dark-theme")');
        document.getElementById("dark-sidebar-link-id").setAttribute('onclick','changeAppColor("dark-sidebar","dark-theme")');
        document.getElementById("light-theme-link-id").setAttribute('onclick','changeAppColor("light-theme","dark-theme")');
        document.getElementById("light-navigation-link-id").setAttribute('onclick','changeAppColor("light-navigation","dark-theme")');
        document.getElementById("light-sidebar-link-id").setAttribute('onclick','changeAppColor("light-sidebar","dark-theme")');
    }
    else if(arg === 'dark-navigation'){
        /* DEFAULT OLD DATA THEME */
        var oldDataThemeNavigation = document.body.getAttribute('data-theme-navigation');
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-navigation','dark');
        document.body.setAttribute('data-theme-brand-sm','dark');
        document.body.setAttribute('data-theme-brand-lg','dark');        

        if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){
            /* APP THEME DESCRIPTION */
            document.body.setAttribute('data-topbar','dark');
            document.body.setAttribute('data-sidebar','dark');
            document.body.setAttribute('data-sidebar-size','large');
            document.body.setAttribute('data-layout','vertical');            
        }
        else if(document.head.innerHTML.match('app-dark.min.css') !== null && document.head.innerHTML.match('bootstrap-dark.min.css') !== null){
            changeAppColor('dark-theme');
        }

        /* STYLES */
        document.getElementById("page-topbar").classList = 'ecommerce-bg-dark';
        document.getElementById("navbar-header-id").classList = 'navbar-header ecommerce-bg-dark';
        document.getElementById("ecomnerce-navigation-home-span").style = '';
        document.getElementById("ecomnerce-navigation-home-i").style = '';
        document.getElementById("vertical-menu-btn").classList = 'btn btn-sm px-4 font-size-20 header-item waves-effect';
        document.getElementById("main-menu-id").classList = 'btn header-item waves-effect ';
        document.getElementById("main-menu-id").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-cog-i").classList = 'bx bx-cog ecommerce-mt-0-5 ';
        document.getElementById("page-header-screen-dropdown").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-cart-i").classList = 'bx bx-cart-alt mt-1 ';
        document.getElementById("page-header-cart-dropdown").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ';
        document.getElementById("page-header-user-dropdown").setAttribute('onclick','');

        /* LOGO SM */
        document.getElementById("logo-1-span-id").classList = 'logo-sm ecommerce-bg-dark';   
        document.getElementById("logo-3-span-id").classList = 'logo-sm ecommerce-bg-dark';
        document.getElementById("logo-5-span-id").classList = 'logo-sm ecommerce-bg-dark';
        document.getElementById("logo-7-span-id").classList = 'logo-sm ecommerce-bg-dark';
        document.getElementById("logo-1-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';   
        document.getElementById("logo-3-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';
        document.getElementById("logo-5-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';        
        document.getElementById("logo-7-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';          

        /* LOGO LG */
        document.getElementById("logo-2-span-id").classList = 'logo-lg ecommerce-bg-dark';   
        document.getElementById("logo-4-span-id").classList = 'logo-lg ecommerce-bg-dark';
        document.getElementById("logo-6-span-id").classList = 'logo-lg ecommerce-bg-dark';
        document.getElementById("logo-8-span-id").classList = 'logo-lg ecommerce-bg-dark';
        document.getElementById("logo-2-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';   
        document.getElementById("logo-4-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';
        document.getElementById("logo-6-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';        
        document.getElementById("logo-8-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';          

        /* REPAIR ONCLICK ARGUMENTS */
        document.getElementById("colored-theme-link-id").setAttribute('onclick','changeAppColor("colored-theme","dark-theme")');
        document.getElementById("colored-navigation-link-id").setAttribute('onclick','changeAppColor("colored-navigation","dark-theme")');
        document.getElementById("colored-sidebar-link-id").setAttribute('onclick','changeAppColor("colored-sidebar","dark-theme")');
        document.getElementById("dark-theme-link-id").setAttribute('onclick','changeAppColor("dark-theme","dark-theme")');
        document.getElementById("dark-navigation-link-id").setAttribute('onclick','changeAppColor("dark-navigation","dark-theme")');
        document.getElementById("dark-sidebar-link-id").setAttribute('onclick','changeAppColor("dark-sidebar","dark-theme")');
        document.getElementById("light-theme-link-id").setAttribute('onclick','changeAppColor("light-theme","dark-theme")');
        document.getElementById("light-navigation-link-id").setAttribute('onclick','changeAppColor("light-navigation","dark-theme")');
        document.getElementById("light-sidebar-link-id").setAttribute('onclick','changeAppColor("light-sidebar","dark-theme")');        
    }
    else if(arg === 'dark-sidebar'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-sidebar','dark');

        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-sidebar','dark');



        /* REPAIR ONCLICK ARGUMENTS */
        document.getElementById("colored-theme-link-id").setAttribute('onclick','changeAppColor("colored-theme","dark-theme")');
        document.getElementById("colored-navigation-link-id").setAttribute('onclick','changeAppColor("colored-navigation","dark-theme")');
        document.getElementById("colored-sidebar-link-id").setAttribute('onclick','changeAppColor("colored-sidebar","dark-theme")');
        document.getElementById("dark-theme-link-id").setAttribute('onclick','changeAppColor("dark-theme","dark-theme")');
        document.getElementById("dark-navigation-link-id").setAttribute('onclick','changeAppColor("dark-navigation","dark-theme")');
        document.getElementById("dark-sidebar-link-id").setAttribute('onclick','changeAppColor("dark-sidebar","dark-theme")');
        document.getElementById("light-theme-link-id").setAttribute('onclick','changeAppColor("light-theme","dark-theme")');
        document.getElementById("light-navigation-link-id").setAttribute('onclick','changeAppColor("light-navigation","dark-theme")');
        document.getElementById("light-sidebar-link-id").setAttribute('onclick','changeAppColor("light-sidebar","dark-theme")');        
    }
    else if(arg === 'dark-brand-sm'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-brand-sm','dark');
        document.getElementById("logo-1-span-id").classList = 'logo-sm ecommerce-bg-dark';   
        document.getElementById("logo-3-span-id").classList = 'logo-sm ecommerce-bg-dark';
        document.getElementById("logo-5-span-id").classList = 'logo-sm ecommerce-bg-dark';
        document.getElementById("logo-7-span-id").classList = 'logo-sm ecommerce-bg-dark';
        document.getElementById("logo-1-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';   
        document.getElementById("logo-3-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';
        document.getElementById("logo-5-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';        
        document.getElementById("logo-7-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-dark.png';          
    }    
    else if(arg === 'dark-brand-lg'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-brand-lg','dark');
        document.getElementById("logo-2-span-id").classList = 'logo-lg ecommerce-bg-dark';   
        document.getElementById("logo-4-span-id").classList = 'logo-lg ecommerce-bg-dark';
        document.getElementById("logo-6-span-id").classList = 'logo-lg ecommerce-bg-dark';
        document.getElementById("logo-8-span-id").classList = 'logo-lg ecommerce-bg-dark';
        document.getElementById("logo-2-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';   
        document.getElementById("logo-4-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';
        document.getElementById("logo-6-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';        
        document.getElementById("logo-8-id").src = '/app/root/assets/images/ecommerce-logo-long-e-dark.png';        
    }        
    else if(arg === 'light-theme'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme','light');
        document.body.setAttribute('data-theme-navigation','light');
        document.body.setAttribute('data-theme-sidebar','light');
        document.body.setAttribute('data-theme-brand','light');
        document.body.setAttribute('data-theme-brand-sm','light');
        document.body.setAttribute('data-theme-brand-lg','light');

        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-topbar','light');
        document.body.setAttribute('data-sidebar','light');
        document.body.setAttribute('data-sidebar-size','large');
        document.body.setAttribute('data-layout','vertical');
    
        /* STYLES */
        document.getElementById("page-topbar").classList = 'bg-white';
        document.getElementById("navbar-header-id").classList = 'navbar-header bg-white';
        document.getElementById("ecomnerce-navigation-home-span").style = '';
        document.getElementById("ecomnerce-navigation-home-i").style = '';
        document.getElementById("vertical-menu-btn").classList = 'btn btn-sm px-4 font-size-20 header-item waves-effect';
        document.getElementById("main-menu-id").classList = 'btn header-item waves-effect ecommerce-text-noti-icon';
        document.getElementById("main-menu-id").setAttribute('onclick','onClickStyleMainMenu2Id()');
        document.getElementById("ecommerce-navigation-cog-i").classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-noti-icon';
        document.getElementById("page-header-screen-dropdown").setAttribute('onclick','onClickStyleNavigationCog2Id()');
        document.getElementById("ecommerce-navigation-cart-i").classList = 'bx bx-cart-alt mt-1 ecommerce-text-noti-icon';
        document.getElementById("page-header-cart-dropdown").setAttribute('onclick','onClickStyleNavigationCart2Id()');
        document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-noti-icon';
        document.getElementById("page-header-user-dropdown").setAttribute('onclick','onClickStyleNavigationLock2Id()');

        /* LOGO SM */
        document.getElementById("logo-1-span-id").classList = 'logo-sm bg-white';   
        document.getElementById("logo-3-span-id").classList = 'logo-sm bg-white';
        document.getElementById("logo-5-span-id").classList = 'logo-sm bg-white';
        document.getElementById("logo-7-span-id").classList = 'logo-sm bg-white';
        document.getElementById("logo-1-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png';   
        document.getElementById("logo-3-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png';
        document.getElementById("logo-5-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png';        
        document.getElementById("logo-7-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png'; 

        /* LOGO LG */
        document.getElementById("logo-2-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-4-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-6-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-8-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-2-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';   
        document.getElementById("logo-4-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';
        document.getElementById("logo-6-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';         
        document.getElementById("logo-8-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';          

        if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){

        }
        else if(document.head.innerHTML.match('app-dark.min.css') !== null && document.head.innerHTML.match('bootstrap-dark.min.css') !== null){
            var editHeadInnerHtml = document.head.innerHTML.replace('app-dark.min.css','app.min.css').replace('bootstrap-dark.min.css','bootstrap.min.css');
            document.head.innerHTML = editHeadInnerHtml;
        }

        /* REPAIR ONCLICK ARGUMENTS */
        document.getElementById("colored-theme-link-id").setAttribute('onclick','changeAppColor("colored-theme","light-theme")');
        document.getElementById("colored-navigation-link-id").setAttribute('onclick','changeAppColor("colored-navigation","light-theme")');
        document.getElementById("colored-sidebar-link-id").setAttribute('onclick','changeAppColor("colored-sidebar","light-theme")');
        document.getElementById("dark-theme-link-id").setAttribute('onclick','changeAppColor("dark-theme","light-theme")');
        document.getElementById("dark-navigation-link-id").setAttribute('onclick','changeAppColor("dark-navigation","light-theme")');
        document.getElementById("dark-sidebar-link-id").setAttribute('onclick','changeAppColor("dark-sidebar","light-theme")');
        document.getElementById("light-theme-link-id").setAttribute('onclick','changeAppColor("light-theme","light-theme")');
        document.getElementById("light-navigation-link-id").setAttribute('onclick','changeAppColor("light-navigation","light-theme")');
        document.getElementById("light-sidebar-link-id").setAttribute('onclick','changeAppColor("light-sidebar","light-theme")');        
    }
    else if(arg === 'light-navigation'){
        /* DEFAULT OLD THEME */
        var oldDataThemeNavigation = document.body.getAttribute('data-theme-navigation');

        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-navigation','light');
        document.body.setAttribute('data-theme-brand-sm','light');
        document.body.setAttribute('data-theme-brand-lg','light');

        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-topbar','light');
        document.body.setAttribute('data-sidebar','light');
        document.body.setAttribute('data-sidebar-size','large');
        document.body.setAttribute('data-layout','vertical');
    
        /* STYLES */
        document.getElementById("page-topbar").classList = 'bg-white';
        document.getElementById("navbar-header-id").classList = 'navbar-header bg-white';
        document.getElementById("ecomnerce-navigation-home-span").style = '';
        document.getElementById("ecomnerce-navigation-home-i").style = '';
        document.getElementById("vertical-menu-btn").classList = 'btn btn-sm px-4 font-size-20 header-item waves-effect';
        document.getElementById("main-menu-id").classList = 'btn header-item waves-effect ecommerce-text-noti-icon';
        document.getElementById("main-menu-id").setAttribute('onclick','onClickStyleMainMenu2Id()');
        document.getElementById("ecommerce-navigation-cog-i").classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-noti-icon';
        document.getElementById("page-header-screen-dropdown").setAttribute('onclick','onClickStyleNavigationCog2Id()');
        document.getElementById("ecommerce-navigation-cart-i").classList = 'bx bx-cart-alt mt-1 ecommerce-text-noti-icon';
        document.getElementById("page-header-cart-dropdown").setAttribute('onclick','onClickStyleNavigationCart2Id()');
        document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-noti-icon';
        document.getElementById("page-header-user-dropdown").setAttribute('onclick','onClickStyleNavigationLock2Id()');

        /* LOGO SM */
        document.getElementById("logo-1-span-id").classList = 'logo-sm bg-white';   
        document.getElementById("logo-3-span-id").classList = 'logo-sm bg-white';
        document.getElementById("logo-5-span-id").classList = 'logo-sm bg-white';
        document.getElementById("logo-7-span-id").classList = 'logo-sm bg-white';
        document.getElementById("logo-1-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png';   
        document.getElementById("logo-3-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png';
        document.getElementById("logo-5-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png';        
        document.getElementById("logo-7-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png'; 

        /* LOGO LG */
        document.getElementById("logo-2-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-4-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-6-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-8-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-2-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';   
        document.getElementById("logo-4-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';
        document.getElementById("logo-6-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';         
        document.getElementById("logo-8-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';          

        /* REPAIR ONCLICK ARGUMENTS */
        document.getElementById("colored-theme-link-id").setAttribute('onclick','changeAppColor("colored-theme","light-theme")');
        document.getElementById("colored-navigation-link-id").setAttribute('onclick','changeAppColor("colored-navigation","light-theme")');
        document.getElementById("colored-sidebar-link-id").setAttribute('onclick','changeAppColor("colored-sidebar","light-theme")');
        document.getElementById("dark-theme-link-id").setAttribute('onclick','changeAppColor("dark-theme","light-theme")');
        document.getElementById("dark-navigation-link-id").setAttribute('onclick','changeAppColor("dark-navigation","light-theme")');
        document.getElementById("dark-sidebar-link-id").setAttribute('onclick','changeAppColor("dark-sidebar","light-theme")');
        document.getElementById("light-theme-link-id").setAttribute('onclick','changeAppColor("light-theme","light-theme")');
        document.getElementById("light-navigation-link-id").setAttribute('onclick','changeAppColor("light-navigation","light-theme")');
        document.getElementById("light-sidebar-link-id").setAttribute('onclick','changeAppColor("light-sidebar","light-theme")');                
    }
    else if(arg === 'light-sidebar'){
        /* DEFAULT OLD THEME */
        var oldDataThemeNavigation = document.body.getAttribute('data-theme-navigation');
        
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-sidebar','light');

        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-sidebar','light');

        /* STYLES */
        document.getElementById("ecomnerce-navigation-home-span").style = '';
        document.getElementById("ecomnerce-navigation-home-i").style = '';

        /* REPAIR ONCLICK ARGUMENTS */
        document.getElementById("colored-theme-link-id").setAttribute('onclick','changeAppColor("colored-theme","light-theme")');
        document.getElementById("colored-navigation-link-id").setAttribute('onclick','changeAppColor("colored-navigation","light-theme")');
        document.getElementById("colored-sidebar-link-id").setAttribute('onclick','changeAppColor("colored-sidebar","light-theme")');
        document.getElementById("dark-theme-link-id").setAttribute('onclick','changeAppColor("dark-theme","light-theme")');
        document.getElementById("dark-navigation-link-id").setAttribute('onclick','changeAppColor("dark-navigation","light-theme")');
        document.getElementById("dark-sidebar-link-id").setAttribute('onclick','changeAppColor("dark-sidebar","light-theme")');
        document.getElementById("light-theme-link-id").setAttribute('onclick','changeAppColor("light-theme","light-theme")');
        document.getElementById("light-navigation-link-id").setAttribute('onclick','changeAppColor("light-navigation","light-theme")');
        document.getElementById("light-sidebar-link-id").setAttribute('onclick','changeAppColor("light-sidebar","light-theme")');                
    }
    else if(arg === 'light-brand-sm'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-brand-sm','light');
        document.getElementById("logo-1-span-id").classList = 'logo-sm bg-white';   
        document.getElementById("logo-3-span-id").classList = 'logo-sm bg-white';
        document.getElementById("logo-5-span-id").classList = 'logo-sm bg-white';
        document.getElementById("logo-7-span-id").classList = 'logo-sm bg-white';
        document.getElementById("logo-1-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png';   
        document.getElementById("logo-3-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png';
        document.getElementById("logo-5-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png';        
        document.getElementById("logo-7-id").src = '/app/root/assets/images/ecommerce-logo-mini-e-light.png';        
    }
    else if(arg === 'light-brand-lg'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-brand-lg','light');
        document.getElementById("logo-2-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-4-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-6-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-8-span-id").classList = 'logo-lg bg-white';
        document.getElementById("logo-2-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';   
        document.getElementById("logo-4-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';
        document.getElementById("logo-6-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';         
        document.getElementById("logo-8-id").src = '/app/root/assets/images/ecommerce-logo-long-e-light.png';  
    }
}


setTimeout(function(){
    /* DEFAULT VIEW */
    document.body.classList = 'fixedwidth';
    /* DEFAULT THEME DESCRIPTION */
    document.body.setAttribute('data-theme','light');
    document.body.setAttribute('data-theme-navigation','light');
    document.body.setAttribute('data-theme-sidebar','light');
    document.body.setAttribute('data-theme-brand-sm','light');
    document.body.setAttribute('data-theme-brand-lg','light');
    /* APP THEME DESCRIPTION */
    document.body.setAttribute('data-topbar','light');
    document.body.setAttribute('data-sidebar','light');
    document.body.setAttribute('data-sidebar-size','large');
    document.body.setAttribute('data-layout','vertical');

    resizeProcess();
    
    

},500)