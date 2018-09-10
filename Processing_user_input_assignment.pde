int arraySize = 1000;
int circleSize = 6;
int rectSize = 10;
float[] x = new float[arraySize];
float[] y = new float[arraySize];
float[] xSpeed = new float[arraySize];
float[] ySpeed = new float[arraySize];

void setup() {
  fill(random(0, 255));
  stroke(random(0, 255));
  size(displayWidth, displayHeight);
  for (int i = 0; i < arraySize; i++) {
    //xSpeed[i] = random(1, 10);
    ySpeed[i] = random(1, 5);
    x[i] = random(26, width-26);
    y[i] = random(26, height-26);
  }
}

void draw() {
  //update background
  background(0);
  noCursor();
  smooth();
  rect(mouseX, mouseY, 10, 10);
  size(displayWidth, displayHeight);
  for (int i = 0; i < arraySize; i++) {
    x[i] = x[i]+xSpeed[i];
    y[i] = y[i]+ySpeed[i];

    ellipse(x[i], y[i], circleSize, circleSize);

    if (y[i] >= height) {
      y[i] = circleSize/2 ;
      x[i] = random(circleSize/2, width-circleSize/2);
    }

    if (y[i] <= -3) {
      y[i] = height-circleSize/2;
      x[i] = random(circleSize/2, width-circleSize/2);
    }
    if (x[i] == mouseX && y[i] == mouseY) {

      circleSize += random(0, 10);
    }

    if (keyPressed) {
      if (key == 'b' || key == 'B') {
        ySpeed[i] = -ySpeed[i];
      }
    }
  }
}
void keyPressed() {
  //if a is pressed then change color of circle
  if (key == 'a') {
    fill(random(0, 255), random(0, 255), random(0, 255));
  }
}
void mouseMoved() {
  rect(mouseX, mouseY, rectSize, rectSize);
  if (circleSize <= 25) {
    circleSize = circleSize+(int)random(1, 2);
  }
}
void mousePressed() {
  if (circleSize >= 25) {
    circleSize = circleSize -(int)random(0, 10);
  }
}
