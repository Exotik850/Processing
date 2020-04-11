int scl = 5;
float inc = 0.2;
int cols, rows;
float ystart = 0;
PImage img;
int frames = 480;
OpenSimplexNoise open;

void setup() {
  size(600, 600, P3D);
  background(0);
  cols = width / scl;
  rows = height / scl;
  noFill();
  stroke(255);
  open = new OpenSimplexNoise();
  //frameRate(30);
  img = loadImage("http://clipart-library.com/images/rTLxeRAzc.jpg");
  img.resize(cols, rows);
}

float noiset(float t, float off) {
  float cosAngle = cos(t);
  float sinAngle = sin(t);
  float cosAngle2 = cos(off);
  float sinAngle2 = sin(off);

  float noiseScale = 0.5;
  float noiseValue = (float) open.eval(noiseScale * cosAngle + noiseScale, 
    noiseScale * sinAngle + noiseScale, 
    noiseScale * cosAngle2 + noiseScale, 
    noiseScale * sinAngle2 + noiseScale);
  return map(noiseValue, 0, 1, -100, 100);
}

void draw() {
  img.loadPixels();
  background(0);
  rotateX(PI / 4);
  camera(0, height, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  float yoff = ystart;
  for (int j = 0; j < rows; j++) {
    float xoff = 0;
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < cols; i++) {
      int index = i + j * img.width;
      float b = brightness(img.pixels[index]);
      if (b > 100) {
        stroke(0, 255, 0);
        strokeWeight(2);
        fill(0);
        vertex(i * scl, j * scl, map((float) open.eval(xoff, yoff), 0, 1, -25, 25));
        vertex(i * scl, (j + 1) * scl, map((float) open.eval(xoff, yoff + inc), 0, 1, -25, 25));
      } else {
        fill(255, 0, 0);
        stroke(255, 0, 0);
        vertex(i * scl, j * scl, 50); 
        vertex(i * scl, (j + 1) * scl, 50);
      }
      xoff += inc;
    }
    endShape();
    yoff += inc;
  }
  ystart -= 0.005;
  //if (frameCount < frames) saveFrame("output/land_###.png");
  //else {println("done");
  //stop();}
}

void mousePressed(){
 saveFrame("sc_###.png"); 
}
