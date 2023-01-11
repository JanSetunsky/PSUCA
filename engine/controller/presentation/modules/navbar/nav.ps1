$Nav = New-UDList -Content {
    New-UDDynamic -Id 'NavigationContentDynamicId' -Content {
        if($Session:AuthenticationResult -eq $true){
            if($Session:AuthenticationCredential -eq 'User'){
                New-UDListItem -Label "My Profile" -OnClick {} -Children {
                    New-UDListItem -Label "Account Management" -OnClick {} -Nested -Children {
                        New-UDListItem -Label "Settings" -OnClick { Invoke-UDRedirect '' } -ClassName 'css-UDListMargin'
                    } -ClassName 'css-UDListMarginOpen'
                }
            }
            else{

            }
        }
        else{
            New-UDListItem -Label "Login" -OnClick { Invoke-UDRedirect '/authentication' }
            New-UDListItem -Label "Forgot Password" -OnClick { Invoke-UDRedirect '/authentication' }
            New-UDListItem -Label "Register Now" -OnClick { Invoke-UDRedirect '/authentication' }
        }
    }
} 



