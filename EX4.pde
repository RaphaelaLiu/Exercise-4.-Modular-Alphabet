float x = 0, y = 0;
float stepSize = 5.0;
String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
int counter = 0;

void setup() {
  fullScreen();
  background(255);
  x = mouseX;
  y = mouseY;
}

void draw() {
  fill(0);
  {
    float d = dist(x, y, mouseX, mouseY);
    textSize(d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x);
      pushMatrix();
      translate(x, y);
      text(newLetter, 0, 0);
      popMatrix();
      counter++;
      
    if (counter > letters.length()-1) counter = 0;
      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize;
    }
  }
}
