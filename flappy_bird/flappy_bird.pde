// import processing.sound.*; *LYD*
// SoundFile flaplyd; *LYD*

Bird b;
Pipe p;
PImage img1;
PImage img2;
PImage gameover;
float x1, x2, x3, dx; 
float y; 
ArrayList<Pipe> Pipes = new ArrayList<Pipe>();
int score = 0;
PFont kremlin;
boolean gameOver;
// import processing.sound.*; *LYD*
// SoundFile flaplyd; *LYD*

void setup() {
  size(500, 800);
  noStroke();
  img1 = loadImage("sprites/background-day.png");
  img2 = loadImage("sprites/base.png");
  gameover=loadImage("sprites/gameover.png");
  frameRate(60);
  y=height-112/2;
  x1=0;
  x2=x1 + 336;
  x3=x2 + 336;
  dx = -2;
  kremlin = loadFont("data/Kremlin-48.vlw");
  restart = loadImage("sprites/restart.PNG");
  restart_mork = loadImage("sprites/restart_mork.PNG");
  b = new Bird();
  p = new Pipe();
}

void draw() {
  imageMode(CENTER);
  image(img1, width/2, height/2);
  img1.resize(0, 900);
  //image(img2,width/2,height-112/2);

  x1=x1 + dx;
  x2=x2 + dx;
  x3=x3 + dx;
  image(img2, x1, y);
  image(img2, x2, y);
  image(img2, x3, y);

  if (x1 <= -336) {
    x1 = x3 + 336;
  } 
  if (x2 <= -336) {
    x2 = x1 + 336;
  } 
  if (x3 <= -336) {
    x3 = x2 + 336;
  }
  if(gameOver==true){
  dx=0;
  }

  b.render();
  b.update();

  for (Pipe p : Pipes) {
    p.render();
    p.update();
  }
  if(gameOver==false){
  if (frameCount % 175 == 0) {
    Pipes.add(new Pipe());
    if (frameCount % 175 == 0) {
      score = score + 1;
    }
    if (frameCount < 350) {
      score = 0;
    }
  }
  }
  // flaplyd = new SoundFile (this, "flaplyd.mp3"); *LYD*
  // flaplyd = new SoundFile (this, "flaplyd.mp3"); *LYD*

  //Game over når jorden rammes
  if (b.y >= height - 110 - b.s/2) {
    textAlign(CENTER);
    textSize(50);
    image(gameover,width/2,height/2.5);
    gameOver=true;
    b.dy=0;
    b.ddy=0;
  }

  menu();

  textAlign(CENTER);
  textSize(48);
  textFont(kremlin);
  fill(0);
  text(score, width/2 + 3, 200 + 3);
  fill(255);
  text(score, width/2, 200);
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
