Boid[] bois;
Attractor[] as;



void setup() {
  size(600, 600, P2D);
  background(51);
  bois = new Boid[100];
  as = new Attractor[10];
  for (int i = 0; i < bois.length; i++) {
    bois[i] = new Boid(random(width), random(height), random(10, 50));
  }
  for (int i = 0; i < as.length; i++) {
    as[i] = new Attractor(random(width), random(height), 20);
  }
}

void draw() {
  background(51);    
  for (Attractor a : as) {

    for (Boid b : bois) {
      PVector force = a.attractForce(b);
      b.applyForce(force);
      b.update();
      b.show();
    }

    a.show();
  }
}
