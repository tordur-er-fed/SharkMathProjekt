PFont sjovFont;
boolean a = false;

void setup() {
  size(800, 800);
  background(0, 0, 255);
    fill(255, 255, 255);
  strokeWeight(10);
  stroke(0, 0, 100);
  rect(200, 100, 400, 80);
  rect(200, 220, 400, 80);
  rect(200, 340, 400, 80);
  rect(200, 460, 400, 80);
  rect(200, 580, 400, 80);
  fill(0, 50, 200);
  sjovFont = createFont("Comic Sans MS", 38);
  textFont(sjovFont);
  text("SPIL!", 345, 150);
  text("SVÆRHEDSGRAD", 230, 272);
  text("TIL FORÆLDRE", 250, 392);
  text("SETTINGS", 290, 512);
  text("EXIT", 350, 632);
  
  
}

void draw() {
  if (mousePressed == true && mouseX>200 && mouseX<600 && mouseY>100 && mouseY<180) {
  a = true;
  } else {
 
  }
  if(a) {
  background(255, 255, 255);
  fill(0, 0, 255);
  rect(mouseX, mouseY, 100, 100);
  }
}
