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
    };
  }
  void hover() {
    if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) objectColour = 60;
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
    text(purpose, x+(w/2), y+(h/2));
    stroke(base);
  }
}
