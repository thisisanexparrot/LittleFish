class Fish {
  PImage img;
  int imgsize = 50;
  int xpos;
  int ypos;
  int xsize = 640;
  int ysize = 480;
  float nosePos;

  Fish() {
    img = loadImage("fish.png");
    xpos = int(random(10, xsize-20));
    ypos = int(random(10, ysize-20));
    nosePos = PI/3.0;
  }
  void drawFish() {
    pushMatrix();
    checkBoundaries();
    translate(xpos, ypos);
    rotate(nosePos);
    image(img, 0, 0); 
    popMatrix();
  }
  
  void checkBoundaries() {
    if(xpos >= (xsize - imgsize)) {
      xpos--;
    }
    if(xpos <= 0) {
      xpos++; 
    }
    if(ypos >= (ysize - imgsize)) {
      ypos--; 
    }
    if(ypos <= 0) {
      ypos++; 
    }
    
  }
};

