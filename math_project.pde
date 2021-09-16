PImage img;
PImage nmg;
PImage cmg;
PFont sjovFont;
void setup(){
size(800 , 800);
background(0,200,255); 
stroke(0);
strokeWeight(6);
line(0,0,0,800);
line(800,800,800,0);
line(0,0,800,0);
line(0,800,800,800);
noStroke();
rect(50,200,700,350);
fill(0);
 sjovFont = createFont("Comic Sans MS", 38);
  textFont(sjovFont);
  text("Sværhedsgrad", 290, 250);
    img = loadImage("Fish.png.png");
       nmg = loadImage("octopus-clipart-md.png");
        cmg = loadImage("pngaaa.com-65514.png");
        fill(255);
        stroke(0);
        rect(90,300,200,200);
          fill(255);
        stroke(0);
        rect(305,300,200,200);
          fill(255);
        stroke(0);
        rect(520,300,200,200);
}
void draw() {
  image(img,75, 300,width/3.5,height/3.5);
  image(nmg,325, 300,width/5,height/5);
   image(cmg,530, 300,width/5,height/5);
}
