class startInterface {
  String[] options = {
    "SCAN", "LOAD"
  };
  int active = 0;
  PFont font;
  lego[] activeLegos;

  startInterface() {
    //options = {"SCAN", "LOAD"};
    activeLegos = new lego[14];
    font = loadFont("Futura-CondensedMedium-48.vlw");
    for (int i = 0; i < activeLegos.length; i++) {
      activeLegos[i] = new lego(0, 0, 0);
    }
  }


  void drawText() {
    background(0);
    textFont(font, 48);
    textAlign(CENTER);
    fill(255);
    for (int i = 0; i < options.length; i++) {
      text(options[i], width / 2, (i + 1) * height / 3);
    }
  }

  void drawLegos() {
    int startX = width / 2 - 7 * pixelSize;
    int startY = height / 3 * (active + 1) + 1 * pixelSize;


    for (int i = 0; i < activeLegos.length; i++) {
      activeLegos[i].setEverything(startX + i * pixelSize, startY, 3);
      activeLegos[i].drawBrick();
    }
  }

  void drawInterface() {
    drawText();
    drawLegos();
  }

  void setTheOtherActive() {
    active = 1 - active;
  }

  int getActive() {
    return active;
  }
}

