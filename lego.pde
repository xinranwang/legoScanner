class lego {
  //color pieceColor;
  int pieceColorIndex;
  int pieceX;
  int pieceY;
  
  lego(int x, int y) {
    //pieceColor = colors[0];
    pieceColorIndex = 0;
    pieceX = x;
    pieceY = y;
  }
  
  void drawPiece() {
    //fill(pieceColor);
    fill(colors[pieceColorIndex]);
    rect(pieceX, pieceY, pixelSize, pixelSize);
    ellipse(pieceX + pixelSize / 2, pieceY + pixelSize / 2, pixelSize * 0.7, pixelSize * 0.7);
  }
}
