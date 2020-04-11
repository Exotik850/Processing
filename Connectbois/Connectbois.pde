Boid[] bois;

void setup() {
  size(600, 600);  
  background(51);
  bois = new Boid[1000];
  for (int i = 0; i < bois.length; i++) {
    bois[i] = new Boid(random(width), random(height)); 
    bois[i].vel = PVector.random2D().mult(5);
  }
}

void mousePressed(){
 saveFrame("output/connect_###.png"); 
  
}



void draw() {
  background(51);
  for (Boid b : bois) {
    b.update();
    b.show();
    b.connect(bois);
  }
}
