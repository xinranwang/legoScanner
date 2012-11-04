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

  if (dataWidth < 0) dataWidth = -dataWidth;
  if (dataHeight < 0) dataHeight = -dataHeight;

  String[] data = new String[dataHeight + 2];

  data[0] = "Width:\"" + dataWidth + "\"";
  data[1] = "Height:\"" + dataHeight + "\"";

  for (int i = 2; i < dataHeight + 2; i++) {
    ////////// ARRAY OUT OF BOUNDARY 
    data[i] = String.valueOf(myLegos[startX + (i + 1) * startY * video.width / pixelSize].brickColorIndex);
    for (int j = 1; j < dataWidth; j++) {
      data[i] += "," + String.valueOf(myLegos[startX + j + (i + 1) * startY * video.width / pixelSize].brickColorIndex);
    }
  }

  saveStrings("data/data.txt", data);
}

void loadData() {
  String[] data = loadStrings("data/data.txt");

  int dataWidth = int(giveMeTextBetween(data[0], "Width:\"", "\""));
  int dataHeight = int(giveMeTextBetween(data[1], "Height:\"", "\""));
  

  loadLegos = new lego[dataWidth * dataHeight];

  for (int i = 2; i < data.length; i++) {
    int[] values = int(split(data[i], ","));
    for (int j = 0; j < dataWidth; j++) {
      loadLegos[j + (i - 2) * dataWidth] = new lego(j * pixelSize, (i - 2) * pixelSize, values[j]);
    }
  }
  
}

void drawLoadData(int x, int y) {
  
  background(0);
  for(int i = 0; i < loadLegos.length; i++) {

    loadLegos[i].drawBrick(x, y);
  }
}

// A function that returns a substring between two substrings
String giveMeTextBetween(String s, String before, String after) {
  String found = "";
  int start = s.indexOf(before);    // Find the index of the beginning tag
  if (start == - 1) return"";       // If we don't find anything, send back a blank String
  start += before.length();         // Move to the end of the beginning tag
  int end = s.indexOf(after, start); // Find the index of the end tag
  if (end == -1) return"";          // If we don't find the end tag, send back a blank String
  return s.substring(start, end);    // Return the text in between
}

