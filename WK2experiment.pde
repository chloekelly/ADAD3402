float xnoise = 0.0;
float ynoise = 0.0;
float inc = 0.1;

void setup() {
  size(700, 500);

}

void draw() {
  background(0);
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) { 
      inc += 0.01;
      float noisey = noise(xnoise, ynoise) * 255;
      stroke(noisey,inc,inc*y/random(10));
      point(x, y);
      xnoise = xnoise + inc;
    }
    inc = 0.1;
    xnoise = 0;
    ynoise = ynoise + inc;
  }
}
