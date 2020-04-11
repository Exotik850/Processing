Flow flow;
Boid[] bois = new Boid[1000];
int scl = 10;
PImage img;
//PImage bitmap = loadImage("image.jpg");


void setup() {
  size(600, 600, P2D);
  background(51);
  img = loadImage("https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX18954096.jpg");
  img.resize(width / scl, height / scl);
  img.loadPixels();
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      int index = i + j * img.width;
      float b = brightness(img.pixels[index]);
      if(b > 100) {img.pixels[index] = color(255);
      }else img.pixels[index] = color(0);
    }
  }
  img.updatePixels();
  //image(img, 0, 0);
  flow = new Flow(width / scl, height / scl, scl, img);
  for (int i = 0; i < bois.length; i++) {
    bois[i] = new Boid(random(width), random(height));
  }
  flow.update();
  //flow.show();
  //image(bitmap, 0, 0);
}

void draw() {
  //background(51);
  flow.update();
  for (Boid b : bois) {
    PVector force = flow.getForce(b.pos.x, b.pos.y);
    b.applyForce(force);
    b.update();
    b.show();
 
}
//flow.show();
}

void mousePressed(){
 saveFrame("output/bleh_###.png"); 
  
}
