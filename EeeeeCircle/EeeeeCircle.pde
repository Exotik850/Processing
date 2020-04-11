float a = 0;
float tr = 10;
int numpoints = 20;
float t = 0;
PVector[] points = new PVector[numpoints];
int frames = 480;

void setup() {
  size(600, 600);
}
void draw() {
  float r = map(sin(t), -1, 1, 50, 75);
  tr = map(cos(t), -1, 1, -50, 75);
  background(51);
  //stroke(255);
  strokeWeight(1);
  translate(width / 2, height / 2);
  for (int i = 0; i < numpoints; i++) {
    float x = r * cos(a);
    float y = r * sin(a);
    //point(x, y);
    points[i] = new PVector(x, y);
    a += TWO_PI / numpoints;
  }
  //println(points);
  for (int i = 0; i < points.length; i++) {
    float ta = 0;
    stroke(sin(t * 2) * 127 + 128, sin(t * 2 + 2) * 127 + 128, sin(t * 2 + 4) * 127 + 128);
    push();
    noFill();
    beginShape();
    translate(points[i].x, points[i].y);
    while (ta < TWO_PI) {
      float x = tr * cos(ta);
      float y = tr * sin(ta);
      vertex(x, y);
      ta += PI / 200;
    }
    endShape();
    pop();
  }
  if(frameCount < frames) saveFrame("output/circ_###.png");
  else stop();
  t += TWO_PI / frames;
}
