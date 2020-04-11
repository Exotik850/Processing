class Flow {
  float zoff = 0;
  int cols, rows, res;
  PVector[][] Field;
  boolean[][] tfield;
  float inc = 0.2;
  PImage img;
  PVector center = new PVector(width / 2, height / 2);
  
  Flow(int cols, int rows, int res, PImage img) {
    this.cols = cols;
    this.rows = rows;
    this.res = res;
    this.Field = new PVector[cols][rows];
    this.tfield = new boolean[cols][rows];
    this.img = img;
  }

  void update() {
    this.img.loadPixels();
    float xoff = 0;
    for (int i = 0; i < this.cols; i++) {
      float yoff = 0;
      for (int j = 0; j < this.rows; j++) {
        int index = i + j * this.img.width;
        float b = brightness(this.img.pixels[index]);
        if(b < 100){
        this.Field[i][j] = PVector.fromAngle(map(noise(xoff, yoff, this.zoff), 0, 1, 0, TWO_PI * 4));
        }else{
          PVector angle = PVector.sub(new PVector(i * this.res, j * this.res), this.center);
        this.Field[i][j] = PVector.fromAngle(angle.heading()).mult(-1);
        }
        yoff += this.inc;
      }
      xoff += this.inc;
    }
    this.zoff += this.inc;
  }
  
  void show() {
    stroke(255);
    strokeWeight(1);
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        push();
        translate(i * this.res, j * this.res);
        rotate(Field[i][j].heading());
        line(0, 0, this.res, 0);
        pop();
      }
    }
  }
  
  PVector getForce(float x, float y){
   int posx = floor(x / this.res);
   int posy = floor(y / this.res);
   return Field[posx][posy].copy().mult(5);
  }
}
