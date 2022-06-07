private class Text extends Rectangle {
  String message;
  int loop, size;
  // Any single line text 
  private Text(float x, float y, float w, float h, color objectColour, String message, int size) {
    super(x, y, w, h, objectColour);
    this.message = message;
    this.size = size;
  }
  private Text(float x, float y, float w, float h, color objectColour, String message, int size, int loop) {
    super(x, y, w, h, objectColour);
    this.message = message;
    this.loop = loop;
    this.size = size;
  }
  void draw() {
    if(loop > 1) {
      for(int i = 0; i < loop; i++) {
        print(1);
      }
    }
    fill(objectColour);
    text(message, x, y, w, h);
  }
}
