float t = 0;

void setup() {
fullScreen();  background(51);
}

int freq = 1;

void draw() {
  background(51); 
  strokeWeight(2);
  translate(width / 2, height / 2);
  for (int i = 0; i < 20; i++) {
    stroke(sin(t * freq + i) * 127 + 128, sin(t * freq + i + 2) * 127 + 128, sin(t * freq + i + 4) * 127 + 128);
    line(x1(t + i), y1(t + i), x2(t + i), y2(t + i));
  }
  t += 0.001;
}

void mousePressed(){
 saveFrame("output/bleh_###.png"); 
  
}

float x1(float t) {
  return cos(t) * (width / 8);
}

float y1(float t) {
  return sin(t) * (width / 8);
}

float x2(float t) {
  return sin(t) * (width / 8);
}

float y2(float t) {
  return cos(t) * (width / 8);
}
