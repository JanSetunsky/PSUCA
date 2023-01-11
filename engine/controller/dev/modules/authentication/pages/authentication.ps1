
$MainSC = {

    New-UDElement -Id 'Authentication-Universal-Modal-FullScreen' -Tag 'div' -Content {
        New-UDHtml -Markup '
        <video autoplay muted loop id="Authentication-Universal-Modal-FullScreen-Video">
            <source src="\assets\video\video.mp4" type="video/mp4">
        </video>
        '
        New-UDElement -Id 'Authentication-Container-Block-Centered' -Tag 'div' -Content {
            New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                New-UDPaper -ClassName "authentication-box-layout" -Square -Content {
                    New-UDRow -Columns {
                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDIcon -Icon 'UserCircle' -Size '1x' -Border -ClassName 'authentication-box-logo'
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Authentication' -ClassName 'authentication-box-title'
                                        }
                                    }
                                }
                            }
                            New-UDStyle -Content {
                                New-UDForm -Id 'Authentication-Container-Form' -Children {
                                    New-UDElement -Tag 'div' -Content {
                                        New-UDElement -Tag 'table' -Content {
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTypography -Text 'Email' -ClassName 'authentication-box-inner-title'
                                                    }
                                                }
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTextbox -Id 'AuthenticationEmailField' -Type text -ClassName 'authentication-box-login-email-text'
                                                    }
                                                }
                                            }
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTypography -Text 'Password' -ClassName 'authentication-box-inner-title'
                                                    }
                                                }
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDTextbox -Id 'AuthenticationPasswordField' -Type password -ClassName 'authentication-box-login-password-text'
                                                    }
                                                }
                                            }
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {

                                                }
                                            }
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDLink -Children {
                                                            New-UDTypography -Text 'Forgot Password' -ClassName 'authentication-box-forgot-password'
                                                        } -OnClick {}
                                                    }
                                                }
                                                New-UDElement -Tag 'td' -Content {
                                                    New-UDElement -Tag 'tr' -Content {
                                                        New-UDLink -Children {
                                                            New-UDTypography -Text 'Register Now' -ClassName 'authentication-box-register-now'
                                                        } -OnClick {}
                                                    }
                                                }
                                            }
                                            New-UDElement -Tag 'tr' -Content {
                                                New-UDElement -Tag 'td' -Content {

                                                }
                                            }
                                        }
                                    }
                                } -SubmitText 'Login' -OnSubmit {
                                    $AuthenticationEmail     = Get-UDElement -Id 'AuthenticationEmailField'
                                    $AuthenticationPassword  = Get-UDElement -Id 'AuthenticationPasswordField'
                                    $Session:AuthenticationCondition = $null -ne $($Cache:AuthenticationData | where { $_.Email -eq $AuthenticationEmail.Value -and $_.Password -eq $AuthenticationPassword.Value })
                                    if($Session:AuthenticationCondition -eq $true){
                                        $Session:AuthenticationData       = $($Cache:AuthenticationData | where { $_.Email -eq $AuthenticationEmail.Value -and $_.Password -eq $AuthenticationPassword.Value })
                                        $Session:AuthenticationLoginEmail = $Session:AuthenticationData.Email
                                        $Session:AuthenticationCredential = $Session:AuthenticationData.Credential
                                        $Session:AuthenticationResult     = $Session:AuthenticationCondition
                                        $Session:AuthenticationCondition  = $null
                                        $NewAuthenticationGuid            = [guid]::NewGuid()
                                        $Session:AuthenticationGuid       = $NewAuthenticationGuid
                                        Invoke-UDJavaScript -JavaScript '
                                            function AuthenticatioBoxnDropdown() {
                                                document.getElementById("Authentication-Container-Block-Centered").style.display = "none";
                                                document.getElementById("Authentication-Container-Block-Centered-Info-Success").style.display = "block";
                                            }
                                            AuthenticatioBoxnDropdown();
                                        '
                                        sleep 3
                                        Invoke-UDRedirect -Url '/interface'
                                    }
                                    else{
                                        Invoke-UDJavaScript -JavaScript '
                                            function AuthenticatioBoxnDropdown() {
                                                document.getElementById("Authentication-Container-Block-Centered").style.display = "none";
                                                document.getElementById("Authentication-Container-Block-Centered-Info-Denied").style.display = "block";
                                            }
                                            AuthenticatioBoxnDropdown();
                                        '
                                        sleep 3
                                        Invoke-UDJavaScript -JavaScript '
                                            function ReloadPage() {
                                                window.location.reload();
                                            }
                                            ReloadPage();
                                        '
                                    }
                                }
                            } -Style '
                            .MuiGrid-root {
                                padding: 0px;
                            }
                            .MuiButton-textPrimary {
                                display: inline-flex;
                                -webkit-box-align: center;
                                align-items: center;
                                -webkit-box-pack: center;
                                justify-content: center;
                                position: relative;
                                box-sizing: border-box;
                                -webkit-tap-highlight-color: transparent;
                                background-color: transparent;
                                outline: 0px;
                                border: 1px solid #eeeeee;
                                cursor: pointer;
                                user-select: none;
                                vertical-align: middle;
                                appearance: none;
                                text-decoration: none;
                                font-family: Roboto, Helvetica, Arial, sans-serif;
                                font-size: 12px;
                                font-weight: 600;
                                line-height: 1.75;
                                letter-spacing: 0.02857em;
                                text-transform: uppercase;
                                min-width: 64px;
                                margin-left: 3px;
                                margin-bottom: 3px;
                                padding: 0px;
                                border-radius: 0px;
                                transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, border-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
                                color: rgb(59, 59, 59);
                            }
                            .MuiButton-textPrimary:hover {
                                background-color: #f5f5f5;
                                color: #012cd9;
                                text-decoration: none;
                                background-color: rgb(245, 245, 245);
                                box-shadow: rgb(0 0 0 / 20%) 0px 2px 4px -1px, rgb(0 0 0 / 14%) 0px 4px 5px 0px, rgb(0 0 0 / 12%) 0px 1px 10px 0px;
                            }
                            '
                        }
                    }                 
                } -Elevation 1
            }
        }
        New-UDElement -Id 'Authentication-Container-Block-Centered-Info-Success' -Tag 'div' -Content {
            New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                New-UDPaper -ClassName "authentication-box-layout" -Square -Content {
                    New-UDRow -Columns {
                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'authentication-box-check-success-logo'
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Authentication successful' -ClassName 'authentication-box-check-success-title'
                                        }
                                    }
                                }
                            }
                        }
                    }                 
                } -Elevation 1
            }
        }
        New-UDElement -Id 'Authentication-Container-Block-Centered-Info-Denied' -Tag 'div' -Content {
            New-UDGrid -Item -ExtraSmallSize 12 -SmallSize 12 -MediumSize 12 -LargeSize 12 -ExtraLargeSize 12 -Content {
                New-UDPaper -ClassName "authentication-box-layout" -Square -Content {
                    New-UDRow -Columns {
                        New-UDColumn -SmallSize 12 -MediumSize 12 -LargeSize 12 {
                            New-UDElement -Tag 'table' -Content {
                                New-UDElement -Tag 'tr' -Content {
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDIcon -Icon 'CheckCircle' -Size '1x' -Border -ClassName 'authentication-box-check-denied-logo'
                                    }
                                    New-UDElement -Tag 'td' -Content {
                                        New-UDElement -Tag 'tr' -Content {
                                            New-UDTypography -Text 'Authentication Denied' -ClassName 'authentication-box-check-denied-title'
                                        }
                                    }
                                }
                            }
                        }
                    }                 
                } -Elevation 1
            }
        }
    }
}

New-UDGrid -Spacing 1 -Container -Content {
    $MainSC|iex
}




