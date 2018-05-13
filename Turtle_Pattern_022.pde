// https://github.com/rupertrussell/Hexagonal-Weave-001.git
// Code by Rupert Russell 12 May 2018
// as allways this may contain bugs and is not as elegant as it could be

float startX;
float startY;
float endX;
float endY;
float x;
float y;
float h = 150; 
float k = 150;
float r = 40;
boolean start = true;
int count = 0;
double step;
float yGap = 161;  // 160

// 2875 x 3900 T-Shirt
// 3502 x 2385 Journal
// 1765 x 2481 notebook
// 2475 x 2475 poster 
// 2940 x 2940 clock
// 5748 x 5748 scarves
// 6310 x 6230 A-Line Dress
// 7632 x 6480 Tapestries
// 2376 x 2024 Travel Mug
// 2700 x 1624 Tall Mug
// 9144 x 6096 extra large print
// 7632 x 6480 Duvet Covers
// 2875 x 3900 Long T-Shirt
// 2696 x 3305 iPad Case
// 4600 x 3000 laptop Skin
// 4600 x 3000 Phone Cases & Skins
// 4625 × 4625 Floor Pillow 36″×36″
// 2788 × 2788 pixels for the large pillow
// 2950 × 2950 Large tote bag
// 4600 × 3000 Pouch

int widthSize = 2344; 
int heightSize = 2467;

//int repeatXtimes = floor(widthSize / 144) - 1; // width
//int repeatYtimes = floor(heightSize / 164) - 1; // height

int repeatXtimes;
int repeatYtimes;
int heightOffset = heightSize - 500; // height - smaller moves down more

int widthOffset = 140;
float leftMargin;

// How to calculate points on a circle
// Based on code from http://www.mathopenref.com/coordcirclealgorithm.html

void setup() {
  leftMargin = 150;
  
  strokeWeight(9); 
  size(2475, 2475); // width x height
  smooth();
  noLoop();
  strokeCap(ROUND);

}

void draw() {
repeatYtimes = 12;
repeatXtimes = 13;
  
 // setGradient(0, 0, width, height, b1, b2, Y_AXIS);
  background(0);
  println("repeatXtimes = " + repeatXtimes);
  println("repeatYtimes = " + repeatYtimes);
  for (int i = 0; i <= repeatXtimes; i++) {
    if (isEven(i)) {
      stack(leftMargin + i * widthOffset, heightOffset, repeatYtimes );
    } else {
      stack(leftMargin + i * widthOffset, heightOffset + 80, repeatYtimes + 1);
    }
  }

  save("poster.png");
  exit();
} // end draw


void hexagon(int radius) {
  count = 0;
  start = true;

  step = 2 * PI/6; 
  for (float theta=0; theta < 2 * PI; theta += step) {
    x = h + radius * cos(theta);
    y = k - radius * sin(theta); //note 2.
    point(x, y);

    if (start == true) {
      startX = x;
      startY = y;
      if (count != 0) {
        line(endX, endY, startX, startY);
      }
    }

    if (start == false) {
      endX = x;
      endY = y;

      line(startX, startY, endX, endY);
    }
    count ++;
    if (start == true) {
      start = false;
    } else {
      start = true;
    }
  } // end void hexagon
}

void stack(float transX, float transY, int num) { 
  pushMatrix();
  translate(transX, transY);
  for (int i = 0; i < num; i++) {
    hex();
    translate(0, -yGap);
  }
  popMatrix();
} // end void stack

void hex() {
  stroke(255);
  hexagon(250);
} // end void hex

boolean isEven(int n) {
  return n % 2 == 0;
}

boolean isOdd(int n) {
  return n % 2 != 0;
}
