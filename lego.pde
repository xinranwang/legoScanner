class lego {
  
  //color brickColor;
  int brickColorIndex;
  int brickX;
  int brickY;

  lego(int x, int y, int colorIndex) {

    brickColorIndex = colorIndex;
    brickX = x;
    brickY = y;
  }

  void setLocation(int x, int y) {
    brickX = x;
    brickY = y;
  }

  void setColor(int colorIndex) {
    brickColorIndex = colorIndex;
  }

  void drawBrick() {
    strokeWeight(legoStrokeWeight);
    stroke(legoStrokeColor);
    fill(colors[brickColorIndex]);
    rect(brickX, brickY, pixelSize, pixelSize);
    ellipse(brickX + pixelSize / 2, brickY + pixelSize / 2, pixelSize * 0.7, pixelSize * 0.7);
  }

  void drawBrick(int x, int y) {
    strokeWeight(legoStrokeWeight);
    stroke(legoStrokeColor);
    fill(colors[brickColorIndex]);
    rect(brickX + x, brickY + y, pixelSize, pixelSize);
    ellipse(brickX + pixelSize / 2 + x, brickY + pixelSize / 2 + y, pixelSize * 0.7, pixelSize * 0.7);
  }
  
  void drawBrickWithColor(color _brickColor) {
    strokeWeight(legoStrokeWeight);
    stroke(legoStrokeColor);
    fill(_brickColor);
    rect(brickX, brickY, pixelSize, pixelSize);
    ellipse(brickX + pixelSize / 2, brickY + pixelSize / 2, pixelSize * 0.7, pixelSize * 0.7);
  }
}

