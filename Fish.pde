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
    nosePos = random(0, TWO_PI);
    //nosePos = PI+0.2;
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
    float xVelo = map(xDistFromFace, 0, xsize/6, 20, 0);
    float yVelo = map(yDistFromFace, 0, ysize/6, 20, 0);

    if (xpos >= userFace.posePosition.x) {
      xpos += xVelo;
    }
    if (xpos < userFace.posePosition.x) {
      xpos -= xVelo;
    }
    if (ypos >= userFace.posePosition.y) {
      ypos += yVelo;
    }
    if (ypos < userFace.posePosition.y) {
      ypos -= yVelo;
    }
  }

  void moveSemiRandomly(Fish[] f) {
    float noseAngle = nosePos;

    float yDist = sin(noseAngle);
    float xDist = cos(noseAngle);
    println("Xdist: " + xDist + " Ydist: " + yDist);
    int xAdd = int(map(xDist, -1, 1, -5, 5));
    int yAdd = int(map(yDist, -1, 1, -5, 5));

    ypos += yAdd;
    xpos += xAdd;


 /*   if (nosePos >= 0 && nosePos < PI) {
      ypos += yAdd;
    }
    else {
      ypos -= yAdd;
    }

    if (nosePos <= PI/2 || nosePos >= PI+(PI/2)) {
      xpos += xAdd;
      println("ADD");
    }
    else {
      xpos -= xAdd;
      println("SUB");
    }*/

    println("NOSE: " + nosePos + " XADD: " + xAdd + " YADD: " + yAdd);
    //println("NOSE: " + noseAngle + "yDist nose: " + yDist + " xDist nose: " + xDist);

    avoidOtherFish(f);
  }

  void avoidOtherFish(Fish[] f) {
  }

  void checkBoundaries() {
    if (xpos >= (xsize - imgsize)) {
      nosePos -= 0.1;
      xpos--;
    }
    if (xpos <= 0) {
      nosePos -= 0.1;
      xpos++;
    }
    if (ypos >= (ysize - imgsize)) {
      nosePos -= 0.1;
      ypos--;
    }
    if (ypos <= 0) {
      nosePos -= 0.1;
      ypos++;
    }
  }
};

