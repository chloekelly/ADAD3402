/**
 * Noise Wave
 * by Daniel Shiffman.  
 * 
 * Using Perlin Noise to generate a wave-like pattern. 
 */

float yoff = 0.0;   
float c1 = 10;

float c2 = 200;

float c3 = 11;
float b = 0;
float c = 0;
float d = 0;
float e = 0;
float f = 0;

float cchange = 1;
float dchange =1;
float echange = 20;
float fchange = 40;

// 2nd dimension of perlin noise

void setup() {
  size(640, 360);
}

void draw() {
  background(51);

  fill(255);
  // We are going to draw a polygon out of the wave points
if(b > 10){
  b = 0;
}
b++;
if(c > 640){
 cchange = -1;
}
if(c < 0){ 
  cchange = +1;
}
c+= cchange;
if(d > 360){
  dchange = -1; 
}
if (d < 0){
  dchange =+1;
}
d+= dchange;

if(e > 640){
  echange = -1;
}
if(e < 0){
echange = +1;
}
e+= echange;
  
  if(f > 360){
    fchange = -1;
  }
  if (f < 0){
    fchange = 1;
  }
  f+= fchange;
  
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
 
    float y = map(noise(xoff, yoff), 0, 1, 200,300); 
   
    // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.1;
  }
   fill(mouseX,mouseY,+c);
 
  // increment y dimension for noise

      yoff += 0.01*b;
  vertex(0+e, 0+f);
  vertex(0+c, 0+d);
  endShape(CLOSE);
}
