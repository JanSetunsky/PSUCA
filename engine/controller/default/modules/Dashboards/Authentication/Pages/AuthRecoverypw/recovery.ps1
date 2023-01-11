
New-UDStyle -Tag 'div' -Content {
    New-UDTextbox -Id 'transport-textbox' -Value ''
    New-UDButton -Id 'encrypt' -Text 'encrypt' -OnClick {
        $ssid  = $Session.Id
        $ciCon = $Cookies.ContainsKey('ci')
        if($ciCon -eq $true){
            $ci = $Cookies.Item('ci')
        }
        $key = ([guid]::NewGuid()).Guid
        $sc  = {Invoke-UDJavaScript -JavaScript (
@"
const cipher = salt => { 
    const textToChars = text => text.split('').map(c => c.charCodeAt(0));
    const byteHex = n => ("0" + Number(n).toString(16)).substr(-2);
    const applySaltToChar = code => textToChars(salt).reduce((a,b) => a ^ b, code);
    return text => text.split('') .map(textToChars) .map(applySaltToChar) .map(byteHex) .join('');
}
const createCipher = cipher("importkey");
var element = document.getElementById("transport-textbox");
var value = element.placeholder;
var encrypt = createCipher(value);
element.placeholder = encrypt;
"@ 
        )} -replace 'importkey',$key
        $sc|iex
        if($ciCon -eq $true){
            $hash = @{type='verify-recovery-password-key';id=$ci;key=$key}
        }
        else{
            $hash = @{type='verify-recovery-password-key';id=$ssid;key=$key}
        }
        $save = Set-PSUCache -Key $ssid -Value $hash -Integrated
    } 
    New-UDButton -Id 'encrypt-pwd' -Text 'encrypt-pwd' -OnClick {
        $key = ([guid]::NewGuid()).Guid
        $sc  = {Invoke-UDJavaScript -JavaScript (
@"
const cipher = salt => { 
    const textToChars = text => text.split('').map(c => c.charCodeAt(0));
    const byteHex = n => ("0" + Number(n).toString(16)).substr(-2);
    const applySaltToChar = code => textToChars(salt).reduce((a,b) => a ^ b, code);
    return text => text.split('') .map(textToChars) .map(applySaltToChar) .map(byteHex) .join('');
}
const createCipher = cipher("importkey");
var element = document.getElementById("transport-textbox");
var value = element.placeholder;
var encrypt = createCipher(value);
element.placeholder = encrypt;
"@ 
        )} -replace 'importkey',$key
        $sc|iex
        if($ciCon -eq $true){
            $hash = @{type='verify-recovery-password-key-step-2';key=$key}
        }
        else{
            $hash = @{type='verify-recovery-password-key-step-2';key=$key}
        }
        $oldData = Get-PSUCache -Key $ssid -Integrated
        $data = @{Id=$oldData.Id;Created=$oldData.Created;Expire=$oldData.Expire;Cred=$oldData.Cred;Lock=$oldData.Lock;Vr=$oldData.Vr;Uid=$oldData.Uid;Pwd='null';lkey=$oldData.lkey;lkeytime=$oldData.lkeytime;recovery=$hash}
        $save = Set-PSUCache -Key $ssid -Value $data -Integrated
    }          
    New-UDButton -Id 'verification-key-email' -Text 'verification-key-email' -OnClick {
        $ssid = $Session.Id
        $get = Get-PSUCache -Key $ssid -Integrated
        $key = $get.lkey
        $tkey = $get.tkey
        $keyTime = $get.lkeytime
        if($null -ne $key -and $null -ne $keyTime -and $tkey -eq 'email'){
            $getTime = Get-Date
            if($getTime -gt $keytime){
                Invoke-UDJavaScript -JavaScript (
@'
VerifyRecoveryKeyDenied('email');
'@                
                )
            }
            else{
                $sc = {
                    Invoke-UDJavaScript -JavaScript (
@'
                        var lkey = 'importlkey';
                        var k1 = document.getElementById("2-step-verification-code-1").value;
                        var k2 = document.getElementById("2-step-verification-code-2").value;
                        var k3 = document.getElementById("2-step-verification-code-3").value;
                        var k4 = document.getElementById("2-step-verification-code-4").value;
                        var wkey = k1+k2+k3+k4;
                        if(lkey === wkey){
                            VerifyRecoveryKeySuccess('email');
                        }
                        else{
                            VerifyRecoveryKeyDenied('email');
                        }
'@
                    )} -replace 'importlkey',$key
                $sc|iex
            }
        }
    }
    New-UDButton -Id 'verification-key-phone' -Text 'verification-key-phone' -OnClick {
        $ssid = $Session.Id
        $get = Get-PSUCache -Key $ssid -Integrated
        $key = $get.lkey
        $tkey = $get.tkey
        $keyTime = $get.lkeytime
        if($null -ne $key -and $null -ne $keyTime -and $tkey -eq 'phone'){
            $getTime = Get-Date
            if($getTime -gt $keytime){
                Invoke-UDJavaScript -JavaScript (
@'
VerifyRecoveryKeyDenied('phone');
'@                
                )
            }
            else{
                $sc = {
                    Invoke-UDJavaScript -JavaScript (
@'
                        var lkey = 'importlkey';
                        var k1 = document.getElementById("2-step-verification-code-1").value;
                        var k2 = document.getElementById("2-step-verification-code-2").value;
                        var k3 = document.getElementById("2-step-verification-code-3").value;
                        var k4 = document.getElementById("2-step-verification-code-4").value;
                        var wkey = k1+k2+k3+k4;
                        if(lkey === wkey){
                            VerifyRecoveryKeySuccess('phone');
                        }
                        else{
                            VerifyRecoveryKeyDenied('phone');
                        }
'@
                    )} -replace 'importlkey',$key
                $sc|iex
            }
        }
    } 
} -Style 'display:none'

