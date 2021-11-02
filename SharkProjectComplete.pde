import java.lang.Math;

int Score;

float HealthBar;
int SharkPosX;
int SharkPosY;
float SharkRotation;

int FishPosX;
int FishPosY;
float FishRotation;

int randGroup0;
int randGroup1;

int numberOfFishGroup1;
int numberOfFishGroup2;

int numOfLives;

//int Result;
//int notResult = Result + int(random(0, 5));

void initScore()
{
    Score = 0;
    numOfLives = 3;
    HealthBar = 1600;
}

void initShark()
{
  SharkPosX = 900;
  SharkPosY = 600;
  SharkRotation = 0;
}

void initFish()
{
  randGroup0 = int(random(0, 11));
  randGroup1 = int(random(0, 11));

  FishPosX = 600;
  FishPosY = 50;
  FishRotation = 90;

  numberOfFishGroup1 = 0;
  numberOfFishGroup2 = 0;
}

void initGame()
{
  initShark();
  initFish();
  initScore();
}


float[][] sharkShape = { 
  {190, 240}, // the first control point
  {190, 240}, // is also the start point of the curve

  // draw body
  {130, 170}, 
  {120, 130}, 

  // draw left fin
  {80, 150}, 
  {90, 125}, 
  {120, 95}, 

  // draw head
  {122, 55}, 
  {140, 20}, 
  {160, 20}, 
  {172, 55}, 

  // draw right fin
  {176, 98}, 
  {220, 129}, 
  {174, 125}, 

  // draw body
  {175, 170}, 
  {200, 227}, 

  // draw tail
  {230, 226}, 
  {250, 215}, 
  {230, 238}, 
  {210, 250}, 
  {215, 280}, 
  {195, 265}, 
  {190, 240}, 

  {190, 240}, // last control point
};



float[][] fishShape = { 
  {190, 240}, // the first control point
  {190, 240}, // is also the start point of the curve

  // draw body
  {130, 170}, 
  {120, 130}, 

  // draw left fin
  {80, 150}, 
  {90, 125}, 
  {120, 95}, 

  // draw head
  {122, 55}, 
  {140, 20}, 
  {160, 20}, 
  {172, 55}, 

  // draw right fin
  {176, 98}, 
  {220, 129}, 
  {174, 125}, 

  // draw body
  {175, 170}, 
  {200, 227}, 

  // draw tail
  {230, 226}, 
  {250, 215}, 
  {230, 238}, 
  {210, 250}, 
  {215, 280}, 
  {195, 265}, 
  {190, 240}, 

  {190, 240}, // last control point
};

void drawAnswerShape(int x, int y, int diameter, int result)
{
  pushMatrix();
  translate(x, y);
  beginShape();
  ellipseMode(CENTER);  // Set ellipseMode to CENTER
  fill(255, 0, 0);
  ellipse(0, 0, diameter, diameter);
  textSize(50);
  textAlign(CENTER);
  fill(0, 0, 0);
  text(result, 0, 0);
  endShape(); 
  popMatrix();
}




void drawShape(float[][] shape, int x, int y, float rotAngle, float scaleShape)
{
  pushMatrix();
  translate(x, y);
  scale(scaleShape);
  rotate(radians(rotAngle));
  fill(0);
  beginShape();
  for (int n=0; n< shape.length; n++)
  {
    curveVertex(shape[n][0], shape[n][1]);
  }
  endShape(); 
  popMatrix();
}



int drawFishGroup(int x, int y, int numberOfFish) {
  int PosX = 0;
  int PosY = 0;
  for (int i = 0; i < numberOfFish; i++) {
    drawShape(fishShape, x, y + PosY, FishRotation, 0.2);

    PosY = PosY + 50;
  }
  return numberOfFish;
};




void setup() {
  size(1800, 900);
  background(70, 130, 180); // steel grey

  initGame();

  /* Move shark head tip to 0,0 by adjusting all coordinates */
  for (int n=0; n< sharkShape.length; n++)
  {
    sharkShape[n][0] = sharkShape[n][0] - 150; 
    sharkShape[n][1] = sharkShape[n][1] - 20;
  }
}

int resultPosition = int(random(4));


void drawFishGroups(int result, int resultPosition)
{
  if (resultPosition == 0)
  {
    drawAnswerShape( 150, 200, 200, result);
    drawAnswerShape( 1600, 200, 200, result+1);
    drawAnswerShape( 150, 700, 200, result+2);
    drawAnswerShape( 1600, 700, 200, result+3);
  } else if (resultPosition == 1) {
    drawAnswerShape( 150, 200, 200, result+1);
    drawAnswerShape( 1600, 200, 200, result);
    drawAnswerShape( 150, 600, 200, result+2);
    drawAnswerShape( 1600, 600, 200, result+3);
  } else if (resultPosition == 2) {
    drawAnswerShape( 150, 200, 200, result+1);
    drawAnswerShape( 1600, 200, 200, result+2);
    drawAnswerShape( 150, 600, 200, result);
    drawAnswerShape( 1600, 600, 200, result+3);
  } else if (resultPosition == 3) {
    drawAnswerShape( 150, 200, 200, result+1);
    drawAnswerShape( 1600, 200, 200, result+2);
    drawAnswerShape( 150, 600, 200, result+3);
    drawAnswerShape( 1600, 600, 200, result);
  }
}


