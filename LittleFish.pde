import oscP5.*;
OscP5 oscP5;

// our FaceOSC tracked face dat
Face face = new Face();
int xsize = 640;
int ysize = 480;
int numFish = 50;
Fish[] fishArray;


void setup() {
  size(xsize, ysize);
  frameRate(30);

  oscP5 = new OscP5(this, 8338);

  fishArray = new Fish[numFish];
  for (int i = 0; i < numFish; i++) {
    Fish f = new Fish();
    fishArray[i] = f;
  }
}

void draw() {  
  background(255);
  stroke(0);
  for (int i = 0; i < numFish; i++) {
    fishArray[i].drawFish();
  }

  if (face.found > 0) {
    translate(face.posePosition.x, face.posePosition.y);
    scale(face.poseScale);
    noFill();
    ellipse(-20, face.eyeLeft * -9, 20, 7);
    ellipse(20, face.eyeRight * -9, 20, 7);
    ellipse(0, 20, face.mouthWidth* 3, face.mouthHeight * 3);
    ellipse(-5, face.nostrils * -1, 7, 3);
    ellipse(5, face.nostrils * -1, 7, 3);
    rectMode(CENTER);
    fill(0);
    rect(-20, face.eyebrowLeft * -5, 25, 5);
    rect(20, face.eyebrowRight * -5, 25, 5);

    print(face.toString());
  }
}

// OSC CALLBACK FUNCTIONS

void oscEvent(OscMessage m) {
  face.parseOSC(m);
}

