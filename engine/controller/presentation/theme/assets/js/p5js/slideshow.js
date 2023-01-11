/* 
function windowIframeScrollbar() {
    var iframe_name = document.getElementById("initial-udiframe-canvas-p5js");
    iframe_name.scrolling = "no";
}
*/




function stateChange(newState) {
    setTimeout(function(){
        if(newState == -1){
            const instanceCaption = new Typewriter('#initial-slideshow-caption', {
                loop: true,
                });
            const instanceLabel = new Typewriter('#initial-slideshow-label', {
                loop: true,
                });                
                
            instanceCaption.typeString('Solutions for business.')
            .pauseFor(1000)
            .typeString('<br/>')
            .typeString('Desktop and web applications.')
            .pauseFor(2000)
            .deleteChars(29)
            .typeString('E-Commerce development.')
            .pauseFor(1000)
            .deleteChars(23)
            .typeString('Accounting systems.')
            .pauseFor(1000)
            .deleteChars(19)
            .typeString('Warehouse systems.')
            .pauseFor(1000)
            .deleteChars(18)            
            .typeString('Artificial Intelligence.')
            .pauseFor(1000)
            .deleteAll(1)
            .start();
            instanceLabel.typeString('ASP.NET, C#, Javascript, React, SQL and more...')
            .pauseFor(1000)
            .typeString('<br/>')
            .typeString('Database entity models.')
            .pauseFor(1000)
            .typeString('<br/>')
            .typeString('Runspace interfaces.')            
            .pauseFor(1000)
            .typeString('<br/>')
            .typeString('E-Commerce solution.')
            .pauseFor(10000)
            .deleteAll(1)
            .start();            
        }
    }, 2000);
}


stateChange(-1);

