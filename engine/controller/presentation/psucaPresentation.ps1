$Cache:RootAppDirectory     = 'd:\PSUCA\'
$Cache:RootControllerPublic = 'presentation'
$Cache:ServerUrlAdress      = 'http://localhost:5000/'
$Cache:GlobalAdminAppToken  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9oYXNoIjoiNDA2YTlkODctMzEyOS00NmNhLTgxNjAtYWY3OWM1YzlmN2Q0Iiwic3ViIjoiUG93ZXJTaGVsbFVuaXZlcnNhbCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkbWluaXN0cmF0b3IiLCJuYmYiOjE2NTg1MjA2ODAsImV4cCI6MjExNjQ0NDI2MCwiaXNzIjoiSXJvbm1hblNvZnR3YXJlIiwiYXVkIjoiUG93ZXJTaGVsbFVuaXZlcnNhbCJ9.OTk1EDJ0wURQpYsPOx3TRzXYfT9O077N6eR9GjeyMV0'
$Cache:GlobalApiAppToken    = 'testapiapptoken'
connect-PSUServer -ComputerName $Cache:ServerUrlAdress -AppToken $Cache:GlobalAdminAppToken
#region PART PARAMETERS
#.("$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerType"+'\path-list.ps1')
.("$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerPublic"+'\theme\theme.ps1')
.("$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerPublic"+'\modules\navbar\header.ps1')
.("$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerPublic"+'\modules\navbar\nav.ps1')
$Cache:LogoFilePath = '\assets\img\CustomizePSUCA-extra-small.png'
#endregion PART PARAMETERS

#region ENTITY CENTER PARAMETERS
$Cache:InterfacePSCO = [PSCustomObject]@{
    Home = '75b8fb5d-43b2-48f3-a595-17e6a1e7f37e'
}

#endregion ENTITY CENTER PARAMETERS










#region PART PAGES
# PAGE - AUTHENTICATION
$Cache:PagePresentationHome = '.'+'"'+"$Cache:RootAppDirectory"+'engine\controller\'+"$Cache:RootControllerPublic"+'\modules\home\pages\home.ps1'+'"'
#endregion PART PAGES


#region PART DASHBOARD
New-UDDashboard -Title "PUBLIC TEST" -Theme $Theme -Logo "$Cache:LogoFilePath" -Pages @(

    #region PUBLIC PAGES
    New-UDPage -DefaultHomePage -HideNavigation -Id 'PresentationHome' -Name 'PresentationHome' -Url '/' -Title 'Home' -Logo "$Cache:LogoFilePath" -Content {
        $Cache:PagePresentationHome|iex
    }
    #endregion PUBLIC PAGES

) -Navigation $Nav -HeaderContent $HeaderContent -Scripts @("\presentation\assets\js\typewriterjs-master\dist\core.js";"\presentation\assets\js\p5js\slideshow.js";"\presentation\assets\js\navbar\navbar.js") -Stylesheets @("\presentation\assets\css\theme.css")
#endregion PART DASHBOARD
