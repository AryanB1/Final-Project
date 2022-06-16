final private class Text extends Rectangle {
  String message;
  String longMessage[] = {
  "Please set your screen in landscape mode",
  "For single player: press j (You control the left paddle)",
  "To turn off single player: press z",
  "For screen saver: press f",
  "To turn off screen saver: press z",
  "To turn on night mode: press q",
  "To turn off night mode: press e",
  "To move the left paddle up, press w",
  "To move the left paddle down, press s",
  "To move the right paddle up, press the up key",
  "To move the right paddle down, press the down key",
  "For Left Paddle Speed, Press n (hard), r (normal), g (easy)",
  "For Right Paddle Speed, Press m (hard), t (normal), h (easy)",
  "By default both of these speed parameters are set to easy",
  "To reset game press z",
  "Click any number key beteween 1-9 if you want to add or remove balls (there is one ball by default)",
  "A point is scored by getting a point into the enemy players net, or in the case of single player mode, hitting the ball", 
  "First one to 5 points wins!!",
  "Press i to close this window! It can be reopened any time you need to see the instructions or take a break!",
  "You can use the o(easy), u(normal), and p(hard) keys to set the ball speed. By default, the speed is set to easy",
  "If the addition of the left and right scoreboard equals 3, try clicking anywhere in the middle of the screen!",
  "Feel Free using key presses or mouse presses to complete commands!"
  };
  float size;
  boolean multipleLines;
  // Any single line text 
  private Text(float x, float y, color objectColour, String message, float size, float w, float h, boolean multipleLines) {
    super(x, y, w, h, objectColour);
    this.message = message;
    this.size = size;
    this.multipleLines = multipleLines;
  }
  private Text(float x, float y, color objectColour, float size, float w, float h, boolean multipleLines) {
    super(x, y, w, h, objectColour);
    this.size = size;
    this.multipleLines = multipleLines;
  }
  //Getter and Setter
  void messageGet(String changedMessage) {
    if(message != changedMessage) message = changedMessage;
  }
  void draw() {
    if(multipleLines == true) {
      for(int i = 0; i < longMessage.length; i++) {
        textAlign(CENTER);
        fill(objectColour);
        textSize(size);
        text(longMessage[i], x, y+(i*size));
      }
    }
    else {
      textAlign(CENTER);
      fill(objectColour);
      textSize(size);
      text(message, x, y);
      }
  }
}
