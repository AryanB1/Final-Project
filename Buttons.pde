class Buttons extends Rectangle {
  String purpose;
  boolean hover;
  color opposite;
  private Buttons(int x, int y, int w, int h, color objectColour, String purpose) {
    super(x, y, w, h, objectColour);
    this.purpose = purpose;
  }
  void mousePressed() {
    if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      if(purpose == "start") instructionsOn = false;
      if(purpose == "restart") reset = true;
      if(purpose == "end") exit();
      if(purpose == "Please Switch your display to landscape mode! Press this prompt to exit application") exit();
      if(purpose == "Congratulations! Left Player Wins! Press this prompt to restart the game!") reset = true;
      if(purpose == "Congratulations! Right Player Wins! Press this prompt to restart the game!") reset = true;
    };
  }
  void hover() {
    if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) objectColour = 60;
  }
  void purposeGet(String changedPurpose) {
    if(purpose != changedPurpose) purpose = changedPurpose;
  }
  void draw() {
    hover();
    if(objectColour == 0) opposite = 255;
    else opposite = 0;
    stroke(opposite);
    fill(objectColour);
    rect(x, y, w, h);
    fill(opposite);
    textSize(h/2);
    textAlign(CENTER);
    text(purpose, x+(w/2), y+(h/2));
    stroke(base);
  }
}
