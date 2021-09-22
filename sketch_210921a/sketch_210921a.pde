boolean main = true;
boolean game = false;
boolean difficulty = false;
boolean progress = false;
boolean settings = false;
boolean exit = false;
boolean easyOn = false;
boolean mediumOn = true;
boolean hardOn = false;

PFont sjovFont;
PImage difficulty1;
PImage difficulty2;
PImage difficulty3;
PImage mainImage;
PImage back1;

void setup() {
size(800,800);
difficulty1 = loadImage("fisk1.png");
difficulty2 = loadImage("fisk2.jpg");
difficulty3 = loadImage("fisk4.png");
mainImage=loadImage("mainShark3.png");
back1=loadImage("back1.png");
sjovFont = createFont("Comic Sans MS", 48);
}

void draw() {
if(main == true && mousePressed == true && mouseX>90 && mouseX<310 && mouseY>110 && mouseY<170)
{
main = false;
game = true;
difficulty = false;
progress = false;
settings = false;
exit = false;
} else {

}
if(main == true && mousePressed == true && mouseX>90 && mouseX<310 && mouseY>230 && mouseY<290) {
main=false;
game=false;
difficulty=true;
progress=false;
settings=false;
exit=false;

} else {

}

if(main == true && mousePressed == true && mouseX>90 && mouseX<310 && mouseY>350 && mouseY<410) {
main=false;
game=false;
difficulty=false;
progress=true;
settings=false;
exit=false;

} else {

}

if(main == true && mousePressed == true && mouseX>90 && mouseX<310 && mouseY>470 && mouseY<530) {
main=false;
game=false;
difficulty=false;
progress=false;
settings=true;
exit=false;

} else {

}

if(main == true && mousePressed == true && mouseX>90 && mouseX<310 && mouseY>590 && mouseY<650) {
main=false;
game=false;
difficulty=false;
progress=false;
settings=false;
exit=true;

} else {

}
if(game == true && mousePressed == true && mouseX>45 && mouseX<105 && mouseY>25 && mouseY<50) {
main=true;
game=false;
difficulty=false;
progress=false;
settings=false;
exit=false;
} else {

}

if(difficulty == true && mousePressed == true && mouseX>45 && mouseX<105 && mouseY>25 && mouseY<50) {
main=true;
game=false;
difficulty=false;
progress=false;
settings=false;
exit=false;
} else {

}

if(progress == true && mousePressed == true && mouseX>45 && mouseX<105 && mouseY>25 && mouseY<50) {
main=true;
game=false;
difficulty=false;
progress=false;
settings=false;
exit=false;
} else {

}

if(settings == true && mousePressed == true && mouseX>45 && mouseX<105 && mouseY>25 && mouseY<50) {
main=true;
game=false;
difficulty=false;
progress=false;
settings=false;
exit=false;
} else {

}
if(exit == true && mousePressed == true && mouseX>260 && mouseX<380 && mouseY>460 && mouseY<530) {
exit();
} else{}
if(exit == true && mousePressed == true && mouseX>420 && mouseX<540 && mouseY>460 && mouseY<530) {
exit = false;
main = true;
game = false;
difficulty = false;
progress = false;
settings = false;
}

if(difficulty == true && mousePressed == true && mouseX>90 && mouseX<300 && mouseY>110 && mouseY<170) {
main=true;
difficulty=false;
easyOn=true;
mediumOn=false;
hardOn=false;
delay(70);
} else{}
if(difficulty == true && mousePressed == true && mouseX>90 && mouseX<300 && mouseY>310 && mouseY<370) {
main=true;
difficulty=false;
easyOn=false;
mediumOn=true;
hardOn=false;
delay(70);
} else{}
if(difficulty == true && mousePressed == true && mouseX>90 && mouseX<300 && mouseY>510 && mouseY<570) {
main=true;
difficulty=false;
easyOn=false;
mediumOn=false;
hardOn=true;
delay(70);
} else{}


if(main){
background(255);
image(back1,30,420,170*2,170);
fill(0, 0, 255);
stroke(100, 100, 255);
strokeWeight(5);
for (int i = 0; i<5; i = i+1){
rect(100,120+i*120,200,50,20);
}
image(mainImage, 400, 200,300,400);
textFont(sjovFont, 28);
text("Velkommen Til SharkMath!", 400,150);
fill(255);
textAlign(LEFT);
text("SPIL!",163,155);
text("SVÆRHED!", 125,275);
text("PROGRESS!",120,395);
text("SETTINGS!",120,515);
text("EXIT!", 160,635);
if(easyOn == true) {
fill(0,178,0);
textSize(28);
text("DU SPILLER PÅ EASY", 50, 50);
} else{}
if(mediumOn == true) {
fill(178, 178,0);
text("DU SPILLER PÅ MEDIUM", 50, 50);
} else{}
if(hardOn == true) {
fill(178,0,0);
text("DU SPILLER PÅ HARD", 50, 50);
}

} else{
if(game) {
background(255);
fill(0,0,255,100);
stroke(0,0,255,50);
strokeWeight(10);
rect(50,30,50,20,2);
fill(255);
textSize(10);
text("BACK",63,45);
      //SKRIV KODEN FOR SPILLET HER
  
} else {
if(difficulty) {

background(255);
fill(0,0,255,100);
stroke(0,0,255,50);
strokeWeight(10);
rect(50,30,50,20,2);
fill(255);
textSize(10);
text("BACK",63,45);
fill(0,178,0);
stroke(0,128,0,50);
rect(100,120,200,50,20);
fill(200, 200,0);
stroke(128,128,0,50);
rect(100,320,200,50,20);
fill(178,0,0);
stroke(128,0,0,50);
rect(100,520,200,50,20);
fill(255);
textSize(28);
text("EASY", 165, 155);
text("MEDIUM", 140, 355);
text("HARD", 162, 555);
image(difficulty1, 450, 50, 200, 200);
image(difficulty2, 450, 250, 200, 200);
image(difficulty3, 440, 470, 250, 150);

} else {
if(progress) {
background(255);
fill(0,0,255,100);
stroke(0,0,255,50);
strokeWeight(10);
rect(50,30,50,20,2);
fill(255);
textSize(10);
text("BACK",63,45);

    //SKRIV KODEN FOR PROGRESS MENUEN HER
    
} else {
if(settings) {
background(255);
fill(0,0,255,100);
stroke(0,0,255,50);
strokeWeight(10);
rect(50,30,50,20,2);
fill(255);
textSize(10);
text("BACK",63,45);

    //SKRIV KODEN FOR SETTINGS MENUEN HER
  
} else {
if(exit) {
fill(0, 0, 0, 200);
rect(0,0,1000,1000);
fill(255);
stroke(128, 128, 128);
strokeWeight(20);
rect(200,200,400,400,40);
textAlign(CENTER);
fill(0);
textSize(40);
text("ER DU SIKKER?", 400, 270);
fill(128);
textSize(20);
text("(DETTE VIL LUKKE SPILLET NED)", 400, 330);
fill(0,178,0);
stroke(0,128,0,50);
rect(270, 470, 100, 50, 10);
fill(178,0,0);
stroke(128,0,0,50);
rect(430, 470, 100, 50, 10);
fill(0);
text("JA!", 315, 500);
text("NEJ!", 475, 500);
}
}
}
} 
}
}
}
