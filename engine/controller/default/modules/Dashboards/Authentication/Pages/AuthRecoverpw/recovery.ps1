
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
            $hash = @{type='verify-login-account-key';id=$ci;key=$key}
        }
        else{
            $hash = @{type='verify-login-account-key';id=$ssid;key=$key}
        }
        $save = Set-PSUCache -Key $ssid -Value $hash -Integrated
    }    
    New-UDButton -Id 'verification-key' -Text 'verification-key' -OnClick {
        $ssid = $Session.Id
        $get = Get-PSUCache -Key $ssid -Integrated
        $key = $get.lkey
        $keyTime = $get.lkeytime
        if($null -ne $key -and $null -ne $keyTime){
            $getTime = Get-Date
            if($getTime -gt $keytime){
                Invoke-UDJavaScript -JavaScript (
@'
                    VerifyKeyDenied();
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
                            VerifyKeySuccess();
                        }
                        else{
                            VerifyKeyDenied();
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
<a href="/app/builder/index" class="text-dark"><i class="mdi mdi-home-variant h2"></i></a>
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
                                <p>Re-Password with Skote.</p>
                            </div>
                        </div>
                        <div class="col-5 align-self-end">
                            <img src="/app/builder/root/assets/images/profile-img.png" alt="" class="img-fluid" >
                        </div>
                    </div>
                </div>
                <div class="card-body pt-0">
                    <div>
                        <a href="/app/builder/index">
                            <div class="avatar-md profile-user-wid mb-4">
                                <span class="avatar-title rounded-circle bg-light">
                                    <img src="/app/builder/root/assets/images/logo.svg" alt="" class="rounded-circle" height="34" >
                                </span>
                            </div>
                        </a>
                    </div>

                    <div class="p-2">
                        <div class="alert alert-success text-center mb-4" role="alert">
                            Enter your Email and instructions will be sent to you!
                        </div>
                        <form class="form-horizontal" action="/app/builder/index">

                            <div class="form-group">
                                <label for="useremail">Email</label>
                                <input type="email" class="form-control" id="useremail" placeholder="Enter email">
                            </div>

                            <div class="form-group row mb-0">
                                <div class="col-12 text-right">
                                    <button class="btn btn-primary w-md waves-effect waves-light" type="submit">Reset</button>
                                </div>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
            <div class="mt-5 text-center">
                <p>Remember It ? <a href="/app/builder/AuthLogin" class="font-weight-medium text-primary"> Sign In here</a> </p>
                <p>© 2020 Skote. Crafted with <i class="mdi mdi-heart text-danger"></i> by Themesbrand</p>
            </div>

        </div>
    </div>
</div>

'@)

