void mousePressed() {
  mousePressedX = mouseX;
  mousePressedY = mouseY;
}

void mouseDragged() {

  stroke(255);
  strokeWeight(1);
  noFill();
  rect(mousePressedX, mousePressedY, mouseX - mousePressedX, mouseY - mousePressedY);
  
}

void mouseReleased() {
  saveData(mouseX, mouseY);
}

void saveData(int x, int y) {
  int startX, startY, endX, endY;
  if (mousePressedX % pixelSize == 0) {
    startX = mousePressedX / pixelSize;
  }
  else {
    startX = mousePressedX / pixelSize + 1;
  }

  if (mousePressedY % pixelSize == 0) {
    startY = mousePressedY / pixelSize;
  }
  else {
    startY = mousePressedY / pixelSize + 1;
  }

  endX = x / pixelSize;
  endY = y / pixelSize;

  int dataWidth = endX - startX;
  int dataHeight = endY - startY;
  
  println(startX + ", " + startY);
  println(endX + ", " + endY);
  println(dataWidth);
  println(dataHeight);
  
  if(dataWidth < 0) dataWidth = -dataWidth;
  if(dataHeight < 0) dataHeight = -dataHeight;
  
  String[] data = new String[dataHeight + 2];
  
  data[0] = "Width: " + dataWidth;
  data[1] = "Height: " + dataHeight;
  
  for (int i = 2; i < dataHeight + 2; i++) {
    ////////// ARRAY OUT OF BOUNDARY 
    data[i] = String.valueOf(myLegos[startX + (i + 1) * startY * video.width / pixelSize].pieceColorIndex);
    for (int j = 1; j < dataWidth; j++) {
      data[i] += "," + String.valueOf(myLegos[startX + j + (i + 1) * startY * video.width / pixelSize].pieceColorIndex);
    }
  }
  
  saveStrings("data/data.txt", data);
}

//void loadData() {
//  String[] data = loadStrings("data.txt");
//  loadLegos = new lego[data.length];
//  for(int i = 0; i < data.length; i++) {
//    int[] values = int(split(data[i], ","));
//    loadLegos[i] = new lego();
//  }
//}
