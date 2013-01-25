class Fish {
  PImage img;
  int imgsize = 50;
  int xpos;
  int ypos;
  int xsize = 1000;
  int ysize = 800;
  
  int avoidDist = 10;
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

  void trackFaceMovement(Face userFace) {
    //println(userFace.posePosition.x);
    float xDistFromFace = abs(userFace.posePosition.x - xpos);
    float yDistFromFace = abs(userFace.posePosition.y - ypos); 
    float xVelo = map(xDistFromFace, 0, xsize/4, 20, 0);
    float yVelo = map(yDistFromFace, 0, ysize/4, 20, 0);
    println("xVelo: " + xVelo);
    if(xpos >= userFace.posePosition.x) {
      xpos += xVelo; 
    }
    if(xpos < userFace.posePosition.x) {
      xpos -= xVelo;
    }
    if(ypos >= userFace.posePosition.y) {
      ypos += yVelo; 
    }
    if(ypos < userFace.posePosition.y) {
      ypos -= yVelo; 
    }
  }

  void moveSemiRandomly(Fish[] f) {
    avoidOtherFish(f);
  }

  void avoidOtherFish(Fish[] f) {
    
  }

  void checkBoundaries() {
    if (xpos >= (xsize - imgsize)) {
      xpos--;
    }
    if (xpos <= 0) {
      xpos++;
    }
    if (ypos >= (ysize - imgsize)) {
      nosePos += 0.1;
      ypos--;
    }
    if (ypos <= 0) {
      ypos++;
    }
  }
};

