int bodyCenterY = -100;
int earCenterY = bodyCenterY-110;
int rightEyeX = 265;
int rightEyeY = bodyCenterY-120;
int leftEyeY = rightEyeY;
int leftEyeX = 335;
float angleRightEye = 0.0;
float angleLeftEye = 0.0;
int eyeSize = 10;
int feetR;
int feetG;
int feetB = feetG = feetR = 50;

void setup() {
  size(600,600);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
}
void draw() {
  bodyCenterY = ((bodyCenterY+1)%700);
  feetR=(feetR+int(random(10)))%255;
  feetG=(feetG+int(random(10)))%255;
  feetB=(feetB+int(random(10)))%255;
  background(255);
 
  //Hale
  /*stroke(30);
  strokeWeight(2);
  noFill();
  arc(420,300,50,50,HALF_PI, PI);
  arc(400,280,50,100,QUARTER_PI, PI);*/
  
  //Krop
  stroke(30);
  fill(135);
  ellipse(300,bodyCenterY,200,200);
  stroke(235);
  fill(235);
  ellipse(298,bodyCenterY-2,190,200);
  
  //Ører
  stroke(30);
  fill(135);
  ellipse(220,bodyCenterY-110,90,120);
  ellipse(380,bodyCenterY-110,90,120);
  stroke(135);
  fill(235);
  ellipse(220,bodyCenterY-110+5,80,110);
  ellipse(380,bodyCenterY-110+5,80,110);
  
  //Fødder
  //arc(200, 200, 320, 320, 0, PI+QUARTER_PI, CHORD);
  arc(250,bodyCenterY+80,70,70,HALF_PI+QUARTER_PI,2*PI+QUARTER_PI,CHORD);
  arc(350,bodyCenterY+80,70,70,HALF_PI+QUARTER_PI,2*PI+QUARTER_PI,CHORD);
  fill(feetR,feetG,feetB);
  arc(230,bodyCenterY+80+17,20,20,HALF_PI+QUARTER_PI,2*PI+QUARTER_PI,CHORD);
  arc(250,bodyCenterY+80+17,20,20,HALF_PI+QUARTER_PI,2*PI+QUARTER_PI,CHORD);
  arc(270,bodyCenterY+80+17,20,20,HALF_PI+QUARTER_PI,2*PI+QUARTER_PI,CHORD);
  arc(330,bodyCenterY+80+17,20,20,HALF_PI+QUARTER_PI,2*PI+QUARTER_PI,CHORD);
  arc(350,bodyCenterY+80+17,20,20,HALF_PI+QUARTER_PI,2*PI+QUARTER_PI,CHORD);
  arc(370,bodyCenterY+80+17,20,20,HALF_PI+QUARTER_PI,2*PI+QUARTER_PI,CHORD);
  
  //Hoved
  stroke(30);
  fill(135);
  ellipse(300,bodyCenterY-100,130,140);
  strokeWeight(2);
  line(300,bodyCenterY-170,300,bodyCenterY-185);
  line(300,bodyCenterY-170,290,bodyCenterY-188);
  line(300,bodyCenterY-170,310,bodyCenterY-188);
  strokeWeight(1);
  stroke(135);
  fill(235);
  ellipse(295,bodyCenterY-100,120,140);
  
  //Øjne
  rightEyeY = bodyCenterY-120;
  leftEyeY = rightEyeY;
  stroke(255);
  fill(30);
  ellipse(rightEyeX,rightEyeY,20,20);
  ellipse(leftEyeX,leftEyeY,20,20);
  fill(250);
  angleRightEye = atan2(mouseY-rightEyeY, mouseX-rightEyeX);
  angleLeftEye = atan2(mouseY-leftEyeY, mouseX-leftEyeX);
  pushMatrix();
  translate(rightEyeX, rightEyeY);
  rotate(angleRightEye);
  ellipse(3, 0, eyeSize, eyeSize);
  popMatrix();
  pushMatrix();
  translate(leftEyeX,leftEyeY);
  rotate(angleLeftEye);
  ellipse(3, 0, eyeSize, eyeSize);
  popMatrix();
  //ellipse(rightEyeX+eyeOffset,rightEyeY+upOrDown*eyeOffset,5,5);
  //ellipse(leftEyeX+eyeOffset,leftEyeY+upOrDown*eyeOffset,5,5);
  
  //Snabel
  noStroke();
  //quad();
  fill(235);
  quad(280,bodyCenterY-80,320,bodyCenterY-80,310,bodyCenterY+20,290,bodyCenterY+20);
  stroke(30);
  strokeWeight(2);
  line(280,bodyCenterY-80,290,bodyCenterY+20);
  line(320,bodyCenterY-80,310,bodyCenterY+20);
  arc(300,bodyCenterY+10,20,20,QUARTER_PI,HALF_PI+QUARTER_PI);
  
  
  //frameCOunt leg
  ellipse((frameCount-50)%(2*width),height/2,50,50);
  ellipse(2*width-frameCount+50,height/2,50,50);
  
  
}
