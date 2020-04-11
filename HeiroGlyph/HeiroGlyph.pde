int scl = 25;
int i = 0;
int j = 0;
int cols, rows;

void setup() {
  size(600, 600);
  cols = width / scl;
  rows = height / scl;
  background(51);
  noFill();
  ellipseMode(CORNER);
  stroke(255);
  strokeWeight(2);
}

float t = 0;
float tstart = 0;

void draw() {
  noLoop();
  background(51);
  for (int i = 0; i < cols; i++) {
    t = tstart;

    for (int j = 0; j < rows; j++) {
      stroke(sin(t) * 127 + 128, sin(t + 2) * 127 + 128, sin(t + 4) * 127 + 128);
      float randnum = random(1); 
      choices(randnum, i, j);
      t += 6;
    }
  }
  tstart += 1;
}

void choices(float rand, int x, int y) {
  if (rand <= 0.2) circ(x, y);
  else if ((rand > 0.2) && (rand<=0.4)) circline(x, y);
  else if ((rand > 0.4) && (rand<=0.6)) circline2(x, y);
  else if ((rand > 0.6) && (rand<=0.8)) circline3(x, y);
  else if ((rand > 0.8) && (rand<=  1)) boxie(x, y);
}

void circ(int x, int y) {
  ellipse(x * scl, y * scl, scl, scl);
}

void circline(int x, int y) {
  push();
  ellipse(x * scl, y * scl, scl, scl);
  translate(x * scl, y * scl);
  line(0, scl, scl/2, scl / 2);
  pop();
}

void circline2(int x, int y) {
  push();
  ellipse(x * scl, y * scl, scl, scl);
  translate(x * scl, y * scl);
  line(scl, scl, scl/2, scl / 2);
  pop();
}

void circline3(int x, int y) {
  push();
  ellipse(x * scl, y * scl, scl, scl);
  translate(x * scl, y * scl);
  line(scl, 0, scl/2, scl / 2);
  pop();
}

void boxie(int x, int y) {
  rect(x * scl, y * scl, scl, scl);
}

void mousePressed() {
  saveFrame("output/bleh_###.png");
}
