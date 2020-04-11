class Attractor{
  
 PVector pos;
 float mass;
 
 Attractor(float x, float y, float m){
   this.pos = new PVector(x, y);
   this.mass = m;
 }
 
 PVector attractForce(Boid b){
   PVector desired = PVector.sub(this.pos, b.pos);
   float d = PVector.dist(this.pos, b.pos);
   d = constrain(d, 5, 25);
   desired.mult((this.mass * b.mass) / pow(d, 2));
   desired.limit(5);
   return desired;
 }
  
  void show(){
   stroke(0, 255, 0);
   circle(this.pos.x, this.pos.y, this.mass / 4); 
  } 
}
