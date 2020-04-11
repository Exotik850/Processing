class Boid {
  PVector pos;
  PVector prev;
  PVector vel;
  PVector acc;
  float mass;


  Boid(float x, float y) {
    this.pos = new PVector(x, y); 
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);
    this.prev = this.pos.copy();
  }

  void update() {
    this.prev = this.pos.copy();
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    if ((this.pos.x < 0) || (this.pos.x > width)) this.vel.x *= -1;
    if ((this.pos.y < 0) || (this.pos.y > height)) this.vel.y *= -1;
    this.acc.mult(0);
  }

  void show() {
    stroke(255);
    strokeWeight(4);
    fill(240);
    circle(this.pos.x, this.pos.y, 1);
  }

  void applyForce(PVector force) {
    this.acc.add(force.copy().div(this.mass));
  }

  void connect(Boid[] boids) {
    stroke(255, 255, 255, 200);
    strokeWeight(2);
    for (Boid b : boids) {
      float d = PVector.dist(this.pos, b.pos);
      if ((d > 0) && (d < 20)) {
        line(this.pos.x, this.pos.y, b.pos.x, b.pos.y);
      }
    }
  }
}
