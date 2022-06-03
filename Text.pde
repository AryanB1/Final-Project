private class Text extends Rectangle {
  String message;
  private Text(float x, float y, float w, float h, color objectColour, String message) {
    super(x, y, w, h, objectColour);
    this.message = message;
  }
  void draw() {
    fill(objectColour);
    text(message, x, y, w, h);
  }
}
