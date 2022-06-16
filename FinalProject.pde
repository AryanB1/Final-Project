//
/*
My class structare:
First primary class: Shape (Will set it to x, y ONLY
1 Constructor
Mostly out of necessity, as I need to have a constructor so that my subclasses can
inherit something. 
)
Second nested classes: 
Circle (2 constructors
1. Creates the primary ball, and any secondary ball as the game progresses
2. Creates the animation after a game has been won. 
The circle class is final 
)
Rectangle (2 constructors
1. Creates the paddles needed to play pong
2. Creates the animation after a goal has been scored
The rectangle class is final
) 
Text (2 constructors
1. Creates single line text
2. Creates text that needs to be looped through
The text class IS NOT final
)
Third nested class:
Display (2 Constructors
1. Creates the rectangle needed to print text in 
2. Prints the text
The display class is final 
)
Generalized class progression
Shape -> Rectangle
Shape -> Circle
Shape -> Text -> Display 
*/
//Global Variables & Other Items (Classes)
ArrayList<Shape> shapes = new ArrayList<Shape>();
Boolean instructionsOn=true, screensaver = false, singleplayer = false, nightmode;
// Variables for niight mode
int time, base, contrast;
// Variables for colour
int colourBall, colourRectLeft, colourRectRight;
// Variable for dotted middle line
int lenMiddle;
// Variables for left and right score board
int lScore = 0, rScore = 0;
// Variable for number of balls 
int numBalls = 1;
// Variable for mouse press
int xMouse, yMouse, lenBall;
boolean reset = false;
//Variables for ball speed;
//Annonymous Class, one time object
//These numbers in new shape don't matter since I declare the object again in setup after the displayWidth is set
//
void setup()
{
  fullScreen(); //fullScreen(); //displayWidth, displayHeight
  display(); //Landscape manditory
  //
  //Local Variables & Object Setup
  //
  //Instructions, Features, and Hints for Easter Eggs
  time = hour();
  if(time < 8 || time > 18) nightmode = true;
  else nightmode = false;
    //If nightmode is true, background is black, and foreground (text and lines) is white
  if (nightmode == true) {
    base = 0;
    contrast = 255;
  }
  //If nightmode is true, background is white, and foreground (text and lines) is black
  else {
    base = 255;
    contrast = 0;
  }
  Text instructions = new Text(appWidth*1/2, appHeight*2/15, 255, appHeight/35, 0, 0, true);
  shapes.add(instructions); //Elememt 0
  // Redefine instruction location now that fullscreen has been called.
  //Creating Local Variables
  int yDiameter;
  int xDiameter = yDiameter = appWidth*1/90;
  int rectWidth = appWidth*1/80;
  int rectHeight = appHeight*1/4;
  // Ensures that the outlines of objects are invisible
  stroke(base);
  // Assigning Colours
  if(nightmode == true) {
    colourRectLeft = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
    colourRectRight = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
    colourBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
  }
  else {
    colourRectLeft = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
    colourRectRight = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
    colourBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
  }
  //Creating circle and rectangle, and text objects 
  Rectangle rHexLeft = new Rectangle(appWidth*1/40, appHeight*1/4, rectWidth, rectHeight, colourRectLeft);
  Rectangle rHexRight = new Rectangle(appWidth*39/40-rectWidth, appHeight*1/4, rectWidth, rectHeight, colourRectRight);
  Rectangle rectDropL = new Rectangle(appWidth*1/40, appHeight+100, rectWidth, appHeight*1/25, colourRectLeft, "Left");
  Rectangle rectDropR = new Rectangle(appWidth*39/40-rectWidth, appHeight+100, rectWidth, appHeight*1/25, colourRectRight, "Right");
  Rectangle lBoard = new Rectangle(appWidth/5, 0, appWidth/10, appHeight/10, base);
  Rectangle rBoard = new Rectangle(appWidth*3/5, 0, appWidth/10, appHeight/10, base);
  Rectangle leftLine = new Rectangle(appWidth*1/40, 0, 5, appHeight, base);
  Rectangle rightLine = new Rectangle(appWidth*39/40, 0, 6, appHeight, base);
  Rectangle middleLine = new Rectangle(appWidth*1/2, 0, 5, appHeight, base);
  Rectangle screenBox = new Rectangle(appWidth*2/10, appHeight*4/10, appWidth*6/10, appHeight*2/10, base);
  Rectangle lGoalScore = new Rectangle(appWidth*1.5/10, appHeight*4/10, appWidth*3/10, appHeight*2/10, base);
  Rectangle rGoalScore = new Rectangle(appWidth*5.5/10, appHeight*4/10, appWidth*3.5/10, appHeight*2/10, base);
  Circle cHex = new Circle(appWidth*1/2, appHeight*1/2, xDiameter, yDiameter, colourBall);
  Text lBoardText = new Text(appWidth/5+appWidth/20, appHeight/20, 255, str(lScore), appHeight/20, 0, 0, false);
  Text rBoardText = new Text(appWidth*3/5+appWidth/20, appHeight/20, 255, str(rScore), appHeight/20, 0, 0, false);
//  Text lScoreText = new Text(appWidth/5+appWidth/20, appHeight/20, 255, "left", appHeight/20, 0, 0, false);
  // Text rScoreText = new Text(appWidth*3/5+appWidth/20, appHeight/20, 255, "right", appHeight/20, 0, 0, false);
  Buttons start = new Buttons(appWidth*3/5, appHeight*4/5, appWidth*1/10, appHeight*1/10, base,"start");
  Buttons exit = new Buttons(appWidth/5, appHeight*4/5, appWidth*1/10, appHeight*1/10, base,"end");
  Buttons restart = new Buttons(appWidth*2/5, appHeight*4/5, appWidth*1/10, appHeight*1/10, base, "restart");
  //Elements 1-14
  shapes.add(rHexLeft); 
  shapes.add(rHexRight); 
  shapes.add(lBoard);
  shapes.add(rBoard);
  shapes.add(screenBox);
  shapes.add(rectDropL);
  shapes.add(rectDropR);
  shapes.add(rightLine);
  shapes.add(middleLine);
  shapes.add(leftLine);
  shapes.add(lGoalScore);
  shapes.add(rGoalScore);
  shapes.add(lBoardText);
  shapes.add(rBoardText);
  shapes.add(start);
  shapes.add(exit);
  shapes.add(restart);
  for (int i = 15; i < displayHeight; i += 50) {
    //sets colour, to create dotted effect
    Rectangle dots = new Rectangle(appWidth*1/2, i, 5, 25, contrast);
    shapes.add(dots);
  }
  lenMiddle = shapes.size();
  shapes.add(cHex);
  lenBall = shapes.size();
}
//End setup
//
void draw() {
  if (nightmode == true) {
    base = 0;
    contrast = 255;
  }
  else {
    base = 255;
    contrast = 0;
  }
  int sBox = 5;
  if (screenCheck == false ) {
    background(base);
    shapes.get(sBox).objectColour = base;
    shapes.get(sBox).draw();
    fill(contrast);
    textAlign(CENTER);
    textSize(displayHeight*1/30);
    text("Please Switch your display to landscape mode", displayWidth*3/10+displayWidth*1/5, displayHeight*4/10+displayHeight*1/10);
    noLoop();
}
else {
  //If nightmode is true, background is white, and foreground (text and lines) is black
  background(base);
  stroke(base);
  // Things to call
  int instructionElement = 0;
  int paddleLeftElement = 1;
  int paddleRightElement = 2;
  int lBoardElement = 3;
  int rBoardElement = 4;
  int lLine = 10;
  int rLine = 8;
  int mLine = 9;
  int rectL = 6;
  int rectR = 7;
  int lGoalScore = 11;
  int rGoalScore = 12;
  int lBoardText = 13;
  int rBoardText = 14;
  int startButton = 15;
  int endButton = 16;
  int restartButton = 17;
  int mDot = 18;
  int ballElement = lenMiddle;
    if (reset == true) {
    //Scoreboards to original
    lScore = 0;
    rScore = 0;
    numBalls = 1;
    //Paddle position to original
    shapes.get(paddleLeftElement).y = appHeight*1/4;
    shapes.get(paddleRightElement).y = appHeight*1/4;
    shapes.get(rectL).y = height;
    shapes.get(rectR).y = height;
    // Ball to original
    shapes.get(lenMiddle).x = displayWidth*1/2;
    shapes.get(lenMiddle).y = displayHeight*1/2;
    // Single player and screen saver turned off
    singleplayer = false;
    screensaver = false;
    // Turn on instructions
    instructionsOn = true;
    reset = false;
  }
  shapes.get(startButton).objectColour = base;
  shapes.get(endButton).objectColour = base;
  shapes.get(restartButton).objectColour = base;
  shapes.get(lBoardText).messageGet(str(lScore));
  shapes.get(rBoardText).messageGet(str(rScore));
  shapes.get(instructionElement).objectColour = contrast;
  if(lScore == 0 && rScore == 0) {
    shapes.get(paddleLeftElement).h = appHeight*1/4;
    shapes.get(paddleRightElement).h = appHeight*1/4;
  }
  if(shapes.size() - lenMiddle < numBalls) {
    Circle ballNew = new Circle(appWidth*1/2, appHeight*1/2, appWidth*1/90, appWidth*1/90, colourBall);
    shapes.add(ballNew);
  }
  if(shapes.size() - lenMiddle > numBalls) {
    shapes.remove(shapes.size()-1);
  }
  //
  if ( instructionsOn==true ){
    shapes.get(instructionElement).draw();
    shapes.get(startButton).draw();
    shapes.get(endButton).draw();
  }
  //
  //Arithmetic
  else {
    //Game Winning!!!
    if(lScore >= 5) {
      //Shapes are drawn and redrawn in nearly every iteration which looks way cooler than stationary
      for (int i=lenBall; i < lenBall+5; i++) {
        //Randomly choose parameters
        int diameterRandom = int(random ( displayWidth*1/8, displayWidth*1/6)); //Consider user Input (eye sentitivity)
        int xRandom = int(random ( diameterRandom*1/2, displayWidth-diameterRandom*1/2 )); //No stars in net
        int yRandom = int(random ( diameterRandom*1/2, displayHeight-diameterRandom*1/2 )); //Entire displayHeight OK
        Circle circles = new Circle(xRandom, yRandom, diameterRandom, diameterRandom, colourBall, 0);
        shapes.add(circles);
        if ( xRandom-diameterRandom*1/2 > shapes.get(i).x && xRandom+diameterRandom*1/2 < shapes.get(i).x ) {
        xRandom = int(random ( diameterRandom*1/2, displayWidth-diameterRandom*1/2 ));
        shapes.get(i).x = xRandom;
        }
       if ( yRandom-diameterRandom*1/2 > shapes.get(i).x && yRandom+diameterRandom*1/2 < shapes.get(i).x ) {
         yRandom = int(random ( diameterRandom*1/2, displayHeight-diameterRandom*1/2 ));
         shapes.get(i).y = yRandom;
      //
       }
     }
      shapes.get(sBox).objectColour = base;
      for(int i = lenBall; i < shapes.size(); i++) {
        shapes.get(i).draw();
      }
      shapes.get(sBox).draw();
      fill(contrast);
      textAlign(CENTER);
      textSize(displayHeight*1/30);
      text("Congratulations! Left Player Wins! Press Z to reset game!", displayWidth*3/10+displayWidth*1/5, displayHeight*4/10+displayHeight*1/10);
    }
    else if(rScore >= 5) {
      //Shapes are drawn and redrawn in nearly every iteration which looks way cooler than stationary
      for (int i=lenBall; i < lenBall+5; i++) {
        //Randomly choose parameters
        int diameterRandom = int(random ( displayWidth*1/8, displayWidth*1/6)); //Consider user Input (eye sentitivity)
        int xRandom = int(random ( diameterRandom*1/2, displayWidth-diameterRandom*1/2 )); //No stars in net
        int yRandom = int(random ( diameterRandom*1/2, displayHeight-diameterRandom*1/2 )); //Entire displayHeight OK
        Circle circles = new Circle(xRandom, yRandom, diameterRandom, diameterRandom, colourBall, 0);
        shapes.add(circles);
        if ( xRandom-diameterRandom*1/2 > shapes.get(i).x && xRandom+diameterRandom*1/2 < shapes.get(i).x ) {
        xRandom = int(random ( diameterRandom*1/2, displayWidth-diameterRandom*1/2 ));
        shapes.get(i).x = xRandom;
        }
       if ( yRandom-diameterRandom*1/2 > shapes.get(i).x && yRandom+diameterRandom*1/2 < shapes.get(i).x ) {
         yRandom = int(random ( diameterRandom*1/2, displayHeight-diameterRandom*1/2 ));
         shapes.get(i).y = yRandom;
      //
       }
     }
      shapes.get(sBox).objectColour = base;
      for(int i = lenBall; i < shapes.size(); i++) {
        shapes.get(i).draw();
      }
      shapes.get(sBox).draw();
      fill(contrast);
      textAlign(CENTER);
      textSize(displayHeight*1/30);
      text("Congratulations! Right Player Wins! Press Z to reset game!", displayWidth*3/10+displayWidth*1/5, displayHeight*4/10+displayHeight*1/10);
    }
    else{
      // Setting the Right Colour
      shapes.get(paddleLeftElement).objectColour = colourRectLeft;
      shapes.get(paddleRightElement).objectColour = colourRectRight;
      shapes.get(lBoardElement).objectColour = base;
      shapes.get(rBoardElement).objectColour = base;
      shapes.get(sBox).objectColour = base;
      shapes.get(lLine).objectColour = contrast;
      shapes.get(rLine).objectColour = contrast;
      shapes.get(mLine).objectColour = contrast;
      shapes.get(rectL).objectColour = colourRectLeft;
      shapes.get(rectR).objectColour = colourRectRight;
      shapes.get(lGoalScore).objectColour = base;
      shapes.get(rGoalScore).objectColour = base;
      shapes.get(lBoardText).objectColour = contrast;
      shapes.get(rBoardText).objectColour = contrast;
      for(int i = mDot; i < lenMiddle; i++) shapes.get(i).objectColour = base;
      shapes.get(ballElement).objectColour = colourBall;
      for (int i = ballElement; i < shapes.size(); i++) {
        shapes.get(i).paddleBounceLeft( shapes.get(paddleLeftElement).x, shapes.get(paddleLeftElement).y, shapes.get(paddleLeftElement).w, shapes.get(paddleLeftElement).h );
        shapes.get(i).paddleBounceRight( shapes.get(paddleRightElement).x, shapes.get(paddleRightElement).y, shapes.get(paddleRightElement).h ); 
      }
      //Drawing where tokens should be
      //Screensaver functional 
      if(screensaver == true) {
        shapes.get(paddleLeftElement).y = shapes.get(ballElement).y - shapes.get(paddleLeftElement).h/2;
        if(shapes.get(paddleLeftElement).y < 0) shapes.get(paddleLeftElement).y = 0;  
        if(shapes.get(paddleLeftElement).y+shapes.get(paddleLeftElement).h > height) shapes.get(paddleLeftElement).y = height-shapes.get(paddleLeftElement).h;  
        shapes.get(paddleRightElement).y = shapes.get(ballElement).y - shapes.get(paddleLeftElement).h/2;
        if(shapes.get(paddleRightElement).y < 0) shapes.get(paddleRightElement).y = 0;  
        if(shapes.get(paddleRightElement).y+shapes.get(paddleRightElement).h > height) shapes.get(paddleRightElement).y = height-shapes.get(paddleRightElement).h;  
      }
      if(singleplayer == true) {
        shapes.get(paddleRightElement).y = shapes.get(ballElement).y - shapes.get(paddleLeftElement).h/2;
        if(shapes.get(paddleRightElement).y < 0) shapes.get(paddleRightElement).y = 0;  
        if(shapes.get(paddleRightElement).y+shapes.get(paddleRightElement).h > height) shapes.get(paddleRightElement).y = height-shapes.get(paddleRightElement).h;  
      }
      //Note: repeats basic FOR-Each like belowss
      for ( int i=1; i< shapes.size(); i++ ) {
        if(i == startButton || i == endButton) continue;
        shapes.get(i).draw();
        //println("here", i);
      }
      fill(contrast);
      stroke(contrast);
      if(int(shapes.get(rectL).y) < int(appHeight+50)) {
        textAlign(CENTER);
        textSize(displayHeight*1/30);
        text("Left Player Scored!", shapes.get(lGoalScore).x+(shapes.get(lGoalScore).w/2), shapes.get(lGoalScore).y+(shapes.get(lGoalScore).h/2));
      }
      if(int(shapes.get(rectR).y) < int(appHeight+50)) {
        textAlign(CENTER);
        textSize(displayHeight*1/30);
        text("Right Player Scored!", shapes.get(rGoalScore).x+(shapes.get(rGoalScore).w/2), shapes.get(rGoalScore).y+(shapes.get(rGoalScore).h/2));
    }
    }
  }
}
  //
}
//End draw
// Start keyPressed
void keyPressed() {
  int paddleLeftElement = 1;
  int paddleRightElement = 2;
  int rectL = 6;
  int rectR = 7;
  // Opens And Closes Instructions
  if ( key == 'I' || key == 'i' ) {
    if ( instructionsOn==true ) {
      instructionsOn=false;
    } else {
      instructionsOn=true;
    }
  }
  shapes.get(paddleLeftElement).leftPaddleSpeed();
  shapes.get(paddleRightElement).rightPaddleSpeed();
  shapes.get(paddleLeftElement).leftPaddleMove();
  shapes.get(paddleRightElement).rightPaddleMove();
  for(int i = lenMiddle; i < shapes.size(); i++) shapes.get(i).ballSpeed();
  // Turn On Screen Saver
  if(key == 'f' || key == 'F'){
    screensaver = true;
  }
  // Turn On Single Player
  if(key == 'j' || key == 'J'){
    singleplayer = true;
  }
  // Turn On Night Mode 
  if(key == 'q' || key == 'Q') {
    nightmode = true;
    colourRectLeft = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
    colourRectRight = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
    colourBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
  }
  // Turn Off Night Mode
  if(key == 'e' || key == 'E') {
    nightmode = false;
    colourRectLeft = color(int( random(50, 200) ), int( random(50, 200) ), int( random(0) ));
    colourRectRight = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
    colourBall = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
  }
  //Setting Paddle Speeds 
  // Reset Game
  if(key == 'z' || key == 'Z') reset = true;
}
//End keyPressed
void mousePressed() {
  int startButton = 15;
  int endButton = 16;
  int restartButton = 17;
  if(instructionsOn == true){
  shapes.get(startButton).mousePressed();
  shapes.get(endButton).mousePressed();
  }
  else {
    // The inclusion of the 3 is an easter egg to how many times I've rewritten this game
   shapes.get(restartButton).mousePressed();
   if(mouseX > displayWidth*5/40 && mouseX < displayWidth*35/40 && mouseY > displayHeight*5/40 && mouseY < displayHeight*35/40 && (lScore + rScore) == 3 && xMouse == 0 && yMouse == 0){
     xMouse = int(shapes.get(lenMiddle).x - mouseX);
     yMouse = int(shapes.get(lenMiddle).y - mouseY);
   }
  } 
}//End mousePressed
//
//End MAIN (Driver) Program
