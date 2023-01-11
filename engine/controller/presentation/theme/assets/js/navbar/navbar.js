function LanguageListBoxDropdown() {
    var languageDrop = document.getElementById("language-list-box-dropdown").style.display;
    var loginDrop = document.getElementById("login-list-box-dropdown").style.display;
    var productsDrop = document.getElementById("products-list-box-dropdown").style.display;
    var servicesDrop = document.getElementById("services-list-box-dropdown").style.display;
    var aboutDrop = document.getElementById("about-list-box-dropdown").style.display;

    if(languageDrop === "none" && loginDrop === "block"){
        document.getElementById("language-list-mobile-item-id").style.color = "white";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("language-list-box-dropdown").style.display = "block";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";
    }
    else if(languageDrop === "none" && productsDrop === "block"){
        document.getElementById("language-list-mobile-item-id").style.color = "white";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("language-list-box-dropdown").style.display = "block";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";
    }
    else if(languageDrop === "none" && servicesDrop === "block"){
        document.getElementById("language-list-mobile-item-id").style.color = "white";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("language-list-box-dropdown").style.display = "block";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";
    }
    else if(languageDrop === "none" && aboutDrop === "block"){
        document.getElementById("language-list-mobile-item-id").style.color = "white";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("language-list-box-dropdown").style.display = "block";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";
    }
    else if(languageDrop === "none"){
        document.getElementById("language-list-mobile-item-id").style.color = "white";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("language-list-box-dropdown").style.display = "block";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "block";
        
        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "none";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
}

function LanguageListMobileBoxDropdown() {
    var languageMobileDrop = document.getElementById("language-list-box-dropdown").style.display;
    var loginMobileDrop = document.getElementById("login-list-mobile-box-dropdown").style.display;
    var productsMobileDrop = document.getElementById("products-list-mobile-box-dropdown").style.display;
    var servicesMobileDrop = document.getElementById("services-list-mobile-box-dropdown").style.display;
    var aboutMobileDrop = document.getElementById("about-list-mobile-box-dropdown").style.display;

    if(languageMobileDrop === "none" && loginMobileDrop === "block"){
        document.getElementById("language-list-mobile-item-id").style.color = "white";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("language-list-box-dropdown").style.display = "block";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";
    }
    else if(languageMobileDrop === "none" && productsMobileDrop === "block"){
        document.getElementById("language-list-mobile-item-id").style.color = "white";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("language-list-box-dropdown").style.display = "block";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";
    }
    else if(languageMobileDrop === "none" && servicesMobileDrop === "block"){
        document.getElementById("language-list-mobile-item-id").style.color = "white";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("language-list-box-dropdown").style.display = "block";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";
    }    
    else if(languageMobileDrop === "none" && aboutMobileDrop === "block"){
        document.getElementById("language-list-mobile-item-id").style.color = "white";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("language-list-box-dropdown").style.display = "block";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";
    }
    else if(languageMobileDrop === "none"){
        document.getElementById("language-list-mobile-item-id").style.color = "white";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("language-list-box-dropdown").style.display = "block";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "block";
        
        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";
    }
}

function LoginListBoxDropdown() {
    var languageDrop = document.getElementById("language-list-box-dropdown").style.display;
    var loginDrop = document.getElementById("login-list-box-dropdown").style.display;
    var productsDrop = document.getElementById("products-list-box-dropdown").style.display;
    var servicesDrop = document.getElementById("services-list-box-dropdown").style.display;
    var aboutDrop = document.getElementById("about-list-box-dropdown").style.display;

    if(loginDrop === "none" && languageDrop === "block"){
        document.getElementById("login-list-mobile-item-id").style.color = "white";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("login-list-box-dropdown").style.display = "block";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";
    }
    else if(loginDrop === "none" && productsDrop === "block"){
        document.getElementById("login-list-mobile-item-id").style.color = "white";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("login-list-box-dropdown").style.display = "block";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";
    }
    else if(loginDrop === "none" && servicesDrop === "block"){
        document.getElementById("login-list-mobile-item-id").style.color = "white";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("login-list-box-dropdown").style.display = "block";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";
    }
    else if(loginDrop === "none" && aboutDrop === "block"){
        document.getElementById("login-list-mobile-item-id").style.color = "white";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("login-list-box-dropdown").style.display = "block";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";
    }
    else if(loginDrop === "none"){
        document.getElementById("login-list-mobile-item-id").style.color = "white";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("login-list-box-dropdown").style.display = "block";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "block";
        
        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "none";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
}

function LoginListMobileBoxDropdown() {
    var languageMobileDrop = document.getElementById("language-list-mobile-box-dropdown").style.display;
    var loginMobileDrop = document.getElementById("login-list-mobile-box-dropdown").style.display;
    var productsMobileDrop = document.getElementById("products-list-mobile-box-dropdown").style.display;
    var servicesMobileDrop = document.getElementById("services-list-mobile-box-dropdown").style.display;
    var aboutMobileDrop = document.getElementById("about-list-mobile-box-dropdown").style.display;

    if(loginMobileDrop === "none" && languageMobileDrop === "block"){
        document.getElementById("login-list-mobile-item-id").style.color = "white";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("login-list-box-dropdown").style.display = "block";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";
    }
    else if(loginMobileDrop === "none" && productsMobileDrop === "block"){
        document.getElementById("login-list-mobile-item-id").style.color = "white";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("login-list-box-dropdown").style.display = "block";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";
    }
    else if(loginMobileDrop === "none" && servicesMobileDrop === "block"){
        document.getElementById("login-list-mobile-item-id").style.color = "white";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("login-list-box-dropdown").style.display = "block";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";
    }    
    else if(loginMobileDrop === "none" && aboutMobileDrop === "block"){
        document.getElementById("login-list-mobile-item-id").style.color = "white";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("login-list-box-dropdown").style.display = "block";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";
    }
    else if(loginMobileDrop === "none"){
        document.getElementById("login-list-mobile-item-id").style.color = "white";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("login-list-box-dropdown").style.display = "block";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "block";
        
        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";
    }
}

function ProductsListBoxDropdown() {
    var languageDrop = document.getElementById("language-list-box-dropdown").style.display;
    var loginDrop = document.getElementById("login-list-box-dropdown").style.display;
    var productsDrop = document.getElementById("products-list-box-dropdown").style.display;
    var servicesDrop = document.getElementById("services-list-box-dropdown").style.display;
    var aboutDrop = document.getElementById("about-list-box-dropdown").style.display;

    if(productsDrop === "none" && languageDrop === "block"){
        document.getElementById("products-list-mobile-item-id").style.color = "white";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-item-id").style.color = "white";
        document.getElementById("products-list-item-id").style.backgroundColor = "black";
        document.getElementById("products-list-item-id").style.borderColor = "black";

        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-box-dropdown").style.display = "block";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";
    }
    else if(productsDrop === "none" && loginDrop === "block"){
        document.getElementById("products-list-mobile-item-id").style.color = "white";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-item-id").style.color = "white";
        document.getElementById("products-list-item-id").style.backgroundColor = "black";
        document.getElementById("products-list-item-id").style.borderColor = "black";

        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-box-dropdown").style.display = "block";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";
    }
    else if(productsDrop === "none" && servicesDrop === "block"){
        document.getElementById("products-list-mobile-item-id").style.color = "white";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-item-id").style.color = "white";
        document.getElementById("products-list-item-id").style.backgroundColor = "black";
        document.getElementById("products-list-item-id").style.borderColor = "black";

        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("products-list-box-dropdown").style.display = "block";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";
    }
    else if(productsDrop === "none" && aboutDrop === "block"){
        document.getElementById("products-list-mobile-item-id").style.color = "white";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-item-id").style.color = "white";
        document.getElementById("products-list-item-id").style.backgroundColor = "black";
        document.getElementById("products-list-item-id").style.borderColor = "black";

        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("products-list-box-dropdown").style.display = "block";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";
    }
    else if(productsDrop === "none"){
        document.getElementById("products-list-mobile-item-id").style.color = "white";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-item-id").style.color = "white";
        document.getElementById("products-list-item-id").style.backgroundColor = "black";
        document.getElementById("products-list-item-id").style.borderColor = "black";

        document.getElementById("products-list-box-dropdown").style.display = "block";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "block";
        
        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "none";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
}

function ProductsListMobileBoxDropdown() {
    var languageMobileDrop = document.getElementById("language-list-mobile-box-dropdown").style.display;
    var loginMobileDrop = document.getElementById("login-list-mobile-box-dropdown").style.display;
    var productsMobileDrop = document.getElementById("products-list-mobile-box-dropdown").style.display;
    var servicesMobileDrop = document.getElementById("services-list-mobile-box-dropdown").style.display;
    var aboutMobileDrop = document.getElementById("about-list-mobile-box-dropdown").style.display;

    if(productsMobileDrop === "none" && languageMobileDrop === "block"){
        document.getElementById("products-list-mobile-item-id").style.color = "white";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-item-id").style.color = "white";
        document.getElementById("products-list-item-id").style.backgroundColor = "black";
        document.getElementById("products-list-item-id").style.borderColor = "black";

        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-box-dropdown").style.display = "block";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";
    }
    else if(productsMobileDrop === "none" && loginMobileDrop === "block"){
        document.getElementById("products-list-mobile-item-id").style.color = "white";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-item-id").style.color = "white";
        document.getElementById("products-list-item-id").style.backgroundColor = "black";
        document.getElementById("products-list-item-id").style.borderColor = "black";

        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-box-dropdown").style.display = "block";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";
    }
    else if(productsMobileDrop === "none" && servicesMobileDrop === "block"){
        document.getElementById("products-list-mobile-item-id").style.color = "white";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-item-id").style.color = "white";
        document.getElementById("products-list-item-id").style.backgroundColor = "black";
        document.getElementById("products-list-item-id").style.borderColor = "black";

        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("products-list-box-dropdown").style.display = "block";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";
    }
    else if(productsMobileDrop === "none" && aboutMobileDrop === "block"){
        document.getElementById("products-list-mobile-item-id").style.color = "white";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-item-id").style.color = "white";
        document.getElementById("products-list-item-id").style.backgroundColor = "black";
        document.getElementById("products-list-item-id").style.borderColor = "black";

        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("products-list-box-dropdown").style.display = "block";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";
    }
    else if(productsMobileDrop === "none"){
        document.getElementById("products-list-mobile-item-id").style.color = "white";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("products-list-item-id").style.color = "white";
        document.getElementById("products-list-item-id").style.backgroundColor = "black";
        document.getElementById("products-list-item-id").style.borderColor = "black";

        document.getElementById("products-list-box-dropdown").style.display = "block";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "block";
        
        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";
    }
}

function ServicesListBoxDropdown() {
    var languageDrop = document.getElementById("language-list-box-dropdown").style.display;
    var loginDrop = document.getElementById("login-list-box-dropdown").style.display;
    var productsDrop = document.getElementById("products-list-box-dropdown").style.display;
    var servicesDrop = document.getElementById("services-list-box-dropdown").style.display;
    var aboutDrop = document.getElementById("about-list-box-dropdown").style.display;

    if(servicesDrop === "none" && languageDrop === "block"){
        document.getElementById("services-list-mobile-item-id").style.color = "white";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-item-id").style.color = "white";
        document.getElementById("services-list-item-id").style.backgroundColor = "black";
        document.getElementById("services-list-item-id").style.borderColor = "black";

        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-box-dropdown").style.display = "block";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";
    }
    else if(servicesDrop === "none" && loginDrop === "block"){
        document.getElementById("services-list-mobile-item-id").style.color = "white";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-item-id").style.color = "white";
        document.getElementById("services-list-item-id").style.backgroundColor = "black";
        document.getElementById("services-list-item-id").style.borderColor = "black";

        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-box-dropdown").style.display = "block";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";
    }
    else if(servicesDrop === "none" && productsDrop === "block"){
        document.getElementById("services-list-mobile-item-id").style.color = "white";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-item-id").style.color = "white";
        document.getElementById("services-list-item-id").style.backgroundColor = "black";
        document.getElementById("services-list-item-id").style.borderColor = "black";

        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("services-list-box-dropdown").style.display = "block";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";
    }
    else if(servicesDrop === "none" && aboutDrop === "block"){
        document.getElementById("services-list-mobile-item-id").style.color = "white";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-item-id").style.color = "white";
        document.getElementById("services-list-item-id").style.backgroundColor = "black";
        document.getElementById("services-list-item-id").style.borderColor = "black";

        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("services-list-box-dropdown").style.display = "block";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";
    }
    else if(servicesDrop === "none"){
        document.getElementById("services-list-mobile-item-id").style.color = "white";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-item-id").style.color = "white";
        document.getElementById("services-list-item-id").style.backgroundColor = "black";
        document.getElementById("services-list-item-id").style.borderColor = "black";

        document.getElementById("services-list-box-dropdown").style.display = "block";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "block";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "none";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
}

function ServicesListMobileBoxDropdown() {
    var languageMobileDrop = document.getElementById("language-list-mobile-box-dropdown").style.display;
    var loginMobileDrop = document.getElementById("login-list-mobile-box-dropdown").style.display;
    var productsMobileDrop = document.getElementById("products-list-mobile-box-dropdown").style.display;
    var servicesMobileDrop = document.getElementById("services-list-mobile-box-dropdown").style.display;
    var aboutMobileDrop = document.getElementById("about-list-mobile-box-dropdown").style.display;

    if(servicesMobileDrop === "none" && languageMobileDrop === "block"){
        document.getElementById("services-list-mobile-item-id").style.color = "white";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-item-id").style.color = "white";
        document.getElementById("services-list-item-id").style.backgroundColor = "black";
        document.getElementById("services-list-item-id").style.borderColor = "black";

        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-box-dropdown").style.display = "block";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";
    }
    else if(servicesMobileDrop === "none" && loginMobileDrop === "block"){
        document.getElementById("services-list-mobile-item-id").style.color = "white";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-item-id").style.color = "white";
        document.getElementById("services-list-item-id").style.backgroundColor = "black";
        document.getElementById("services-list-item-id").style.borderColor = "black";

        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-box-dropdown").style.display = "block";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";
    }
    else if(servicesMobileDrop === "none" && productsMobileDrop === "block"){
        document.getElementById("services-list-mobile-item-id").style.color = "white";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-item-id").style.color = "white";
        document.getElementById("services-list-item-id").style.backgroundColor = "black";
        document.getElementById("services-list-item-id").style.borderColor = "black";

        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("services-list-box-dropdown").style.display = "block";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";
    }
    else if(servicesMobileDrop === "none" && aboutMobileDrop === "block"){
        document.getElementById("services-list-mobile-item-id").style.color = "white";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-item-id").style.color = "white";
        document.getElementById("services-list-item-id").style.backgroundColor = "black";
        document.getElementById("services-list-item-id").style.borderColor = "black";

        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("services-list-box-dropdown").style.display = "block";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";
    }
    else if(servicesMobileDrop === "none"){
        document.getElementById("services-list-mobile-item-id").style.color = "white";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("services-list-item-id").style.color = "white";
        document.getElementById("services-list-item-id").style.backgroundColor = "black";
        document.getElementById("services-list-item-id").style.borderColor = "black";

        document.getElementById("services-list-box-dropdown").style.display = "block";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "block";
        
        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";
    }
}

function AboutListBoxDropdown() {
    var languageDrop = document.getElementById("language-list-box-dropdown").style.display;
    var loginDrop = document.getElementById("login-list-box-dropdown").style.display;
    var productsDrop = document.getElementById("products-list-box-dropdown").style.display;
    var servicesDrop = document.getElementById("services-list-box-dropdown").style.display;
    var aboutDrop = document.getElementById("about-list-box-dropdown").style.display;

    if(aboutDrop === "none" && languageDrop === "block"){
        document.getElementById("about-list-mobile-item-id").style.color = "white";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-item-id").style.color = "white";
        document.getElementById("about-list-item-id").style.backgroundColor = "black";
        document.getElementById("about-list-item-id").style.borderColor = "black";

        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-box-dropdown").style.display = "block";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";
    }
    else if(aboutDrop === "none" && loginDrop === "block"){
        document.getElementById("about-list-mobile-item-id").style.color = "white";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-item-id").style.color = "white";
        document.getElementById("about-list-item-id").style.backgroundColor = "black";
        document.getElementById("about-list-item-id").style.borderColor = "black";

        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-box-dropdown").style.display = "block";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";
    }
    else if(aboutDrop === "none" && productsDrop === "block"){
        document.getElementById("about-list-mobile-item-id").style.color = "white";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-item-id").style.color = "white";
        document.getElementById("about-list-item-id").style.backgroundColor = "black";
        document.getElementById("about-list-item-id").style.borderColor = "black";

        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("about-list-box-dropdown").style.display = "block";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";
    }
    else if(aboutDrop === "none" && servicesDrop === "block"){
        document.getElementById("about-list-mobile-item-id").style.color = "white";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-item-id").style.color = "white";
        document.getElementById("about-list-item-id").style.backgroundColor = "black";
        document.getElementById("about-list-item-id").style.borderColor = "black";

        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("about-list-box-dropdown").style.display = "block";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";
    }
    else if(aboutDrop === "none"){
        document.getElementById("about-list-mobile-item-id").style.color = "white";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-item-id").style.color = "white";
        document.getElementById("about-list-item-id").style.backgroundColor = "black";
        document.getElementById("about-list-item-id").style.borderColor = "black";

        document.getElementById("about-list-box-dropdown").style.display = "block";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "block";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "none";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
}

function AboutListMobileBoxDropdown() {
    var languageMobileDrop = document.getElementById("language-list-mobile-box-dropdown").style.display;
    var loginMobileDrop = document.getElementById("login-list-mobile-box-dropdown").style.display;
    var productsMobileDrop = document.getElementById("products-list-mobile-box-dropdown").style.display;
    var servicesMobileDrop = document.getElementById("services-list-mobile-box-dropdown").style.display;
    var aboutMobileDrop = document.getElementById("about-list-mobile-box-dropdown").style.display;

    if(aboutMobileDrop === "none" && languageMobileDrop === "block"){
        document.getElementById("about-list-mobile-item-id").style.color = "white";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-item-id").style.color = "white";
        document.getElementById("about-list-item-id").style.backgroundColor = "black";
        document.getElementById("about-list-item-id").style.borderColor = "black";

        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-box-dropdown").style.display = "block";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";
    }
    else if(aboutMobileDrop === "none" && loginMobileDrop === "block"){
        document.getElementById("about-list-mobile-item-id").style.color = "white";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-item-id").style.color = "white";
        document.getElementById("about-list-item-id").style.backgroundColor = "black";
        document.getElementById("about-list-item-id").style.borderColor = "black";

        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-box-dropdown").style.display = "block";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";
    }
    else if(aboutMobileDrop === "none" && productsMobileDrop === "block"){
        document.getElementById("about-list-mobile-item-id").style.color = "white";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-item-id").style.color = "white";
        document.getElementById("about-list-item-id").style.backgroundColor = "black";
        document.getElementById("about-list-item-id").style.borderColor = "black";

        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("about-list-box-dropdown").style.display = "block";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";
    }
    else if(aboutMobileDrop === "none" && servicesMobileDrop === "block"){
        document.getElementById("about-list-mobile-item-id").style.color = "white";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-item-id").style.color = "white";
        document.getElementById("about-list-item-id").style.backgroundColor = "black";
        document.getElementById("about-list-item-id").style.borderColor = "black";

        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("about-list-box-dropdown").style.display = "block";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "block";
        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";
    }
    else if(aboutMobileDrop === "none"){
        document.getElementById("about-list-mobile-item-id").style.color = "white";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "black";

        document.getElementById("about-list-item-id").style.color = "white";
        document.getElementById("about-list-item-id").style.backgroundColor = "black";
        document.getElementById("about-list-item-id").style.borderColor = "black";

        document.getElementById("about-list-box-dropdown").style.display = "block";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "block";
        
        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
        document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";
    }
}

function NavBarMobileBoxDropdown() {
    var navbarbutton = document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display;


    if(navbarbutton === "none"){
        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "block";
    }
    else{
        /* LANGUAGE LIST */
        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";

        /* LOGIN LIST */
        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";

        /* PRODUCTS LIST */
        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";

        /* SERVICES LIST */
        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";

        /* SERVICES LIST */
        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";

        /* NAVBAR MOBILE CONTAINER */
        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
}

function DarkEffectBoxDropdown() {
    var navbarbutton = document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display;
    var darkeffectDrop = document.getElementById("initial-navbar-dropdown-dark-effect").style.display;
    var languageDrop = document.getElementById("language-list-box-dropdown").style.display;
    var loginDrop = document.getElementById("login-list-box-dropdown").style.display;
    var productsDrop = document.getElementById("products-list-box-dropdown").style.display;
    var servicesDrop = document.getElementById("services-list-box-dropdown").style.display;
    var aboutDrop = document.getElementById("about-list-box-dropdown").style.display;

    if(languageDrop === "block"){
        document.getElementById("language-list-mobile-item-id").style.color = "black";
        document.getElementById("language-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("language-list-box-dropdown").style.display = "none";
        document.getElementById("language-list-mobile-box-dropdown").style.display = "none";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
    else if(loginDrop === "block"){
        document.getElementById("login-list-mobile-item-id").style.color = "black";
        document.getElementById("login-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("login-list-box-dropdown").style.display = "none";
        document.getElementById("login-list-mobile-box-dropdown").style.display = "none";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
    else if(productsDrop === "block"){
        document.getElementById("products-list-mobile-item-id").style.color = "black";
        document.getElementById("products-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("products-list-item-id").style.color = "black";
        document.getElementById("products-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("products-list-item-id").style.borderColor = "transparent";

        document.getElementById("products-list-box-dropdown").style.display = "none";
        document.getElementById("products-list-mobile-box-dropdown").style.display = "none";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
    else if(servicesDrop === "block"){
        document.getElementById("services-list-mobile-item-id").style.color = "black";
        document.getElementById("services-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("services-list-item-id").style.color = "black";
        document.getElementById("services-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("services-list-item-id").style.borderColor = "transparent";

        document.getElementById("services-list-box-dropdown").style.display = "none";
        document.getElementById("services-list-mobile-box-dropdown").style.display = "none";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
    else if(aboutDrop === "block"){
        document.getElementById("about-list-mobile-item-id").style.color = "black";
        document.getElementById("about-list-mobile-item-id").style.backgroundColor = "white";

        document.getElementById("about-list-item-id").style.color = "black";
        document.getElementById("about-list-item-id").style.backgroundColor = "transparent";
        document.getElementById("about-list-item-id").style.borderColor = "transparent";

        document.getElementById("about-list-box-dropdown").style.display = "none";
        document.getElementById("about-list-mobile-box-dropdown").style.display = "none";

        document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";

        document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
    }
    else{
        if(navbarbutton === "block" && darkeffectDrop === "none"){
            document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "block";
            document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "block";
        }
        else if(navbarbutton === "none" && darkeffectDrop === "block"){
            document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";
            document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "none";
        }
        else if(navbarbutton === "block" && darkeffectDrop === "block"){
            document.getElementById("initial-navbar-dropdown-dark-effect").style.display = "none";
            document.getElementById("initial-navbar-mobile-dropdown-dark-effect").style.display = "none";
            document.getElementById("initial-navbar-mobile-dropdown-container-box").style.display = "none";
        }
    }
}