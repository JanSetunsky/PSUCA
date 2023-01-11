var streams = [];
var symbolSize = 24;

function setup() {
	createCanvas(window.innerWidth, window.innerHeight);
	textSize(symbolSize);

	var x = 0;
	for(var i = 0; i <= width/symbolSize; ++i) {
		var stream = new Stream();
		stream.generateSymbols(x, round(random(-1000, 0)));
		streams.push(stream);
		x += symbolSize;
	}
}

function draw() {
	background(0, 128);
	streams.forEach(function(stream){
		stream.render();
	});
}