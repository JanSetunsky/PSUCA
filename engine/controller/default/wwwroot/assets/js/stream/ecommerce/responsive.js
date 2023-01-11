function onClickStyleMainMenuId() {
    var element = document.getElementById('main-menu-id')
    if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){
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
    else{
        if(element.ariaExpanded === 'false'){
            document.addEventListener('mouseup',()=>{
                var element = document.getElementById('main-menu-id')
                element.style.color = 'white';
                element.classList = 'btn header-item waves-effect ecommerce-text-white'
            });
            setTimeout(function(){
                element.style.color = 'white';
                element.classList = 'btn header-item waves-effect ecommerce-text-white'
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
}
function onClickStyleMainMenu2Id() {
    var element = document.getElementById('main-menu-id')
    if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){
        if(element.ariaExpanded === 'false'){
            document.addEventListener('mouseup',()=>{
                var element = document.getElementById('main-menu-id')
                element.style.color = '#555b6d';
                element.classList = 'btn header-item waves-effect ecommerce-text-noti-icon'
            });
            setTimeout(function(){
                element.style.color = '#555b6d';
                element.classList = 'btn header-item waves-effect ecommerce-text-noti-icon'
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
    else{
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
}
function onClickStyleNavigationCogId() {
    var elementBtn = document.getElementById('page-header-screen-dropdown')
    var elementIcon = document.getElementById('ecommerce-navigation-cog-i')
    if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){
        if(elementBtn.ariaExpanded === 'false'){
            document.addEventListener('mouseup',()=>{
                var elementIcon = document.getElementById('ecommerce-navigation-cog-i')
                elementIcon.style.color = 'white';
                elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
            });
            setTimeout(function(){
                elementIcon.style.color = '#556ee6';
                elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-primary'
            },50)
        }
        else if(elementBtn.ariaExpanded === 'true'){
            elementIcon.style.color = 'white';
            elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
        }       
        else{
            elementIcon.style.color = '#556ee6';
        }
    }
    else{
        if(elementBtn.ariaExpanded === 'false'){
            document.addEventListener('mouseup',()=>{
                var elementIcon = document.getElementById('ecommerce-navigation-cog-i')
                elementIcon.style.color = 'white';
                elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
            });
            setTimeout(function(){
                elementIcon.style.color = 'white';
                elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
            },50)
        }
        else if(elementBtn.ariaExpanded === 'true'){
            elementIcon.style.color = 'white';
            elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
        }       
        else{
            elementIcon.style.color = 'white';
        }
    }

}
function onClickStyleNavigationCog2Id() {
    var elementBtn = document.getElementById('page-header-screen-dropdown')
    var elementIcon = document.getElementById('ecommerce-navigation-cog-i')
    if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){
        if(elementBtn.ariaExpanded === 'true'){
            document.addEventListener('mouseup',()=>{
                var elementIcon = document.getElementById('ecommerce-navigation-cog-i')
                elementIcon.style.color = '#555b6d';
                elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-noti-icon'
            });
            setTimeout(function(){
                elementIcon.style.color = '#555b6d';
                elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-noti-icon'          
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
    else{
        if(elementBtn.ariaExpanded === 'false'){
            document.addEventListener('mouseup',()=>{
                var elementIcon = document.getElementById('ecommerce-navigation-cog-i')
                elementIcon.style.color = '#555b6d';
                elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 commerce-text-noti-icon'
            });
            document.removeEventListener('mousedown',()=>{
    
            });        
            setTimeout(function(){
                elementIcon.style.color = 'white';
                elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
            },50)
        }
        else if(elementBtn.ariaExpanded === 'true'){
            elementIcon.style.color = '#555b6d';
            elementIcon.classList = 'bx bx-cog ecommerce-mt-0-5 commerce-text-noti-icon'
        }       
        else{
            elementIcon.style.color = 'white';
        }
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
        document.removeEventListener('mousedown',()=>{

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
    if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){
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
    else{
        if(elementBtn.ariaExpanded === 'false'){
            document.addEventListener('mouseup',()=>{
                var elementIcon = document.getElementById('ecommerce-navigation-lock-i')
                elementIcon.style.color = 'white';
                elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
            });
            setTimeout(function(){
                elementIcon.style.color = 'white';
                elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
            },50)
        }
        else if(elementBtn.ariaExpanded === 'true'){
            elementIcon.style.color = 'white';
            elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9'
        }       
        else{
            elementIcon.style.color = 'white';
        }
    }

}
function onClickStyleNavigationLock2Id() {
    var elementBtn = document.getElementById('page-header-user-dropdown')
    var elementIcon = document.getElementById('ecommerce-navigation-lock-i')
    if(document.head.innerHTML.match('app.min.css') !== null && document.head.innerHTML.match('bootstrap.min.css') !== null){
        if(elementBtn.ariaExpanded === 'true'){
            document.addEventListener('mouseup',()=>{
                var elementIcon = document.getElementById('ecommerce-navigation-lock-i')
                elementIcon.style.color = '#555b6d';
                elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-noti-icon'
            });
            document.removeEventListener('mousedown',()=>{
    
            });               
            setTimeout(function(){
                elementIcon.style.color = '#555b6d';
                elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-noti-icon'          
            },100)
        }
        else if(elementBtn.ariaExpanded === 'false'){
            elementIcon.style.color = '#555b6d';
            elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-noti-icon'
        }       
        else{
            elementIcon.style.color = 'white';
        }
    }
    else{
        if(elementBtn.ariaExpanded === 'false'){
            document.addEventListener('mouseup',()=>{
                var elementIcon = document.getElementById('ecommerce-navigation-lock-i')
                elementIcon.style.color = '#555b6d';
                elementIcon.classList = 'bx bx-lock ecommerce-mt-0-5 commerce-text-noti-icon'
            });
            document.removeEventListener('mousedown',()=>{
    
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
}





function changeAppColor(arg) {
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
        document.getElementById("ecommerce-navigation-cog-i").style = '';
        document.getElementById("page-header-screen-dropdown").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-cart-i").classList = 'bx bx-cart-alt mt-1 ';
        document.getElementById("ecommerce-navigation-cart-i").style = '';
        document.getElementById("page-header-cart-dropdown").setAttribute('onclick','');
        const conLock = document.getElementById("ecommerce-navigation-lock-i") || false;
        if(conLock){
            document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ';
            document.getElementById("ecommerce-navigation-lock-i").style = '';
        }
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
            const conLock = document.getElementById("ecommerce-navigation-lock-i") || false;
            if(conLock){
                document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9';
                document.getElementById("page-header-user-dropdown").setAttribute('onclick','onClickStyleNavigationLockId()');
            }
            
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
            const conLock = document.getElementById("ecommerce-navigation-lock-i") || false;
            if(conLock){
                document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-white-opacity-0-9';
                document.getElementById("page-header-user-dropdown").setAttribute('onclick','onClickStyleNavigationLockId()');
            }            
            
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

    }    
    else if(arg === 'colored-sidebar'){
        /* DEFAULT OLD THEME*/
        var oldDataThemeNavigation = document.body.getAttribute('data-theme-navigation');

        /* THEME DESCRIPTION */
        document.body.setAttribute('data-theme-sidebar','colored');

        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-sidebar','colored');

        /* STYLES */
        document.getElementById("ecomnerce-navigation-home-span").style = 'color:white!important';
        document.getElementById("ecomnerce-navigation-home-i").style = 'color:white!important;opacity:0.8';        

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
        document.getElementById("ecommerce-navigation-cog-i").style = '';
        document.getElementById("page-header-screen-dropdown").setAttribute('onclick','');
        document.getElementById("ecommerce-navigation-cart-i").classList = 'bx bx-cart-alt mt-1 ';
        document.getElementById("ecommerce-navigation-cart-i").style = '';
        document.getElementById("page-header-cart-dropdown").setAttribute('onclick','');
        const conLock = document.getElementById("ecommerce-navigation-lock-i") || false;
        if(conLock){
            document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ';
            document.getElementById("ecommerce-navigation-lock-i").style = '';
            document.getElementById("page-header-user-dropdown").setAttribute('onclick','');
        }                    
        

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
        const conLock = document.getElementById("ecommerce-navigation-lock-i") || false;
        if(conLock){
            document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ';
            document.getElementById("page-header-user-dropdown").setAttribute('onclick','');
        }                            
        

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
       
    }
    else if(arg === 'dark-sidebar'){
        /* DEFAULT THEME DESCRIPTION */
        document.body.setAttribute('data-theme-sidebar','dark');

        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-sidebar','dark');
       
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
        document.getElementById("ecommerce-navigation-cog-i").style = '';
        document.getElementById("page-header-screen-dropdown").setAttribute('onclick','onClickStyleNavigationCog2Id()');
        document.getElementById("ecommerce-navigation-cart-i").classList = 'bx bx-cart-alt mt-1 ecommerce-text-noti-icon';
        document.getElementById("ecommerce-navigation-cart-i").style = '';
        document.getElementById("page-header-cart-dropdown").setAttribute('onclick','onClickStyleNavigationCart2Id()');
        const conLock = document.getElementById("ecommerce-navigation-lock-i") || false;
        if(conLock){
            document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-noti-icon';
            document.getElementById("ecommerce-navigation-lock-i").style = '';
            document.getElementById("page-header-user-dropdown").setAttribute('onclick','onClickStyleNavigationLock2Id()');
        }                                    
        

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
        const conLock = document.getElementById("ecommerce-navigation-lock-i") || false;
        if(conLock){
            document.getElementById("ecommerce-navigation-lock-i").classList = 'bx bx-lock ecommerce-mt-0-5 ecommerce-text-noti-icon';
            document.getElementById("page-header-user-dropdown").setAttribute('onclick','onClickStyleNavigationLock2Id()');
        }                    
        

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

        /* DEFAULT THEME DESCRIPTION */
        var dataTheme = document.body.getAttribute('data-theme');
        var dataThemeNavigation = document.body.getAttribute('data-theme-navigation');
        var dataThemeSidebar = document.body.getAttribute('data-theme-sidebar');
        var dataThemeBrandSm = document.body.getAttribute('data-theme-brand-sm');
        var dataThemeBrandLg = document.body.getAttribute('data-theme-brand-lg');      

        /* APP THEME DESCRIPTION */
        var dataTopbar = document.body.getAttribute('data-topbar');
        var dataSidebar = document.body.getAttribute('data-sidebar');
        var dataSidebarSize = document.body.getAttribute('data-sidebar-size');
        var dataLayout = document.body.getAttribute('data-layout');

        /* RESPONSIVE STYLE */
        var responsiveStyleResult = responsiveStyle();

        /* COOKIE CONSTRUCTOR */
        var constructorCookies = '[{"rstyle":"'+responsiveStyleResult+'","dtheme":"'+dataTheme+'","dthemenav":"'+dataThemeNavigation+'","dthemesidebar":"'+dataThemeSidebar+'","dthemebrandsm":"'+dataThemeBrandSm+'","dthemebrandlg":"'+dataThemeBrandLg+'","atopbar":"'+dataTopbar+'","asidebar":"'+dataSidebar+'","asidebarsize":"'+dataSidebarSize+'","alayout":"'+dataLayout+'"}]'

        /* DATE EXPIRE */
        const d = new Date();
        d.setTime(d.getTime()+(365*24*60*60*1000));
        var utcdate = d.toUTCString();
        console.log(utcdate)

        /* COOKIE SAVE */
        var cookieData = "cth="+constructorCookies+"; domain=localhost; path=/; expires="+utcdate+"; secure=false; samesite=strict;";
        document.cookie = cookieData;
}

function responsiveStyle() {
    var bodyClassList = document.body.classList;
    if(bodyClassList.value.match('fullwidth') !== null){
        return 'fullwidth'
    }
    else if(bodyClassList.value.match('fixedwidth') !== null){
        return 'fixedwidth'
    }
    else{
        /* DEFAULT */
        return 'fixedwidth'
    }
}

function getThemeCookie(arg) {
    let name = arg+"=";
    let decodedCookie = decodeURIComponent(document.cookie);
    let ca = decodedCookie.split(';');
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if(c.indexOf(name) == 0){
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function analysisTheme() {
    var ck = getThemeCookie('cth');
    console.log(ck);
    if(ck !== '' && ck !== "''"){
        var themeData = JSON.parse(ck);
        document.body.classList = themeData[0].rstyle;
    
        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-topbar',themeData[0].atopbar);
        document.body.setAttribute('data-sidebar',themeData[0].asidebar);
        document.body.setAttribute('data-sidebar-size',themeData[0].asidebarsize);
        document.body.setAttribute('data-layout',themeData[0].alayout);

        if(document.body.classList.value.match('fixedwidth') !== null){
            fixedWidthResponsive();verticalMenuControlFixedWidth();resizeListener();
        }
        else if(document.body.classList.value.match('fullwidth') !== null){
            fullWidthResponsive();verticalMenuControlFullWidth();resizeListener();
        }
        else{
            /* DEFAULT */
            fixedWidthResponsive();verticalMenuControlFixedWidth();resizeListener();
        }
    
        if(themeData[0].dtheme == 'colored'){
            changeAppColor('colored-theme');
        }
        else if(themeData[0].dtheme == 'dark'){
            changeAppColor('dark-theme');
        }
        else if(themeData[0].dtheme == 'light'){
            changeAppColor('light-theme');
        }
    
        if(themeData[0].dthemenav == 'colored'){
            changeAppColor('colored-navigation');
        }
        else if(themeData[0].dthemenav == 'dark'){
            changeAppColor('dark-navigation');
        }
        else if(themeData[0].dthemenav == 'light'){
            changeAppColor('light-navigation');
        }
    
        if(themeData[0].dthemesidebar == 'colored'){
            changeAppColor('colored-sidebar');
        }
        else if(themeData[0].dthemesidebar == 'dark'){
            changeAppColor('dark-sidebar');
        }
        else if(themeData[0].dthemesidebar == 'light'){
            changeAppColor('light-sidebar');
        }
    
        if(themeData[0].dthemebrandsm == 'colored'){
            changeAppColor('colored-brand-sm');
        }
        else if(themeData[0].dthemebrandsm == 'dark'){
            changeAppColor('dark-brand-sm');
        }
        else if(themeData[0].dthemebrandsm == 'light'){
            changeAppColor('light-brand-sm');
        }
    
        if(themeData[0].dthemebrandlg == 'colored'){
            changeAppColor('colored-brand-lg');
        }
        else if(themeData[0].dthemebrandlg == 'dark'){
            changeAppColor('dark-brand-lg');
        }
        else if(themeData[0].dthemebrandlg == 'light'){
            changeAppColor('light-brand-lg');
        }    
    }
    else{
        /* THEME LIGHT */
        changeAppColor('light-theme');

        /* APP THEME DESCRIPTION */
        document.body.setAttribute('data-topbar','light');
        document.body.setAttribute('data-sidebar','light');
        document.body.setAttribute('data-sidebar-size','large');
        document.body.setAttribute('data-layout','vertical');
        
        /* DEFAULT RESIZE */
        fixedWidthResponsive();verticalMenuControlFixedWidth();resizeListener();

    }
}











function fullWidthResponsive() {

    document.body.setAttribute('data-responsive','fullwidth')
    
    var mainContent = document.getElementById("main-content-id");
    var megaMenuDrop = document.getElementById("mega-menu-dropdown-id");
    var navbarBrandBox = document.getElementById("navbar-brand-box-id");
    var verticalMenu = document.getElementById("vertical-menu-id");
    var verticalMenuBtn = document.getElementById("vertical-menu-btn");
    var navbarHeader = document.getElementById("navbar-header-id");

    document.body.classList = 'sidebar-enable vertical-collpsed fullwidth';

    /* MAIN CONTENT */
    mainContent.style.width = 'auto';
    mainContent.style.position = 'relative';
    mainContent.style.left = '0';
    mainContent.style.transform = 'translate(0, 0)';
    mainContent.style.marginLeft = '70px';
    mainContent.style.paddingLeft = '0px';
    /* MEGA MENU BUTTON */
    megaMenuDrop.style.display = 'block!important';
    /* NAVBAR BRAND BOX */
    navbarBrandBox.style.width = '250px';
    /* NAVBAR HEADER */
    navbarHeader.style.width = '100%';
    /* VERTICAL MENU */
    verticalMenu.style.display = 'block';
    verticalMenu.style.width = '250px';
    /* VERTICAL MENU BTN */
    verticalMenuBtn.style.display = 'block';  

    document.body.classList = 'sidebar-enable vertical-collpsed fullwidth';

    resizeProcess();
}

function fixedWidthResponsive() {

    document.body.setAttribute('data-responsive','fixedwidth')

    var mainContent = document.getElementById("main-content-id");
    var megaMenuDrop = document.getElementById("mega-menu-dropdown-id");
    var navbarBrandBox = document.getElementById("navbar-brand-box-id");
    var verticalMenu = document.getElementById("vertical-menu-id");
    var verticalMenuBtn = document.getElementById("vertical-menu-btn");
    var navbarHeader = document.getElementById("navbar-header-id");
    let documentInnerWidth = document.defaultView.parent.innerWidth;

    if(documentInnerWidth > 1222){
        /* MAIN CONTENT */
        mainContent.style.width = '1200px';
        mainContent.style.left = '50%';
        mainContent.style.transform = 'translate(-50%, 0%)';
        mainContent.style.position = 'relative';
        mainContent.style.marginLeft = '0px';
        mainContent.style.paddingleft = '0px';
        /* MEGA MENU BUTTON */
        megaMenuDrop.style.display = 'block!important';
        /* NAVBAR BRAND BOX */
        navbarBrandBox.style.width = '150px';
        /* NAVBAR HEADER */
        navbarHeader.style.width = '1200px';
        /* VERTICAL MENU */
        verticalMenu.style.display = 'none';
        verticalMenu.style.width = '0px';
        /* VERTICAL MENU BTN */
        verticalMenuBtn.style.display = 'none';  
    }
    else if(documentInnerWidth < 1222){
        /* MAIN CONTENT */
        mainContent.style.width = 'auto';
        mainContent.style.left = '0';
        mainContent.style.transform = 'translate(0, 0)';
        mainContent.style.position = 'relative';
        mainContent.style.marginLeft = '70px';
        mainContent.style.paddingleft = '0px';
        /* MEGA MENU BUTTON */
        megaMenuDrop.style.display = 'block!important';
        /* NAVBAR BRAND BOX */
        navbarBrandBox.style.width = '150px';
        /* NAVBAR HEADER */
        navbarHeader.style.width = 'auto';
        /* VERTICAL MENU */
        verticalMenu.style.display = 'block';
        verticalMenu.style.width = '70px';
        /* VERTICAL MENU BTN */
        verticalMenuBtn.style.display = 'block';  
    }

    document.body.classList = 'sidebar-enable vertical-collpsed fixedwidth';

    resizeProcess();
}

function verticalMenuControlFullWidth() {
    var bodyClassList = document.body.classList;
    bodyClassList = 'sidebar-enable vertical-collpsed fullwidth'
}

function verticalMenuControlFixedWidth() {
    var bodyClassList = document.body.classList;
    bodyClassList = 'sidebar-enable vertical-collpsed fixedwidth'
}

function verticalMenuControl() {
    var mainContent = document.getElementById("main-content-id");
    var verticalMenu = document.getElementById("vertical-menu-id");
    var verticalMenuBtn = document.getElementById("vertical-menu-btn");
    var bodyClassList = document.body.classList;
    let documentInnerWidth = document.defaultView.parent.innerWidth;
    if((bodyClassList.value).match('sidebar-enable') === null && (bodyClassList.value).match('fullwidth') !== null  && documentInnerWidth > 992 && documentInnerWidth < 1222){
        mainContent.style.marginLeft = '70px';
        /* VERTICAL MENU */
        verticalMenu.style.display = 'block';
        verticalMenu.style.width = '70px';
        /* VERTICAL MENU BTN */
        verticalMenuBtn.style.display = 'block';

    }
    else if((bodyClassList.value).match('sidebar-enable') === null && (bodyClassList.value).match('fixedwidth') !== null  && documentInnerWidth > 992 && documentInnerWidth < 1222){
        mainContent.style.marginLeft = '70px';
        /* VERTICAL MENU */
        verticalMenu.style.display = 'block';
        verticalMenu.style.width = '70px';
        /* VERTICAL MENU BTN */
        verticalMenuBtn.style.display = 'block';

    }
    else if((bodyClassList.value).match('sidebar-enable') !== null && (bodyClassList.value).match('fullwidth') !== null  && documentInnerWidth > 992 && documentInnerWidth < 1222){
        mainContent.style.marginLeft = '250px';        
        /* VERTICAL MENU */
        verticalMenu.style.display = 'block';
        verticalMenu.style.width = '250px';
        /* VERTICAL MENU BTN */
        verticalMenuBtn.style.display = 'block';
        
    }
    else if((bodyClassList.value).match('sidebar-enable') !== null && (bodyClassList.value).match('fixedwidth') !== null  && documentInnerWidth > 992 && documentInnerWidth < 1222){
        mainContent.style.marginLeft = '250px';        
        /* VERTICAL MENU */
        verticalMenu.style.display = 'block';
        verticalMenu.style.width = '250px';
        /* VERTICAL MENU BTN */
        verticalMenuBtn.style.display = 'block';  
        
    }    
    else if((bodyClassList.value).match('sidebar-enable') !== null && (bodyClassList.value).match('fullwidth') !== null  && documentInnerWidth > 1222){
        mainContent.style.marginLeft = '250px';
        /* VERTICAL MENU */
        verticalMenu.style.width = '250px';
    }
    else if((bodyClassList.value).match('sidebar-enable') === null && (bodyClassList.value).match('fullwidth') !== null  && documentInnerWidth > 1222){
        mainContent.style.marginLeft = '70px';
        /* VERTICAL MENU */
        verticalMenu.style.width = '70px';
    }    
    else if((bodyClassList.value).match('sidebar-enable') !== null && (bodyClassList.value).match('fixedwidth') !== null  && documentInnerWidth > 1222){
        mainContent.style.marginLeft = '0px';
        /* VERTICAL MENU */
        verticalMenu.style.display = 'none';
        verticalMenu.style.width = '0px';
        /* VERTICAL MENU BTN */
        verticalMenuBtn.style.display = 'none';  
    }                  
    else if((bodyClassList.value).match('sidebar-enable') === null  && documentInnerWidth < 992){
        mainContent.style.marginLeft = '0px';
        verticalMenu.style.width = '250px';
    }  
    else if((bodyClassList.value).match('sidebar-enable') !== null  && documentInnerWidth < 992){
        mainContent.style.marginLeft = '0px';
        verticalMenu.style.width = '0px';
    }            
    else{
        mainContent.style.marginLeft = '0px';
        verticalMenu.style.width = '0px';
    }
    
    console.log(bodyClassList.value);
    setTimeout(function(){
        if((bodyClassList.value).match('sidebar-enable') !== null && (bodyClassList.value).match('vertical-collpsed') === null && (bodyClassList.value).match('fullwidth') !== null  && documentInnerWidth > 992 && documentInnerWidth < 1016){
            document.body.classList = 'fixedwidth sidebar-enable vertical-collpsed';
        }    
        else if((bodyClassList.value).match('sidebar-enable') !== null && (bodyClassList.value).match('vertical-collpsed') === null  && (bodyClassList.value).match('fixedwidth') !== null  && documentInnerWidth > 992 && documentInnerWidth < 1016){
            document.body.classList = 'fixedwidth sidebar-enable vertical-collpsed';
        }
    },50)
    
}


function resizeProcess() {
    var verticalMenu = document.getElementById("vertical-menu-id");
    var mainContent = document.getElementById("main-content-id");
    var footerContent = document.getElementById("footer-id");
    var slidesShow2Con = document.getElementById("ecommerce-home-page-slideshow-2-id") || false;
    let documentInnerWidth = document.defaultView.parent.innerWidth;
    let bodyClassList = document.body.classList;

    if(slidesShow2Con){
        var slidesShow2 = document.getElementById("ecommerce-home-page-slideshow-2-id") || false;
        if(documentInnerWidth > 1800 && (bodyClassList.value).match('fullwidth') !== null){
            slidesShow2.style.display = 'block';
        }
        else{
            slidesShow2.style.display = '';
        }
    }


    if(documentInnerWidth > 1222){
        if((bodyClassList.value).match('fullwidth') !== null){
            document.body.classList = 'sidebar-enable vertical-collpsed fullwidth';

            var navbarBrandBox = document.getElementById("navbar-brand-box-id");
            navbarBrandBox.classList = "navbar-brand-box px-0";

            mainContent.style.marginLeft = '70px';

            /* FOOTER */
            footerContent.style.left = '0';
            footerContent.style.width = '100%';
            footerContent.style.maxWidth = '100%';
            footerContent.style.marginLeft = '0px';
            footerContent.style.marginRight = '0px';              
        }
        else if((bodyClassList.value).match('fixedwidth') !== null){
            document.body.classList = 'sidebar-enable vertical-collpsed fixedwidth';
            mainContent.style.marginLeft = '0px';

            /* RESPONSIVE DEFAULT */
            var megaMenuDrop = document.getElementById("mega-menu-dropdown-id");
            var navbarBrandBox = document.getElementById("navbar-brand-box-id");
            var verticalMenu = document.getElementById("vertical-menu-id");
            var verticalMenuBtn = document.getElementById("vertical-menu-btn");
            var navbarHeader = document.getElementById("navbar-header-id");
            /* MAIN CONTENT */
            mainContent.style.width = '1200px';
            mainContent.style.left = '50%';
            mainContent.style.transform = 'translate(-50%, 0%)';
            mainContent.style.position = 'relative';
            mainContent.style.marginLeft = '0px';
            mainContent.style.paddingleft = '0px';
            /* MEGA MENU BUTTON */
            megaMenuDrop.style.display = 'block!important';
            /* NAVBAR BRAND BOX */
            navbarBrandBox.style.width = '150px';
            navbarBrandBox.classList = "navbar-brand-box ecomerce-brand-logo-ml-3";
            /* NAVBAR HEADER */
            navbarHeader.style.width = '1200px';
            /* VERTICAL MENU */
            verticalMenu.style.display = 'none';
            verticalMenu.style.width = '0px';
            /* VERTICAL MENU BTN */
            verticalMenuBtn.style.display = 'none';
            
            /* FOOTER */
            footerContent.style.left = '0';
            footerContent.style.width = 'auto';
            footerContent.style.maxWidth = '1200px';
            footerContent.style.marginLeft = '25px';
            footerContent.style.marginRight = '25px';            
        }
    }
    else if(documentInnerWidth > 992 && documentInnerWidth < 1222){
        if((bodyClassList.value).match('fullwidth') !== null){
            document.body.classList = 'sidebar-enable vertical-collpsed fullwidth';
            mainContent.style.marginLeft = '70px';

            /* FOOTER */
            footerContent.style.left = '0';
            footerContent.style.width = '100%';
            footerContent.style.maxWidth = '100%';
            footerContent.style.marginLeft = '0px';
            footerContent.style.marginRight = '0px';              
        }
        else if((bodyClassList.value).match('fixedwidth') !== null){
            document.body.classList = 'sidebar-enable vertical-collpsed fixedwidth';
            mainContent.style.marginLeft = '70px';

            /* RESPONSIVE DEFAULT */
            var megaMenuDrop = document.getElementById("mega-menu-dropdown-id");
            var navbarBrandBox = document.getElementById("navbar-brand-box-id");
            var verticalMenu = document.getElementById("vertical-menu-id");
            var verticalMenuBtn = document.getElementById("vertical-menu-btn");
            var navbarHeader = document.getElementById("navbar-header-id");
            /* MAIN CONTENT */
            mainContent.style.width = 'auto';
            mainContent.style.position = 'relative';
            mainContent.style.left = '0';
            mainContent.style.transform = 'translate(0, 0)';
            mainContent.style.marginLeft = '70px';
            mainContent.style.paddingLeft = '0px';
            /* MEGA MENU BUTTON */
            megaMenuDrop.style.display = 'block!important';
            /* NAVBAR BRAND BOX */
            navbarBrandBox.style.width = '250px';
            navbarBrandBox.classList = "navbar-brand-box px-0";
            /* NAVBAR HEADER */
            navbarHeader.style.width = '100%';
            /* VERTICAL MENU */
            verticalMenu.style.display = 'block';
            verticalMenu.style.width = '250px';
            /* VERTICAL MENU BTN */
            verticalMenuBtn.style.display = 'block';   
            
            /* FOOTER */
            footerContent.style.left = '0';
            footerContent.style.width = 'auto';
            footerContent.style.maxWidth = '1200px';
            footerContent.style.marginLeft = '0px';
            footerContent.style.marginRight = '0px';              
        }
    }
    else if(documentInnerWidth < 992){
        if((bodyClassList.value).match('fullwidth') !== null){
            document.body.classList = 'fullwidth';
            verticalMenu.style.marginLeft = '0px';
            verticalMenu.style.width = '0px';
        }
        else if((bodyClassList.value).match('fixedwidth') !== null){
            document.body.classList = 'fixedwidth';
            verticalMenu.style.marginLeft = '0px';
            verticalMenu.style.width = '0px';
        }

    }        
}

function removePreloader() {
    
}
function preloaderScreen(arg,time,reload,invoke) {
    setTimeout(function(){
        if(arg === 'show'){
            document.getElementById('preloader-content').style.display = 'none';
            document.getElementById('preloader').style.display = 'block';
            
        }
        else if(arg === 'hide'){
            document.getElementById('preloader-content').style.display = 'block';
            document.getElementById('preloader').style.display = 'none';
        }
        setTimeout(function(){
            if(reload === true){
                window.location.reload();
            }
            else{
    
            }
        },time)
    },time)
}


setTimeout(function(){
    analysisTheme();
    preloaderScreen('hide',500,false,false);
},200)



function resizeListener() {
    addEventListener('resize', ()=>{
        resizeProcess();
    })
}
resizeListener()

setTimeout(function(){
    resizeProcess();
    let decodedCookie = decodeURIComponent(document.cookie);
    console.log(decodedCookie);
},500)

