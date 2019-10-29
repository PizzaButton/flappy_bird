// import processing.sound.*; *LYD*
// SoundFile flaplyd; *LYD*

Bird b;
Pipe p;
PImage img1;
PImage img2;
float x1, x2, x3; 
float y; 
ArrayList<Pipe> Pipes = new ArrayList<Pipe>();

void setup() {
  size(500, 800);
  noStroke();
  img1 = loadImage("sprites/background-day.png");
  img2 = loadImage("sprites/base.png");
  frameRate(60);
  y=height-112/2;
  x1=0;
  x2=x1 + 336;
  x3=x2 + 336;

  b = new Bird();
  p = new Pipe();
}

void draw() {
  imageMode(CENTER);
  image(img1, width/2, height/2);
  img1.resize(0,900);
  //image(img2,width/2,height-112/2);
  
  x1=x1-2;
  x2=x2-2;
  x3=x3-2;
  image(img2,x1,y);
  image(img2,x2,y);
  image(img2,x3,y);
  
  if(x1 <= -336) {
  x1 = x3 + 336;
  } if (x2 <= -336) {
  x2 = x1 + 336;
  } if (x3 <= -336) {
  x3 = x2 + 336;
  }
  
  
  b.render();
  b.update();
  
  for (Pipe p: Pipes) {
  p.render();
  p.update();
  }
  
  if (frameCount % 175 == 0) {
    Pipes.add(new Pipe());
  }
 
 // flaplyd = new SoundFile (this, "flaplyd.mp3"); *LYD*
 
  //Game over når jorden rammes
  if (b.y >= height - b.s/2) {
    frameRate(0);
    textAlign(CENTER);
    textSize(40);
    text("GAME OVER", width/2, height/2);
  }
}

void keyPressed() {
  if (key == ' ') {
    b.flap();
  //flaplyd.play(); { *LYD*
    //flaplyd.amp(1); *LYD*
  }
}

void keyReleased() {
  if (!b.ready2flap) {
    b.ready2flap = true;
  }
}
