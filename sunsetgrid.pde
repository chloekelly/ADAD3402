/*

For this creative development task I took inspiration mainly from Frieder Nake's "no title" work:

https://www.tate.org.uk/art/artworks/nake-no-title-p80816

I wanted to animate it, but also achieve a different affect in other ways too.
There are a lot of variables that can be changed, for a lot of different effects.

Inspiration was taken (some code copied, but majorly edited) from the 3D perlin noise example
*/


//Setting global variables
//Space increment
float increment = 0.03;
float zOff = 0.0;  
//Time increment
float zincrement = 0.006; 
//Square base size
int xSize = 15;
int ySize = 15;


void setup() {
  size(1600, 800);
  //fullScreen();
}

void draw() {
  background(255);

  
  float xOff = 0.0;
  
  for (int x=0; x<(int)(width/xSize); x++) {
    //loop through xOff
    xOff += increment;
    float yOff = 0.0;
    for (int y = 0; y < (int)(height/ySize); y++) {
      //loop through yOff
      yOff += increment;
      //Generate squares
      generateSquare(xOff, yOff, zOff, xSize, ySize, x, y);
    }
  }
  //loop through zoff
  zOff += zincrement;
}

void generateSquare(float xOff, float yOff, float zOff, float xSize, float ySize, int x, int y) {
  //Rounding value set to 250 to achieve high-contrast effect
  //float rounder = 250;
  //Size noise value
  float size = noise(xOff,yOff,zOff)*mouseX/250;
  noStroke();
  //Setting the colour from the noise
  fill(round(noise(xOff+10, yOff+10, zOff+10)*255)*random(mouseX/10), round(noise(xOff+20, yOff+20, zOff+20)*mouseY/10)*mouseY/10, round(noise(xOff+30, yOff+30, zOff+30)*255/random(120))*100);
  
  //Creating the relative matrix, transforming it & drawing the rectangles, then popping the matrix
  pushMatrix();
    translate((x+0.5)*xSize, (y+0.5)*ySize);
   rect(-size*xSize/2, -size*xSize/2, size*xSize, size*ySize);
    fill(255);
   rect(-size*xSize/4, -size*xSize/4, size*xSize/(2), size*ySize/(2));
  popMatrix();
}
