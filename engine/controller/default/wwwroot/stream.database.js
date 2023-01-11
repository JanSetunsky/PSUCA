/* Database Structure Processes */

/* GET JSON BY VALUE TO LOG */
/* Short */
function d(){let x=new XMLHttpRequest();x.onload=function(){if(x.status===200){r=JSON.parse(x.responseText);$.each(r,function(k,v) {var v=v.d;console.log(v);});}};x.open('GET','/app/builder/root/database/products/test.json',true);x.send(null);}
/* Normal */
function d() {
    let x = new XMLHttpRequest();
    x.onload = function() {
        if(x.status === 200) {
            r = JSON.parse(x.responseText);
            $.each(r, function(k, v) {
                var v = v.d;
                console.log(v);
            });
        }
    };
    x.open('GET', '/app/builder/root/database/products/test.json' , true); 
    x.send(null);
}

function d(arg,type,attr,id) {
    if(arg==='find'){
        if(type==='products'){
            var a = '/app/builder/root/database/'+type+'/'+id+'/'+attr+'.json';
        }
    }
    else if(arg==='get'){
        if(type==='products'){
            var a = '/app/builder/root/database/'+type+'/'+id+'/'+attr+'.json';
        }
    }
    console.log(a);
}
















function stateChange(newState) {
    setTimeout(function(){
        if(newState == -1){
            
        }  
        }, 5000);
    }
    
stateChange(-1);
    