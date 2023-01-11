
New-UDStyle -Tag 'div' -Content {
    New-UDTextbox -Id 'transport-textbox' -Value ''
    New-UDButton -Id 'encrypt' -Text 'encrypt' -OnClick {
        $ssid  = $Session.Id
        $ciCon = $Cookies.ContainsKey('ci')
        if($ciCon -eq $true){
            $ci   = $Cookies.Item('ci')
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
            $hash = @{type='verify-register-account-key';id=$ci;key=$key}
        }
        else{
            $hash = @{type='verify-register-account-key';id=$ssid;key=$key}
        }
        $save = Set-PSUCache -Key $ssid -Value $hash -Integrated
    }
} -Style 'display:none'

New-UDHtml -Markup (
@'
<div class="home-btn d-none d-sm-block">
    <a href="/" class="text-dark"><i class="mdi mdi-home-variant h2"></i></a>
</div>
<div class="account-pages my-5 pt-sm-5">
<div class="container user-select-none"">
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card overflow-hidden">
                <div class="bg-soft-primary">
                    <div class="row">
                        <div class="col-7">
                            <div class="text-primary p-4">
                                <h5 class="text-primary">Welcome Back !</h5>
                                <p>Sign in to continue to system.</p>
                            </div>
                        </div>
                        <div class="col-5 align-self-end">
                            <img src="/app/root/assets/images/profile-img.png" alt="" class="img-fluid auth-img" >
                        </div>
                    </div>
                </div>
                <div class="card-body pt-0">
                    <div>
                        <a href="/">
                            <div class="avatar-md profile-user-wid mb-4">
                                <span class="avatar-title rounded-circle bg-light">
                                    <img src="/app/root/assets/images/ecommerce-logo-mini-e-light.png" alt="" class="rounded-circle" height="34" >
                                </span>
                            </div>
                        </a>
                    </div>
                    <div id="scrollspyFormHeader" data-bs-spy"scroll" class="p-2">
                        <form class="form-horizontal" action="/">
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
                                                <span id="login-valid-label-true" style="display:block;color:green"></span>
                                                <span id="login-valid-label-false" style="display:block;color:red"></span>
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
                            <!-- Registration form --> 
                            <h4 class="card-title mb-4">Registration Form</h4>

                            <div id="progrss-wizard" class="twitter-bs-wizard">
                                <ul class="twitter-bs-wizard-nav nav-justified">
                                    <li class="nav-item text-center col-3 p-0">
                                        <a href="#progress-seller-details" class="nav-link p-1 pt-2 pb-2" data-toggle="tab">
                                            <span class="step-number mr-2">01</span>
                                            Seller
                                        </a>
                                    </li>
                                    <li class="nav-item text-center col-3 p-0">
                                        <a href="#progress-company-document" class="nav-link p-1 pt-2 pb-2" data-toggle="tab">
                                            <span class="step-number mr-2">02</span>
                                            Company
                                        </a>
                                    </li>
        
                                    <li class="nav-item text-center col-3 p-0">
                                        <a href="#progress-payment-detail" class="nav-link p-1 pt-2 pb-2" data-toggle="tab">
                                            <span class="step-number mr-2">03</span>
                                            Payment
                                        </a>
                                    </li>
                                    <li class="nav-item text-center col-3 p-0">
                                        <a href="#progress-login-detail" class="nav-link p-1 pt-2 pb-2" data-toggle="tab">
                                            <span class="step-number mr-2">04</span>
                                            Login
                                        </a>
                                    </li>
                                    <li class="nav-item text-center col-3 p-0">
                                        <a href="#progress-confirm-detail" class="nav-link p-1 pt-2 pb-2" data-toggle="tab">
                                            <span class="step-number mr-2">05</span>
                                            Confirm
                                        </a>
                                    </li>
                                </ul>
        
                                <div id="bar" class="progress mt-4">
                                    <div id="progress-bar-animated-line" class="progress-bar bg-primary progress-bar-striped progress-bar-animated"></div>
                                </div>
                                <div class="tab-content twitter-bs-wizard-tab-content">
                                    <div class="tab-pane" id="progress-seller-details">
                                        <form>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label for="basicpill-firstname-input">First name</label>
                                                        <input type="text" class="form-control" id="basicpill-firstname-input" autocomplete="off">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label for="basicpill-lastname-input">Last name</label>
                                                        <input type="text" class="form-control" id="basicpill-lastname-input" autocomplete="off">
                                                    </div>
                                                </div>
                                            </div>
        
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label for="basicpill-phoneno-input">Phone</label>
                                                        <input type="text" class="form-control" id="basicpill-phoneno-input" onchange="LoginPhoneAutocomplete()" oninput="LoginPhoneAutocomplete()" autocomplete="off">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label for="basicpill-email-input">Email</label>
                                                        <input type="email" class="form-control" id="basicpill-email-input" onchange="LoginEmailAutocomplete()" oninput="LoginEmailAutocomplete()" autocomplete="off">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label for="basicpill-state-select">State</label>
                                                        <select class="custom-select" id="basicpill-state-select">
                                                            <option value="0" selected="">Select a state</option>
                                                            <option value="CZ">Czech Republic</option>
                                                            <option value="GE">Germany</option>
                                                            <option value="SK">Slovakia</option>
                                                            <option value="USA">United States America</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label for="basicpill-language-select">Default language</label>
                                                        <select class="custom-select" id="basicpill-language-select">
                                                            <option value="0" selected="">Select default language</option>
                                                            <option value="CZ">Czech Republic</option>
                                                            <option value="GE">Germany</option>
                                                            <option value="SK">Slovakia</option>
                                                            <option value="USA">United States America</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>                                            

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <label for="basicpill-billing-address-input">Billing address</label>
                                                        <textarea id="basicpill-billing-address-input" class="form-control" rows="2" oninput="BillingDeliveryAddressAutocompleteListener()"></textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class=col-lg-12 pl-4">
                                                    <div class="form-group">
                                                        <div class="form-check mb-3">
                                                            <input onclick="BillingDeliveryAddressAutocomplete();multiCheckingBox('check-billing-delivery-address-conditions');" class="form-check-input" type="checkbox" value="false" id="check-billing-delivery-address-conditions" style="margin-top:3px">
                                                            <label class="form-check-label" for="check-billing-delivery-address-conditions" style="cursor:pointer">
                                                                Billing address is the same as delivery address
                                                            </label>
                                                        </div>
                                                    </div>        
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <label for="basicpill-delivery-address-input">Delivery address</label>
                                                        <textarea id="basicpill-delivery-address-input" class="form-control" rows="2"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane" id="progress-company-document">
                                        <div>
                                            <form>
                                                <div class="row">
                                                    <div class=col-lg-12 pl-4">
                                                        <div class="form-group">
                                                            <div class="form-check mb-3">
                                                                <input onclick="multiCheckingBox('check-company-data-add-later');" class="form-check-input" type="checkbox" value="false" id="check-company-data-add-later" style="margin-top:3px" checked>
                                                                <label class="form-check-label" for="check-company-data-add-later" style="cursor:pointer">
                                                                    Company data add later
                                                                </label>
                                                            </div>
                                                        </div>        
                                                    </div>
                                                </div>
                                                <div id="company-data-block-hidden" class="container text-center" style="display:block">
                                                    <h2 class="mt-5">Company data add later</h2>
                                                </div>
                                                <div id="company-data-block" style="display:none">
                                                    <div id="company-document-for-usa" style="display:block">
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="basicpill-pancard-input">PAN Card</label>
                                                                    <input type="text" class="form-control" id="basicpill-pancard-input" autocomplete="off">
                                                                </div>
                                                            </div>
                
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="basicpill-vatno-input">VAT/TIN No.</label>
                                                                    <input type="text" class="form-control" id="basicpill-vatno-input" autocomplete="off">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="basicpill-cstno-input">CST No.</label>
                                                                    <input type="text" class="form-control" id="basicpill-cstno-input" autocomplete="off">
                                                                </div>
                                                            </div>
                
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="basicpill-servicetax-input">Service Tax No.</label>
                                                                    <input type="text" class="form-control" id="basicpill-servicetax-input" autocomplete="off">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="basicpill-companyuin-input">Company UIN</label>
                                                                    <input type="text" class="form-control" id="basicpill-companyuin-input" autocomplete="off">
                                                                </div>
                                                            </div>
                
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label for="basicpill-declaration-input">Declaration</label>
                                                                    <input type="text" class="form-control" id="basicpill-Declaration-input" autocomplete="off">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="progress-payment-detail">
                                        <div>
                                            <form>
                                                <div class="row">
                                                    <div class="container text-center">
                                                        <h4>Prefered payment method</h4>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="container text-center">
                                                        <div class="col-lg-3 col-md-3 col-sm-6 col-6 float-left">
                                                            <div class="custom-control custom-radio mb-3">
                                                                <input onclick="multiCheckingBox('payment-data-add-later-radio');" type="radio" id="payment-data-add-later-radio" name="payment-type-radio" class="custom-control-input" checked>
                                                                <label class="custom-control-label" for="payment-data-add-later-radio">
                                                                    Add later
                                                                </label>
                                                            </div>                                                            
                                                        </div>
                                            
                                                        <div class="col-lg-3 col-md-3 col-sm-6 col-6 float-left">
                                                            <div class="custom-control custom-radio mb-3">
                                                                <input onclick="multiCheckingBox('payment-data-credit-card-pay-radio');" type="radio" id="payment-data-credit-card-pay-radio" name="payment-type-radio" class="custom-control-input">
                                                                <label class="custom-control-label" for="payment-data-credit-card-pay-radio">
                                                                    Credit Card
                                                                </label>
                                                            </div>                                                            
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-6 col-6 float-left">
                                                            <div class="custom-control custom-radio mb-3">
                                                                <input onclick="multiCheckingBox('payment-data-apple-pay-radio');" type="radio" id="payment-data-apple-pay-radio" name="payment-type-radio" class="custom-control-input">
                                                                <label class="custom-control-label" for="payment-data-apple-pay-radio">
                                                                    Apple Pay
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-6 col-6 float-left">
                                                            <div class="custom-control custom-radio mb-3">
                                                                <input onclick="multiCheckingBox('payment-data-google-pay-radio');" type="radio" id="payment-data-google-pay-radio" name="payment-type-radio" class="custom-control-input">
                                                                <label class="custom-control-label" for="payment-data-google-pay-radio">
                                                                    Google Pay
                                                                </label>
                                                            </div>    
                                                        </div>
                                                    </div>
                                                </div>                                                 
                                                <div id="payment-data-block-hidden" class="container text-center" style="display:block">
                                                    <h2 class="mt-5">Payment data add later</h2>
                                                </div>
                                                <div id="payment-data-block-credit-card" style="display:none">
                                                    <div class="row">
                                                        <div class="container text-center">
                                                            <h4>Credit Card</h4>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-center">

                                                        <div>
                                                            <div class="pr-3 bg-light" style="max-width:300px;border:1px #ced4da solid">
                                                                <div class="row pl-3">
                                                                    <div class="col-lg-12 pt-3">
                                                                        <div class="form-group" style="display:block">
                                                                            <!-- LABEL FOR SELECT -->
                                                                            <label class="mb-1 text-secondary" style="font-weight:700;font-size:12px" for="basicpill-card-type-select">CARD TYPE</label>
                                                                            <fieldset disabled>
                                                                                <select class="custom-select" id="basicpill-card-type-select">
                                                                                    <option value="0" selected>Card Type</option>
                                                                                    <option value="AE">American Express</option>
                                                                                    <option value="VI">Visa</option>
                                                                                    <option value="MC">Master Card</option>
                                                                                    <option value="DC">Discover</option>
                                                                                    <option value="DIN">Dinners Club</option>
                                                                                    <option value="JCB">Japan Central Bank</option>
                                                                                </select>
                                                                            </fieldset>
                                                                        </div>
                                                                        <div class="form-group mt-3 mb-1">
                                                                            <!-- LABEL FOR IMG -->
                                                                            <div class="row">
                                                                                <div class="p-1">
                                                                                    <div class="col-2 p-0 float-left">
                                                                                        <div class="p-1">
                                                                                            <div class="box-card-type" id="box-card-type-border-vi">
                                                                                                <div class="container default-img-card-type card-type-vi"></div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-2 p-0 float-left">
                                                                                        <div class="p-1">
                                                                                            <div class="box-card-type" id="box-card-type-border-mc">
                                                                                                <div class="container default-img-card-type card-type-mc"></div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-2 p-0 float-left">
                                                                                        <div class="p-1">
                                                                                            <div class="box-card-type" id="box-card-type-border-ae">
                                                                                                <div class="container default-img-card-type card-type-ae"></div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-2 p-0 float-left">
                                                                                        <div class="p-1">
                                                                                            <div class="box-card-type" id="box-card-type-border-jcb">
                                                                                                <div class="container default-img-card-type card-type-jcb"></div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-2 p-0 float-left">
                                                                                        <div class="p-1">
                                                                                            <div class="box-card-type" id="box-card-type-border-dc">
                                                                                                <div class="container default-img-card-type card-type-dc"></div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-2 p-0 float-left">
                                                                                        <div class="p-1">
                                                                                            <div class="box-card-type" id="box-card-type-border-din">
                                                                                                <div class="container default-img-card-type card-type-din"></div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>                                                                                
                                                                                </div>                                                                                
                                                                            </div>    
                                                                        </div>                                                                        
                                                                    </div>


                                                                    <div class="col-lg-12">
                                                                        <div class="form-group mb-0 pt-1">
                                                                            <label class="mb-1 text-secondary" style="font-weight:700;font-size:12px" for="basicpill-cardno-input">CARD NUMBER</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <div class="form-group mb-0">
                                                                            <div id="input-mask-block-for-hidden" style="display:none">
                                                                                <input id="input-number-hidden" type="text" value="" autocomplete="off">
                                                                            </div>                                                                        
                                                                            <div id="input-mask-block-for-default" style="display:block">
                                                                                <input class="form-control input-mask" id="basicpill-cardno-input" onchange="validateCreditCardInputForm()" oninput="validateCreditCardInputForm();" data-inputmask="'mask': '9 9 9 9 - 9 9 9 9 - 9 9 9 9 - 9 9 9 9'" style="font-weight:600" placeholder="_ _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _" autocomplete="off">
                                                                            </div>
                                                                            <div id="input-mask-block-for-ae" style="display:none">
                                                                                <input class="form-control input-mask" id="basicpill-cardno-input-ae" onchange="validateCreditCardInputForm()" oninput="validateCreditCardInputForm();" data-inputmask="'mask': '9 9 9 9 - 9 9 9 9 - 9 9 9 9 - 9 9 9'" style="font-weight:600" placeholder="_ _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _" autocomplete="off">
                                                                            </div>
                                                                            <div id="input-mask-block-for-vi" style="display:none">
                                                                                <input class="form-control input-mask" id="basicpill-cardno-input-vi" onchange="validateCreditCardInputForm()" oninput="validateCreditCardInputForm();" data-inputmask="'mask': '9 9 9 9 - 9 9 9 9 - 9 9 9 9 - 9 9 9 9'" style="font-weight:600" placeholder="_ _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _" autocomplete="off">
                                                                            </div>
                                                                            <div id="input-mask-block-for-mc" style="display:none">
                                                                                <input class="form-control input-mask" id="basicpill-cardno-input-mc" onchange="validateCreditCardInputForm()" oninput="validateCreditCardInputForm();" data-inputmask="'mask': '9 9 9 9 - 9 9 9 9 - 9 9 9 9 - 9 9 9 9'" style="font-weight:600" placeholder="_ _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _" autocomplete="off">
                                                                            </div>
                                                                            <div id="input-mask-block-for-dc" style="display:none">
                                                                                <input class="form-control input-mask" id="basicpill-cardno-input-dc" onchange="validateCreditCardInputForm()" oninput="validateCreditCardInputForm();" data-inputmask="'mask': '9 9 9 9 - 9 9 9 9 - 9 9 9 9 - 9 9 9 9'" style="font-weight:600" placeholder="_ _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _" autocomplete="off">
                                                                            </div>
                                                                            <div id="input-mask-block-for-din" style="display:none">
                                                                                <input class="form-control input-mask" id="basicpill-cardno-input-din" onchange="validateCreditCardInputForm()" oninput="validateCreditCardInputForm();" data-inputmask="'mask': '9 9 9 9 - 9 9 9 9 - 9 9 9 9 - 9 9'" style="font-weight:600" placeholder="_ _ _ _ - _ _ _ _ - _ _ _ _ - _ _" autocomplete="off">
                                                                            </div>
                                                                            <div id="input-mask-block-for-jcb" style="display:none">
                                                                                <input class="form-control input-mask" id="basicpill-cardno-input-jcb" onchange="validateCreditCardInputForm()" oninput="validateCreditCardInputForm();" data-inputmask="'mask': '9 9 9 9 - 9 9 9 9 - 9 9 9 9 - 9 9 9'" style="font-weight:600" placeholder="_ _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _" autocomplete="off">
                                                                            </div>                                                                                                                                                                                                                                                                                                                                                                                            
                                                                            <div id="box-card-type-input-ae" class="p-1" style="display:none">
                                                                                <div class="box-card-type-input">
                                                                                    <div class="container default-img-card-type card-type-ae"></div>
                                                                                </div>
                                                                            </div>
                                                                            <div id="box-card-type-input-vi" class="p-1" style="display:none">
                                                                                <div class="box-card-type-input">
                                                                                    <div class="container default-img-card-type card-type-vi"></div>
                                                                                </div>
                                                                            </div>
                                                                            <div id="box-card-type-input-mc" class="p-1" style="display:none">
                                                                                <div class="box-card-type-input">
                                                                                    <div class="container default-img-card-type card-type-mc"></div>
                                                                                </div>
                                                                            </div>
                                                                            <div id="box-card-type-input-dc" class="p-1" style="display:none">
                                                                                <div class="box-card-type-input">
                                                                                    <div class="container default-img-card-type card-type-dc"></div>
                                                                                </div>
                                                                            </div>
                                                                            <div id="box-card-type-input-din" class="p-1" style="display:none">
                                                                                <div class="box-card-type-input">
                                                                                    <div class="container default-img-card-type card-type-din"></div>
                                                                                </div>
                                                                            </div>
                                                                            <div id="box-card-type-input-jcb" class="p-1" style="display:none">
                                                                                <div class="box-card-type-input">
                                                                                    <div class="container default-img-card-type card-type-jcb"></div>
                                                                                </div>
                                                                            </div>                                                                                                                                                                                                                                                                                                                
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <div class="form-group mb-0" style="min-height:20px;max-height:42px;">
                                                                            <span id="basicpill-cardno-input-span" style="display:block;color:#74788d"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row pl-3">
                                                                    <div class="col-lg-6 pl-0 pr-0 col-md-6 col-sm-6 col-6">
                                                                        <div class="col-lg-12">
                                                                            <div class="form-group mb-0">
                                                                                <label class="mb-1 text-secondary" style="font-weight:700;font-size:12px" for="basicpill-expiration-input">EXPIRY DATE</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-12">
                                                                            <div class="form-group mb-0">
                                                                                <input id="basicpill-expiration-input" class="form-control input-mask text-center text-uppercase" data-inputmask="'alias': 'datetime'" data-inputmask-inputformat="mm / yy" placeholder="MM / YY" onchange="validateCreditCardInputForm()" oninput="validateCreditCardInputForm()" style="font-weight:600" autocomplete="off">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-12 pr-0">
                                                                            <div class="form-group mb-0" style="min-height:20px;max-height:42px;">
                                                                                <span id="basicpill-expiration-input-span" style="display:block;color:red"></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6 pl-0 pr-0 col-md-6 col-sm-6 col-6">
                                                                        <div class="col-lg-12">
                                                                            <div class="form-group mb-0">
                                                                                <label class="mb-1 text-secondary" style="font-weight:700;font-size:12px" for="basicpill-card-verification-input">SECURE CODE</label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-12">
                                                                            <div class="form-group mb-0">
                                                                                <input type="text" class="form-control text-center" id="basicpill-card-verification-input" onchange="validateCreditCardInputForm()" oninput="validateCreditCardInputForm()" style="font-weight:600" autocomplete="off">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-12 pr-0">
                                                                            <div class="form-group mb-0" style="min-height:20px;max-height:42px;">
                                                                                <span id="basicpill-card-verification-input-span" style="display:block;color:red"></span>
                                                                            </div>
                                                                        </div>                                                                    
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <div class="form-group mb-0">
                                                                            <label class="mb-1 text-secondary" style="font-weight:700;font-size:12px" for="basicpill-namecard-input">NAME ON CARD</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <div class="form-group mb-0">
                                                                            <input type="text" class="form-control text-uppercase" id="basicpill-namecard-input" onchange="validateCreditCardInputForm()" oninput="validateCreditCardInputForm()" style="font-weight:600" autocomplete="off">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-12">
                                                                        <div class="form-group mb-0" style="min-height:20px;max-height:42px;">
                                                                            <span id="basicpill-namecard-input-span" style="display:block;color:red"></span>
                                                                        </div>
                                                                    </div>                                                                
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                      
                                                    </div>
                                                </div>
                                                <div id="payment-data-block-apple-pay" style="display:none">
                                                    <div class="row">
                                                        <div class="container text-center">
                                                            <h4>Apple Pay</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="payment-data-block-google-pay" style="display:none">
                                                    <div class="row">
                                                        <div class="container text-center">
                                                            <h4>Google Pay</h4>
                                                        </div>
                                                    </div>
                                                </div>                                                
                                            </form>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="progress-login-detail">
                                        <form>
                                            <div class="row">
                                                <div class=col-lg-12 pl-4">
                                                    <div class="form-group">
                                                        <div class="form-check mb-3">
                                                            <input onclick="multiCheckingBox('check-2-step-verification-process');" class="form-check-input" type="checkbox" value="false" id="check-2-step-verification-process" style="margin-top:3px">
                                                            <label class="form-check-label" for="check-2-step-verification-process" style="cursor:pointer">
                                                                Activate 2-step verification process
                                                            </label>
                                                        </div>
                                                    </div>        
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label for="basicpill-confirm-phoneno-input">Phone</label>
                                                        <fieldset disabled>
                                                            <input type="text" class="form-control" id="basicpill-confirm-phoneno-input" autocomplete="off">
                                                        </fieldset>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label for="basicpill-confirm-email-input">Email</label>
                                                        <fieldset disabled>
                                                            <input type="email" class="form-control" id="basicpill-confirm-email-input" autocomplete="off">
                                                        </fieldset>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">                                                
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label for="basicpill-confirm-password-input">Password</label>
                                                        <input type="password" class="form-control" id="basicpill-confirm-password-input" autocomplete="off">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group">
                                                        <label for="basicpill-confirm-control-password-input">Confirm Password</label>
                                                        <input type="password" class="form-control" id="basicpill-confirm-control-password-input" autocomplete="off">
                                                    </div>
                                                </div>
                                            </div>                                             
                                        </form>
                                    </div>                                    
                                    <div class="tab-pane" id="progress-confirm-detail">
                                        <div class="row justify-content-center">
                                            <div class="col-lg-6">
                                                <div class="text-center">
                                                    <div id="progress-confirm-detail-is-valid-block" style="display:none">
                                                        <div class="mb-2">
                                                            <i class="mdi mdi-check-circle-outline text-success display-4"></i>
                                                        </div>
                                                        <div>
                                                            <h5>Document is valid!</h5>
                                                            <p class="text-muted">Please confirm create new account.</p>
                                                        </div>
                                                    </div>
                                                    <div id="progress-confirm-detail-is-not-valid-block" style="display:none">
                                                        <div class="mb-2">
                                                            <i class="mdi mdi-alert-circle-outline text-danger display-4"></i>
                                                        </div>
                                                        <div>
                                                            <h5>Document is not valid!</h5>
                                                            <p class="text-muted">Please repair registration form.</p>
                                                        </div>
                                                    </div>                                                    
                                                </div>
                                            </div>
                                        </div>

                                        <div id="confirm-form-seller-details">
                                            <div class="row justify-content-center">
                                                <div class="col-lg-6 mt-2">
                                                    <div class="text-center">
                                                        <div>
                                                            <h4>Seller details</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                        

                                            <div class="row mb-3">
                                                <div class="col-lg-6">
                                                    <div class="mb-0">
                                                        <input id="validation-firstname-input" class="form-control form-control-sm" type="text" placeholder="First name" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-firstname-input-span" style="display:block;color:red"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="mb-0">
                                                        <input id="validation-lastname-input" class="form-control form-control-sm" type="text" placeholder="Last name" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-lastname-input-span" style="display:block;color:red"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="mb-0">
                                                        <input id="validation-phone-input" class="form-control form-control-sm" type="text" placeholder="Phone" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-phone-input-span" style="display:block;color:red"></span>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="mb-0">
                                                        <input id="validation-email-input" class="form-control form-control-sm" type="email" placeholder="Email" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-email-input-span" style="display:block;color:red"></span>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="mb-0">
                                                        <input id="validation-state-input" class="form-control form-control-sm" type="text" placeholder="State" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-state-input-span" style="display:block;color:red"></span>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="mb-0">
                                                        <input id="validation-language-input" class="form-control form-control-sm" type="text" placeholder="Language" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-language-input-span" style="display:block;color:red"></span>
                                                        </div>                                                        
                                                    </div>
                                                </div>                                            
                                                <div class="col-lg-12">
                                                    <div class="mb-0">
                                                        <input id="validation-billing-address-input" class="form-control form-control-sm" type="text" placeholder="Billing address" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-billing-address-input-span" style="display:block;color:red"></span>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="mb-0">
                                                        <input id="validation-delivery-address-input" class="form-control form-control-sm" type="text" placeholder="Delivery address" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-delivery-address-input-span" style="display:block;color:red"></span>
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="confirm-form-company-document">
                                            <div class="row justify-content-center">
                                                <div class="col-lg-6">
                                                    <div class="text-center">
                                                        <div>
                                                            <h4>Company document</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                        
                                            <div id="validation-company-data-block-hidden" class="container text-center mb-5" style="display:block">
                                                <h2>Company data add later</h2>
                                            </div>
                                            <div id="validation-company-data-block" style="display:none">
                                                <div class="row mb-3">
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-pancard-input" class="form-control form-control-sm" type="text" placeholder="PAN Card" disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-pancard-input-span" style="display:block;color:red"></span>
                                                            </div>                                                            
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-vattinno-input" class="form-control form-control-sm" type="text" placeholder="VAT/TIN No." disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-vattinno-input-span" style="display:block;color:red"></span>
                                                            </div>                                                                                                                        
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-cstno-input" class="form-control form-control-sm" type="text" placeholder="CST No." disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-cstno-input-span" style="display:block;color:red"></span>
                                                            </div>                                                                                                                        
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-servicetaxno-input" class="form-control form-control-sm" type="text" placeholder="Service Tax No." disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-servicetaxno-input-span" style="display:block;color:red"></span>
                                                            </div>                                                                                                                        
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-companyuin-input" class="form-control form-control-sm" type="text" placeholder="Company UIN" disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-companyuin-input-span" style="display:block;color:red"></span>
                                                            </div>                                                                                                                        
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-declaration-input" class="form-control form-control-sm" type="text" placeholder="Declaration" disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-declaration-input-span" style="display:block;color:red"></span>
                                                            </div>                                                                                                                        
                                                        </div>
                                                    </div>                                            
                                                </div>
                                            </div>        
                                        </div>

                                        <div id="confirm-form-payment-details">
                                            <div class="row justify-content-center">
                                                <div class="col-lg-6">
                                                    <div class="text-center">
                                                        <div>
                                                            <h4>Payment details</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                        
                                            <div id="validation-payment-data-block-hidden" class="container text-center mb-5" style="display:block">
                                                <h2>Payment data add later</h2>
                                            </div>
                                            <div id="validation-payment-data-block-credit-card" style="display:none">
                                                <div class="row mb-3">
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-card-type-input" class="form-control form-control-sm" type="text" placeholder="Credit Card Type" disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-card-type-input-span" style="display:block;color:red"></span>
                                                            </div>                                                              
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-card-number-input" class="form-control form-control-sm" type="text" placeholder="Credit Card Number" disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-card-number-input-span" style="display:block;color:red"></span>
                                                            </div>                                                              
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-card-expiration-date-input" class="form-control form-control-sm" type="text" placeholder="Expiration Date" disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-card-expiration-date-input-span" style="display:block;color:red"></span>
                                                            </div>                                                              
                                                        </div>
                                                    </div>                                                    
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-card-verification-code-input" class="form-control form-control-sm" type="text" placeholder="Card Verification Number" disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-card-verification-code-input-span" style="display:block;color:red"></span>
                                                            </div>                                                              
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-0">
                                                            <input id="validation-card-user-name-input" class="form-control form-control-sm text-uppercase" type="text" placeholder="Name on Card" disabled="true">
                                                            <div class="container" style="height:20px">
                                                                <span id="validation-card-user-name-input-span" style="display:block;color:red"></span>
                                                            </div>                                                              
                                                        </div>
                                                    </div>                                                    
                                                </div>
                                            </div>
                                            <div id="validation-payment-data-block-apple-pay" class="container text-center mb-5" style="display:none">
                                                <h2>Payment method Apple Pay</h2>
                                            </div>
                                            <div id="validation-payment-data-block-google-pay" class="container text-center mb-5" style="display:none">
                                                <h2>Payment method Google Pay</h2>
                                            </div>                                            
                                        </div>

                                        <div id="confirm-form-login-details">
                                            <div class="row justify-content-center">
                                                <div class="col-lg-6">
                                                    <div class="text-center">
                                                        <div>
                                                            <h4>Authentication</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                                        

                                            <div class="row mb-3">
                                                <div class="col-lg-4">
                                                    <div class="mb-0">
                                                        <input id="validation-login-phone-input" class="form-control form-control-sm" type="text" placeholder="Phone" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-login-phone-input-span" style="display:block;color:red"></span>
                                                        </div>                                                                
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="mb-0">
                                                        <input id="validation-login-email-input" class="form-control form-control-sm" type="text" placeholder="Email" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-login-email-input-span" style="display:block;color:red"></span>
                                                        </div>                                                                                                                        
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="mb-0">
                                                        <input id="validation-login-password-input" class="form-control form-control-sm" type="password" placeholder="Password" disabled="true">
                                                        <div class="container" style="height:20px">
                                                            <span id="validation-login-password-input-span" style="display:block;color:red"></span>
                                                        </div>                                                                                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class=col-lg-12 pl-4">
                                                <div class="form-group">
                                                    <div class="form-check mb-3">
                                                        <input onclick="multiCheckingBox('check-personal-conditions');" class="form-check-input" type="checkbox" value="false" id="check-personal-conditions" style="margin-top:3px">
                                                        <label class="form-check-label" for="check-personal-conditions" style="cursor:pointer">
                                                            Consent to the use of personal data
                                                        </label>
                                                    </div>
                                                    <a class="font-weight-medium text-primary" onclick="multiOpenModal('personalConditionsModal');" style="cursor:pointer">Read here</a>
                                                </div>        
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class=col-lg-12 pl-4">
                                                <div class="form-group">
                                                    <div class="form-check mb-3">
                                                        <input onclick="multiCheckingBox('check-ecommerce-conditions');" class="form-check-input" type="checkbox" value="false" id="check-ecommerce-conditions" style="margin-top:3px">
                                                        <label class="form-check-label" for="check-ecommerce-conditions" style="cursor:pointer">
                                                            Agree to the Terms and Conditions for E-Commerce
                                                        </label>
                                                    </div>
                                                    <a class="font-weight-medium text-primary" onclick="multiOpenModal('ecommerceConditionsModal');" style="cursor:pointer">Read here</a>
                                                </div>        
                                            </div>
                                        </div>                                        

                                        <!-- Modal for personal conditions --> 
                                        <div class="modal fade" id="personalConditionsModal" tabindex="-1" role="dialog" aria-labelledby="personalConditionsModalTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="personalConditionsModalLongTitle">Personal Data</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Conditions content</p>    
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Modal for E-Commerce Terms and Conditions --> 
                                        <div class="modal fade" id="ecommerceConditionsModal" tabindex="-1" role="dialog" aria-labelledby="ecommerceTermsAndConditionsModalTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="ecommerceTermsAndConditionsModalLongTitle">Terms and Conditions</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Conditions content</p>    
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>
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
                                                            <span id="login-valid-label-true" style="display:block;color:green"></span>
                                                            <span id="login-valid-label-false" style="display:block;color:red"></span>
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

                                        <div class="row justify-content-center">
                                            <div class="col-lg-6">
                                                <button onclick="Verification('verify-register-account');" class="btn btn-success btn-block waves-effect waves-light" type="button">Create New Account</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <ul class="pager wizard twitter-bs-wizard-pager-link">
                                    <li class="previous"><a onclick="scrollSpyFormHeader();" href="javascript: void(0);">Previous</a></li>
                                    <li class="next"><a onclick="scrollSpyFormHeader();" href="javascript: void(0);">Next</a></li>
                                </ul>
                            </div>
























                            <div class="mt-4 text-center">
                                <h5 class="font-size-14 mb-3">Sign in with</h5>

                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <a href="javascript::void()" class="social-list-item bg-primary text-white border-primary">
                                            <i class="mdi mdi-facebook"></i>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="javascript::void()" class="social-list-item bg-info text-white border-info">
                                            <i class="mdi mdi-twitter"></i>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="javascript::void()" class="social-list-item bg-danger text-white border-danger">
                                            <i class="mdi mdi-google"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <div class="mt-4 text-center">
                                <a href="/app/authentication/recovery" class="text-muted"><i class="mdi mdi-lock mr-1"></i> Forgot your password?</a>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
            <div class="mt-5 text-center">

                <div>
                    <p>Don't have an account ? <a href="/app/authentication/register" class="font-weight-medium text-primary"> Signup now </a> </p>
                    <p>© 2022 PSUCA. Crafted with <i class="mdi mdi-heart text-danger"></i> by PowerShell Universal</p>
                </div>
            </div>

        </div>
    </div>
</div>





'@)

