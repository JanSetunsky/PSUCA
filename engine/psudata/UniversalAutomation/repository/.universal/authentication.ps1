Set-PSUAuthenticationMethod -Type "Form" -ScriptBlock {
param(
    [PSCredential]$Credential
)

#
#   You can call whatever cmdlets you like to conduct authentication here.
#   Just make sure to return the $Result with the Success property set to $true
#

if ($Credential.UserName -eq 'Admin' -and $Credential.GetNetworkCredential().Password -eq 'bobek12345') 
{
    New-PSUAuthenticationResult -Success -UserName 'Admin'
}
else 
{
    New-PSUAuthenticationResult -ErrorMessage 'Bad username or password'
}
}