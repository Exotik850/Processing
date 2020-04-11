class Boid{
  PVector pos;
  //PVector prev;
  PVector vel;
  PVector acc;
  float mass;
  
  
 Boid(float x, float y, float m){
  this.pos = new PVector(x, y); 
  this.vel = new PVector(0, 0);
  this.acc = new PVector();
  this.mass = m;
  //this.prev = this.pos.copy();
 }
 
 void update(){
  //this.prev = this.pos.copy();
  this.vel.add(this.acc);
  //vel.limit(5);
  this.pos.add(this.vel);
  this.acc.mult(0);
 }
 
 void show(){
  //stroke(map((this.mass / 2), 0, 25, 0, 255),map((this.mass * 2), 0, 100, 0, 255),map((this.mass % 2), 0, 1, 0, 255), 100);
  stroke(255, 255, 255, 100);
  strokeWeight(2);
  fill(240);
  circle(this.pos.x, this.pos.y, this.mass / 5);
 }
 
 void applyForce(PVector force){
  this.acc.add(force.copy()); 
 }
  
  
}