void draw() {
  background(70, 130, 180);
  smooth();
  fill(0);
  stroke(0);
  
  //Score
  fill(0);
 textSize(50);
 text(Score,50,70);
 
  drawFishGroups(numberOfFishGroup1 + numberOfFishGroup2, resultPosition);

  numberOfFishGroup1 = drawFishGroup( 800, 50, randGroup0);
  numberOfFishGroup2 = drawFishGroup( 1000, 50, randGroup1);

  fill(0);
  rect(100,850,1600,30);
  fill(124,252,0);
  rect(100,850,HealthBar,30);
  fill(255);


  drawShape(sharkShape, SharkPosX, SharkPosY, SharkRotation, 1.0);

  //Up Left Corner correct answer
  if (resultPosition == 0) {
    if (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY <= 300 && SharkPosY >= 100) 
    {
      Score = Score + 1;
      SharkPosX = 900;
      SharkPosY = 600;
      initShark();
      initFish();
    } else if ((SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY <= 300 && SharkPosY >= 100) ||
                (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY >= 600 && SharkPosY <= 800) ||
                (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY >= 600 && SharkPosY <= 800))
    {
      if(numOfLives>0) 
      {
         numOfLives--;
         HealthBar = HealthBar - 533.34;
         initShark();
      }
    }
  }
  
  
  //up right Corner correct answer
  if (resultPosition == 1)
  {
    if (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY <= 300 && SharkPosY >= 100)
    {
      Score = Score + 1;
      SharkPosX = 900;
      SharkPosY = 600;
      initShark();
      initFish();
    } else if ((SharkPosX >= 50 && SharkPosX <=250 && SharkPosY >= 600 && SharkPosY <= 800) ||
                (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY <= 300 && SharkPosY >= 100) ||
                (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY >= 600 && SharkPosY <= 800))
    {
      if(numOfLives>0) 
      {
         numOfLives--;
         HealthBar = HealthBar - 533.34;
         initShark();
      }
    }
  }

  //Down Left Corner correct answer
  if (resultPosition == 2) {
    if (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY >= 600 && SharkPosY <= 800) {
      Score = Score + 1;
      SharkPosX = 900;
      SharkPosY = 600;
      initShark();
      initFish();
    } else if ((SharkPosX >= 50 && SharkPosX <=250 && SharkPosY <= 300 && SharkPosY >= 100) ||
                (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY <= 300 && SharkPosY >= 100) ||
                (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY >= 600 && SharkPosY <= 800))
    {                  
      if(numOfLives>0) 
      {
         numOfLives--;
         HealthBar = HealthBar - 533.34;
         initShark();
      }
    }
  }

  //Down Right Corner correct answer
  if (resultPosition == 3) {
    if (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY >= 600 && SharkPosY <= 800) {
      Score = Score + 1;
      initShark();
      initFish();
    } else if((SharkPosX >= 50 && SharkPosX <=250 && SharkPosY <= 300 && SharkPosY >= 100) ||
              (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY <= 300 && SharkPosY >= 100) ||
              (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY >= 600 && SharkPosY <= 800))
    {
      HealthBar = HealthBar - 533.34;;
      initShark();
    } 
  }

  if(numOfLives == 0) 
  {
     HealthBar = 0;
  }


if (HealthBar <=0){
   fill(200);
   rect(400,150,775,400);
   textSize(50);
   fill(0);
   text("Øv.. Du Døde",750,250);
   textSize(25);
   text("Score:",800,300);
   text(Score,900,300);
   SharkPosY = -200;
   SharkPosX=-200;
   fill(230);
   rect(500,400,575,100);
   textSize(45);
   fill(0);
   text("Tryk R for at Spille Igen",800,475);
 }
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      SharkPosX = SharkPosX + 5;
      SharkRotation =  90;
    }
  } 
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      SharkPosX = SharkPosX - 5;
      SharkRotation =  270;
    }
  } 
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      SharkPosY = SharkPosY + 5;
      SharkRotation =  180;
    }
  } 
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      SharkPosY = SharkPosY - 5;
      SharkRotation =  0;
    }
  }

  if(HealthBar == 0)
  {
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        initScore();
        initGame();
      }
    }
  }
}