New-UDHtml -Markup (
@'
<div class="home-btn d-none d-sm-block">
<a href="/" class="text-dark"><i class="mdi mdi-home-variant h2"></i></a>
</div>
<div class="account-pages my-5 pt-sm-5">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6 col-xl-5">
            <div class="card overflow-hidden">
                <div class="bg-soft-primary">
                    <div class="row">
                        <div class="col-7">
                            <div class="text-primary p-4">
                                <h5 class="text-primary"> Reset Password</h5>
                                <p>Re-Password to system.</p>
                            </div>
                        </div>
                        <div class="col-5 align-self-end">
                            <img src="/app/root/assets/images/profile-img.png" alt="" class="img-fluid" >
                        </div>
                    </div>
                </div>
                <div class="card-body pt-0">
                    <div>
                        <a href="/app/builder/index">
                            <div class="avatar-md profile-user-wid mb-4">
                                <span class="avatar-title rounded-circle bg-light">
                                    <img src="/app/root/assets/images/ecommerce-logo-mini-e-light.png" alt="" class="rounded-circle" height="34" >
                                </span>
                            </div>
                        </a>
                    </div>

                    <div id="verify-selector-box-id" class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-6 text-center">
                            <div class="custom-control custom-radio mb-3">
                                <input onclick="multiCheckingBox('verify-recovery-password-email-radio');" type="radio" id="verify-recovery-password-email-radio" name="recovery-type-radio" class="custom-control-input" checked>
                                <label class="custom-control-label" for="verify-recovery-password-email-radio">
                                    <h4>Email</h4>
                                </label>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 col-sm-6 col-6 text-center">
                            <div class="custom-control custom-radio mb-3">
                                <input onclick="multiCheckingBox('verify-recovery-password-phone-radio');" type="radio" id="verify-recovery-password-phone-radio" name="recovery-type-radio" class="custom-control-input">
                                <label class="custom-control-label" for="verify-recovery-password-phone-radio">
                                    <h4>Phone</h4>
                                </label>
                            </div>
                        </div>                    
                    </div>

                    <div id="verify-recovery-password-box-id" style="display:none"">
                        <div class="form-group">
                            <label for="userpassword">Password</label>
                            <input type="email" class="form-control" id="userpassword" placeholder="Enter password" oninput="UserRecoveryPasswordValidation('userpassword');">
                            <div class="container" style="height:20px">
                                <span id="userpassword-valid-label-true" style="display:block;color:green"></span>
                                <span id="userpassword-valid-label-false" style="display:block;color:red"></span>
                            </div>
                        </div>                            
                        
                        <div class="form-group">
                            <label for="userconfirmpassword">Confirm Password</label>
                            <input type="email" class="form-control" id="userconfirmpassword" placeholder="Confirm password" oninput="UserRecoveryPasswordValidation('userconfirmpassword');">
                            <div class="container" style="height:20px">
                                <span id="userconfirmpassword-valid-label-true" style="display:block;color:green"></span>
                                <span id="userconfirmpassword-valid-label-false" style="display:block;color:red"></span>
                            </div>
                        </div> 
                        
                        <div class="form-group row mb-0">
                            <div class="col-12 text-right">
                                <div id="verification-btn-email-method-id" style="display:none">
                                    <button class="btn btn-primary w-md waves-effect waves-light" type="button" onclick="Verification('verify-recovery-password-email');">Save Password</button>
                                </div>
                                <div id="verification-btn-phone-method-id" style="display:none">
                                    <button class="btn btn-primary w-md waves-effect waves-light" type="button" onclick="Verification('verify-recovery-password-phone');">Save Password</button>
                                </div>                                
                            </div>
                        </div>                                                                                   
                    </div>                    

                    <div id="verify-recovery-password-email-block-id" class="p-2">
                        <div class="alert alert-success text-center mb-4" role="alert">
                            Enter your Email and instructions will be sent to you!
                        </div>
                        <form class="form-horizontal" action="/">

                            <div class="form-group">
                                <label for="useremail">Email</label>
                                <input type="email" class="form-control" id="useremail" oninput="UserEmailValidation();" placeholder="Enter email">
                                <div class="container" style="height:20px">
                                    <span id="useremail-valid-label-true" style="display:block;color:green"></span>
                                    <span id="useremail-valid-label-false" style="display:block;color:red"></span>
                                </div>                                
                            </div>

                            <div class="form-group row mb-0">
                                <div class="col-12 text-right">
                                    <button class="btn btn-primary w-md waves-effect waves-light" type="button" onclick="Verification('verify-recovery-password-identity-email')">Reset</button>
                                </div>
                            </div>

                        </form>
                    </div>

                    <div id="verify-recovery-password-phone-block-id" class="p-2">
                        <div class="alert alert-success text-center mb-4" role="alert">
                            Enter your Phone and instructions will be sent to you!
                        </div>
                        <form class="form-horizontal" action="/">

                            <div class="form-group">
                                <label for="useremail">Phone</label>
                                <input type="text" class="form-control" id="userphone" oninput="UserPhoneValidation();" placeholder="Enter phone">
                                <div class="container" style="height:20px">
                                    <span id="userphone-valid-label-true" style="display:block;color:green"></span>
                                    <span id="userphone-valid-label-false" style="display:block;color:red"></span>
                                </div>                                
                            </div>

                            <div class="form-group row mb-0">
                                <div class="col-12 text-right">
                                    <button class="btn btn-primary w-md waves-effect waves-light" type="button" onclick="Verification('verify-recovery-password-identity-phone')">Reset</button>
                                </div>
                            </div>

                        </form>
                    </div>                    

                </div>
            </div>

            <!-- Modal Verification --> 
            <div class="modal fade" id="verificationModal" tabindex="-1" role="dialog" aria-labelledby="verificationModalTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="verificationModalLongTitle">Verification process</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div id="shield-check-verification-container" class="pt-1 pb-2 container text-center" style="display:none">
                                <div id="check-2-step-verification-timer-display-container" class="text-center text-primary">
                                    <div id="check-2-step-verification-timer-display" class="text-center text-primary" style="font-size: 55px;font-weight:900">
                                        
                                    </div>
                                    <div id"check-2-step-verification-buttons-hidden" style="display:none">
                                        <button type="button" id="check-2-step-verification-startTimer">start</button>
                                        <button type="button" id="check-2-step-verification-pauseTimer">pause</button>
                                        <button type="button" id="check-2-step-verification-stopTimer">stop</button>
                                    </div>
                                </div>
                            </div>
                            <div id="shield-check-success-container" class="pt-1 pb-2 container text-center" style="display:none">
                                <i class="bi bi-shield-check">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="green" class="bi bi-shield-check" viewBox="0 0 16 16">
                                        <path d="M5.338 1.59a61.44 61.44 0 0 0-2.837.856.481.481 0 0 0-.328.39c-.554 4.157.726 7.19 2.253 9.188a10.725 10.725 0 0 0 2.287 2.233c.346.244.652.42.893.533.12.057.218.095.293.118a.55.55 0 0 0 .101.025.615.615 0 0 0 .1-.025c.076-.023.174-.061.294-.118.24-.113.547-.29.893-.533a10.726 10.726 0 0 0 2.287-2.233c1.527-1.997 2.807-5.031 2.253-9.188a.48.48 0 0 0-.328-.39c-.651-.213-1.75-.56-2.837-.855C9.552 1.29 8.531 1.067 8 1.067c-.53 0-1.552.223-2.662.524zM5.072.56C6.157.265 7.31 0 8 0s1.843.265 2.928.56c1.11.3 2.229.655 2.887.87a1.54 1.54 0 0 1 1.044 1.262c.596 4.477-.787 7.795-2.465 9.99a11.775 11.775 0 0 1-2.517 2.453 7.159 7.159 0 0 1-1.048.625c-.28.132-.581.24-.829.24s-.548-.108-.829-.24a7.158 7.158 0 0 1-1.048-.625 11.777 11.777 0 0 1-2.517-2.453C1.928 10.487.545 7.169 1.141 2.692A1.54 1.54 0 0 1 2.185 1.43 62.456 62.456 0 0 1 5.072.56z"/>
                                        <path d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                                    </svg>
                                </i>
                            </div>
                            <div id="shield-check-denied-container" class="pt-1 pb-2 container text-center" style="display:none">
                                <i class="bi bi-shield-x">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="red" class="bi bi-shield-x" viewBox="0 0 16 16">
                                        <path d="M5.338 1.59a61.44 61.44 0 0 0-2.837.856.481.481 0 0 0-.328.39c-.554 4.157.726 7.19 2.253 9.188a10.725 10.725 0 0 0 2.287 2.233c.346.244.652.42.893.533.12.057.218.095.293.118a.55.55 0 0 0 .101.025.615.615 0 0 0 .1-.025c.076-.023.174-.061.294-.118.24-.113.547-.29.893-.533a10.726 10.726 0 0 0 2.287-2.233c1.527-1.997 2.807-5.031 2.253-9.188a.48.48 0 0 0-.328-.39c-.651-.213-1.75-.56-2.837-.855C9.552 1.29 8.531 1.067 8 1.067c-.53 0-1.552.223-2.662.524zM5.072.56C6.157.265 7.31 0 8 0s1.843.265 2.928.56c1.11.3 2.229.655 2.887.87a1.54 1.54 0 0 1 1.044 1.262c.596 4.477-.787 7.795-2.465 9.99a11.775 11.775 0 0 1-2.517 2.453 7.159 7.159 0 0 1-1.048.625c-.28.132-.581.24-.829.24s-.548-.108-.829-.24a7.158 7.158 0 0 1-1.048-.625 11.777 11.777 0 0 1-2.517-2.453C1.928 10.487.545 7.169 1.141 2.692A1.54 1.54 0 0 1 2.185 1.43 62.456 62.456 0 0 1 5.072.56z"/>
                                        <path d="M6.146 5.146a.5.5 0 0 1 .708 0L8 6.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 7l1.147 1.146a.5.5 0 0 1-.708.708L8 7.707 6.854 8.854a.5.5 0 1 1-.708-.708L7.293 7 6.146 5.854a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </i>
                            </div>
                            <div class="p-1 container text-center">
                                <span id="recovery-password-valid-label-verification" style="display:block;color:blue"></span>
                                <span id="recovery-password-valid-label-true" style="display:block;color:green"></span>
                                <span id="recovery-password-valid-label-false" style="display:block;color:red"></span>
                            </div>
                            <div id="check-2-step-verification-container" class="p-2 container text-center" style="display:none">
                                <div class="row">
                                    <div class="col-2 p-1">
                                    </div>                                                
                                    <div class="col-2 p-1">
                                        <input type="text" class="p-0 form-control input-mask text-center" id="2-step-verification-code-1" oninput="" data-inputmask="'mask': '9'" style="font-size: 35px;font-weight:1000" placeholder="_" autocomplete="off">
                                    </div>    
                                    <div class="col-2 p-1">
                                        <input type="text" class="p-0 form-control input-mask text-center" id="2-step-verification-code-2" oninput="" data-inputmask="'mask': '9'" style="font-size: 35px;font-weight:1000" placeholder="_" autocomplete="off">
                                    </div>    
                                    <div class="col-2 p-1">
                                        <input type="text" class="p-0 form-control input-mask text-center" id="2-step-verification-code-3" oninput="" data-inputmask="'mask': '9'" style="font-size: 35px;font-weight:1000" placeholder="_" autocomplete="off">
                                    </div>    
                                    <div class="col-2 p-1">
                                        <input type="text" class="p-0 form-control input-mask text-center" id="2-step-verification-code-4" oninput="" data-inputmask="'mask': '9'" style="font-size: 35px;font-weight:1000" placeholder="_" autocomplete="off">
                                    </div>    
                                    <div class="col-2 p-1">
                                    </div>
                                </div>    
                            </div>
                            <div id="modal-progress-bar-block-id" style="display:block">
                                <div class="progress">
                                    <div id="modal-progress-bar-id" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="100" style="width: 1%"></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="mt-5 text-center">
                <p>Remember It ? <a href="/app/authentication/recovery" class="font-weight-medium text-primary"> Sign In here</a> </p>
                <p>© 2022 PSUCA. Crafted with <i class="mdi mdi-heart text-danger"></i> by PowerShell Universal</p>
            </div>

        </div>
    </div>
</div>

'@)

