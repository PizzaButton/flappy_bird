PImage restart;
PImage restart_mork;
void menu () {
  if (gameOver==true) {
    image(restart, width/2, height/2);
    for(){}
    if (mouseX>=width/2-85 && mouseX<=width/2+85) {
      if (mouseY >= height/2-30 && mouseY<=height/2+30) {
        image(restart_mork, width/2, height/2);
        if (mousePressed==true) {
          setup();
          Pipes.clear();
          gameOver=false;
          frameCount=0;
          score=0;
          
        }
      }
    }
  }
}
