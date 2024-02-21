class Elefant {
  float bodyCenterX, bodyCenterY;
  float speed;
  float direction;
  int bodySize = 200;
  int earCenterX, earCenterY;
  int earWidth = int(9./20*bodySize);
  int earHeight = int(12./20*bodySize);
  int feetSize = int(7./20*bodySize);
  int headWidth = 130;
  int headHeight = 140;
  float rightEyeX, rightEyeY;
  float leftEyeX, leftEyeY;
  float angleRightEye, angleLeftEye;
  int eyeSize = int(1./20*bodySize);
  int feetR, feetG, feetB;


  Elefant(int tx, int ty, float tdir, float ts) {
    bodyCenterX = tx;
    bodyCenterY = ty;
    //eyeSize = ts;
    angleRightEye = angleLeftEye = 0.0;
    feetR = feetG = feetB = 50;
    direction = tdir;
    speed = ts;
  }

  void update(int mx, int my, float acceleration) {
    // Update the eyes
    angleRightEye = atan2(my-rightEyeY, mx-rightEyeX);
    angleLeftEye = atan2(my-leftEyeY, mx-leftEyeX);
    // Update the feet color
    feetR=(feetR+int(random(10)))%255;
    feetG=(feetG+int(random(10)))%255;
    feetB=(feetB+int(random(10)))%255;
    // Move the elefant
    speed += acceleration;

    float changeX = speed*cos(direction);
    float changeY = speed*(-1)*sin(direction);
    float newX = constrain(bodyCenterX+changeX, bodySize/2, width-bodySize/2);
    float newY = constrain(bodyCenterY+changeY, bodySize/2+headHeight/2, height-bodySize/2);

    if (newY >= height-bodySize/2 || newY <= bodySize/2+headHeight/2 ) { 
      //Vi rammer toppen eller bunden
      speed *= 0.9;
      direction *= -1;
    } else if (newX <= bodySize/2 || newX >= width-bodySize/2) { 
      // Vi rammer højre eller venstre kant
      //speed *= 1.1;
      direction = PI-direction;
    }

    if ( (newX==bodyCenterX || newY==bodyCenterY)) {
      println("Speed: " + speed);
      println("Direction: " + degrees(direction));
      println("Change: ("+ changeX + ", " + changeY +")");
      println("(x,y)=(" + bodyCenterX + ", " + bodyCenterY +")");
      bodyCenterX = constrain(bodyCenterX+speed*cos(direction), 0, width);
    }
    if (speed < 0.01) speed=0;
    if (speed > min(width/2,height/2)) speed=1; 
    bodyCenterX = newX;
    bodyCenterY = newY;
  }


  void display() {
    pushMatrix();
    translate(bodyCenterX, bodyCenterY);
    // Krop
    stroke(30);
    fill(135);
    ellipse(0, 0, bodySize, bodySize);
    stroke(235);
    fill(235);
    ellipse(-2, -2, bodySize-10, bodySize);
    // Ører
    stroke(30);
    fill(135);
    ellipse(-80, -110, earWidth, earHeight);
    ellipse(80, -110, earWidth, earHeight);
    stroke(135);
    fill(235);
    ellipse(-80, -110+5, earWidth-10, earHeight-10);
    ellipse(80, -110+5, earWidth-10, earHeight-10);
    //Fødder
    arc(-50, 80, feetSize, feetSize, HALF_PI+QUARTER_PI, 2*PI+QUARTER_PI, CHORD);
    arc(50, 80, feetSize, feetSize, HALF_PI+QUARTER_PI, 2*PI+QUARTER_PI, CHORD);
    fill(feetR, feetG, feetB);
    arc(-70, 80+17, 2./7*feetSize, 2./7*feetSize, HALF_PI+QUARTER_PI, 2*PI+QUARTER_PI, CHORD);
    arc(-50, 80+17, 2./7*feetSize, 2./7*feetSize, HALF_PI+QUARTER_PI, 2*PI+QUARTER_PI, CHORD);
    arc(-30, 80+17, 2./7*feetSize, 2./7*feetSize, HALF_PI+QUARTER_PI, 2*PI+QUARTER_PI, CHORD);
    arc( 30, 80+17, 2./7*feetSize, 2./7*feetSize, HALF_PI+QUARTER_PI, 2*PI+QUARTER_PI, CHORD);
    arc( 50, 80+17, 2./7*feetSize, 2./7*feetSize, HALF_PI+QUARTER_PI, 2*PI+QUARTER_PI, CHORD);
    arc( 70, 80+17, 2./7*feetSize, 2./7*feetSize, HALF_PI+QUARTER_PI, 2*PI+QUARTER_PI, CHORD);
    //Hoved
    stroke(30);
    fill(135);
    ellipse(0, -100, headWidth, headHeight);
    strokeWeight(2);
    line(0, -170, 0, -185);
    line(0, -170, -10, -188);
    line(0, -170, 10, -188);
    strokeWeight(1);
    stroke(135);
    fill(235);
    ellipse(-5, -100, headWidth-10, headHeight);

    //Snabel
    noStroke();
    //quad();
    fill(235);
    quad(-20, -80, 20, -80, 10, 20, -10, 20);
    stroke(30);
    strokeWeight(2);
    line(-20, -80, -10, 20);
    line( 20, -80, 10, 20);
    arc(  0, 10, 20, 20, QUARTER_PI, HALF_PI+QUARTER_PI);
    strokeWeight(1);
    //Øjne
    rightEyeX = bodyCenterX-35;
    leftEyeX =  bodyCenterX+35;
    leftEyeY = rightEyeY = bodyCenterY-120;
    stroke(255);
    fill(30);
    ellipse(rightEyeX-bodyCenterX, rightEyeY-bodyCenterY, 20, 20);
    ellipse(leftEyeX-bodyCenterX, leftEyeY-bodyCenterY, 20, 20);
    popMatrix();
    fill(250);
    //angleRightEye = atan2(mouseY-rightEyeY, mouseX-rightEyeX);
    //angleLeftEye = atan2(mouseY-leftEyeY, mouseX-leftEyeX);
    pushMatrix();
    //translate(bodyCenterX, bodyCenterY);
    translate(rightEyeX, rightEyeY);
    rotate(angleRightEye);
    ellipse(3, 0, eyeSize, eyeSize);
    popMatrix();
    pushMatrix();
    //translate(bodyCenterX, bodyCenterY);
    translate(leftEyeX, leftEyeY);
    rotate(angleLeftEye);
    ellipse(3, 0, eyeSize, eyeSize);
    popMatrix();
  }
}
