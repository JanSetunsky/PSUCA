function setCookie(name,value,options={}) {
    options = {
        path: '/'
    };
    if(options.expires instanceof Date){
        options.expires = options.expires.toUTCString();
    }
    let updatedCookie = encodeURIComponent(name)+"="+encodeURIComponent(value);
    for (let optionKey in options){
        updatedCookie += "; "+optionKey;
        let optionValue = options[optionKey];
        if(optionValue !== true){
            updatedCookie += "="+optionValue;
        }
    }
    document.cookie = updatedCookie;
}
function UserRecoveryPasswordValidation(arg) {
    var input = document.getElementById(arg);
    var pwd = input.value;
    var labt = document.getElementById(arg+"-valid-label-true");
    var labf = document.getElementById(arg+"-valid-label-false");
    var res = ValidatePassword(pwd);
    if(res === true){
        labf.innerText = '';
        labt.innerText = 'Password is valid!';
        return [pwd,true];
    }
    else{
        labt.innerText = '';
        labf.innerText = res;
        return [false,false];
    }

}
function UserEmailValidation() {
    var input = document.getElementById('useremail');
    var uid = input.value;
    var labt = document.getElementById("useremail-valid-label-true");
    var labf = document.getElementById("useremail-valid-label-false");
    var reg = "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    var res = typeof input.checkValidity === 'function' ? input.checkValidity() : reg.test(uid);
    if(res === true && uid !== ''){
        labf.innerText = '';
        labt.innerText = 'Email address is valid!';
        return [uid,true];
    }
    else{
        labt.innerText = '';
        labf.innerText = 'Invalid email address!';
        return [false,false];
    }
}
function UserPasswordValidation() {
    var input = document.getElementById('userpassword');
    var pwd = input.value;
    var labt = document.getElementById("userpassword-valid-label-true");
    var labf = document.getElementById("userpassword-valid-label-false");
    var res = ValidatePassword(pwd);
    if(res === true){
        labf.innerText = '';
        labt.innerText = 'Password is valid!';
        return [pwd,true];
    }
    else{
        labt.innerText = '';
        labf.innerText = res;
        return [false,false];
    }

}
function UserPhoneValidation() {
    var input = document.getElementById('userphone');
    var phone = input.value;
    var labt = document.getElementById("userphone-valid-label-true");
    var labf = document.getElementById("userphone-valid-label-false");
    var reg = /^(?:[0-9+ -])$/;
    var valid
    for (let i = 0; i < phone.length; i++) {
        const val = phone[i];
        var res = val.match(reg);
        if(res === null){
            valid = false;
        }
    }
    if(valid !== false){
        labf.innerText = '';
        labt.innerText = 'Phone number is valid!';
        return [phone,true];
    }
    else{
        labt.innerText = '';
        labf.innerText = 'Invalid phone number!';
        return [false,false];
    }
}
function validateCreditCardInputForm() {
    var typeCard = document.getElementById('basicpill-card-type-select');
    var name = document.getElementById('basicpill-namecard-input');
    var nameSpan = document.getElementById('basicpill-namecard-input-span');
    var number = document.getElementById('basicpill-cardno-input');
    var numberMaskDefault = document.getElementById('input-mask-block-for-default');
    var numberSpan = document.getElementById('basicpill-cardno-input-span');
    var date = document.getElementById('basicpill-expiration-input');
    var dateSpan = document.getElementById('basicpill-expiration-input-span');
    var ccv = document.getElementById('basicpill-card-verification-input');
    var ccvSpan = document.getElementById('basicpill-card-verification-input-span');

    var nameValue = name.value;
    var numberValue = (((number.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
    var dateValue = date.value;
    var ccvValue = ccv.value;
    var ccvReg1 = /^(?:[0-9]{4})$/;
    var ccvReg2 = /^(?:[0-9]{3})$/;
    var uniReg = /^(?:[0-9]{1})$/;
    var uniRegMc = /^(?:[1-5]{1})$/;
    var uniRegDc = /^(?:6[5][0-9]{2})$/;
    var uniRegDin1 = /^(?:3[0][0-5]{1})$/;
    var uniRegDin2 = /^(?:3[68][0-9]{1})$/;
    var uniRegJcb1 = /^(?:2131{1})$/;
    var uniRegJcb2 = /^(?:1800{1})$/;
    var uniRegJcb3 = /^(?:35\d{3})$/;
    var regNumberForAE = /^(?:3[47][0-9]{13})$/;
    var regNumberForVI = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
    var regNumberForMC = /^(?:5[1-5][0-9]{14})$/;
    var regNumberForDC = /^(?:6(?:011|5[0-9][0-9])[0-9]{12})$/;
    var regNumberForDIN = /^(?:3(?:0[0-5]|[68][0-9])[0-9]{11})$/;
    var regNumberForJCB = /^(?:(?:2131|1800|35\d{3})\d{11})$/;

    /* HIDDEN NUMBER SAVER */
    var numberHidden = document.getElementById("input-number-hidden");

    /* AMERICAN EXPRESS */
    var boxAe = document.getElementById("box-card-type-border-ae");
    var boxInputAe = document.getElementById("box-card-type-input-ae");
    var numberAe = document.getElementById('basicpill-cardno-input-ae');
    var numberMaskAe = document.getElementById('input-mask-block-for-ae');

    /* VISA */
    var boxVi = document.getElementById("box-card-type-border-vi");
    var boxInputVi = document.getElementById("box-card-type-input-vi");
    var numberVi = document.getElementById('basicpill-cardno-input-vi');
    var numberMaskVi = document.getElementById('input-mask-block-for-vi');   
    
    /* MASTER CARD */
    var boxMc = document.getElementById("box-card-type-border-mc");
    var boxInputMc = document.getElementById("box-card-type-input-mc");
    var numberMc = document.getElementById('basicpill-cardno-input-mc');
    var numberMaskMc = document.getElementById('input-mask-block-for-mc');     
    
    /* DISCOVER */
    var boxDc = document.getElementById("box-card-type-border-dc");
    var boxInputDc = document.getElementById("box-card-type-input-dc");
    var numberDc = document.getElementById('basicpill-cardno-input-dc');
    var numberMaskDc = document.getElementById('input-mask-block-for-dc'); 
    
    /* DINERS CLUB */
    var boxDin = document.getElementById("box-card-type-border-din");
    var boxInputDin = document.getElementById("box-card-type-input-din");
    var numberDin = document.getElementById('basicpill-cardno-input-din');
    var numberMaskDin = document.getElementById('input-mask-block-for-din');     

    /* JAPAN CENTRAL BANK */
    var boxJcb = document.getElementById("box-card-type-border-jcb");
    var boxInputJcb = document.getElementById("box-card-type-input-jcb");
    var numberJcb = document.getElementById('basicpill-cardno-input-jcb');
    var numberMaskJcb = document.getElementById('input-mask-block-for-jcb');  

    if(numberMaskAe.style.display === 'block'){
        var numberValueAe = (((numberAe.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
        var numberValue = '';
    }
    else{
        var numberValueAe = '';
    }

    if(numberMaskVi.style.display === 'block'){
        var numberValueVi = (((numberVi.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
        var numberValue = '';
    }    
    else{
        var numberValueVi = '';
    }

    if(numberMaskMc.style.display === 'block'){
        var numberValueMc = (((numberMc.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
        var numberValue = '';
    }    
    else{
        var numberValueMc = '';
    }

    if(numberMaskDc.style.display === 'block'){
        var numberValueDc = (((numberDc.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
        var numberValue = '';
    }    
    else{
        var numberValueDc = '';
    }        

    if(numberMaskDin.style.display === 'block'){
        var numberValueDin = (((numberDin.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
        var numberValue = '';
    }    
    else{
        var numberValueDin = '';
    }  
    
    if(numberMaskJcb.style.display === 'block'){
        var numberValueJcb = (((numberJcb.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
        var numberValue = '';
    }    
    else{
        var numberValueJcb = '';
    }         

    if(numberValue.length >= 1){
        numberHidden.value = numberValue;
        var numberHiddenValue = numberHidden.value;
    }
    else if(numberValueAe.length > 1){
        numberHidden.value = numberValueAe;
        var numberHiddenValue = numberHidden.value; 
    }
    else if(numberValueVi.length > 1){
        numberHidden.value = numberValueVi;
        var numberHiddenValue = numberHidden.value; 
    } 
    else if(numberValueMc.length > 1){
        numberHidden.value = numberValueMc;
        var numberHiddenValue = numberHidden.value; 
    }      
    else if(numberValueDc.length > 1){
        numberHidden.value = numberValueDc;
        var numberHiddenValue = numberHidden.value; 
    }         
    else if(numberValueDin.length > 1){
        numberHidden.value = numberValueDin;
        var numberHiddenValue = numberHidden.value; 
    }
    else if(numberValueJcb.length > 1){
        numberHidden.value = numberValueJcb;
        var numberHiddenValue = numberHidden.value; 
    }      
    else if((numberHidden.value).length < 1){

    }
    else{
        var numberHiddenValue = numberHidden.value;
    }
    
    /* 
    var boxVi = document.getElementById("box-card-type-border-vi");
    var boxMc = document.getElementById("box-card-type-border-mc");
    var boxDc = document.getElementById("box-card-type-border-dc");
    var boxDin = document.getElementById("box-card-type-border-din");
    var boxJcb = document.getElementById("box-card-type-border-jcb");
    */

    var numberValueAe
    var numberValueVi
    var numberValueMc
    var numberValueDc
    var numberValueDin
    var numberValueJcb


    if(numberHiddenValue !== undefined && numberHiddenValue.length === 2 && (numberValueAe.length === 1 || numberValueVi.length === 1 || numberValueMc.length === 1 || numberValueDc.length === 1 || numberValueDin.length === 1 || numberValueJcb.length === 1)){
        numberHiddenValue = numberHiddenValue.substring(0,1);
        var scanNumberCon = false;
    }
    else if(numberHiddenValue !== undefined && numberHiddenValue.length === 2 && numberValue.length !== 2 && (numberValueAe.length < 1 || numberValueVi.length < 1 || numberValueMc.length < 1 || numberValueDc.length < 1 || numberValueDin.length < 1 || numberValueJcb.length < 1)){
        var scanNumberCon = true;
    }
    else if(numberHiddenValue !== undefined && numberHiddenValue.length > 1 ){
        var scanNumberCon = true;
    }

    if(numberHiddenValue !== undefined && numberHiddenValue.length === 1){
        numberHidden.value = '';
        var scanNumberCon = false;
    }

    if(scanNumberCon === true && numberHiddenValue !== undefined){
        if(numberHiddenValue.substring(0,2) === '34' || numberHiddenValue.substring(0,2) === '37' || numberValueAe.substring(0,2) === '34' || numberValueAe.substring(0,2) === '37'){
            /* AMERICAN EXPRESS */
            if(numberMaskDefault.style.display !== 'none'){
                $("#basicpill-cardno-input").keyup(function() {
                    numberMaskDefault.style.display = 'none';
                    numberMaskAe.style.display = 'block';

                    numberAe.focus();
                    
                    numberAe.setAttribute('placeholder', (number.value.substring(0,35)));
                    numberAe.value = ((number.value).substring(0,35));
                    number.value = '';

                    boxAe.style.border = '2px blue solid';
                    boxInputAe.style.display = 'block';
                    number.style.border = '1px #e7e4db solid';
                    numberSpan.style.color = '#74788d';

                    $("#basicpill-cardno-input-ae").off("keyup");
                })
            }

            var type = 'AE';
            var numberResult = false;
            typeCard.value = 'AE';
            numberSpan.style.color = '#74788d';
            numberAe.style.border = '1px #ced4da solid';
            var uniCon = numberValueAe.substring(2,3).match(uniReg);
            if(uniCon !== null){
                var uniCon = numberValueAe.substring(3,4).match(uniReg);
                if(uniCon !== null){
                    var uniCon = numberValueAe.substring(4,5).match(uniReg);
                    if(uniCon !== null){
                        var uniCon = numberValueAe.substring(5,6).match(uniReg);
                        if(uniCon !== null){
                            var uniCon = numberValueAe.substring(6,7).match(uniReg);
                            if(uniCon !== null){
                                var uniCon = numberValueAe.substring(7,8).match(uniReg);
                                if(uniCon !== null){
                                    var uniCon = numberValueAe.substring(8,9).match(uniReg);
                                    if(uniCon !== null){
                                        var uniCon = numberValueAe.substring(9,10).match(uniReg);
                                        if(uniCon !== null){
                                            var uniCon = numberValueAe.substring(10,11).match(uniReg);
                                            if(uniCon !== null){
                                                var uniCon = numberValueAe.substring(11,12).match(uniReg);
                                                if(uniCon !== null){
                                                    var uniCon = numberValueAe.substring(12,13).match(uniReg);
                                                    if(uniCon !== null){
                                                        var uniCon = numberValueAe.substring(13,14).match(uniReg);
                                                        if(uniCon !== null){
                                                            var uniCon = numberValueAe.substring(14,15).match(uniReg);
                                                            if(uniCon !== null){
                                                                var numberResult = numberValueAe.match(regNumberForAE);
                                                                if(numberResult !== null){
                                                                    numberAe.style.border = '2px blue solid';
                                                                    numberSpan.style.color = 'blue';
                                                                    numberSpan.innerText = '';
                                                                }
                                                                else{
                                                                    number.style.border = '1px red solid';
                                                                    numberSpan.style.color = 'red';
                                                                    numberSpan.innerText = 'Card number is not valid!';
                                                                }
                                                            }else{numberSpan.innerText = 'Number of remaining characters is 1';}
                                                        }else{numberSpan.innerText = 'Number of remaining characters is 2';}
                                                    }else{numberSpan.innerText = 'Number of remaining characters is 3';}
                                                }else{numberSpan.innerText = 'Number of remaining characters is 4';}
                                            }else{numberSpan.innerText = 'Number of remaining characters is 5';}
                                        }else{numberSpan.innerText = 'Number of remaining characters is 6';}
                                    }else{numberSpan.innerText = 'Number of remaining characters is 7';}
                                }else{numberSpan.innerText = 'Number of remaining characters is 8';}
                            }else{numberSpan.innerText = 'Number of remaining characters is 9';}
                        }else{numberSpan.innerText = 'Number of remaining characters is 10';}
                    }else{numberSpan.innerText = 'Number of remaining characters is 11';}
                }else{numberSpan.innerText = 'Number of remaining characters is 12';}
            }else{numberSpan.innerText = 'Number of remaining characters is 13';}
        }
        else if(numberHiddenValue.substring(0,1) === '4' && (numberHiddenValue.substring(1,2).match(uniReg))){
            /* VISA */
            if(numberMaskDefault.style.display !== 'none'){
                $("#basicpill-cardno-input").keyup(function() {
                    numberMaskDefault.style.display = 'none';
                    numberMaskVi.style.display = 'block';

                    numberVi.focus();
                    
                    numberVi.setAttribute('placeholder', (number.value.substring(0,35)));
                    numberVi.value = ((number.value).substring(0,35));
                    number.value = '';

                    boxVi.style.border = '2px blue solid';
                    boxInputVi.style.display = 'block';
                    number.style.border = '1px #e7e4db solid';
                    numberSpan.style.color = '#74788d';

                    $("#basicpill-cardno-input-vi").off("keyup");
                })
            }

            var type = 'VI';
            var numberResult = false;
            typeCard.value = 'VI';
            numberSpan.style.color = '#74788d';
            numberVi.style.border = '1px #ced4da solid';
            var uniCon = numberValueVi.substring(2,3).match(uniReg);
            if(uniCon !== null){
                var uniCon = numberValueVi.substring(3,4).match(uniReg);
                if(uniCon !== null){
                    var uniCon = numberValueVi.substring(4,5).match(uniReg);
                    if(uniCon !== null){
                        var uniCon = numberValueVi.substring(5,6).match(uniReg);
                        if(uniCon !== null){
                            var uniCon = numberValueVi.substring(6,7).match(uniReg);
                            if(uniCon !== null){
                                var uniCon = numberValueVi.substring(7,8).match(uniReg);
                                if(uniCon !== null){
                                    var uniCon = numberValueVi.substring(8,9).match(uniReg);
                                    if(uniCon !== null){
                                        var uniCon = numberValueVi.substring(9,10).match(uniReg);
                                        if(uniCon !== null){
                                            var uniCon = numberValueVi.substring(10,11).match(uniReg);
                                            if(uniCon !== null){
                                                var uniCon = numberValueVi.substring(11,12).match(uniReg);
                                                if(uniCon !== null){
                                                    var uniCon = numberValueVi.substring(12,13).match(uniReg);
                                                    if(uniCon !== null){
                                                        var uniCon = numberValueVi.substring(13,14).match(uniReg);
                                                        if(uniCon !== null){
                                                            var uniCon = numberValueVi.substring(14,15).match(uniReg);
                                                            if(uniCon !== null){
                                                                var uniCon = numberValueVi.substring(15,16).match(uniReg);
                                                                if(uniCon !== null){
                                                                    var numberResult = numberValueVi.match(regNumberForVI);
                                                                    if(numberResult !== null){
                                                                        numberVi.style.border = '2px blue solid';
                                                                        numberSpan.style.color = 'blue'
                                                                        numberSpan.innerText = '';
                                                                    }
                                                                    else{
                                                                        number.style.border = '1px red solid';
                                                                        numberSpan.style.color = 'red'
                                                                        numberSpan.innerText = 'Card number is not valid!';
                                                                    }
                                                                }else{numberSpan.innerText = 'Number of remaining characters is 1';}
                                                            }else{numberSpan.innerText = 'Number of remaining characters is 2';}
                                                        }else{numberSpan.innerText = 'Number of remaining characters is 3';}
                                                    }else{numberSpan.innerText = 'Number of remaining characters is 4';}
                                                }else{numberSpan.innerText = 'Number of remaining characters is 5';}
                                            }else{numberSpan.innerText = 'Number of remaining characters is 6';}
                                        }else{numberSpan.innerText = 'Number of remaining characters is 7';}
                                    }else{numberSpan.innerText = 'Number of remaining characters is 8';}
                                }else{numberSpan.innerText = 'Number of remaining characters is 9';}
                            }else{numberSpan.innerText = 'Number of remaining characters is 10';}
                        }else{numberSpan.innerText = 'Number of remaining characters is 11';}
                    }else{numberSpan.innerText = 'Number of remaining characters is 12';}
                }else{numberSpan.innerText = 'Number of remaining characters is 13';}
            }else{numberSpan.innerText = 'Number of remaining characters is 14';}
        }
        else if(numberHiddenValue.substring(0,1) === '5' && (numberHiddenValue.substring(1,2).match(uniRegMc))){
            /* MASTER CARD */
            if(numberMaskDefault.style.display !== 'none'){
                $("#basicpill-cardno-input").keyup(function() {
                    numberMaskDefault.style.display = 'none';
                    numberMaskMc.style.display = 'block';

                    numberMc.focus();
                    
                    numberMc.setAttribute('placeholder', (number.value.substring(0,35)));
                    numberMc.value = ((number.value).substring(0,35));
                    number.value = '';

                    boxMc.style.border = '2px blue solid';
                    boxInputMc.style.display = 'block';
                    number.style.border = '1px #e7e4db solid';
                    numberSpan.style.color = '#74788d';

                    $("#basicpill-cardno-input-mc").off("keyup");
                })
            }

            var type = 'MC';
            var numberResult = false;
            typeCard.value = 'MC';
            numberSpan.style.color = '#74788d';
            numberMc.style.border = '1px #ced4da solid';
            var uniCon = numberValueMc.substring(2,3).match(uniReg);
            if(uniCon !== null){
                var uniCon = numberValueMc.substring(3,4).match(uniReg);
                if(uniCon !== null){
                    var uniCon = numberValueMc.substring(4,5).match(uniReg);
                    if(uniCon !== null){
                        var uniCon = numberValueMc.substring(5,6).match(uniReg);
                        if(uniCon !== null){
                            var uniCon = numberValueMc.substring(6,7).match(uniReg);
                            if(uniCon !== null){
                                var uniCon = numberValueMc.substring(7,8).match(uniReg);
                                if(uniCon !== null){
                                    var uniCon = numberValueMc.substring(8,9).match(uniReg);
                                    if(uniCon !== null){
                                        var uniCon = numberValueMc.substring(9,10).match(uniReg);
                                        if(uniCon !== null){
                                            var uniCon = numberValueMc.substring(10,11).match(uniReg);
                                            if(uniCon !== null){
                                                var uniCon = numberValueMc.substring(11,12).match(uniReg);
                                                if(uniCon !== null){
                                                    var uniCon = numberValueMc.substring(12,13).match(uniReg);
                                                    if(uniCon !== null){
                                                        var uniCon = numberValueMc.substring(13,14).match(uniReg);
                                                        if(uniCon !== null){
                                                            var uniCon = numberValueMc.substring(14,15).match(uniReg);
                                                            if(uniCon !== null){
                                                                var uniCon = numberValueMc.substring(15,16).match(uniReg);
                                                                if(uniCon !== null){
                                                                    var numberResult = numberValueMc.match(regNumberForMC);
                                                                    if(numberResult !== null){
                                                                        numberMc.style.border = '2px blue solid';
                                                                        numberSpan.style.color = 'blue'
                                                                        numberSpan.innerText = '';
                                                                    }
                                                                    else{
                                                                        number.style.border = '1px red solid';
                                                                        numberSpan.style.color = 'red'
                                                                        numberSpan.innerText = 'Card number is not valid!';
                                                                    }
                                                                }else{numberSpan.innerText = 'Number of remaining characters is 1';}
                                                            }else{numberSpan.innerText = 'Number of remaining characters is 2';}
                                                        }else{numberSpan.innerText = 'Number of remaining characters is 2';}
                                                    }else{numberSpan.innerText = 'Number of remaining characters is 4';}
                                                }else{numberSpan.innerText = 'Number of remaining characters is 5';}
                                            }else{numberSpan.innerText = 'Number of remaining characters is 6';}
                                        }else{numberSpan.innerText = 'Number of remaining characters is 7';}
                                    }else{numberSpan.innerText = 'Number of remaining characters is 8';}
                                }else{numberSpan.innerText = 'Number of remaining characters is 9';}
                            }else{numberSpan.innerText = 'Number of remaining characters is 10';}
                        }else{numberSpan.innerText = 'Number of remaining characters is 11';}
                    }else{numberSpan.innerText = 'Number of remaining characters is 12';}
                }else{numberSpan.innerText = 'Number of remaining characters is 13';}
            }else{numberSpan.innerText = 'Number of remaining characters is 14';}
        }
        else if(numberHiddenValue.substring(0,4) === '6011' || (numberHiddenValue.substring(0,4).match(uniRegDc))){
            /* DISCOVER */
            if(numberMaskDefault.style.display !== 'none'){
                $("#basicpill-cardno-input").keyup(function() {
                    numberMaskDefault.style.display = 'none';
                    numberMaskDc.style.display = 'block';

                    numberDc.focus();
                    
                    numberDc.setAttribute('placeholder', (number.value.substring(0,35)));
                    numberDc.value = ((number.value).substring(0,35));
                    number.value = '';

                    boxDc.style.border = '2px blue solid';
                    boxInputDc.style.display = 'block';
                    number.style.border = '1px #e7e4db solid';
                    numberSpan.style.color = '#74788d';

                    $("#basicpill-cardno-input-dc").off("keyup");
                })
            }

            var type = 'DC';
            var numberResult = false;
            typeCard.value = 'DC';
            numberSpan.style.color = '#74788d';
            numberDc.style.border = '1px #ced4da solid';
            var uniCon = numberValueDc.substring(4,5).match(uniReg);
            if(uniCon !== null){
                var uniCon = numberValueDc.substring(5,6).match(uniReg);
                if(uniCon !== null){
                    var uniCon = numberValueDc.substring(6,7).match(uniReg);
                    if(uniCon !== null){
                        var uniCon = numberValueDc.substring(7,8).match(uniReg);
                        if(uniCon !== null){
                            var uniCon = numberValueDc.substring(8,9).match(uniReg);
                            if(uniCon !== null){
                                var uniCon = numberValueDc.substring(9,10).match(uniReg);
                                if(uniCon !== null){
                                    var uniCon = numberValueDc.substring(10,11).match(uniReg);
                                    if(uniCon !== null){
                                        var uniCon = numberValueDc.substring(11,12).match(uniReg);
                                        if(uniCon !== null){
                                            var uniCon = numberValueDc.substring(12,13).match(uniReg);
                                            if(uniCon !== null){
                                                var uniCon = numberValueDc.substring(13,14).match(uniReg);
                                                if(uniCon !== null){
                                                    var uniCon = numberValueDc.substring(14,15).match(uniReg);
                                                    if(uniCon !== null){
                                                        var uniCon = numberValueDc.substring(15,16).match(uniReg);
                                                        if(uniCon !== null){
                                                            var numberResult = numberValueDc.match(regNumberForDC);
                                                            if(numberResult !== null){
                                                                numberDc.style.border = '2px blue solid';
                                                                numberSpan.style.color = 'blue'
                                                                numberSpan.innerText = '';
                                                            }
                                                            else{
                                                                number.style.border = '1px red solid';
                                                                numberSpan.style.color = 'red'
                                                                numberSpan.innerText = 'Card number is not valid!';
                                                            }
                                                        }else{numberSpan.innerText = 'Number of remaining characters is 1';}
                                                    }else{numberSpan.innerText = 'Number of remaining characters is 2';}
                                                }else{numberSpan.innerText = 'Number of remaining characters is 3';}
                                            }else{numberSpan.innerText = 'Number of remaining characters is 4';}
                                        }else{numberSpan.innerText = 'Number of remaining characters is 5';}
                                    }else{numberSpan.innerText = 'Number of remaining characters is 6';}
                                }else{numberSpan.innerText = 'Number of remaining characters is 7';}
                            }else{numberSpan.innerText = 'Number of remaining characters is 8';}
                        }else{numberSpan.innerText = 'Number of remaining characters is 9';}
                    }else{numberSpan.innerText = 'Number of remaining characters is 10';}
                }else{numberSpan.innerText = 'Number of remaining characters is 11';}
            }else{numberSpan.innerText = 'Number of remaining characters is 12';}
        }
        else if((numberHiddenValue.substring(0,3).match(uniRegDin1)) || (numberHiddenValue.substring(0,3).match(uniRegDin2))){
            /* DINERS CLUB */
            if(numberMaskDefault.style.display !== 'none'){
                $("#basicpill-cardno-input").keyup(function() {
                    numberMaskDefault.style.display = 'none';
                    numberMaskDin.style.display = 'block';

                    numberDin.focus();
                    
                    numberDin.setAttribute('placeholder', (number.value.substring(0,35)));
                    numberDin.value = ((number.value).substring(0,35));
                    number.value = '';

                    boxDin.style.border = '2px blue solid';
                    boxInputDin.style.display = 'block';
                    number.style.border = '1px #e7e4db solid';
                    numberSpan.style.color = '#74788d';

                    $("#basicpill-cardno-input-din").off("keyup");
                })
            }

            var type = 'DIN';
            var numberResult = false;
            typeCard.value = 'DIN';
            numberSpan.style.color = '#74788d';
            numberDin.style.border = '1px #ced4da solid';
            var uniCon = numberValueDin.substring(3,4).match(uniReg);
            if(uniCon !== null){
                var uniCon = numberValueDin.substring(4,5).match(uniReg);
                if(uniCon !== null){
                    var uniCon = numberValueDin.substring(5,6).match(uniReg);
                    if(uniCon !== null){
                        var uniCon = numberValueDin.substring(6,7).match(uniReg);
                        if(uniCon !== null){
                            var uniCon = numberValueDin.substring(7,8).match(uniReg);
                            if(uniCon !== null){
                                var uniCon = numberValueDin.substring(8,9).match(uniReg);
                                if(uniCon !== null){
                                    var uniCon = numberValueDin.substring(9,10).match(uniReg);
                                    if(uniCon !== null){
                                        var uniCon = numberValueDin.substring(10,11).match(uniReg);
                                        if(uniCon !== null){
                                            var uniCon = numberValueDin.substring(11,12).match(uniReg);
                                            if(uniCon !== null){
                                                var uniCon = numberValueDin.substring(12,13).match(uniReg);
                                                if(uniCon !== null){
                                                    var uniCon = numberValueDin.substring(13,14).match(uniReg);
                                                    if(uniCon !== null){
                                                        var numberResult = numberValueDin.match(regNumberForDIN);
                                                        if(numberResult !== null){
                                                            numberDin.style.border = '2px blue solid';
                                                            numberSpan.style.color = 'blue'
                                                            numberSpan.innerText = '';
                                                        }
                                                        else{
                                                            number.style.border = '1px red solid';
                                                            numberSpan.style.color = 'red'
                                                            numberSpan.innerText = 'Card number is not valid!';
                                                        }
                                                    }else{numberSpan.innerText = 'Number of remaining characters is 1';}
                                                }else{numberSpan.innerText = 'Number of remaining characters is 2';}
                                            }else{numberSpan.innerText = 'Number of remaining characters is 3';}
                                        }else{numberSpan.innerText = 'Number of remaining characters is 4';}
                                    }else{numberSpan.innerText = 'Number of remaining characters is 5';}
                                }else{numberSpan.innerText = 'Number of remaining characters is 6';}
                            }else{numberSpan.innerText = 'Number of remaining characters is 7';}
                        }else{numberSpan.innerText = 'Number of remaining characters is 8';}
                    }else{numberSpan.innerText = 'Number of remaining characters is 9';}
                }else{numberSpan.innerText = 'Number of remaining characters is 10';}
            }else{numberSpan.innerText = 'Number of remaining characters is 11';}
        }  
        else if((numberHiddenValue.substring(0,4).match(uniRegJcb1)) || (numberHiddenValue.substring(0,4).match(uniRegJcb2)) || (numberHiddenValue.substring(0,4).match(uniRegJcb3))){
            /* JAPAN CENTRAL BANK */
            if(numberMaskDefault.style.display !== 'none'){
                $("#basicpill-cardno-input").keyup(function() {
                    numberMaskDefault.style.display = 'none';
                    numberMaskJcb.style.display = 'block';

                    numberJcb.focus();
                    
                    numberJcb.setAttribute('placeholder', (number.value.substring(0,35)));
                    numberJcb.value = ((number.value).substring(0,35));
                    number.value = '';

                    boxJcb.style.border = '2px blue solid';
                    boxInputJcb.style.display = 'block';
                    number.style.border = '1px #e7e4db solid';
                    numberSpan.style.color = '#74788d';

                    $("#basicpill-cardno-input-jcb").off("keyup");
                })
            }

            var type = 'JCB';
            var numberResult = false;
            typeCard.value = 'JCB';
            numberSpan.style.color = '#74788d';
            numberJcb.style.border = '1px #ced4da solid';
            var uniCon = numberValueJcb.substring(4,5).match(uniReg);
            if(uniCon !== null){
                var uniCon = numberValueJcb.substring(5,6).match(uniReg);
                if(uniCon !== null){
                    var uniCon = numberValueJcb.substring(6,7).match(uniReg);
                    if(uniCon !== null){
                        var uniCon = numberValueJcb.substring(7,8).match(uniReg);
                        if(uniCon !== null){
                            var uniCon = numberValueJcb.substring(8,9).match(uniReg);
                            if(uniCon !== null){
                                var uniCon = numberValueJcb.substring(9,10).match(uniReg);
                                if(uniCon !== null){
                                    var uniCon = numberValueJcb.substring(10,11).match(uniReg);
                                    if(uniCon !== null){
                                        var uniCon = numberValueJcb.substring(11,12).match(uniReg);
                                        if(uniCon !== null){
                                            var uniCon = numberValueJcb.substring(12,13).match(uniReg);
                                            if(uniCon !== null){
                                                var uniCon = numberValueJcb.substring(13,14).match(uniReg);
                                                if(uniCon !== null){
                                                    var uniCon = numberValueJcb.substring(14,15).match(uniReg);
                                                    if(uniCon !== null){
                                                        var numberResult = numberValueJcb.match(regNumberForJCB);
                                                        if(numberResult !== null){
                                                            numberJcb.style.border = '2px blue solid';
                                                            numberSpan.style.color = 'blue'
                                                            numberSpan.innerText = '';
                                                        }
                                                        else{
                                                            number.style.border = '1px red solid';
                                                            numberSpan.style.color = 'red'
                                                            numberSpan.innerText = 'Card number is not valid!';
                                                        }
                                                    }else{numberSpan.innerText = 'Number of remaining characters is 1';}
                                                }else{numberSpan.innerText = 'Number of remaining characters is 2';}
                                            }else{numberSpan.innerText = 'Number of remaining characters is 3';}
                                        }else{numberSpan.innerText = 'Number of remaining characters is 4';}
                                    }else{numberSpan.innerText = 'Number of remaining characters is 5';}
                                }else{numberSpan.innerText = 'Number of remaining characters is 6';}
                            }else{numberSpan.innerText = 'Number of remaining characters is 7';}
                        }else{numberSpan.innerText = 'Number of remaining characters is 8';}
                    }else{numberSpan.innerText = 'Number of remaining characters is 9';}
                }else{numberSpan.innerText = 'Number of remaining characters is 10';}
            }else{numberSpan.innerText = 'Number of remaining characters is 11';}
        }                
        else if(numberHiddenValue.length >= 2){
            typeCard.value = 0;
            number.style.border = '2px red solid';
            numberSpan.style.color = 'red'
            numberSpan.innerText = 'Card number is not valid';

            /* AMERICAN EXPRESS */
            boxAe.style.border = '1px #ced4da solid';
            numberAe.style.border = '2px red solid';
            
            /* VISA */
            boxVi.style.border = '1px #ced4da solid';
            numberVi.style.border = '2px red solid';

            /* MASTER CARD */
            boxMc.style.border = '1px #ced4da solid';
            numberMc.style.border = '2px red solid';   
            
            /* DISCOVER */
            boxDc.style.border = '1px #ced4da solid';
            numberDc.style.border = '2px red solid'; 
            
            /* DINERS CLUB */
            boxDin.style.border = '1px #ced4da solid';
            numberDin.style.border = '2px red solid'; 
            
            /* JAPAN CENTRAL BANK */
            boxJcb.style.border = '1px #ced4da solid';
            numberJcb.style.border = '2px red solid';            
        }
        else{
            typeCard.value = 0;
            number.style.border = '1px #ced4da solid';
            numberSpan.innerText = '';
            numberMaskDefault.style.display = 'block';

            /* AMERICAN EXPRESS */
            numberMaskAe.style.display = 'none';
            boxAe.style.border = '1px #ced4da solid';
            boxInputAe.style.display = 'none';            

            /* VISA */
            numberMaskVi.style.display = 'none';
            boxVi.style.border = '1px #ced4da solid';
            boxInputVi.style.display = 'none';      
            
            /* MASTER CARD */
            numberMaskMc.style.display = 'none';
            boxMc.style.border = '1px #ced4da solid';
            boxInputMc.style.display = 'none';              

            /* DISCOVER */
            numberMaskDc.style.display = 'none';
            boxDc.style.border = '1px #ced4da solid';
            boxInputDc.style.display = 'none';  
            
            /* DINERS CLUB */
            numberMaskDin.style.display = 'none';
            boxDin.style.border = '1px #ced4da solid';
            boxInputDin.style.display = 'none';      
            
            /* JAPAN CENTRAL BANK */
            numberMaskJcb.style.display = 'none';
            boxJcb.style.border = '1px #ced4da solid';
            boxInputJcb.style.display = 'none';                  
        }
    }
    else{
        /* DEFAULT STYLES */
        typeCard.value = 0;
        number.style.border = '1px #ced4da solid';
        
        /* AMERICAN EXPRESS */
        if(numberMaskAe.style.display === 'block'){
            numberAe.style.border = '1px #ced4da solid';
            boxAe.style.border = '1px #ced4da solid';
            boxInputAe.style.display = 'none';
            $("#basicpill-cardno-input-ae").keyup(function() {
                var numberValueAe = (((numberAe.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
                numberMaskDefault.style.display = 'block';
                numberMaskAe.style.display = 'none';

                number.focus();

                if(numberValueAe.length === 1){
                    var varibaleMask = numberValueAe+" _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                if(numberValueAe.length <= 3){
                    var varibaleMask = numberValueAe.substring(0,1)+" "+numberValueAe.substring(2,3)+" _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                numberSpan.innerText = '';
                $("#basicpill-cardno-input").off("keyup");
            });
        }

        /* VISA */
        if(numberMaskVi.style.display === 'block'){
            numberVi.style.border = '1px #ced4da solid';
            boxVi.style.border = '1px #ced4da solid';
            boxInputVi.style.display = 'none';
            $("#basicpill-cardno-input-vi").keyup(function() {
                var numberValueVi = (((numberVi.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
                numberMaskDefault.style.display = 'block';
                numberMaskVi.style.display = 'none';

                number.focus();

                if(numberValueVi.length === 1){
                    var varibaleMask = numberValueVi+" _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                if(numberValueVi.length <= 3){
                    var varibaleMask = numberValueVi.substring(0,1)+" "+numberValueVi.substring(2,3)+" _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                numberSpan.innerText = '';
                $("#basicpill-cardno-input").off("keyup");
            });
        }

        /* MASTER CARD */
        if(numberMaskMc.style.display === 'block'){
            numberMc.style.border = '1px #ced4da solid';
            boxMc.style.border = '1px #ced4da solid';
            boxInputMc.style.display = 'none';
            $("#basicpill-cardno-input-mc").keyup(function() {
                var numberValueMc = (((numberMc.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
                numberMaskDefault.style.display = 'block';
                numberMaskMc.style.display = 'none';

                number.focus();

                if(numberValueMc.length === 1){
                    var varibaleMask = numberValueMc+" _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                if(numberValueMc.length <= 3){
                    var varibaleMask = numberValueMc.substring(0,1)+" "+numberValueMc.substring(2,3)+" _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                numberSpan.innerText = '';
                $("#basicpill-cardno-input").off("keyup");
            });
        }        

        /* DISCOVER */
        if(numberMaskDc.style.display === 'block'){
            numberDc.style.border = '1px #ced4da solid';
            boxDc.style.border = '1px #ced4da solid';
            boxInputDc.style.display = 'none';
            $("#basicpill-cardno-input-dc").keyup(function() {
                var numberValueDc = (((numberDc.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
                numberMaskDefault.style.display = 'block';
                numberMaskDc.style.display = 'none';

                number.focus();

                if(numberValueDc.length === 1){
                    var varibaleMask = numberValueDc+" _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                if(numberValueDc.length <= 3){
                    var varibaleMask = numberValueDc.substring(0,1)+" "+numberValueDc.substring(2,3)+" _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                numberSpan.innerText = '';
                $("#basicpill-cardno-input").off("keyup");
            });
        }     
        
        /* DINERS CLUB */
        if(numberMaskDin.style.display === 'block'){
            numberDin.style.border = '1px #ced4da solid';
            boxDin.style.border = '1px #ced4da solid';
            boxInputDin.style.display = 'none';
            $("#basicpill-cardno-input-din").keyup(function() {
                var numberValueDin = (((numberDin.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
                numberMaskDefault.style.display = 'block';
                numberMaskDin.style.display = 'none';

                number.focus();

                if(numberValueDin.length === 1){
                    var varibaleMask = numberValueDin+" _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                if(numberValueDin.length <= 3){
                    var varibaleMask = numberValueDin.substring(0,1)+" "+numberValueDin.substring(2,3)+" _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                numberSpan.innerText = '';
                $("#basicpill-cardno-input").off("keyup");
            });
        }
        
        /* JAPAN CENTRAL BANK */
        if(numberMaskJcb.style.display === 'block'){
            numberJcb.style.border = '1px #ced4da solid';
            boxJcb.style.border = '1px #ced4da solid';
            boxInputJcb.style.display = 'none';
            $("#basicpill-cardno-input-jcb").keyup(function() {
                var numberValueJcb = (((numberJcb.value).replace(/\s/g,'')).replace(/\_/g,'')).replace(/\-/g,'');
                numberMaskDefault.style.display = 'block';
                numberMaskJcb.style.display = 'none';

                number.focus();

                if(numberValueJcb.length === 1){
                    var varibaleMask = numberValueJcb+" _ _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                if(numberValueJcb.length <= 3){
                    var varibaleMask = numberValueJcb.substring(0,1)+" "+numberValueJcb.substring(2,3)+" _ _ - _ _ _ _ - _ _ _ _ - _ _ _ _"
                    number.setAttribute('placeholder', varibaleMask);
                    number.value = varibaleMask;
                }
                numberSpan.innerText = '';
                $("#basicpill-cardno-input").off("keyup");
            });
        }           
    }

    if(dateValue.length === 7){
        expMonth = dateValue.substring(0,2);
        expYear = dateValue.substring(5,7);
        newDate = '20'+expYear+'-'+expMonth+'-28';
        var today = new Date();
        var expDate = new Date(newDate);
        if(today.getTime() > expDate.getTime()) {
            var resultDate = false;
            date.style.border = '2px red solid';
            dateSpan.style.color = 'red';
            dateSpan.innerText = 'Your Card is expired.';
        }
        else if(today.getTime() < expDate.getTime()) {
            var resultDate = true;
            date.style.border = '2px blue solid';
            dateSpan.style.color = 'blue';
            dateSpan.innerText = '';
        }        
        else{
            date.style.border = '1px #e7e4db solid';
            dateSpan.innerText = '';
            var resultDate = false;
        }
    }
    else{
        date.style.border = '1px #ced4da solid';
        dateSpan.innerText = '';
    }

    if(ccvValue.length >= 1){
        var ccvResult = false;
        ccvSpan.style.color = '#74788d';
        ccv.style.border = '1px #e7e4db solid';
        if(type === 'AE'){
            var ccvCon = 4;
            var uniCon = ccvValue.substring(0,1).match(uniReg)
            if(uniCon !== null){
                var uniCon = ccvValue.substring(1,2).match(uniReg);
                if(uniCon !== null){
                    var uniCon = ccvValue.substring(2,3).match(uniReg);
                    if(uniCon !== null){
                        var uniCon = ccvValue.substring(3,4).match(uniReg);
                        if(uniCon !== null){
                            var uniCon = ccvValue.match(ccvReg1);
                            if(uniCon !== null){
                                ccv.style.border = '2px blue solid';
                                ccvSpan.style.color = 'blue';
                                ccvSpan.innerText = '';
                                var ccvResult = true;
                            }
                            else{
                                ccv.style.border = '2px red solid';
                                ccvSpan.style.color = 'red';
                                ccvSpan.innerText = 'CCV is not valid!';
                            }
                        }else{ccvSpan.innerText = 'Number of remaining characters is 1';}
                    }else{ccvSpan.innerText = 'Number of remaining characters is 2';}
                }else{ccvSpan.innerText = 'Number of remaining characters is 3';}
            }else{ccvSpan.innerText = 'Number of remaining characters is 4';}
        }
        else if(typeCard.value === '0'){
            ccv.style.border = '2px red solid';
            ccvSpan.style.color = 'red';
            ccvSpan.innerText = 'Type card is not valid for CCV validation.';
        }
        else{
            var ccvCon = 3;
            var uniCon = ccvValue.substring(0,1).match(uniReg)
            if(uniCon !== null){
                var uniCon = ccvValue.substring(1,2).match(uniReg);
                if(uniCon !== null){
                    var uniCon = ccvValue.substring(2,3).match(uniReg);
                    if(uniCon !== null){
                        var uniCon = ccvValue.match(ccvReg2);
                        if(uniCon !== null){
                            ccv.style.border = '2px blue solid';
                            ccvSpan.style.color = 'blue';
                            ccvSpan.innerText = '';
                            var ccvResult = true;
                        }
                        else{
                            ccv.style.border = '2px red solid';
                            ccvSpan.style.color = 'red';
                            ccvSpan.innerText = 'CCV is not valid!';
                        }
                    }else{ccvSpan.innerText = 'Number of remaining characters is 1';}
                }else{ccvSpan.innerText = 'Number of remaining characters is 2';}
            }else{ccvSpan.innerText = 'Number of remaining characters is 3';}
        }
    }
    else{
        ccv.style.border = '1px #ced4da solid';
        ccvSpan.style.color = '#e7e4db';
        ccvSpan.innerText = '';
    }

    if(nameValue.length > 1){
        var regHolderName = /^((?:[A-Za-z]+ ?){1,3})$/;
        name.style.border = '1px #e7e4db solid';
        nameSpan.style.color = '#74788d';
        if(nameValue.match(regHolderName) && nameValue.length > 3 && nameValue.length < 22){
            var resultName = true;
            name.style.border = '2px blue solid';
            nameSpan.style.color = 'blue';
            nameSpan.innerText = '';
        }
        else{
            var resultName = true;
            name.style.border = '2px red solid';
            nameSpan.style.color = 'red';
            nameSpan.innerText = 'Holder Name is not valid!';
        }
    }
    else{
        name.style.border = '1px #ced4da solid';
        nameSpan.innerText = '';
    }

}

function validateCreditCard(type,number,expiration,verifycode,name) {
    
    if(type === 'AE'){
        /* CARD TYPE */
        var resultType = true;

        /* CARD NUMBER */
        var regNumber = /^(?:3[47][0-9]{13})$/;
        if(number.match(regNumber)){
            var resultNumber = true;
        }
        else{
            var resultNumber = 'Amercican Express credit card number is not valid!';
        }

        /* DATE */
        if(expiration.length === 7){
            expMonth = expiration.substring(0,2);
            expYear = expiration.substring(5,7);
            newDate = '20'+expYear+'-'+expMonth+'-28';
            var today = new Date();
            var expDate = new Date(newDate);
            if(today.getTime() > expDate.getTime()) {
                var resultDate = 'Your card is expired!';
            }
            else if(today.getTime() < expDate.getTime()) {
                var resultDate = true;
            }        
            else{
                var resultDate = 'Expiration date is not valid!';
            }
        }
        else{
            var resultDate = 'Expiration date is not valid!';
        }

        /* CCV */
        var regCCV = /^(?:[0-9]{4})$/;
        if(verifycode.match(regCCV)){
            var resultCCV = true;
        }
        else{
            var resultCCV = 'Amercican Express credit card CCV code is not valid!';
        }
        
        /* HOLDER NAME */
        var regHolderName = /^((?:[A-Za-z]+ ?){1,3})$/;
        if(name.match(regHolderName) && name.length > 3 && name.length < 22){
            var resultName = true;
        }
        else{
            var resultName = 'Holder name is not valid!';
        }  
    }
    else if(type === 'VI'){
        /* CARD TYPE */
        var resultType = true;

        /* CARD NUMBER */
        var regNumber = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
        if(number.match(regNumber)){
            var resultNumber = true;
        }
        else{
            var resultNumber = 'VISA credit card number is not valid!';
        }

        /* DATE */
        if(expiration.length === 7){
            expMonth = expiration.substring(0,2);
            expYear = expiration.substring(5,7);
            newDate = '20'+expYear+'-'+expMonth+'-28';
            var today = new Date();
            var expDate = new Date(newDate);
            if(today.getTime() > expDate.getTime()) {
                var resultDate = 'Card is expired!';
            }
            else if(today.getTime() < expDate.getTime()) {
                var resultDate = true;
            }        
            else{
                var resultDate = 'Expiration date is not valid!';
            }
        }
        else{
            var resultDate = 'Expiration date is not valid!';
        }

        /* CCV */
        var regCCV = /^(?:[0-9]{3})$/;
        if(verifycode.match(regCCV)){
            var resultCCV = true;
        }
        else{
            var resultCCV = 'VISA credit card CCV code is not valid!';
        }
        
        /* HOLDER NAME */
        var regHolderName = /^((?:[A-Za-z]+ ?){1,3})$/;
        if(name.match(regHolderName) && name.length > 3 && name.length < 22){
            var resultName = true;
        }
        else{
            var resultName = 'Holder name is not valid!';
        }  
    }
    else if(type === 'MC'){
        /* CARD TYPE */
        var resultType = true;

        /* CARD NUMBER */
        var regNumber = /^(?:5[1-5][0-9]{14})$/;
        if(number.match(regNumber)){
            var resultNumber = true;
        }
        else{
            var resultNumber = 'Master Card credit card number is not valid!';
        }

        /* DATE */
        if(expiration.length === 7){
            expMonth = expiration.substring(0,2);
            expYear = expiration.substring(5,7);
            newDate = '20'+expYear+'-'+expMonth+'-28';
            var today = new Date();
            var expDate = new Date(newDate);
            if(today.getTime() > expDate.getTime()) {
                var resultDate = 'Card is expired!';
            }
            else if(today.getTime() < expDate.getTime()) {
                var resultDate = true;
            }        
            else{
                var resultDate = 'Expiration date is not valid!';
            }
        }
        else{
            var resultDate = 'Expiration date is not valid!';
        }

        /* CCV */
        var regCCV = /^(?:[0-9]{3})$/;
        if(verifycode.match(regCCV)){
            var resultCCV = true;
        }
        else{
            var resultCCV = 'Master Card credit card CCV code is not valid!';
        }

        /* HOLDER NAME */
        var regHolderName = /^((?:[A-Za-z]+ ?){1,3})$/;
        if(name.match(regHolderName) && name.length > 3 && name.length < 22){
            var resultName = true;
        }
        else{
            var resultName = 'Holder name is not valid!';
        }        
    }
    else if(type === 'DC'){
        /* CARD TYPE */
        var resultType = true;

        /* CARD NUMBER */ 
        var regNumber = /^(?:6(?:011|5[0-9][0-9])[0-9]{12})$/;
        if(number.match(regNumber)){
            var resultNumber = true;
        }
        else{
            var resultNumber = 'Discover credit card number is not valid!';
        }

        /* DATE */
        if(expiration.length === 7){
            expMonth = expiration.substring(0,2);
            expYear = expiration.substring(5,7);
            newDate = '20'+expYear+'-'+expMonth+'-28';
            var today = new Date();
            var expDate = new Date(newDate);
            if(today.getTime() > expDate.getTime()) {
                var resultDate = 'Card is expired!';
            }
            else if(today.getTime() < expDate.getTime()) {
                var resultDate = true;
            }        
            else{
                var resultDate = 'Expiration date is not valid!';
            }
        }
        else{
            var resultDate = 'Expiration date is not valid!';
        }

        /* CCV */
        var regCCV = /^(?:[0-9]{3})$/;
        if(verifycode.match(regCCV)){
            var resultCCV = true;
        }
        else{
            var resultCCV = 'Discover credit card CCV code is not valid!';
        }
        
        /* HOLDER NAME */
        var regHolderName = /^((?:[A-Za-z]+ ?){1,3})$/;
        if(name.match(regHolderName) && name.length > 3 && name.length < 22){
            var resultName = true;
        }
        else{
            var resultName = 'Holder name is not valid!';
        }  
    }
    else if(type === 'DIN'){
        /* CARD TYPE */
        var resultType = true;

        /* CARD NUMBER */
        var regNumber = /^(?:3(?:0[0-5]|[68][0-9])[0-9]{11})$/;
        if(number.match(regNumber)){
            var resultNumber = true;
        }
        else{
            var resultNumber = 'Diners Club credit card number is not valid!';
        }

        /* DATE */
        if(expiration.length === 7){
            expMonth = expiration.substring(0,2);
            expYear = expiration.substring(5,7);
            newDate = '20'+expYear+'-'+expMonth+'-28';
            var today = new Date();
            var expDate = new Date(newDate);
            if(today.getTime() > expDate.getTime()) {
                var resultDate = 'Card is expired!';
            }
            else if(today.getTime() < expDate.getTime()) {
                var resultDate = true;
            }        
            else{
                var resultDate = 'Expiration date is not valid!';
            }
        }
        else{
            var resultDate = 'Expiration date is not valid!';
        }

        /* CCV */
        var regCCV = /^(?:[0-9]{3})$/;
        if(verifycode.match(regCCV)){
            var resultCCV = true;
        }
        else{
            var resultCCV = 'Diners Club credit card CCV code is not valid!';
        }
        
        /* HOLDER NAME */
        var regHolderName = /^((?:[A-Za-z]+ ?){1,3})$/;
        if(name.match(regHolderName) && name.length > 3 && name.length < 22){
            var resultName = true;
        }
        else{
            var resultName = 'Holder name is not valid!';
        }  
    }
    else if(type === 'JCB'){
        /* CARD TYPE */
        var resultType = true;

        /* CARD NUMBER */
        var regNumber = /^(?:(?:2131|1800|35\d{3})\d{11})$/;
        if(number.match(regNumber)){
            var resultNumber = true;
        }
        else{
            var resultNumber = 'JCB credit card number is not valid!';
        }

        /* DATE */
        if(expiration.length === 7){
            expMonth = expiration.substring(0,2);
            expYear = expiration.substring(5,7);
            newDate = '20'+expYear+'-'+expMonth+'-28';
            var today = new Date();
            var expDate = new Date(newDate);
            if(today.getTime() > expDate.getTime()) {
                var resultDate = 'Card is expired!';
            }
            else if(today.getTime() < expDate.getTime()) {
                var resultDate = true;
            }        
            else{
                var resultDate = 'Expiration date is not valid!';
            }
        }
        else{
            var resultDate = 'Expiration date is not valid!';
        }

        /* CCV */
        var regCCV = /^(?:[0-9]{3})$/;
        if(verifycode.match(regCCV)){
            var resultCCV = true;
        }
        else{
            var resultCCV = 'JCB credit card CCV code is not valid!';
        }
        
        /* HOLDER NAME */
        var regHolderName = /^((?:[A-Za-z]+ ?){1,3})$/;
        if(name.match(regHolderName) && name.length > 3 && name.length < 22){
            var resultName = true;
        }
        else{
            var resultName = 'Holder name is not valid!';
        }  
    }
    else{
        var resultType = 'Card type is not valid!';
        var resultNumber = 'Card type is not valid!';
        var resultDate = 'Card type is not valid!';
        var resultCCV = 'Card type is not valid!';
        var resultName = 'Card type is not valid!';
        var resultTotal = false;
    }

    if(resultType === true && resultNumber === true && resultDate === true && resultCCV === true && resultName === true){
        var resultTotal = true;
    }
    else{
        var resultTotal = false;
    }

    return [resultType,resultNumber,resultDate,resultCCV,resultName,resultTotal];
}
function validateString(arg) {
    var id = arg;
    var input = document.getElementById(id);
    var value = input.value;
    var reg = "[a-zA-Z ]";
    var valid
    for (let i = 0; i < value.length; i++) {
        const val = value[i];
        var res = val.match(reg);
        if(res === null){
            valid = false;
        }
    }
    if(valid !== false && value.length > 1){
        return true;
    }
    else{
        return false;
    }
}
function validatePhone(arg) {
    var id = arg;
    var input = document.getElementById(id);
    var value = input.value;
    var reg = /^(?:[0-9+ -])$/;
    var valid
    for (let i = 0; i < value.length; i++) {
        const val = value[i];
        var res = val.match(reg);
        if(res === null){
            valid = false;
        }
    }
    if(valid !== false && value.length > 7){
        return true;
    }
    else{
        return false;
    }
}
function validateEmail(arg) {
    var id = arg;
    var input = document.getElementById(id);
    var value = input.value;
    var reg = "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    var res = typeof input.checkValidity === 'function' ? input.checkValidity() : reg.test(value);
    return res
}
function ValidatePassword(pwd) {
    if (typeof pwd != "string") { pwd = "" + pwd; } 
    if (pwd.length < 8) { return 'Password length must be 8 chars'; } 
    if (pwd.search(/[0-9]/) === -1) { return 'At least 1 numeric value'; } 
    if (pwd.search(/[a-z]/) === -1) { return 'At least 1 small letter value [a-z]'; } 
    if (pwd.search(/[A-Z]/) === -1) { return 'At least 1 upper letter value [A-Z]'; } 
    if (pwd.search(/[`~!@#\$%\^&\*\(\)\-_\{\}\=\+'"\>\.\,\?<\/\|\\\:;\]\[]/) === -1) { return 'At least 1 special chars [~!@#$%^&*()_+{}":?><...]'; } 
    return true;
}
function Verification(arg) {
    if(arg === "verify-1-step"){
        var type = "verify-save-device";
        var uidVal = UserEmailValidation();
        var pwdVal = UserPasswordValidation();
        var uid = uidVal[0];
        var uidCon = uidVal[1];
        var pwd = pwdVal[0];
        var pwdCon = pwdVal[1];
        if(uidCon === true && pwdCon === true){
            document.getElementById("modal-progress-bar-block-id").style.display = 'block';
            document.getElementById("shield-check-verification-container").style.display = 'none';
            document.getElementById("shield-check-success-container").style.display = 'none';
            document.getElementById("shield-check-denied-container").style.display = 'none';
            document.getElementById("check-2-step-verification-container").style.display = 'none';
            document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
            document.getElementById("login-valid-label-verification").innerText = '';
            document.getElementById("login-valid-label-true").innerText = '';
            document.getElementById("login-valid-label-false").innerText = '';

            var loginJson = "[{\"uid\":\""+uid+"\",\"pwd\":\""+pwd+"\"}]";

            /* ENCRYPT DATA */
            var encrypt = document.getElementById("encrypt");
            var element = document.getElementById("transport-textbox");
            element.setAttribute('placeholder', loginJson);
            encrypt.click();

            /* OPEN MODAL */
            $('#verificationModal').modal('toggle');
            $('#verificationModal').modal('show');
            $('#verificationModal').modal('hide');
            
            var bar = document.getElementById("modal-progress-bar-id");
            var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100];
            var iv = 50;
            array.forEach(function (perc, i) {
                setTimeout(function () {
                    bar.ariavaluenow = perc;
                    bar.style.width = perc+'%';
                    if(perc === 100){
                        /* GET ENCRYPT DATA */
                        var encryptData = element.placeholder;
                        
                        var cookiesArray = document.cookie.split('; ')
                        const cdValue = cookiesArray.find((row) => row.startsWith('cd='))?.split('=')[1];
                        const ciValue = cookiesArray.find((row) => row.startsWith('ci='))?.split('=')[1];
                        const cnValue = cookiesArray.find((row) => row.startsWith('cn='))?.split('=')[1];
                        const ctValue = cookiesArray.find((row) => row.startsWith('ct='))?.split('=')[1];
                        const ceValue = cookiesArray.find((row) => row.startsWith('ce='))?.split('=')[1];
                        var sessionId = UniversalDashboard.sessionId;
                        var dateTime = (new Date()).getTime();
                        var sessionJson = "[{\"type\":\""+type+"\",\"time\":\""+dateTime+"\",\"cd\":\""+cdValue+"\",\"ci\":\""+ciValue+"\",\"cn\":\""+cnValue+"\",\"ct\":\""+ctValue+"\",\"ce\":\""+ceValue+"\",\"ssid\":\""+sessionId+"\",\"encrypt\":\""+encryptData+"\"}]";
                        const requestPromise = fetch('http://localhost:5000/api/auth', {
                            method : 'POST',
                            body : sessionJson
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error("Got non-2XX response from API server.");
                            }
                            return response.json();
                        }).then(responseData => {
                            return responseData;
                        }); 

                        requestPromise.then(responseData => {
                            let result = (responseData[0]).r;
                            var labv = document.getElementById("login-valid-label-verification");
                            var labt = document.getElementById("login-valid-label-true");
                            var labf = document.getElementById("login-valid-label-false");
                            if(result === 'success'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-success-container").style.display = 'block';
                                document.getElementById("shield-check-denied-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = 'Verification is success!';
                                labf.innerText = '';
                                document.getElementById("check-2-step-verification-stopTimer").click();
                                window.location.replace("/")
                            }
                            else if(result === 'verification'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'block';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'block';
                                labv.innerText = 'Enter the code sent to you by email for successful verification!';
                                labt.innerText = '';
                                labf.innerText = '';
                                VerificationTimerDisplay();
                                setTimeout(function () {
                                    document.getElementById("check-2-step-verification-startTimer").click();
                                },1000)
                            }                            
                            else if(result === 'denied'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Verification is denied!';
                            }
                            else if(result === 'error'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Verification is error!';
                            }
                        }, error => {
                            console.error(error);
                        }); 
                    }
                }, i * iv);
            });
        }
    }
    else if(arg === "verify-2-step"){
        var type = "verify-new-device";
        var uidVal = UserEmailValidation();
        var pwdVal = UserPasswordValidation();
        var uid = uidVal[0];
        var uidCon = uidVal[1];
        var pwd = pwdVal[0];
        var pwdCon = pwdVal[1];
        if(uidCon === true && pwdCon === true){
            var cookiesArray = document.cookie.split('; ')
            const cdValue = cookiesArray.find((row) => row.startsWith('cd='))?.split('=')[1];
            const ciValue = cookiesArray.find((row) => row.startsWith('ci='))?.split('=')[1];
            const cnValue = cookiesArray.find((row) => row.startsWith('cn='))?.split('=')[1];
            const ctValue = cookiesArray.find((row) => row.startsWith('ct='))?.split('=')[1];
            const ceValue = cookiesArray.find((row) => row.startsWith('ce='))?.split('=')[1];
            var sessionId = UniversalDashboard.sessionId;
            var dateTime = (new Date()).getTime();
            var sessionJson = "[{\"type\":\""+type+"\",\"time\":\""+dateTime+"\",\"cd\":\""+cdValue+"\",\"ci\":\""+ciValue+"\",\"cn\":\""+cnValue+"\",\"ct\":\""+ctValue+"\",\"ce\":\""+ceValue+"\",\"ssid\":\""+sessionId+"\"}]";
            const requestPromise = fetch('http://localhost:5000/api/auth', {
                method : 'POST',
                body : sessionJson
            }).then(response => {
                console.log(response);
                if (!response.ok) {
                    throw new Error("Got non-2XX response from API server.");
                }
                return response.json();
            }).then(responseData => {
                return responseData;
            });
            setTimeout(function () {
                requestPromise.then(responseData => {
                    let result = (responseData[0]).r;
                    if(result === 'success'){
                        var labv = document.getElementById("login-valid-label-verification");
                        var labt = document.getElementById("login-valid-label-true");
                        var labf = document.getElementById("login-valid-label-false");
                        document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                        document.getElementById("shield-check-verification-container").style.display = 'none';
                        document.getElementById("shield-check-success-container").style.display = 'block';
                        document.getElementById("shield-check-denied-container").style.display = 'none';
                        document.getElementById("check-2-step-verification-container").style.display = 'none';
                        document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                        labv.innerText = '';
                        labt.innerText = 'Verification is success!';
                        labf.innerText = '';
                        setTimeout(function () {
                            window.location.replace("/")
                        },1000)
                    }
                    else if(result === 'denied'){
                        var labv = document.getElementById("login-valid-label-verification");
                        var labt = document.getElementById("login-valid-label-true");
                        var labf = document.getElementById("login-valid-label-false");
                        document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                        document.getElementById("shield-check-verification-container").style.display = 'none';
                        document.getElementById("shield-check-denied-container").style.display = 'block';
                        document.getElementById("shield-check-success-container").style.display = 'none';
                        document.getElementById("check-2-step-verification-container").style.display = 'none';
                        document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                        labv.innerText = '';
                        labt.innerText = '';
                        labf.innerText = 'Verification is denied!';
                        setTimeout(function () {
                            window.location.reload()
                        },1000)
                    }
                    else if(result === 'error'){
                        var labv = document.getElementById("login-valid-label-verification");
                        var labt = document.getElementById("login-valid-label-true");
                        var labf = document.getElementById("login-valid-label-false");
                        document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                        document.getElementById("shield-check-verification-container").style.display = 'none';
                        document.getElementById("shield-check-denied-container").style.display = 'block';
                        document.getElementById("shield-check-success-container").style.display = 'none';
                        document.getElementById("check-2-step-verification-container").style.display = 'none';
                        document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                        labv.innerText = '';
                        labt.innerText = '';
                        labf.innerText = 'Verification is error!';
                        setTimeout(function () {
                            window.location.reload()
                        },1000)
                    }                    
                }, error => {
                    console.error(error);
                });
            },1000)
        }
    }
    else if(arg === "verify-lock-screen"){
        var type = "verify-save-device";
        var pwdVal = UserPasswordValidation();
        var uid = "importuid";
        var pwd = pwdVal[0];
        var pwdCon = pwdVal[1];
        if(pwdCon === true){
            document.getElementById("modal-progress-bar-block-id").style.display = 'block';
            document.getElementById("shield-check-verification-container").style.display = 'none';
            document.getElementById("shield-check-success-container").style.display = 'none';
            document.getElementById("shield-check-denied-container").style.display = 'none';
            document.getElementById("check-2-step-verification-container").style.display = 'none';
            document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
            document.getElementById("login-valid-label-verification").innerText = '';
            document.getElementById("login-valid-label-true").innerText = '';
            document.getElementById("login-valid-label-false").innerText = '';

            var loginJson = "[{\"uid\":\""+uid+"\",\"pwd\":\""+pwd+"\"}]";

            /* ENCRYPT DATA */
            var encrypt = document.getElementById("encrypt");
            var element = document.getElementById("transport-textbox");
            element.setAttribute('placeholder', loginJson);
            encrypt.click();

            /* OPEN MODAL */
            $('#verificationModal').modal('toggle');
            $('#verificationModal').modal('show');
            $('#verificationModal').modal('hide');

            var bar = document.getElementById("modal-progress-bar-id");
            var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100];
            var iv = 50;
            array.forEach(function (perc, i) {
                setTimeout(function () {
                    bar.ariavaluenow = perc;
                    bar.style.width = perc+'%';
                    if(perc === 100){
                        /* GET ENCRYPT DATA */
                        var element = document.getElementById("transport-textbox");
                        var encryptData = element.placeholder;
                        
                        var cookiesArray = document.cookie.split('; ')
                        const cdValue = cookiesArray.find((row) => row.startsWith('cd='))?.split('=')[1];
                        const ciValue = cookiesArray.find((row) => row.startsWith('ci='))?.split('=')[1];
                        const cnValue = cookiesArray.find((row) => row.startsWith('cn='))?.split('=')[1];
                        const ctValue = cookiesArray.find((row) => row.startsWith('ct='))?.split('=')[1];
                        const ceValue = cookiesArray.find((row) => row.startsWith('ce='))?.split('=')[1];
                        var sessionId = UniversalDashboard.sessionId;
                        var dateTime = (new Date()).getTime();
                        var sessionJson = "[{\"type\":\""+type+"\",\"time\":\""+dateTime+"\",\"cd\":\""+cdValue+"\",\"ci\":\""+ciValue+"\",\"cn\":\""+cnValue+"\",\"ct\":\""+ctValue+"\",\"ce\":\""+ceValue+"\",\"ssid\":\""+sessionId+"\",\"encrypt\":\""+encryptData+"\"}]";
                        const requestPromise = fetch('http://localhost:5000/api/auth', {
                            method : 'POST',
                            body : sessionJson
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error("Got non-2XX response from API server.");
                            }
                            return response.json();
                        }).then(responseData => {
                            return responseData;
                        }); 

                        requestPromise.then(responseData => {
                            let result = (responseData[0]).r;
                            var labv = document.getElementById("login-valid-label-verification");
                            var labt = document.getElementById("login-valid-label-true");
                            var labf = document.getElementById("login-valid-label-false");
                            if(result === 'success'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-success-container").style.display = 'block';
                                document.getElementById("shield-check-denied-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = 'Verification is success!';
                                labf.innerText = '';
                                document.getElementById("check-2-step-verification-stopTimer").click();
                                setTimeout(function () {
                                    window.location.replace("/")
                                },1000)
                            }
                            else if(result === 'verification'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'block';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'block';
                                labv.innerText = 'Enter the code sent to you by email for successful verification!';
                                labt.innerText = '';
                                labf.innerText = '';
                                VerificationTimerDisplay();
                                setTimeout(function () {
                                    document.getElementById("check-2-step-verification-startTimer").click();
                                },1000)
                            }                            
                            else if(result === 'denied'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Verification is denied!';
                            }
                            else if(result === 'error'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Verification is error!';
                            }
                        }, error => {
                            console.error(error);
                        }); 
                    }
                }, i * iv);
            });
        }
    }    
    else if(arg === "verify-register-account"){
        var type = "verify-register-account";
        /* SELLER */
        var sellerFirstName = document.getElementById("basicpill-firstname-input").value;
        var sellerLastName = document.getElementById("basicpill-lastname-input").value;
        var sellerPhoneNum = document.getElementById("basicpill-phoneno-input").value;
        var sellerEmail = document.getElementById("basicpill-email-input").value;
        var sellerState = document.getElementById("basicpill-state-select").value;
        var sellerStateText = $("#basicpill-state-select option:selected").text();
        var sellerLanguage = document.getElementById("basicpill-language-select").value;
        var sellerLanguageText = $("#basicpill-language-select option:selected").text();
        var sellerBillingDeliveryAddressCondition = document.getElementById("check-billing-delivery-address-conditions").value;
        var sellerBillingAddress = document.getElementById("basicpill-billing-address-input").value;
        var sellerDeliveryAddress = document.getElementById("basicpill-delivery-address-input").value;
        var sellerLanguageText = $("#basicpill-language-select option:selected").text();
        
        /* VALIDATION PHONE */
        var validationPhoneResult = validatePhone("basicpill-phoneno-input");

        if(validationPhoneResult === false || sellerFirstName === '' || sellerLastName === '' || sellerPhoneNum === '' || sellerEmail === '' || sellerState === '0' || sellerLanguage === '0' || sellerBillingAddress === '' || sellerDeliveryAddress === ''){
            sellerCondition = false;
        }
        else{
            sellerCondition = true;
        }

        /* COMPANY */
        var companyCheckData = document.getElementById("company-data-block-hidden");
        if(companyCheckData.style.display === 'none'){
            if(sellerLanguage === 'USA'){
                /* COMPANY - USA */
                var companyPanCard = document.getElementById("basicpill-pancard-input").value;
                var companyVatNo = document.getElementById("basicpill-vatno-input").value;
                var companyCSTNo = document.getElementById("basicpill-cstno-input").value;
                var companyServiceTax = document.getElementById("basicpill-servicetax-input").value;
                var companyUIN = document.getElementById("basicpill-companyuin-input").value;
                var companyDeclaration = document.getElementById("basicpill-Declaration-input").value;
                if(companyPanCard && companyVatNo && companyCSTNo && companyServiceTax && companyUIN && companyDeclaration){
                    var companyCondition = true;
                }
                else{
                    var companyCondition = false;
                }
            }
            else if(sellerLanguage === 'CZ'){
                var companyCondition = true;
            }
            else if(sellerLanguage === 'SK'){
                var companyCondition = true;
            }
            else if(sellerLanguage === 'GE'){
                var companyCondition = true;
            }
            else{
                var companyCondition = false;    
            }
        }
        else if(companyCheckData.style.display === 'block'){
            var companyCondition = 'later';
        }
        else{
            var companyCondition = false;
        }

        /* PAYMENT - CREDIT CARD */
        var paymentAddLetter = document.getElementById("payment-data-block-hidden");
        var paymentCreditCard = document.getElementById("payment-data-block-credit-card");
        var paymentApplePay = document.getElementById("payment-data-block-apple-pay");
        var paymentGooglePay = document.getElementById("payment-data-block-google-pay");
        if(paymentAddLetter.style.display === 'block'){
            var paymentCondition = 'later';
        }
        else if(paymentCreditCard.style.display === 'block'){
            var paymentCreditCardType = document.getElementById("basicpill-card-type-select").value;
            var paymentCreditCardTypeText = $("#basicpill-card-type-select option:selected").text();
            var creditCardNumberHidden = document.getElementById("input-number-hidden").value;

            if(paymentCreditCardType === 'AE'){
                var paymentCreditCardName = document.getElementById("basicpill-namecard-input").value;
                var paymentCreditCardNumber = document.getElementById("basicpill-cardno-input-ae").value;
                var paymentCreditCardVerificationCode = document.getElementById("basicpill-card-verification-input").value;
                var paymentCreditCardExpiration = document.getElementById("basicpill-expiration-input").value;
            }
            else if(paymentCreditCardType === 'VI'){
                var paymentCreditCardName = document.getElementById("basicpill-namecard-input").value;
                var paymentCreditCardNumber = document.getElementById("basicpill-cardno-input-vi").value;
                var paymentCreditCardVerificationCode = document.getElementById("basicpill-card-verification-input").value;
                var paymentCreditCardExpiration = document.getElementById("basicpill-expiration-input").value;
            }
            else if(paymentCreditCardType === 'MC'){
                var paymentCreditCardName = document.getElementById("basicpill-namecard-input").value;
                var paymentCreditCardNumber = document.getElementById("basicpill-cardno-input-mc").value;
                var paymentCreditCardVerificationCode = document.getElementById("basicpill-card-verification-input").value;
                var paymentCreditCardExpiration = document.getElementById("basicpill-expiration-input").value;
            }
            else if(paymentCreditCardType === 'DC'){
                var paymentCreditCardName = document.getElementById("basicpill-namecard-input").value;
                var paymentCreditCardNumber = document.getElementById("basicpill-cardno-input-dc").value;
                var paymentCreditCardVerificationCode = document.getElementById("basicpill-card-verification-input").value;
                var paymentCreditCardExpiration = document.getElementById("basicpill-expiration-input").value;
            }
            else if(paymentCreditCardType === 'DIN'){
                var paymentCreditCardName = document.getElementById("basicpill-namecard-input").value;
                var paymentCreditCardNumber = document.getElementById("basicpill-cardno-input-din").value;
                var paymentCreditCardVerificationCode = document.getElementById("basicpill-card-verification-input").value;
                var paymentCreditCardExpiration = document.getElementById("basicpill-expiration-input").value;
            }
            else if(paymentCreditCardType === 'JCB'){
                var paymentCreditCardName = document.getElementById("basicpill-namecard-input").value;
                var paymentCreditCardNumber = document.getElementById("basicpill-cardno-input-jcb").value;
                var paymentCreditCardVerificationCode = document.getElementById("basicpill-card-verification-input").value;
                var paymentCreditCardExpiration = document.getElementById("basicpill-expiration-input").value;
            }
            else{
                var paymentCondition = false;
            }

            var validationCreditCardResult = validateCreditCard(paymentCreditCardType,creditCardNumberHidden,paymentCreditCardExpiration,paymentCreditCardVerificationCode,paymentCreditCardName);

            if(validationCreditCardResult[5] === false){
                var paymentCondition = false;
            }
            else{
                var paymentCondition = 'credit-card';
            }
        }
        else if(paymentApplePay.style.display === 'block'){
            var paymentCondition = 'apple-pay';
        }
        else if(paymentGooglePay.style.display === 'block'){
            var paymentCondition = 'google-pay';
        }
        else{
            var paymentCondition = false;
        }
        
        /* LOGIN */
        var login2StepVerificationCondition = document.getElementById("check-2-step-verification-process").value
        var loginPhone = document.getElementById("basicpill-phoneno-input").value;
        var loginEmail = document.getElementById("basicpill-email-input").value;
        var loginPassword = document.getElementById("basicpill-confirm-password-input").value;
        var loginControlPassword = document.getElementById("basicpill-confirm-control-password-input").value;

        /* VALIDATION PASSWORD */
        if(loginPassword === loginControlPassword){
            var validationPasswordResult = ValidatePassword(loginPassword);
            var validationControlPasswordResult = ValidatePassword(loginControlPassword);
        }
        else{
            var validationPasswordResult = 'Control Password is not same';
            var validationControlPasswordResult = 'Control Password is not same';
        }
        
        if(login2StepVerificationCondition === '' || loginPhone === '' || loginEmail === '' || loginPassword === '' || loginControlPassword === ''){
            loginCondition = false;
        }
        else{
            loginCondition = true;
        }        

        if(sellerCondition === true && (companyCondition === true || companyCondition === 'later') && (paymentCondition === 'credit-card' || paymentCondition === 'later') && loginCondition === true ){
            /* VALIDATION FIRST NAME and LAST NAME */
            var validationFirstNameResult = validateString("basicpill-firstname-input");
            var validationLastNameResult = validateString("basicpill-lastname-input");

            /* VALIDATION CREDIT CARD */
            if(paymentCondition === 'credit-card'){
                var validationCreditCardResultArray = validateCreditCard(paymentCreditCardType,creditCardNumberHidden,paymentCreditCardExpiration,paymentCreditCardVerificationCode,paymentCreditCardName);
                var validationCreditCardResult = validationCreditCardResultArray[5];
            }
            else{
                var validationCreditCardResult = true;
            }

            /* VALIDATION PHONE */
            var validationPhoneResult = validatePhone("basicpill-phoneno-input");

            /* VALIDATION EMAIL */
            var validationEmailResult = validateEmail("basicpill-email-input");

            /* VALIDATION PASSWORD */
            if(loginPassword === loginControlPassword){
                var validationPasswordResult = ValidatePassword(loginPassword);
                var validationControlPasswordResult = ValidatePassword(loginControlPassword);
            }
            else{
                var validationPasswordResult = 'Password is not same';
                var validationControlPasswordResult = 'Password is not same';
            }

            console.log("val1:"+validationFirstNameResult,"val1:"+validationLastNameResult,"val1:"+validationCreditCardResult,"val1:"+validationPhoneResult,"val1:"+validationEmailResult,"val1:"+validationPasswordResult,"val1:"+validationControlPasswordResult);

            if( validationFirstNameResult === true &&
                validationLastNameResult === true &&
                validationCreditCardResult === true &&
                validationPhoneResult === true &&
                validationEmailResult === true &&
                validationPasswordResult === true &&
                validationControlPasswordResult === true){

                var borderStyle = '2px #34c38f solid';

                /* VALIDATION PROGRESS STYLES */
                document.getElementById("progress-confirm-detail-is-valid-block").style.display = 'block';
                document.getElementById("progress-confirm-detail-is-not-valid-block").style.display = 'none';
                document.getElementById("progress-bar-animated-line").classList = 'progress-bar bg-success progress-bar-striped progress-bar-animated"';

                /* VALIDATION - SELLER - ELEMENTS */
                var validationFirstName = document.getElementById("validation-firstname-input");
                var validationFirstNameSpan = document.getElementById("validation-firstname-input-span");
                var validationLastName = document.getElementById("validation-lastname-input");
                var validationLastNameSpan = document.getElementById("validation-lastname-input-span");
                var validationPhone = document.getElementById("validation-phone-input");
                var validationPhoneSpan = document.getElementById("validation-phone-input-span");
                var validationEmail = document.getElementById("validation-email-input");
                var validationEmailSpan = document.getElementById("validation-email-input-span");
                var validationState = document.getElementById("validation-state-input");
                var validationStateSpan = document.getElementById("validation-state-input-span");
                var validationLanguage = document.getElementById("validation-language-input");
                var validationLanguageSpan = document.getElementById("validation-language-input-span");
                var validationBillingAddress = document.getElementById("validation-billing-address-input");
                var validationBillingAddressSpan = document.getElementById("validation-billing-address-input-span");
                var validationDeliveryAddress = document.getElementById("validation-delivery-address-input");
                var validationDeliveryAddressSpan = document.getElementById("validation-delivery-address-input-span");
                /* VALIDATION - SELLER - VALUES FOR CONFIRM DOCUMENT */
                validationFirstName.value = sellerFirstName;
                validationLastName.value = sellerLastName;
                validationPhone.value = sellerPhoneNum;
                validationEmail.value = sellerEmail;
                validationState.value = sellerState;
                validationLanguage.value = sellerLanguage;
                validationBillingAddress.value = sellerBillingAddress;
                validationDeliveryAddress.value = sellerDeliveryAddress;
                /* VALIDATION - SELLER - VALUES FOR API */
                var validationFirstNameValue = validationFirstName.value;
                var validationLastNameValue = validationLastName.value;
                var validationPhoneValue = validationPhone.value;
                var validationEmailValue = validationEmail.value;
                var validationStateValue = validationState.value;
                var validationLanguageValue = validationLanguage.value;
                var validationBillingAddressValue = validationBillingAddress.value;
                var validationDeliveryAddressValue = validationDeliveryAddress.value;
                /* VALIDATION - SELLER - STYLES */
                validationFirstName.style.border = borderStyle;
                validationLastName.style.border = borderStyle;
                validationPhone.style.border = borderStyle;
                validationEmail.style.border = borderStyle;
                validationState.style.border = borderStyle;
                validationLanguage.style.border = borderStyle;
                validationBillingAddress.style.border = borderStyle;
                validationDeliveryAddress.style.border = borderStyle;
                /* VALIDATION - SELLER - COMMENTS */
                validationFirstNameSpan.innerText = '';
                validationLastNameSpan.innerText = '';
                validationPhoneSpan.innerText = '';
                validationEmailSpan.innerText = '';
                validationStateSpan.innerText = '';
                validationLanguageSpan.innerText = '';
                validationBillingAddressSpan.innerText = '';
                validationDeliveryAddressSpan.innerText = '';
                /* TRANSPORT JSON PACKAGE */
                var sellerJson = "[{\"type\":\""+"seller-data"+"\",\"firstname\":\""+validationFirstNameValue+"\",\"lastname\":\""+validationLastNameValue+"\",\"phone\":\""+validationPhoneValue+"\",\"email\":\""+validationEmailValue+"\",\"state\":\""+validationStateValue+"\",\"language\":\""+validationLanguageValue+"\",\"billingaddress\":\""+validationBillingAddressValue+"\",\"deliveryaddress\":\""+validationDeliveryAddressValue+"\"}]";

                /* VALIDATION - COMPANY */
                if(companyCondition === true){
                    if(sellerLanguage === 'USA'){
                        /* VALIDATION - COMPANY - USA - ELEMENTS */
                        var validationCompanyPanCard = document.getElementById("validation-pancard-input");
                        var validationCompanyPanCardSpan = document.getElementById("validation-pancard-input-span");
                        var validationCompanyVatTinNo = document.getElementById("validation-vattinno-input");
                        var validationCompanyVatTinNoSpan = document.getElementById("validation-vattinno-input-span");
                        var validationCompanyCSTNo = document.getElementById("validation-cstno-input");
                        var validationCompanyCSTNoSpan = document.getElementById("validation-cstno-input-span");
                        var validationCompanyServiceTax = document.getElementById("validation-servicetaxno-input");
                        var validationCompanyServiceTaxSpan = document.getElementById("validation-servicetaxno-input-span");
                        var validationCompanyUin = document.getElementById("validation-companyuin-input");
                        var validationCompanyUinSpan = document.getElementById("validation-companyuin-input-span");
                        var validationCompanyDeclaration = document.getElementById("validation-declaration-input");
                        var validationCompanyDeclarationSpan = document.getElementById("validation-declaration-input-span");
                        /* VALIDATION - COMPANY - USA - VALUES FOR CONFIRM DOCUMENT */
                        validationCompanyPanCard.value = companyPanCard;
                        validationCompanyVatTinNo.value = companyVatNo;
                        validationCompanyCSTNo.value = companyCSTNo;
                        validationCompanyServiceTax.value = companyServiceTax;
                        validationCompanyUin.value = companyUIN;
                        validationCompanyDeclaration.value = companyDeclaration;
                        /* VALIDATION - COMPANY - USA - VALUES FOR API */
                        var validationCompanyPanCardValue = validationCompanyPanCard.value;
                        var validationCompanyVatTinNoValue = validationCompanyVatTinNo.value;
                        var validationCompanyCSTNoValue = validationCompanyCSTNo.value;
                        var validationCompanyServiceTaxValue = validationCompanyServiceTax.value;
                        var validationCompanyUinValue = validationCompanyUin.value;
                        var validationCompanyDeclarationValue = validationCompanyDeclaration.value;
                        /* VALIDATION - COMPANY - USA - STYLES */
                        validationCompanyPanCard.style.border = borderStyle;
                        validationCompanyVatTinNo.style.border = borderStyle;
                        validationCompanyCSTNo.style.border = borderStyle;
                        validationCompanyServiceTax.style.border = borderStyle;
                        validationCompanyUin.style.border = borderStyle;
                        validationCompanyDeclaration.style.border = borderStyle;
                        /* VALIDATION - COMPANY - USA - COMMENTS */
                        validationCompanyPanCardSpan.innerText = '';
                        validationCompanyVatTinNoSpan.innerText = '';
                        validationCompanyCSTNoSpan.innerText = '';
                        validationCompanyServiceTaxSpan.innerText = '';
                        validationCompanyUinSpan.innerText = '';
                        validationCompanyDeclarationSpan.innerText = '';
                        /* TRANSPORT JSON PACKAGE */
                        var companyJson = "[{\"type\":\""+"company-usa-document"+"\",\"pancard\":\""+validationCompanyPanCardValue+"\",\"vattinno\":\""+validationCompanyVatTinNoValue+"\",\"cstno\":\""+validationCompanyCSTNoValue+"\",\"servicetax\":\""+validationCompanyServiceTaxValue+"\",\"companyuin\":\""+validationCompanyUinValue+"\",\"declaration\":\""+validationCompanyDeclarationValue+"\"}]";
                    }
                    else if(sellerLanguage === 'CZ'){}
                    else if(sellerLanguage === 'SK'){}
                    else if(sellerLanguage === 'GE'){}
                }
                else{
                     /* TRANSPORT JSON PACKAGE */
                     var companyJson = "[{\"type\":\""+"company-later"+"\"}]";
                }

                if(paymentCondition === 'credit-card'){
                    /* VALIDATION - PAYMENT - CREDIT CARD - ELEMENTS */
                    var validationCreditCardUserName = document.getElementById("validation-card-user-name-input");
                    var validationCreditCardUserNameSpan = document.getElementById("validation-card-user-name-input-span");
                    var validationCreditCardType = document.getElementById("validation-card-type-input");
                    var validationCreditCardTypeSpan = document.getElementById("validation-card-type-input-span");
                    var validationCreditCardNumber = document.getElementById("validation-card-number-input");
                    var validationCreditCardNumberSpan = document.getElementById("validation-card-number-input-span");
                    var validationCreditCardVerificationCode = document.getElementById("validation-card-verification-code-input");
                    var validationCreditCardVerificationCodeSpan = document.getElementById("validation-card-verification-code-input-span");
                    var validationCreditCardExpirationDate = document.getElementById("validation-card-expiration-date-input");
                    var validationCreditCardExpirationDateSpan = document.getElementById("validation-card-expiration-date-input-span");
                    /* VALIDATION - PAYMENT - CREDIT CARD - VALUES FOR CONFIRM DOCUMENT */
                    validationCreditCardType.value = paymentCreditCardType;
                    validationCreditCardNumber.value = paymentCreditCardNumber;
                    validationCreditCardExpirationDate.value = paymentCreditCardExpiration;
                    validationCreditCardVerificationCode.value = paymentCreditCardVerificationCode;
                    validationCreditCardUserName.value = paymentCreditCardName;
                    /* VALIDATION - PAYMENT - CREDIT CARD - VALUES FOR API */
                    var validationCreditCardTypeValue = validationCreditCardType.value;
                    var validationCreditCardNumberValue = validationCreditCardNumber.value;
                    var validationCreditCardExpirationDateValue = validationCreditCardExpirationDate.value;
                    var validationCreditCardVerificationCodeValue = validationCreditCardVerificationCode.value;
                    var validationCreditCardUserNameValue = validationCreditCardUserName.value;
                    /* VALIDATION - PAYMENT - CREDIT CARD - STYLES */
                    validationCreditCardType.style.border = borderStyle;
                    validationCreditCardNumber.style.border = borderStyle;
                    validationCreditCardExpirationDate.style.border = borderStyle;
                    validationCreditCardVerificationCode.style.border = borderStyle;
                    validationCreditCardUserName.style.border = borderStyle;
                    /* VALIDATION - PAYMENT - CREDIT CARD - COMMENTS */
                    validationCreditCardTypeSpan.innerText = '';
                    validationCreditCardNumberSpan.innerText = '';
                    validationCreditCardExpirationDateSpan.innerText = '';
                    validationCreditCardVerificationCodeSpan.innerText = '';
                    validationCreditCardUserNameSpan.innerText = '';
                    /* TRANSPORT JSON PACKAGE */
                    var paymentJson = "[{\"type\":\""+"payment-credit-card"+"\",\"holdername\":\""+validationCreditCardUserNameValue+"\",\"cardtype\":\""+validationCreditCardTypeValue+"\",\"cardnumber\":\""+validationCreditCardNumberValue+"\",\"cardccv\":\""+validationCreditCardVerificationCodeValue+"\",\"cardexpiration\":\""+validationCreditCardExpirationDateValue+"\"}]";
                }
                else{
                    var paymentJson = "[{\"type\":\""+"payment-later"+"\"}]";
                }

                /* VALIDATION - LOGIN - ELEMENTS */
                var validationLoginPhone = document.getElementById("validation-login-phone-input");
                var validationLoginPhoneSpan = document.getElementById("validation-login-phone-input-span");
                var validationLoginEmail = document.getElementById("validation-login-email-input");
                var validationLoginEmailSpan = document.getElementById("validation-login-email-input-span");
                var validationLoginPassword = document.getElementById("validation-login-password-input");
                var validationLoginPasswordSpan = document.getElementById("validation-login-password-input-span");
                /* VALIDATION - LOGIN - VALUES FOR CONFIRM DOCUMENT */
                validationLoginPhone.value = loginPhone;
                validationLoginEmail.value = loginEmail;
                validationLoginPassword.value = loginControlPassword;
                /* VALIDATION - LOGIN - VALUES FOR API */
                var validationLoginPhoneValue = validationLoginPhone.value;
                var validationLoginEmailValue = validationLoginEmail.value;
                var validationLoginPasswordValue = validationLoginPassword.value;
                /* VALIDATION - LOGIN - STYLES */
                validationLoginPhone.style.border = borderStyle;
                validationLoginEmail.style.border = borderStyle;
                validationLoginPassword.style.border = borderStyle;
                /* VALIDATION - LOGIN - SPAN */
                validationLoginPhoneSpan.innerText = '';
                validationLoginEmailSpan.innerText = '';
                validationLoginPasswordSpan.innerText = '';
                /* TRANSPORT JSON PACKAGE */
                var loginJson = "[{\"type\":\""+"login"+"\",\"phone\":\""+validationLoginPhoneValue+"\",\"email\":\""+validationLoginEmailValue+"\",\"password\":\""+validationLoginPasswordValue+"\"}]";

                /* TRANSPORT JSON TO PSU */
                var registrationJson = "[{\"type\":\""+"registration"+"\",\"sellerData\":"+sellerJson+",\"companyData\":"+companyJson+",\"paymentData\":"+paymentJson+",\"loginData\":"+loginJson+"}]";

                /* ENCRYPT DATA */
                var encrypt = document.getElementById("encrypt");
                var element = document.getElementById("transport-textbox");
                element.setAttribute('placeholder', registrationJson);
                encrypt.click();

                /* MODAL SHIELD CONTAINER */
                document.getElementById("login-valid-label-true").innerText = '';
                document.getElementById("login-valid-label-false").innerText = '';
                document.getElementById("shield-check-denied-container").style.display = 'none';                
                document.getElementById("shield-check-success-container").style.display = 'none';
                document.getElementById("modal-progress-bar-block-id").style.display = 'block';

                setTimeout(function () {
                    /* OPEN MODAL */
                    $('#verificationModal').modal('toggle');
                    $('#verificationModal').modal('show');
                    $('#verificationModal').modal('hide');

                    /* GET ENCRYPT DATA */
                    var encryptData = element.placeholder;

                    /* SESSION DATA */
                    var cookiesArray = document.cookie.split('; ')
                    const cdValue = cookiesArray.find((row) => row.startsWith('cd='))?.split('=')[1];
                    const ciValue = cookiesArray.find((row) => row.startsWith('ci='))?.split('=')[1];
                    const cnValue = cookiesArray.find((row) => row.startsWith('cn='))?.split('=')[1];
                    const ctValue = cookiesArray.find((row) => row.startsWith('ct='))?.split('=')[1];
                    const ceValue = cookiesArray.find((row) => row.startsWith('ce='))?.split('=')[1];
                    var sessionId = UniversalDashboard.sessionId;
                    var dateTime = (new Date()).getTime();
                    var sessionJson = "[{\"type\":\""+type+"\",\"time\":\""+dateTime+"\",\"cd\":\""+cdValue+"\",\"ci\":\""+ciValue+"\",\"cn\":\""+cnValue+"\",\"ct\":\""+ctValue+"\",\"ce\":\""+ceValue+"\",\"ssid\":\""+sessionId+"\",\"encrypt\":\""+encryptData+"\"}]";

                    const requestPromise = fetch('http://localhost:5000/api/auth', {
                        method : 'POST',
                        body : sessionJson
                    }).then(response => {
                        if (!response.ok) {
                            throw new Error("Got non-2XX response from API server.");
                        }
                        return response.json();
                    }).then(responseData => {
                        return responseData;
                    });
                    var bar = document.getElementById("modal-progress-bar-id");
                    var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100];
                    var iv = 50;
                    array.forEach(function (perc, i) {
                        setTimeout(function () {
                            bar.ariavaluenow = perc;
                            bar.style.width = perc+'%';
                            if(perc === 100){
                                requestPromise.then(responseData => {
                                    let result = (responseData[0]).r;
                                    let resultType = (responseData[0]).type;
                                    var labt = document.getElementById("login-valid-label-true");
                                    var labf = document.getElementById("login-valid-label-false");
                                    if(result === 'success'){
                                        document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                        document.getElementById("shield-check-success-container").style.display = 'block';
                                        document.getElementById("shield-check-denied-container").style.display = 'none';
                                        labf.innerText = '';
                                        labt.innerText = 'Verification is success!';
                                        setTimeout(function () {
                                            window.location.replace("/")
                                        },1000)
                                    }
                                    else if(result === 'denied'){
                                        if(resultType === 'account-is-exist'){
                                            document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                            document.getElementById("shield-check-denied-container").style.display = 'block';
                                            document.getElementById("shield-check-success-container").style.display = 'none';
                                            labt.innerText = '';
                                            labf.innerText = 'Verification is denied! Account is exist!';
                                        }
                                    }
                                    else if(result === 'error'){
                                        document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                        document.getElementById("shield-check-denied-container").style.display = 'block';
                                        document.getElementById("shield-check-success-container").style.display = 'none';
                                        labt.innerText = '';
                                        labf.innerText = 'Verification is error!';
                                    }
                                    console.log(responseData);
                                }, error => {
                                    console.error(error);
                                }); 
                            }
                        }, i * iv);
                    });
                },500);
            }
            else{
                'not valid'
            }
        }        
        else{
            /* EMPTY INPUT IN CONDITIONS */
            document.getElementById("progress-confirm-detail-is-valid-block").style.display = 'none';
            document.getElementById("progress-confirm-detail-is-not-valid-block").style.display = 'block';
            document.getElementById("progress-bar-animated-line").classList = 'progress-bar bg-danger progress-bar-striped progress-bar-animated"';

            /* VALIDATION FIRST NAME and LAST NAME */
            var validationFirstNameResult = validateString("basicpill-firstname-input");
            var validationLastNameResult = validateString("basicpill-lastname-input");

            /* VALIDATION CREDIT CARD */
            var validationCreditCardResult = validateCreditCard(paymentCreditCardType,creditCardNumberHidden,paymentCreditCardExpiration,paymentCreditCardVerificationCode,paymentCreditCardName);

            /* VALIDATION PHONE */
            var validationPhoneResult = validatePhone("basicpill-phoneno-input");

            /* VALIDATION EMAIL */
            var validationEmailResult = validateEmail("basicpill-email-input");

            /* VALIDATION - SELLER */
            if(sellerFirstName.length > 1 && validationFirstNameResult === true){
                document.getElementById("validation-firstname-input").value = sellerFirstName;
                document.getElementById("validation-firstname-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-firstname-input-span").innerText = '';
            }
            else if(sellerFirstName.length > 1 && validationFirstNameResult === false){
                document.getElementById("validation-firstname-input").value = sellerFirstName;
                document.getElementById("validation-firstname-input").style.border = '3px red solid';
                document.getElementById("validation-firstname-input-span").innerText = 'First name is in an invalid format';
            }
            else{
                document.getElementById("validation-firstname-input").style.border = '3px red solid';
                document.getElementById("validation-firstname-input-span").innerText = 'First name is empty';
            }
            if(sellerLastName.length > 1 && validationLastNameResult === true){
                document.getElementById("validation-lastname-input").value = sellerLastName;
                document.getElementById("validation-lastname-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-lastname-input-span").innerText = '';
            }
            else if(sellerLastName.length > 1 && validationLastNameResult === false){
                document.getElementById("validation-lastname-input").value = sellerLastName;
                document.getElementById("validation-lastname-input").style.border = '3px red solid';
                document.getElementById("validation-lastname-input-span").innerText = 'Last name is in an invalid format';
            }
            else{
                document.getElementById("validation-lastname-input").style.border = '3px red solid';
                document.getElementById("validation-lastname-input-span").innerText = 'Last name is empty';
            }
            if(sellerPhoneNum.length > 1 && validationPhoneResult === true){
                document.getElementById("validation-phone-input").value = sellerPhoneNum;
                document.getElementById("validation-phone-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-phone-input-span").innerText = '';
            }
            else if(sellerPhoneNum.length > 1 && validationPhoneResult === false){
                document.getElementById("validation-phone-input").value = sellerPhoneNum;
                document.getElementById("validation-phone-input").style.border = '3px red solid';
                document.getElementById("validation-phone-input-span").innerText = 'Phone number is in an invalid format';
            }
            else{
                document.getElementById("validation-phone-input").style.border = '3px red solid';
                document.getElementById("validation-phone-input-span").innerText = 'Phone is empty';
            }
            if(sellerEmail.length > 1 && validationEmailResult === true){
                document.getElementById("validation-email-input").value = sellerEmail;
                document.getElementById("validation-email-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-email-input-span").innerText = '';
            }
            else if(sellerEmail.length > 1 && validationEmailResult === false){
                document.getElementById("validation-email-input").value = sellerEmail;
                document.getElementById("validation-email-input").style.border = '3px red solid';
                document.getElementById("validation-email-input-span").innerText = 'Email address is in an invalid format';
            }
            else{
                document.getElementById("validation-email-input").style.border = '3px red solid';
                document.getElementById("validation-email-input-span").innerText = 'Email is empty';
            }
            if(sellerState.length > 1){
                document.getElementById("validation-state-input").value = sellerStateText;
                document.getElementById("validation-state-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-state-input-span").innerText = '';
            }
            else{
                document.getElementById("validation-state-input").style.border = '3px red solid';
                document.getElementById("validation-state-input-span").innerText = 'State is not selected';
            }
            if(sellerLanguage.length > 1){
                document.getElementById("validation-language-input").value = sellerLanguageText;
                document.getElementById("validation-language-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-language-input-span").innerText = '';
            }
            else{
                document.getElementById("validation-language-input").style.border = '3px red solid';
                document.getElementById("validation-language-input-span").innerText = 'Language is not selected';
            }            
            if(sellerBillingAddress.length > 1 && sellerBillingAddress.length > 10){
                document.getElementById("validation-billing-address-input").value = sellerBillingAddress;
                document.getElementById("validation-billing-address-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-billing-address-input-span").innerText = '';
            }
            else if(sellerBillingAddress.length > 1 && sellerBillingAddress.length < 10){
                document.getElementById("validation-billing-address-input").value = sellerBillingAddress;
                document.getElementById("validation-billing-address-input").style.border = '3px red solid';
                document.getElementById("validation-billing-address-input-span").innerText = 'Billing address must have more than 10 characters';
            }
            else{
                document.getElementById("validation-billing-address-input").style.border = '3px red solid';
                document.getElementById("validation-billing-address-input-span").innerText = 'Billing address is empty';
            }            
            if(sellerDeliveryAddress.length > 1 && sellerDeliveryAddress.length > 10){
                document.getElementById("validation-delivery-address-input").value = sellerDeliveryAddress;
                document.getElementById("validation-delivery-address-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-delivery-address-input-span").innerText = '';
            }
            else if(sellerDeliveryAddress.length > 1 && sellerDeliveryAddress.length < 10){
                document.getElementById("validation-delivery-address-input").value = sellerDeliveryAddress;
                document.getElementById("validation-delivery-address-input").style.border = '3px red solid';
                document.getElementById("validation-delivery-address-input-span").innerText = 'Delivery address must have more than 10 characters';
            }
            else{
                document.getElementById("validation-delivery-address-input").style.border = '3px red solid';
                document.getElementById("validation-delivery-address-input-span").innerText = 'Delivery address is empty';
            }            
            
            
            
            /* VALIDATION - COMPANY */
            if(sellerStateText !== '0' && companyCondition === true){
                if(sellerState === 'USA'){
                    /* VALIDATION - COMPANY - USA */
                    if(companyPanCard.length > 1){
                        document.getElementById("validation-pancard-input").value = companyPanCard;
                        document.getElementById("validation-pancard-input").style.border = '1px #ced4da solid';
                        document.getElementById("validation-pancard-input-span").innerText = '';
                    }
                    else{
                        document.getElementById("validation-pancard-input").style.border = '3px red solid';
                        document.getElementById("validation-pancard-input-span").innerText = 'PAN Card is empty';
                    } 
                    if(companyVatNo.length > 1){
                        document.getElementById("validation-vattinno-input").value = companyVatNo;
                        document.getElementById("validation-vattinno-input").style.border = '1px #ced4da solid';
                        document.getElementById("validation-vattinno-input-span").innerText = '';
                    }
                    else{
                        document.getElementById("validation-vattinno-input").style.border = '3px red solid';
                        document.getElementById("validation-vattinno-input-span").innerText = 'VAT/TIN No. is empty';
                    } 
                    if(companyCSTNo.length > 1){
                        document.getElementById("validation-cstno-input").value = companyCSTNo;
                        document.getElementById("validation-cstno-input").style.border = '1px #ced4da solid';
                        document.getElementById("validation-cstno-input-span").innerText = '';
                    }
                    else{
                        document.getElementById("validation-cstno-input").style.border = '3px red solid';
                        document.getElementById("validation-cstno-input-span").innerText = 'CST No. is empty';
                    } 
                    if(companyServiceTax.length > 1){
                        document.getElementById("validation-servicetaxno-input").value = companyServiceTax;
                        document.getElementById("validation-servicetaxno-input").style.border = '1px #ced4da solid';
                        document.getElementById("validation-servicetaxno-input-span").innerText = '';
                    }
                    else{
                        document.getElementById("validation-servicetaxno-input").style.border = '3px red solid';
                        document.getElementById("validation-servicetaxno-input-span").innerText = 'Service Tax No. is empty';
                    } 
                    if(companyUIN.length > 1){
                        document.getElementById("validation-companyuin-input").value = companyUIN;
                        document.getElementById("validation-companyuin-input").style.border = '1px #ced4da solid';
                        document.getElementById("validation-companyuin-input-span").innerText = '';
                    }
                    else{
                        document.getElementById("validation-companyuin-input").style.border = '3px red solid';
                        document.getElementById("validation-companyuin-input-span").innerText = 'Company UIN is empty';
                    } 
                    if(companyDeclaration.length > 1){
                        document.getElementById("validation-declaration-input").value = companyDeclaration;
                        document.getElementById("validation-declaration-input").style.border = '1px #ced4da solid';
                        document.getElementById("validation-declaration-input-span").innerText = '';
                    }
                    else{
                        document.getElementById("validation-declaration-input").style.border = '3px red solid';
                        document.getElementById("validation-declaration-input-span").innerText = 'Declaration is empty';
                    } 
                }
                else if(sellerState === 'CZ'){}
                else if(sellerState === 'SK'){}
                else if(sellerState === 'GE'){}
            }
            else if(companyCondition === 'later'){

            }
            else{
                /* DEFAULT ERROR FOR NONE STATE SELECTED IS USA CONTENT */
                if(sellerState === '0'){
                    /* VALIDATION - COMPANY - USA */
                    document.getElementById("validation-pancard-input").style.border = '3px red solid';
                    document.getElementById("validation-pancard-input-span").innerText = 'State is not selected and PAN Card is not valid';
                    document.getElementById("validation-vattinno-input").style.border = '3px red solid';
                    document.getElementById("validation-vattinno-input-span").innerText = 'State is not selected and VAT/TIN No. is not valid';
                    document.getElementById("validation-cstno-input").style.border = '3px red solid';
                    document.getElementById("validation-cstno-input-span").innerText = 'State is not selected and CST No. is not valid';
                    document.getElementById("validation-servicetaxno-input").style.border = '3px red solid';
                    document.getElementById("validation-servicetaxno-input-span").innerText = 'State is not selected and Service Tax No. is not valid';
                    document.getElementById("validation-companyuin-input").style.border = '3px red solid';
                    document.getElementById("validation-companyuin-input-span").innerText = 'State is not selected and Company UIN is not valid';
                    document.getElementById("validation-declaration-input").style.border = '3px red solid';
                    document.getElementById("validation-declaration-input-span").innerText = 'State is not selected and Declaration is not valid';
                }
                else if(sellerState === 'USA'){}
                else if(sellerState === 'CZ'){}
                else if(sellerState === 'SK'){}
                else if(sellerState === 'GE'){}
            }       

                            
            /* VALIDATION - PAYMENT - CREDIT CARD */
            if(paymentCondition === 'later'){

            }
            else{
                /* CARD TYPE */
                if(validationCreditCardResult[0] === true){
                    document.getElementById("validation-card-type-input").value = paymentCreditCardTypeText;
                    document.getElementById("validation-card-type-input").style.border = '1px #ced4da solid';
                    document.getElementById("validation-card-type-input-span").innerText = '';
                }
                else{
                    document.getElementById("validation-card-type-input").value = paymentCreditCardTypeText;
                    document.getElementById("validation-card-type-input").style.border = '3px red solid';
                    document.getElementById("validation-card-type-input-span").innerText = validationCreditCardResult[0];
                }

                /* CARD NUMBER */
                if(validationCreditCardResult[1] === true){
                    document.getElementById("validation-card-number-input").value = paymentCreditCardNumber;
                    document.getElementById("validation-card-number-input").style.border = '1px #ced4da solid';
                    document.getElementById("validation-card-number-input-span").innerText = '';
                }
                else{
                    document.getElementById("validation-card-number-input").value = paymentCreditCardNumber;
                    document.getElementById("validation-card-number-input").style.border = '3px red solid';
                    document.getElementById("validation-card-number-input-span").innerText = validationCreditCardResult[1];
                } 

                /* CARD DATE */
                if(validationCreditCardResult[2] === true){
                    document.getElementById("validation-card-expiration-date-input").value = paymentCreditCardExpiration;
                    document.getElementById("validation-card-expiration-date-input").style.border = '1px #ced4da solid';
                    document.getElementById("validation-card-expiration-date-input-span").innerText = '';
                }
                else{
                    document.getElementById("validation-card-expiration-date-input").value = paymentCreditCardExpiration;
                    document.getElementById("validation-card-expiration-date-input").style.border = '3px red solid';
                    document.getElementById("validation-card-expiration-date-input-span").innerText = validationCreditCardResult[2];
                } 

                /* CARD CCV */
                if(validationCreditCardResult[3] === true){
                    document.getElementById("validation-card-verification-code-input").value = paymentCreditCardVerificationCode;
                    document.getElementById("validation-card-verification-code-input").style.border = '1px #ced4da solid';
                    document.getElementById("validation-card-verification-code-input-span").innerText = '';
                }
                else{
                    document.getElementById("validation-card-verification-code-input").value = paymentCreditCardVerificationCode;
                    document.getElementById("validation-card-verification-code-input").style.border = '3px red solid';
                    document.getElementById("validation-card-verification-code-input-span").innerText = validationCreditCardResult[3];
                } 
                
                /* CARD NAME */
                if(validationCreditCardResult[4] === true){
                    document.getElementById("validation-card-user-name-input").value = paymentCreditCardName;
                    document.getElementById("validation-card-user-name-input").style.border = '1px #ced4da solid';
                    document.getElementById("validation-card-user-name-input-span").innerText = '';
                }
                else{
                    document.getElementById("validation-card-user-name-input").value = paymentCreditCardName;
                    document.getElementById("validation-card-user-name-input").style.border = '3px red solid';
                    document.getElementById("validation-card-user-name-input-span").innerText = validationCreditCardResult[4];
                } 
            }

            

            /* VALIDATION - LOGIN */
            if(loginPhone.length > 1 && validationPhoneResult === true){
                document.getElementById("validation-login-phone-input").value = loginPhone;
                document.getElementById("validation-login-phone-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-login-phone-input-span").innerText = '';
            }
            else if(sellerPhoneNum.length > 1 && validationPhoneResult === false){
                document.getElementById("validation-login-phone-input").value = loginPhone;
                document.getElementById("validation-login-phone-input").style.border = '3px red solid';
                document.getElementById("validation-login-phone-input-span").innerText = 'Phone number is in an invalid format';
            }            
            else{
                document.getElementById("validation-login-phone-input").style.border = '3px red solid';
                document.getElementById("validation-login-phone-input-span").innerText = 'Login Phone Number is empty';
            } 
            if(loginEmail.length > 1 && validationEmailResult === true){
                document.getElementById("validation-login-email-input").value = loginEmail;
                document.getElementById("validation-login-email-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-login-email-input-span").innerText = '';
            }
            else if(sellerEmail.length > 1 && validationEmailResult === false){
                document.getElementById("validation-login-email-input").value = loginEmail;
                document.getElementById("validation-login-email-input").style.border = '3px red solid';
                document.getElementById("validation-login-email-input-span").innerText = 'Email address is in an invalid format';
            }
            else{
                document.getElementById("validation-login-email-input").style.border = '3px red solid';
                document.getElementById("validation-login-email-input-span").innerText = 'Login Email is empty';
            } 
            if(loginControlPassword.length > 1 && validationPasswordResult === true && validationControlPasswordResult === true){
                document.getElementById("validation-login-password-input").value = loginControlPassword;
                document.getElementById("validation-login-password-input").style.border = '1px #ced4da solid';
                document.getElementById("validation-login-password-input-span").innerText = '';
            }
            else if(loginPassword !== loginControlPassword){
                document.getElementById("validation-login-password-input").style.border = '3px red solid';
                document.getElementById("validation-login-password-input-span").innerText = validationControlPasswordResult;
            }
            else if(loginControlPassword.length > 1 && validationPasswordResult.length > 1){
                document.getElementById("validation-login-password-input").style.border = '3px red solid';
                document.getElementById("validation-login-password-input-span").innerText = validationPasswordResult;
            }
            else{
                document.getElementById("validation-login-password-input").style.border = '3px red solid';
                document.getElementById("validation-login-password-input-span").innerText = 'Login Password is empty';
            } 
        }
    }
    else if(arg === 'verify-recovery-password-identity-email'){
        var type = "verify-recovery-password-identity-email";
        var uidVal = UserEmailValidation();
        var uid = uidVal[0];
        var uidCon = uidVal[1];
        if(uidCon === true){
            document.getElementById("modal-progress-bar-block-id").style.display = 'block';
            document.getElementById("shield-check-verification-container").style.display = 'none';
            document.getElementById("shield-check-success-container").style.display = 'none';
            document.getElementById("shield-check-denied-container").style.display = 'none';
            document.getElementById("check-2-step-verification-container").style.display = 'none';
            document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
            document.getElementById("recovery-password-valid-label-verification").innerText = '';
            document.getElementById("recovery-password-valid-label-true").innerText = '';
            document.getElementById("recovery-password-valid-label-false").innerText = '';

            var loginJson = "[{\"uid\":\""+uid+"\"}]";

            /* ENCRYPT DATA */
            var encrypt = document.getElementById("encrypt");
            var element = document.getElementById("transport-textbox");
            element.setAttribute('placeholder', loginJson);
            encrypt.click();

            /* OPEN MODAL */
            $('#verificationModal').modal('toggle');
            $('#verificationModal').modal('show');
            $('#verificationModal').modal('hide');
            
            var bar = document.getElementById("modal-progress-bar-id");
            var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100];
            var iv = 50;
            array.forEach(function (perc, i) {
                setTimeout(function () {
                    bar.ariavaluenow = perc;
                    bar.style.width = perc+'%';
                    if(perc === 100){
                        /* GET ENCRYPT DATA */
                        var encryptData = element.placeholder;
                        
                        var cookiesArray = document.cookie.split('; ')
                        const cdValue = cookiesArray.find((row) => row.startsWith('cd='))?.split('=')[1];
                        const ciValue = cookiesArray.find((row) => row.startsWith('ci='))?.split('=')[1];
                        const cnValue = cookiesArray.find((row) => row.startsWith('cn='))?.split('=')[1];
                        const ctValue = cookiesArray.find((row) => row.startsWith('ct='))?.split('=')[1];
                        const ceValue = cookiesArray.find((row) => row.startsWith('ce='))?.split('=')[1];
                        var sessionId = UniversalDashboard.sessionId;
                        var dateTime = (new Date()).getTime();
                        var sessionJson = "[{\"type\":\""+type+"\",\"time\":\""+dateTime+"\",\"cd\":\""+cdValue+"\",\"ci\":\""+ciValue+"\",\"cn\":\""+cnValue+"\",\"ct\":\""+ctValue+"\",\"ce\":\""+ceValue+"\",\"ssid\":\""+sessionId+"\",\"encrypt\":\""+encryptData+"\"}]";
                        const requestPromise = fetch('http://localhost:5000/api/auth', {
                            method : 'POST',
                            body : sessionJson
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error("Got non-2XX response from API server.");
                            }
                            return response.json();
                        }).then(responseData => {
                            return responseData;
                        }); 

                        requestPromise.then(responseData => {
                            let result = (responseData[0]).r;
                            var labv = document.getElementById("recovery-password-valid-label-verification");
                            var labt = document.getElementById("recovery-password-valid-label-true");
                            var labf = document.getElementById("recovery-password-valid-label-false");
                            if(result === 'verification'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'block';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'block';
                                labv.innerText = 'Enter the code sent to you by email for successful verification!';
                                labt.innerText = '';
                                labf.innerText = '';
                                VerificationRecoveryTimerDisplay('email');
                                setTimeout(function () {
                                    document.getElementById("check-2-step-verification-startTimer").click();
                                },1000)
                            }                            
                            else if(result === 'denied'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Verification is denied!';
                            }
                            else if(result === 'error'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Verification is error!';
                            }
                        }, error => {
                            console.error(error);
                        }); 
                    }
                }, i * iv);
            });
        }  
    }    
    else if(arg === 'verify-recovery-password-identity-phone'){
        var type = "verify-recovery-password-identity-phone";
        var phoneVal = UserPhoneValidation();
        var phone = phoneVal[0];
        var phoneCon = phoneVal[1];
        if(phoneCon === true){
            document.getElementById("modal-progress-bar-block-id").style.display = 'block';
            document.getElementById("shield-check-verification-container").style.display = 'none';
            document.getElementById("shield-check-success-container").style.display = 'none';
            document.getElementById("shield-check-denied-container").style.display = 'none';
            document.getElementById("check-2-step-verification-container").style.display = 'none';
            document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
            document.getElementById("recovery-password-valid-label-verification").innerText = '';
            document.getElementById("recovery-password-valid-label-true").innerText = '';
            document.getElementById("recovery-password-valid-label-false").innerText = '';

            var phonenJson = "[{\"phone\":\""+phone+"\"}]";

            /* ENCRYPT DATA */
            var encrypt = document.getElementById("encrypt");
            var element = document.getElementById("transport-textbox");
            element.setAttribute('placeholder', phonenJson);
            encrypt.click();

            /* OPEN MODAL */
            $('#verificationModal').modal('toggle');
            $('#verificationModal').modal('show');
            $('#verificationModal').modal('hide');
            
            var bar = document.getElementById("modal-progress-bar-id");
            var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100];
            var iv = 50;
            array.forEach(function (perc, i) {
                setTimeout(function () {
                    bar.ariavaluenow = perc;
                    bar.style.width = perc+'%';
                    if(perc === 100){
                        /* GET ENCRYPT DATA */
                        var encryptData = element.placeholder;
                        
                        var cookiesArray = document.cookie.split('; ')
                        const cdValue = cookiesArray.find((row) => row.startsWith('cd='))?.split('=')[1];
                        const ciValue = cookiesArray.find((row) => row.startsWith('ci='))?.split('=')[1];
                        const cnValue = cookiesArray.find((row) => row.startsWith('cn='))?.split('=')[1];
                        const ctValue = cookiesArray.find((row) => row.startsWith('ct='))?.split('=')[1];
                        const ceValue = cookiesArray.find((row) => row.startsWith('ce='))?.split('=')[1];
                        var sessionId = UniversalDashboard.sessionId;
                        var dateTime = (new Date()).getTime();
                        var sessionJson = "[{\"type\":\""+type+"\",\"time\":\""+dateTime+"\",\"cd\":\""+cdValue+"\",\"ci\":\""+ciValue+"\",\"cn\":\""+cnValue+"\",\"ct\":\""+ctValue+"\",\"ce\":\""+ceValue+"\",\"ssid\":\""+sessionId+"\",\"encrypt\":\""+encryptData+"\"}]";
                        const requestPromise = fetch('http://localhost:5000/api/auth', {
                            method : 'POST',
                            body : sessionJson
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error("Got non-2XX response from API server.");
                            }
                            return response.json();
                        }).then(responseData => {
                            return responseData;
                        }); 

                        requestPromise.then(responseData => {
                            let result = (responseData[0]).r;
                            var labv = document.getElementById("recovery-password-valid-label-verification");
                            var labt = document.getElementById("recovery-password-valid-label-true");
                            var labf = document.getElementById("recovery-password-valid-label-false");
                            if(result === 'verification'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'block';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'block';
                                labv.innerText = 'Enter the code sent to you by phone for successful verification!';
                                labt.innerText = '';
                                labf.innerText = '';
                                VerificationRecoveryTimerDisplay('phone');
                                setTimeout(function () {
                                    document.getElementById("check-2-step-verification-startTimer").click();
                                },1000)
                            }                            
                            else if(result === 'denied'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Verification is denied!';
                            }
                            else if(result === 'error'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Verification is error!';
                            }
                        }, error => {
                            console.error(error);
                        }); 
                    }
                }, i * iv);
            });
        }  
    }        
    else if(arg === 'verify-recovery-password-email'){
        var type = "verify-recovery-password";
        var uidVal = UserEmailValidation();
        var pwdVal = UserRecoveryPasswordValidation('userpassword');
        var confirmpwdVal = UserRecoveryPasswordValidation('userconfirmpassword');
        var uid = uidVal[0];
        var uidCon = uidVal[1];
        var pwd = pwdVal[0];
        var pwdCon = pwdVal[1];
        var confirmpwd = confirmpwdVal[0];
        var confirmpwdCon = confirmpwdVal[1];

        if(pwdCon === true && confirmpwdCon === true && pwd === confirmpwd){
            var controlpwdCon = true;
            document.getElementById("userpassword-valid-label-true").innerText = 'Password is valid!';
            document.getElementById("userpassword-valid-label-false").innerText = '';
            document.getElementById("userconfirmpassword-valid-label-true").innerText = 'Password is valid!';
            document.getElementById("userconfirmpassword-valid-label-false").innerText = '';            
        }
        else{
            var controlpwdCon = false;
            document.getElementById("userpassword-valid-label-true").innerText = '';
            document.getElementById("userpassword-valid-label-false").innerText = 'Password is not same!';
            document.getElementById("userconfirmpassword-valid-label-true").innerText = '';
            document.getElementById("userconfirmpassword-valid-label-false").innerText = 'Confirm Password is not same!';  
        }

        if(uidCon === true && controlpwdCon === true){
            document.getElementById("modal-progress-bar-block-id").style.display = 'block';
            document.getElementById("shield-check-verification-container").style.display = 'none';
            document.getElementById("shield-check-success-container").style.display = 'none';
            document.getElementById("shield-check-denied-container").style.display = 'none';
            document.getElementById("check-2-step-verification-container").style.display = 'none';
            document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
            document.getElementById("recovery-password-valid-label-verification").innerText = '';
            document.getElementById("recovery-password-valid-label-true").innerText = '';
            document.getElementById("recovery-password-valid-label-false").innerText = '';

            var pwdJson = "[{\"pwd\":\""+pwd+"\"}]";

            /* ENCRYPT DATA */
            var encrypt = document.getElementById("encrypt-pwd");
            var element = document.getElementById("transport-textbox");
            element.setAttribute('placeholder', pwdJson);
            encrypt.click();

            /* OPEN MODAL */
            $('#verificationModal').modal('toggle');
            $('#verificationModal').modal('show');
            $('#verificationModal').modal('hide');
            
            var bar = document.getElementById("modal-progress-bar-id");
            var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100];
            var iv = 50;
            array.forEach(function (perc, i) {
                setTimeout(function () {
                    bar.ariavaluenow = perc;
                    bar.style.width = perc+'%';
                    if(perc === 100){
                        /* GET ENCRYPT DATA */
                        var encryptData = element.placeholder;
                        
                        var cookiesArray = document.cookie.split('; ')
                        const cdValue = cookiesArray.find((row) => row.startsWith('cd='))?.split('=')[1];
                        const ciValue = cookiesArray.find((row) => row.startsWith('ci='))?.split('=')[1];
                        const cnValue = cookiesArray.find((row) => row.startsWith('cn='))?.split('=')[1];
                        const ctValue = cookiesArray.find((row) => row.startsWith('ct='))?.split('=')[1];
                        const ceValue = cookiesArray.find((row) => row.startsWith('ce='))?.split('=')[1];
                        var sessionId = UniversalDashboard.sessionId;
                        var dateTime = (new Date()).getTime();
                        var sessionJson = "[{\"type\":\""+type+"\",\"time\":\""+dateTime+"\",\"cd\":\""+cdValue+"\",\"ci\":\""+ciValue+"\",\"cn\":\""+cnValue+"\",\"ct\":\""+ctValue+"\",\"ce\":\""+ceValue+"\",\"ssid\":\""+sessionId+"\",\"encrypt\":\""+encryptData+"\"}]";
                        const requestPromise = fetch('http://localhost:5000/api/auth', {
                            method : 'POST',
                            body : sessionJson
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error("Got non-2XX response from API server.");
                            }
                            return response.json();
                        }).then(responseData => {
                            return responseData;
                        }); 

                        requestPromise.then(responseData => {
                            let result = (responseData[0]).r;
                            var labv = document.getElementById("recovery-password-valid-label-verification");
                            var labt = document.getElementById("recovery-password-valid-label-true");
                            var labf = document.getElementById("recovery-password-valid-label-false");
                            if(result === 'success'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-success-container").style.display = 'block';
                                document.getElementById("shield-check-denied-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = 'Reset password is success!';
                                labf.innerText = '';
                                document.getElementById("check-2-step-verification-stopTimer").click();
                                setTimeout(function () {
                                    window.location.replace("/")
                                },5000);
                            }
                            else if(result === 'denied'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Reset password is denied!';
                            }
                            else if(result === 'error'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Reset password is error!';
                            }
                        }, error => {
                            console.error(error);
                        }); 
                        console.log(requestPromise);
                        console.log('finish');
                    }
                }, i * iv);
            });
        }        
    }
    else if(arg === 'verify-recovery-password-phone'){
        var type = "verify-recovery-password";
        var phoneVal = UserPhoneValidation();
        var pwdVal = UserRecoveryPasswordValidation('userpassword');
        var confirmpwdVal = UserRecoveryPasswordValidation('userconfirmpassword');
        var phoneCon = phoneVal[1];
        var pwd = pwdVal[0];
        var pwdCon = pwdVal[1];
        var confirmpwd = confirmpwdVal[0];
        var confirmpwdCon = confirmpwdVal[1];

        if(pwdCon === true && confirmpwdCon === true && pwd === confirmpwd){
            var controlpwdCon = true;
            document.getElementById("userpassword-valid-label-true").innerText = 'Password is valid!';
            document.getElementById("userpassword-valid-label-false").innerText = '';
            document.getElementById("userconfirmpassword-valid-label-true").innerText = 'Password is valid!';
            document.getElementById("userconfirmpassword-valid-label-false").innerText = '';            
        }
        else{
            var controlpwdCon = false;
            document.getElementById("userpassword-valid-label-true").innerText = '';
            document.getElementById("userpassword-valid-label-false").innerText = 'Password is not same!';
            document.getElementById("userconfirmpassword-valid-label-true").innerText = '';
            document.getElementById("userconfirmpassword-valid-label-false").innerText = 'Confirm Password is not same!';  
        }

        if(phoneCon === true && controlpwdCon === true){
            document.getElementById("modal-progress-bar-block-id").style.display = 'block';
            document.getElementById("shield-check-verification-container").style.display = 'none';
            document.getElementById("shield-check-success-container").style.display = 'none';
            document.getElementById("shield-check-denied-container").style.display = 'none';
            document.getElementById("check-2-step-verification-container").style.display = 'none';
            document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
            document.getElementById("recovery-password-valid-label-verification").innerText = '';
            document.getElementById("recovery-password-valid-label-true").innerText = '';
            document.getElementById("recovery-password-valid-label-false").innerText = '';

            var pwdJson = "[{\"pwd\":\""+pwd+"\"}]";

            /* ENCRYPT DATA */
            var encrypt = document.getElementById("encrypt-pwd");
            var element = document.getElementById("transport-textbox");
            element.setAttribute('placeholder', pwdJson);
            encrypt.click();

            /* OPEN MODAL */
            $('#verificationModal').modal('toggle');
            $('#verificationModal').modal('show');
            $('#verificationModal').modal('hide');
            
            var bar = document.getElementById("modal-progress-bar-id");
            var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100];
            var iv = 50;
            array.forEach(function (perc, i) {
                setTimeout(function () {
                    bar.ariavaluenow = perc;
                    bar.style.width = perc+'%';
                    if(perc === 100){
                        /* GET ENCRYPT DATA */
                        var encryptData = element.placeholder;
                        
                        var cookiesArray = document.cookie.split('; ')
                        const cdValue = cookiesArray.find((row) => row.startsWith('cd='))?.split('=')[1];
                        const ciValue = cookiesArray.find((row) => row.startsWith('ci='))?.split('=')[1];
                        const cnValue = cookiesArray.find((row) => row.startsWith('cn='))?.split('=')[1];
                        const ctValue = cookiesArray.find((row) => row.startsWith('ct='))?.split('=')[1];
                        const ceValue = cookiesArray.find((row) => row.startsWith('ce='))?.split('=')[1];
                        var sessionId = UniversalDashboard.sessionId;
                        var dateTime = (new Date()).getTime();
                        var sessionJson = "[{\"type\":\""+type+"\",\"time\":\""+dateTime+"\",\"cd\":\""+cdValue+"\",\"ci\":\""+ciValue+"\",\"cn\":\""+cnValue+"\",\"ct\":\""+ctValue+"\",\"ce\":\""+ceValue+"\",\"ssid\":\""+sessionId+"\",\"encrypt\":\""+encryptData+"\"}]";
                        const requestPromise = fetch('http://localhost:5000/api/auth', {
                            method : 'POST',
                            body : sessionJson
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error("Got non-2XX response from API server.");
                            }
                            return response.json();
                        }).then(responseData => {
                            return responseData;
                        }); 

                        requestPromise.then(responseData => {
                            let result = (responseData[0]).r;
                            var labv = document.getElementById("recovery-password-valid-label-verification");
                            var labt = document.getElementById("recovery-password-valid-label-true");
                            var labf = document.getElementById("recovery-password-valid-label-false");
                            if(result === 'success'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-success-container").style.display = 'block';
                                document.getElementById("shield-check-denied-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = 'Reset password is success!';
                                labf.innerText = '';
                                document.getElementById("check-2-step-verification-stopTimer").click();
                                setTimeout(function () {
                                    window.location.replace("/")
                                },5000);
                            }
                            else if(result === 'denied'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Reset password is denied!';
                            }
                            else if(result === 'error'){
                                document.getElementById("modal-progress-bar-block-id").style.display = 'none';
                                document.getElementById("shield-check-verification-container").style.display = 'none';
                                document.getElementById("shield-check-denied-container").style.display = 'block';
                                document.getElementById("shield-check-success-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-container").style.display = 'none';
                                document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
                                labv.innerText = '';
                                labt.innerText = '';
                                labf.innerText = 'Reset password is error!';
                            }
                        }, error => {
                            console.error(error);
                        }); 
                        console.log(requestPromise);
                        console.log('finish');
                    }
                }, i * iv);
            });
        }        
    }    
}

function scrollSpyFormHeader() {
    const el = document.getElementById('scrollspyFormHeader');
    el.scrollIntoView({behavior:"smooth"});
}

function multiCheckingBox(arg) {
    var id = arg;
    var con = document.getElementById(id);
    if(con.checked){
        document.getElementById(id).value = true;
    }
    else{
        document.getElementById(id).value = false;
    }

    if(id === "check-company-data-add-later"){
        if(con.checked){
            document.getElementById("company-data-block").style.display = 'none';
            document.getElementById("company-data-block-hidden").style.display = 'block';
            document.getElementById("validation-company-data-block").style.display = 'none';
            document.getElementById("validation-company-data-block-hidden").style.display = 'block';
        }
        else{
            document.getElementById("company-data-block").style.display = 'block';
            document.getElementById("company-data-block-hidden").style.display = 'none';
            document.getElementById("validation-company-data-block").style.display = 'block';
            document.getElementById("validation-company-data-block-hidden").style.display = 'none';
        }
    }
    else if(id === "payment-data-add-later-radio"){
        if(con.checked){
            document.getElementById("payment-data-block-credit-card").style.display = 'none';
            document.getElementById("payment-data-block-apple-pay").style.display = 'none';
            document.getElementById("payment-data-block-google-pay").style.display = 'none';
            document.getElementById("payment-data-block-hidden").style.display = 'block';
            document.getElementById("validation-payment-data-block-credit-card").style.display = 'none';
            document.getElementById("validation-payment-data-block-apple-pay").style.display = 'none';
            document.getElementById("validation-payment-data-block-google-pay").style.display = 'none';
            document.getElementById("validation-payment-data-block-hidden").style.display = 'block';
        }
    }
    else if(id === "payment-data-credit-card-pay-radio"){
        if(con.checked){
            document.getElementById("payment-data-block-credit-card").style.display = 'block';
            document.getElementById("payment-data-block-apple-pay").style.display = 'none';
            document.getElementById("payment-data-block-google-pay").style.display = 'none';
            document.getElementById("payment-data-block-hidden").style.display = 'none';
            document.getElementById("validation-payment-data-block-credit-card").style.display = 'block';
            document.getElementById("validation-payment-data-block-apple-pay").style.display = 'none';
            document.getElementById("validation-payment-data-block-google-pay").style.display = 'none';
            document.getElementById("validation-payment-data-block-hidden").style.display = 'none';
        }
    }    
    else if(id === "payment-data-apple-pay-radio"){
        if(con.checked){
            document.getElementById("payment-data-block-credit-card").style.display = 'none';
            document.getElementById("payment-data-block-apple-pay").style.display = 'block';
            document.getElementById("payment-data-block-google-pay").style.display = 'none';
            document.getElementById("payment-data-block-hidden").style.display = 'none';
            document.getElementById("validation-payment-data-block-credit-card").style.display = 'none';
            document.getElementById("validation-payment-data-block-apple-pay").style.display = 'block';
            document.getElementById("validation-payment-data-block-google-pay").style.display = 'none';
            document.getElementById("validation-payment-data-block-hidden").style.display = 'none';
        }
    }
    else if(id === "payment-data-google-pay-radio"){
        if(con.checked){
            document.getElementById("payment-data-block-credit-card").style.display = 'none';
            document.getElementById("payment-data-block-apple-pay").style.display = 'none';
            document.getElementById("payment-data-block-google-pay").style.display = 'block';
            document.getElementById("payment-data-block-hidden").style.display = 'none';
            document.getElementById("validation-payment-data-block-credit-card").style.display = 'none';
            document.getElementById("validation-payment-data-block-apple-pay").style.display = 'none';
            document.getElementById("validation-payment-data-block-google-pay").style.display = 'block';
            document.getElementById("validation-payment-data-block-hidden").style.display = 'none';
        }
    }
    else if(id === "verify-recovery-password-email-radio"){
        if(con.checked){
            document.getElementById("verify-recovery-password-email-block-id").style.display = 'block';
            document.getElementById("verify-recovery-password-phone-block-id").style.display = 'none';
        }
    }    
    else if(id === "verify-recovery-password-phone-radio"){
        if(con.checked){
            document.getElementById("verify-recovery-password-email-block-id").style.display = 'none';
            document.getElementById("verify-recovery-password-phone-block-id").style.display = 'block';
        }
    }              
}

function multiOpenModal(arg) {
    var id = '#'+arg
    $(id).modal('toggle');
    $(id).modal('show');
    $(id).modal('hide');
}

function LoginPhoneAutocomplete() {
    var input = document.getElementById("basicpill-phoneno-input");
    var output = document.getElementById("basicpill-confirm-phoneno-input");
    output.value = input.value;
}

function LoginEmailAutocomplete() {
    var input = document.getElementById("basicpill-email-input");
    var output = document.getElementById("basicpill-confirm-email-input");
    output.value = input.value;
}

function BillingDeliveryAddressAutocomplete() {
    var condition = document.getElementById("check-billing-delivery-address-conditions").value;
    if(condition === 'false'){
        var input = document.getElementById("basicpill-billing-address-input");
        var output = document.getElementById("basicpill-delivery-address-input");
        output.value = input.value;
        $("#basicpill-delivery-address-input").attr('disabled', true);
    }
    else{
        document.getElementById("basicpill-delivery-address-input").value = '';
        $("#basicpill-delivery-address-input").attr('disabled', false);
    }
}

function BillingDeliveryAddressAutocompleteListener() {
    var condition = document.getElementById("check-billing-delivery-address-conditions").value;
    if(condition === 'true'){
        var input = document.getElementById("basicpill-billing-address-input");
        var output = document.getElementById("basicpill-delivery-address-input");
        output.value = input.value;
    }
}

function VerificationTimerDisplay() {
    setTimeout(function(){
        var verificationContainer = document.getElementById("shield-check-verification-container");
        if(verificationContainer !== undefined){
            var [milliseconds,seconds,minutes,hours] = [1000,59,1,0];
            var timerRef = document.getElementById("check-2-step-verification-timer-display");
            var int = null;
            document.getElementById('check-2-step-verification-startTimer').addEventListener('click', ()=>{
                if(int!==null){
                    clearInterval(int);
                }
                const displayTimer = function() {
                    var k1 = document.getElementById("2-step-verification-code-1");
                    var k2 = document.getElementById("2-step-verification-code-2");
                    var k3 = document.getElementById("2-step-verification-code-3");
                    var k4 = document.getElementById("2-step-verification-code-4");
                    $("#2-step-verification-code-1").keyup(function() {
                        k2.focus();
                        $("#2-step-verification-code-1").off("keyup");
                    });
                    $("#2-step-verification-code-2").keyup(function() {
                        k3.focus();
                        $("#2-step-verification-code-2").off("keyup");
                    });
                    $("#2-step-verification-code-3").keyup(function() {
                        k4.focus();
                        $("#2-step-verification-code-3").off("keyup");
                    });
                    var lkey = k1.value+k2.value+k3.value+k4.value;
                    if(lkey.length === 4){
                        console.log('stop timer');
                        document.getElementById("check-2-step-verification-stopTimer").click();
                        document.getElementById("verification-key").click();
                    }
                    else{
                        milliseconds-=10;
                        if(milliseconds == 0){
                            milliseconds = 1000;
                            if(seconds == 0 && minutes == 0){
                                seconds = 0;
                            }
                            else if(seconds == 0 && minutes > 0){
                                seconds = 59;
                                minutes--;
                            }
                            else if(seconds > 0){
                                seconds--;
                            }
                            else{
                                minutes = 0;
                                seconds--;
                            }
                            
                        }
                        let h = hours < 10 ? + hours : hours;
                        let m = minutes < 10 ? "0" + minutes : minutes;
                        let s = seconds < 10 ? "0" + seconds : seconds;
                        let ms = milliseconds < 10 ? + milliseconds : milliseconds < 100 ? + milliseconds : milliseconds;
                        timerRef.innerHTML = ` ${m}:${s} `;
                    }
                }
                int = setInterval(displayTimer,10);
            });
            document.getElementById('check-2-step-verification-stopTimer').addEventListener('click', ()=>{
                clearInterval(int);
            });
            document.getElementById('check-2-step-verification-pauseTimer').addEventListener('click', ()=>{
                clearInterval(int);
            });
        }
    },1000);
    
}

function VerificationRecoveryTimerDisplay(arg) {
    setTimeout(function(){
        var verificationContainer = document.getElementById("shield-check-verification-container");
        if(verificationContainer !== undefined){
            var [milliseconds,seconds,minutes,hours] = [1000,59,1,0];
            var timerRef = document.getElementById("check-2-step-verification-timer-display");
            var int = null;
            document.getElementById('check-2-step-verification-startTimer').addEventListener('click', ()=>{
                if(int!==null){
                    clearInterval(int);
                }
                const displayTimer = function() {
                    var k1 = document.getElementById("2-step-verification-code-1");
                    var k2 = document.getElementById("2-step-verification-code-2");
                    var k3 = document.getElementById("2-step-verification-code-3");
                    var k4 = document.getElementById("2-step-verification-code-4");
                    $("#2-step-verification-code-1").keyup(function() {
                        k2.focus();
                        $("#2-step-verification-code-1").off("keyup");
                    });
                    $("#2-step-verification-code-2").keyup(function() {
                        k3.focus();
                        $("#2-step-verification-code-2").off("keyup");
                    });
                    $("#2-step-verification-code-3").keyup(function() {
                        k4.focus();
                        $("#2-step-verification-code-3").off("keyup");
                    });
                    var lkey = k1.value+k2.value+k3.value+k4.value;
                    if(lkey.length === 4){
                        console.log('stop timer');
                        document.getElementById("check-2-step-verification-stopTimer").click();
                        document.getElementById(("verification-key-"+arg)).click();
                    }
                    else{
                        milliseconds-=10;
                        if(milliseconds == 0){
                            milliseconds = 1000;
                            if(seconds == 0 && minutes == 0){
                                seconds = 0;
                            }
                            else if(seconds == 0 && minutes > 0){
                                seconds = 59;
                                minutes--;
                            }
                            else if(seconds > 0){
                                seconds--;
                            }
                            else{
                                minutes = 0;
                                seconds--;
                            }
                            
                        }
                        let h = hours < 10 ? + hours : hours;
                        let m = minutes < 10 ? "0" + minutes : minutes;
                        let s = seconds < 10 ? "0" + seconds : seconds;
                        let ms = milliseconds < 10 ? + milliseconds : milliseconds < 100 ? + milliseconds : milliseconds;
                        timerRef.innerHTML = ` ${m}:${s} `;
                    }
                }
                int = setInterval(displayTimer,10);
            });
            document.getElementById('check-2-step-verification-stopTimer').addEventListener('click', ()=>{
                clearInterval(int);
            });
            document.getElementById('check-2-step-verification-pauseTimer').addEventListener('click', ()=>{
                clearInterval(int);
            });
        }
    },1000);
    
}

function VerifyKeySuccess() {
    Verification("verify-2-step");
}

function VerifyKeyDenied() {
    var labv = document.getElementById("login-valid-label-verification");
    var labt = document.getElementById("login-valid-label-true");
    var labf = document.getElementById("login-valid-label-false");
    document.getElementById("modal-progress-bar-block-id").style.display = 'none';
    document.getElementById("shield-check-verification-container").style.display = 'none';
    document.getElementById("shield-check-denied-container").style.display = 'block';
    document.getElementById("shield-check-success-container").style.display = 'none';
    document.getElementById("check-2-step-verification-container").style.display = 'none';
    document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
    labv.innerText = '';
    labt.innerText = '';
    labf.innerText = 'Verification is denied!';
}

function VerifyRecoveryKeySuccess(arg) {
    if(arg === 'email'){
        var labv = document.getElementById("recovery-password-valid-label-verification");
        var labt = document.getElementById("recovery-password-valid-label-true");
        var labf = document.getElementById("recovery-password-valid-label-false");
        labv.innerText = 'Verification email is success!';
        labt.innerText = '';
        labf.innerText = '';
        setTimeout(function(){
            $('#verificationModal').modal('hide');
            document.getElementById("verify-recovery-password-email-block-id").style.display = 'none';
            document.getElementById("verify-recovery-password-phone-block-id").style.display = 'none';
            document.getElementById("verify-selector-box-id").style.display = 'none';
            document.getElementById("verify-recovery-password-box-id").style.display = 'block';
            document.getElementById("verification-btn-email-method-id").style.display = 'block';
        },3000);
    }
    else if(arg === 'phone'){
        var labv = document.getElementById("recovery-password-valid-label-verification");
        var labt = document.getElementById("recovery-password-valid-label-true");
        var labf = document.getElementById("recovery-password-valid-label-false");
        labv.innerText = 'Verification phone is success!';
        labt.innerText = '';
        labf.innerText = '';
        setTimeout(function(){
            $('#verificationModal').modal('hide');
            document.getElementById("verify-recovery-password-email-block-id").style.display = 'none';
            document.getElementById("verify-recovery-password-phone-block-id").style.display = 'none';
            document.getElementById("verify-selector-box-id").style.display = 'none';
            document.getElementById("verify-recovery-password-box-id").style.display = 'block';
            document.getElementById("verification-btn-phone-method-id").style.display = 'block';            
        },3000);
    }
}

function VerifyRecoveryKeyDenied(arg) {
    if(arg === 'email'){
        var labv = document.getElementById("recovery-password-valid-label-verification");
        var labt = document.getElementById("recovery-password-valid-label-true");
        var labf = document.getElementById("recovery-password-valid-label-false");
        document.getElementById("modal-progress-bar-block-id").style.display = 'none';
        document.getElementById("shield-check-verification-container").style.display = 'none';
        document.getElementById("shield-check-denied-container").style.display = 'block';
        document.getElementById("shield-check-success-container").style.display = 'none';
        document.getElementById("check-2-step-verification-container").style.display = 'none';
        document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
        labv.innerText = '';
        labt.innerText = '';
        labf.innerText = 'Verification email is denied!';
    }
    else if(arg === 'phone'){
        var labv = document.getElementById("recovery-password-valid-label-verification");
        var labt = document.getElementById("recovery-password-valid-label-true");
        var labf = document.getElementById("recovery-password-valid-label-false");
        document.getElementById("modal-progress-bar-block-id").style.display = 'none';
        document.getElementById("shield-check-verification-container").style.display = 'none';
        document.getElementById("shield-check-denied-container").style.display = 'block';
        document.getElementById("shield-check-success-container").style.display = 'none';
        document.getElementById("check-2-step-verification-container").style.display = 'none';
        document.getElementById("check-2-step-verification-timer-display-container").style.display = 'none';
        labv.innerText = '';
        labt.innerText = '';
        labf.innerText = 'Verification phone is denied!';
    }
}