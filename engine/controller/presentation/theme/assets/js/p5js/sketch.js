// this class describes the properties of a single particle.
class Particle {
  // setting the co-ordinates, radius and the
  // speed of a particle in both the co-ordinates axes.
    constructor(){
      this.x = random(0,width);
      this.y = random(0,height);
      this.r = random(0.5,3);
      this.xSpeed = random(-0.3,0.3);
      this.ySpeed = random(-0.3,0.3);

    }
  
  // creation of a particle.
    createParticle() {
      noStroke();
      fill('rgb(255,255,255)');
      circle(this.x,this.y,this.r);
      ellipse(mouseX,mouseY, 0,0);
    }
  
  // setting the particle in motion.
    moveParticle() {
      if(this.x < 0 || this.x > width)
        this.xSpeed*=-1;
      if(this.y < 0 || this.y > height)
        this.ySpeed*=-1;
        this.x+=this.xSpeed;
        this.y+=this.ySpeed;
    }
  
  // this function creates the connections(lines)
  // between particles which are less than a certain distance apart
    joinParticles(particles) {
      particles.forEach(element =>{
        let dis1 = dist(this.x,this.y,element.x,element.y);
        let dis2 = dist(this.x,this.y,mouseX,mouseY);
        if(dis1<70) {
          stroke('rgba(255,255,255,0.09)');
          line(this.x,this.y,element.x,element.y);
        }
        if(dis2<110) {
          stroke('rgba(255,255,255,0.01)');
          line(this.x,this.y,mouseX,mouseY);
        }
      });
    }
  }
  
  // an array to add multiple particles
  let particles = [];
  
  function setup() {
    createCanvas(windowWidth, windowHeight);
    for(let i = 0;i<width/15;i++){
      particles.push(new Particle());
    }
  }
  
  function draw() {
    clear();
    background(220, 0);
    for(let i = 0;i<particles.length;i++) {
      particles[i].createParticle();
      particles[i].moveParticle();
      particles[i].joinParticles(particles.slice(i));
    }
  }
  function windowResized() {
    const css = getComputedStyle(canvas.parentElement),
          mw = float(css.marginLeft) + float(css.marginRight),
          ww = float(css.width)  || windowWidth,
          w = round(ww - mw), h = round(300);
  
    resizeCanvas(w, h, true);

  }

/*
  function windowResized() {
    const css = getComputedStyle(canvas.parentElement),
          mw = float(css.marginLeft) + float(css.marginRight),
          ww = float(css.width)  || windowWidth,
          wh = float(300),
          w = round(ww - mw), h = round(wh);
  
    resizeCanvas(w, h, true);

  }
*/
