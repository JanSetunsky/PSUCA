$Nav = New-UDList -Content {
    New-UDDynamic -Id 'NavigationContentDynamicId' -Content {
        if($Session:AuthenticationResult -eq $true){
            if($Session:AuthenticationCredential -eq 'Developer'){
                New-UDListItem -Label "Logo" -OnClick { Invoke-UDRedirect '/interface' } -Icon 'Server'
                New-UDListItem -Label "Modules" -OnClick {} -Children {
                    New-UDListItem -Label "Account Management" -OnClick {} -Nested -Children {
                        New-UDListItem -Label "Create New Account" -OnClick { Invoke-UDRedirect '' } -ClassName 'css-UDListMargin'
                        New-UDListItem -Label "List Of Accounts" -OnClick { Invoke-UDRedirect '' } -ClassName 'css-UDListMargin'
                    } -ClassName 'css-UDListMarginOpen'

                    New-UDListItem -Label "Entity Center" -OnClick {} -Nested -Children {
                        New-UDListItem -Label "Create New Entity Model" -OnClick { Invoke-UDRedirect '/createnewentitymodel' } -ClassName 'css-UDListMargin'
                    } -ClassName 'css-UDListMarginOpen'                    

                    New-UDListItem -Label "Interface" -OnClick { Invoke-UDRedirect '/interface' } -Nested

                    New-UDListItem -Label "Task Center" -OnClick {} -Nested -Children {
                        New-UDListItem -Label "Create New Task" -OnClick { Invoke-UDRedirect '/createnewtask' } -ClassName 'css-UDListMargin'
                        New-UDListItem -Label "Create New Task Group" -OnClick { Invoke-UDRedirect '/createnewtaskgroup' } -ClassName 'css-UDListMargin'
                        New-UDListItem -Label "Create New Task Type" -OnClick { Invoke-UDRedirect '/createnewtasktype' } -ClassName 'css-UDListMargin'
                        New-UDListItem -Label "Get Task List" -OnClick { Invoke-UDRedirect '/tasklist' } -ClassName 'css-UDListMargin'
                    } -ClassName 'css-UDListMarginOpen'

                    New-UDListItem -Label "External Addons" -OnClick {} -Nested -Children {
                        New-UDListItem -Label "Exchange Info" -OnClick { Invoke-UDRedirect '/ExchangeInfo' } -ClassName 'css-UDListMargin'
                    } -ClassName 'css-UDListMarginOpen'
                }
                New-UDListItem -Label "Exit" -OnClick {} -Children {
                    New-UDListItem -Label "Restart Application" -OnClick { Invoke-UDRedirect '' } -Nested
                    New-UDListItem -Label "Quit Application" -OnClick { Invoke-UDRedirect '' } -Nested
                    New-UDListItem -Label "Restart Computer" -OnClick { Invoke-UDRedirect '' } -Nested
                    New-UDListItem -Label "Turn Off Computer" -OnClick { Invoke-UDRedirect '' } -Nested        
                }  
            }
            elseif($Session:AuthenticationCredential -eq 'EmployeeAdministrator'){
                New-UDListItem -Label "Overview" -OnClick { Invoke-UDRedirect '/overview' }
                New-UDListItem -Label "Dashboard" -OnClick {} -Children {
                    New-UDListItem -Label "Account Management" -OnClick {} -Nested -Children {
                        New-UDListItem -Label "Create New Account" -OnClick { Invoke-UDRedirect '' } -ClassName 'css-UDListMargin'
                        New-UDListItem -Label "List Of Accounts" -OnClick { Invoke-UDRedirect '' } -ClassName 'css-UDListMargin'
                    } -ClassName 'css-UDListMarginOpen'
                    New-UDListItem -Label "Addons" -OnClick {} -Nested -Children {
                        New-UDListItem -Label "Exchange Info" -OnClick { Invoke-UDRedirect '/ExchangeInfo' } -ClassName 'css-UDListMargin'
                    } -ClassName 'css-UDListMarginOpen'
                    New-UDListItem -Label "Task Center" -OnClick {} -Nested -Children {
                        New-UDListItem -Label "Create New Task List" -OnClick { Invoke-UDRedirect '/CreateNewTaskList' } -ClassName 'css-UDListMargin'
                        New-UDListItem -Label "Get Task List" -OnClick { Invoke-UDRedirect '' } -ClassName 'css-UDListMargin'
                        New-UDListItem -Label "Runspace Settings" -OnClick { Invoke-UDRedirect '' } -ClassName 'css-UDListMargin'
                        New-UDListItem -Label "Task Manager" -OnClick { Invoke-UDRedirect '' } -ClassName 'css-UDListMargin'
                        New-UDListItem -Label "Terminal" -OnClick { Invoke-UDRedirect '' } -ClassName 'css-UDListMargin'                                    
                    } -ClassName 'css-UDListMarginOpen'
                }
                New-UDListItem -Label "Settings" -OnClick { Invoke-UDRedirect '/settings' }
                New-UDListItem -Label "Tools" -OnClick { Invoke-UDRedirect '/overview' }
                New-UDListItem -Label "Exit" -OnClick {} -Children {
                    New-UDListItem -Label "Restart Application" -OnClick { Invoke-UDRedirect '' } -Nested
                    New-UDListItem -Label "Quit Application" -OnClick { Invoke-UDRedirect '' } -Nested
                    New-UDListItem -Label "Restart Computer" -OnClick { Invoke-UDRedirect '' } -Nested
                    New-UDListItem -Label "Turn Off Computer" -OnClick { Invoke-UDRedirect '' } -Nested        
                }
            }
            else{

            }
        }
        else{
            New-UDListItem -Label "Login" -OnClick { Invoke-UDRedirect '/public/authentication' }
            New-UDListItem -Label "Forgot Password" -OnClick { Invoke-UDRedirect '/public/authentication' }
            New-UDListItem -Label "Register Now" -OnClick { Invoke-UDRedirect '/public/authentication' }
        }
    }
} 



