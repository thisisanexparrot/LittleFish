class Fish {
  PImage img;
  int imgsize = 50;
  int xpos;
  int ypos;
  int xsize = 1000;
  int ysize = 800;
  float xVelo;
  float yVelo;

  int avoidDist = 10;
  float nosePos;
  boolean flipFish;
  float turnDeg;

  Fish() {
    img = loadImage("fish.png");
    xpos = int(random(10, xsize-20));
    ypos = int(random(10, ysize-20));
    nosePos = random(0, TWO_PI);
    //nosePos = PI+0.2;
    xVelo = 1.0;
    yVelo = 1.0;
  }
  void drawFish() {
    pushMatrix();
    checkBoundaries();
    translate(xpos, ypos);
    rotate(nosePos);
    image(img, 0, 0); 
    popMatrix();

    if (flipFish == true) {
      nosePos += 0.09; 
      turnDeg += 0.09;
      xVelo += 1;
      yVelo += 1;
      if (turnDeg > PI) {
        turnDeg = 0;
        xVelo = 1;
        yVelo = 1;
        flipFish = false;
      }
    }
  }

  void trackFaceMovement(Face userFace) {
    //println(userFace.posePosition.x);
    float xDistFromFace = abs(userFace.posePosition.x - xpos - userFace.mouthWidth);
    float yDistFromFace = abs(userFace.posePosition.y - ypos + 20 - userFace.mouthWidth); 
    //xVelo = map(xDistFromFace, 0, xsize/6, 20, 1);
    //yVelo = map(yDistFromFace, 0, ysize/6, 20, 1);

    //println("xvelo: " + xVelo + " yvelo: " + yVelo);

    fill(#CCCCCC);
    //rect(userFace.posePosition.x, userFace.posePosition.y, 160, 160);
    if (xDistFromFace < 160 & yDistFromFace < 160) {
      flipFish = true;
    }
    /*      if (xpos >= userFace.posePosition.x) {
     xpos += xVelo;
     }
     else if (xpos < userFace.posePosition.x) {
     xpos -= xVelo;
     }
     
     if (ypos >= userFace.posePosition.y) {
     ypos += yVelo;
     }
     else if (ypos < userFace.posePosition.y) {
     ypos -= yVelo;
     }
     */
  }


void moveSemiRandomly(Fish[] f) {
  float noseAngle = nosePos;

  float yDist = sin(noseAngle);
  float xDist = cos(noseAngle);
  //println("Xdist: " + xDist + " Ydist: " + yDist);
  int xAdd = int(map(xDist, -1, 1, -5, 5));
  int yAdd = int(map(yDist, -1, 1, -5, 5));

  ypos += (yAdd * yVelo);
  xpos += (xAdd * xVelo);
  
  println(xVelo + ", " + yVelo);

  avoidOtherFish(f);
}

void avoidOtherFish(Fish[] f) {
  for (int i = 0; i < f.length; i++) {
    int xDist = xpos - f[i].xpos;
    int yDist = ypos - f[i].ypos;
    /*
      if(abs(xDist) < imgsize) {
     if(xDist > 0) {
     xpos += 1;
     nosePos += 0.005;
     }
     else {
     xpos -= 1;
     nosePos -= 0.005;
     }
     }
     
     if(abs(yDist) < imgsize) {
     if(yDist > 0) {
     ypos += 1;
     nosePos += 0.005; 
     }
     else {
     ypos -= 1; 
     nosePos -= 0.005;
     }
     }
     */
  }
}

void checkBoundaries() {
  boolean flag = false;
  if (xpos >= (xsize + 20)) {
    xpos = xsize;
    flag = true;
    xVelo = 1.0;
    yVelo = 1.0;
  }
  else if (xpos <= -40) {
    xpos = -40;
    flag = true;
    xVelo = 1.0;
    yVelo = 1.0;
  }
  else if (ypos >= (ysize + 20)) {
    ypos = ysize;
    flag = true;
    xVelo = 1.0;
    yVelo = 1.0;
  }
  else if (ypos <= 0) {
    ypos = 0;
    flag = true;
    xVelo = 1.0;
    yVelo = 1.0;
  }
  if(flag == true) {
    nosePos -= PI; 
  }
}
};

