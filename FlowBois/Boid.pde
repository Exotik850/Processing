class Boid {
  PVector pos;
  PVector prev;
  PVector vel;
  PVector acc;
  float t = 0;

  //float mass;


  Boid(float x, float y) {
    this.pos = new PVector(x, y); 
    this.vel = new PVector();
    this.acc = new PVector();
    this.prev = this.pos.copy();
  }

  void update() {
    this.prev = this.pos.copy();
    this.vel.add(this.acc);
    vel.limit(10);
    this.pos.add(this.vel);
    if (this.pos.x < 0) this.pos.x = width - 1;
    if (this.pos.x > width) this.pos.x = 0;
    if (this.pos.y < 0) this.pos.y = height - 1;
    if (this.pos.y > height) this.pos.y = 0;

    this.acc.mult(0);
    this.t += 0.1;
  }

  float freq = 0.1;

  void show() {
    stroke(sin(t * freq) * 127 + 128, sin(t * freq + 2) * 127 + 128, sin(t * freq + 4) * 127 + 128, 10);
    strokeWeight(1);
    float d = PVector.dist(this.pos, this.prev);
    if (d < 100) line(this.pos.x, this.pos.y, this.prev.x, this.prev.y);
  }

  void applyForce(PVector force) {
    this.acc.add(force.copy());
  }
}
