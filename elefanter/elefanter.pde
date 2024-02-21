import java.util.ArrayList;
ArrayList<Elefant> elefanter = new ArrayList<>();
float speed;

void setup() {
  size(800, 800);
  noStroke();
  elefanter.add(new Elefant(300, 300, 1, 0.9));
  elefanter.add(new Elefant(100, 500, 2, 1.0));
  elefanter.add(new Elefant(500, 200, 3, 1.5));
  
}

void draw() {
  background(102);

  for (Elefant e : elefanter) {
    e.update(mouseX, mouseY, speed);
    e.display();
  }

  speed = 0;
  
}
void mousePressed() {
  int x = int(random(30,width-30));
  int y = int(random(50,height-50));
  float speed = random(0.5,3);
  float direction = random(2*PI);
  elefanter.add( new Elefant(x,y,direction,speed) );
}
  
