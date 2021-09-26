import java.lang.Math;

int SharkPosX = 800;
int SharkPosY = 800;
float SharkRotation = 0;

int FishPosX = 600;
int FishPosY = 50;
float FishRotation = 90;

int test0 = int(random(0, 11));
int test1 = int(random(0, 11));

int numberOfFishGroup1 = 0;
int numberOfFishGroup2 = 0;


int Result;
int notResult = Result + int(random(0, 5));


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

  drawFishGroups(numberOfFishGroup1 + numberOfFishGroup2, resultPosition);

  numberOfFishGroup1 = drawFishGroup( 800, 50, test0);
  numberOfFishGroup2 = drawFishGroup( 1000, 50, test1);





  drawShape(sharkShape, SharkPosX, SharkPosY, SharkRotation, 1.0);

  //Up Left Corner correct answer
  if (resultPosition == 0) {
    if (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY <= 300 && SharkPosY >= 100) {
      rect(100, 100, 100, 100);
    } else if (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY <= 300 && SharkPosY >= 100) {
      ellipse(100, 100, 200, 200);
    } else if (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY >= 600 && SharkPosY <= 800) {
      ellipse(100, 100, 200, 200);
    } else if (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY >= 600 && SharkPosY <= 800) {
      ellipse(100, 100, 200, 200);
    }
  }
  //up right Corner correct answer
  if (resultPosition == 1)
  {
    if (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY <= 300 && SharkPosY >= 100)
    {
      ellipse(100, 100, 200, 200);
    } else if (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY <= 300 && SharkPosY >= 100)
    {
      rect(100, 100, 100, 100);
    } else if (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY >= 600 && SharkPosY <= 800)
    {
      ellipse(100, 100, 200, 200);
    } else if (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY >= 600 && SharkPosY <= 800) {
      ellipse(100, 100, 200, 200);
    }
  }

  //Down Left Corner correct answer
  if (resultPosition == 2) {
    if (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY <= 300 && SharkPosY >= 100) {
      ellipse(100, 100, 200, 200);
    } else if (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY <= 300 && SharkPosY >= 100) {
      ellipse(100, 100, 200, 200);
    } else if (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY >= 600 && SharkPosY <= 800) {
      rect(100, 100, 100, 100);
    } else if (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY >= 600 && SharkPosY <= 800) {
      ellipse(100, 100, 200, 200);
    }
  }

  //Down Right Corner correct answer
  if (resultPosition == 3) {
    if (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY <= 300 && SharkPosY >= 100) {
      ellipse(100, 100, 200, 200);
    } else if (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY <= 300 && SharkPosY >= 100) {
      ellipse(100, 100, 200, 200);
    } else if (SharkPosX >= 50 && SharkPosX <=250 && SharkPosY >= 600 && SharkPosY <= 800) {
      ellipse(100, 100, 200, 200);
    } else if (SharkPosX >= 1500 && SharkPosX <=1700 && SharkPosY >= 600 && SharkPosY <= 800) {
      rect(100, 100, 100, 100);
    }
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

  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      resultPosition = int(random(4));
    }
  }
}
