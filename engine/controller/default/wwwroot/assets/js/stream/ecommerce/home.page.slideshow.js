function slideshowBtnRightSide(arg) {
    var clsList = document.getElementsByClassName(arg);
    var clsChildList = clsList[0].children;
    var length = clsChildList.length;
    for (var i=0; i < length; i++){
        var clsl = clsChildList[i].classList;
        if(clsl.value.match('slide-1') !== null){
            var position = i;
        }
    }

    for (var i=0; i < length; i++){
        var clsChildList = clsList[0].children;
        var obj = clsChildList[i];
        var clsl = clsChildList[i].classList;
        if(clsl.value.match('active') !== null && i+1 !== length){
            let classText = 'slide-'+length+' slide-style carousel-item';
            let objId = obj.id;
            document.getElementById(objId).classList = classText;
            document.getElementById(objId).style.transform = 'translate(-200%,0)';
            setTimeout(function(){
                document.getElementById(objId).style.display = 'none';
                document.getElementById(objId).style.transform = '';
                setTimeout(function(){
                    document.getElementById(objId).style.display = 'block';
                },500)
            },500)
            var activeCon = 1;
        }
        else if(clsl.value.match('active') !== null && i+1 === length){
            let classText = 'slide-'+length+' slide-style carousel-item';
            let objId = obj.id;
            document.getElementById(objId).classList = classText;
            document.getElementById(objId).style.transform = 'translate(-200%,0)';
            setTimeout(function(){
                document.getElementById(objId).style.display = 'none';
                document.getElementById(objId).style.transform = '';
                setTimeout(function(){
                    document.getElementById(objId).style.display = 'block';
                },500)
            },500)            
            let newClassList = 'slide-1 slide-style carousel-item active';
            let objFirst = clsChildList[0];
            let objFirstId = objFirst.id;
            document.getElementById(objFirstId).classList = newClassList;
        }        
        else if(activeCon === 1){
            let classText = 'slide-1 slide-style carousel-item active';
            let objId = obj.id;
            document.getElementById(objId).classList = classText;
            var activeCon = 0;
        }
        else{
            let objId = obj.id;
            let objClassList = document.getElementById(objId).classList.value;
            objSlideNumber = parseFloat((objClassList.replace('slide-','')).replace(' slide-style carousel-item',''));
            objSlideNumberMinus = objSlideNumber-1;
            let newClassList = 'slide-'+objSlideNumberMinus+' slide-style carousel-item';
            document.getElementById(objId).classList = newClassList;
        }
    }
}


function slideshowBtnLeftSide(arg) {
    var clsList = document.getElementsByClassName(arg);
    var clsChildList = clsList[0].children;
    var length = clsChildList.length;
    for (var i=0; i < length; i++){
        var clsl = clsChildList[i].classList;
        if(clsl.value.match('active') !== null){
            var position = i;
        }
    }

    for (var i=0; i < length; i++){
        var iM = length-i-1;
        var clsChildList = clsList[0].children;
        var obj = clsChildList[iM];
        var clsl = clsChildList[iM].classList;
        if(iM === (length-1) && clsl.value.match('active') === null && clsl.value.match('slide-'+length) !== null){
            let classText = 'slide-1 slide-style carousel-item active';
            let objId = obj.id;
            document.getElementById(objId).style.display = 'none';
            document.getElementById(objId).classList = classText;
            setTimeout(function(){
                document.getElementById(objId).style.display = 'block';                
                document.getElementById(objId).style.transform = 'translate(-100%,0)';
                setTimeout(function(){
                    document.getElementById(objId).style.transform = '';
                },300)
            },50)
            var typeProcess = 1;
        }
        else if(typeProcess === 1){
            let iMR = iM+1+1;
            let classText = 'slide-'+iMR+' slide-style carousel-item';
            let objId = obj.id;
            document.getElementById(objId).classList = classText;
        }
        else if(iM === (length-1) && clsl.value.match('active') !== null){
            let classText = 'slide-2 slide-style carousel-item';
            let objId = obj.id;
            document.getElementById(objId).classList = classText;
            var giveActiv = true;
        }
        else if(clsl.value.match('active') !== null){
            let classText = 'slide-2 slide-style carousel-item';
            let objId = obj.id;
            document.getElementById(objId).classList = classText;
            var giveActiv = true;
        }        
        else if(giveActiv === true){
            let classText = 'slide-1 slide-style carousel-item active';
            let objId = obj.id;
            document.getElementById(objId).style.display = 'none';
            document.getElementById(objId).classList = classText;
            setTimeout(function(){
                document.getElementById(objId).style.display = 'block';                
                document.getElementById(objId).style.transform = 'translate(-100%,0)';
                setTimeout(function(){
                    document.getElementById(objId).style.transform = '';
                },300)
            },50)
            var giveActiv = false;
        }
        else{
            let objId = obj.id;
            let objClassList = document.getElementById(objId).classList.value;
            objSlideNumber = parseFloat((objClassList.replace('slide-','')).replace(' slide-style carousel-item',''));
            objSlideNumberMinus = objSlideNumber+1;
            let newClassList = 'slide-'+objSlideNumberMinus+' slide-style carousel-item';
            document.getElementById(objId).classList = newClassList;
        }



    }
}