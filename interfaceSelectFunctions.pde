void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN) {
      myStartInterface.setTheOtherActive();
    }
  }

  if (key == RETURN || key == ENTER) {
    if (myStartInterface.active == 0) {
      mode = 1;
    } 
    else {
      loadData();
      mode = 2;
    }
  }
  
  if (key == DELETE || key == BACKSPACE) {
    mode = 0;
  }
}

void enterMode() {
  switch(mode) {
  case 0: 
    myStartInterface.drawInterface();
    break;

  case 1: 
    enableVideo();
    break;

  case 2: 
    drawLoadData(mouseX, mouseY);
    break;
  }
}

