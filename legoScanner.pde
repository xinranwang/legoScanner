import processing.video.*;

Capture video;

int pixelSize = 10;
int legoStrokeColor = 180;
float legoStrokeWeight = 0.2;

int colorTolerance = 200;

int mousePressedX, mousePressedY;

// COLOR ARRAY
color[] colors = new color[0];

// LEGO ARRAY
lego[] myLegos = new lego[0];
lego[] loadLegos;

startInterface myStartInterface;

int mode = 0;

void setup() {
  size(640, 480);
  strokeWeight(legoStrokeWeight);
  stroke(legoStrokeColor);

  initColors();
  initLego();
  
  myStartInterface = new startInterface();
  
  loadData();

  video = new Capture(this, width, height);
  video.start();
}

void draw() {
  enterMode();
  //myStartInterface.drawInterface();
  //enableVideo();

  //drawLoadData(mouseX, mouseY);
  
}

// BUILD THE LEGO ARRAY
void initLego() {
  for (int i = 0; i < height / pixelSize; i++) {
    for (int j = 0; j < width / pixelSize; j++) {
      myLegos = (lego[])append(myLegos, new lego(j * pixelSize, i * pixelSize, 0));
    }
  }
}

// BUILD THE COLOR ARRAY
void initColors() {
  colors = (color[])append(colors, color(0)); // BLACK
//  colors = (color[])append(colors, color(16)); // BLACK
//  colors = (color[])append(colors, color(32)); // BLACK
//  colors = (color[])append(colors, color(48)); // BLACK
//  colors = (color[])append(colors, color(64)); // BLACK
//  colors = (color[])append(colors, color(72)); // BLACK
//  colors = (color[])append(colors, color(96)); // BLACK
//  colors = (color[])append(colors, color(102)); // BLACK
//  colors = (color[])append(colors, color(128)); // BLACK
//  colors = (color[])append(colors, color(144)); // BLACK
//  colors = (color[])append(colors, color(160)); // BLACK
//  colors = (color[])append(colors, color(176)); // BLACK
//  colors = (color[])append(colors, color(192)); // BLACK
//  colors = (color[])append(colors, color(208)); // BLACK
//  colors = (color[])append(colors, color(224)); // BLACK


  colors = (color[])append(colors, color(255)); // WHITE
  colors = (color[])append(colors, color(234, 0, 0)); // RED
  colors = (color[])append(colors, color(7, 149, 0)); // GREEN
  colors = (color[])append(colors, color(0, 63, 245)); // BLUE
  colors = (color[])append(colors, color(255, 230, 0)); // YELLOW
  colors = (color[])append(colors, color(255, 128, 0)); // ORANGE
  //colors = (color[])append(colors, color(162, 89, 0)); // BROWN
  colors = (color[])append(colors, color(148, 234, 0)); // LIGHT GREEN
}

// CHOOSE THE NEAREST COLOR
int colorInLegoIndex(float R, float G, float B) {

  float[] colorDistances = new float[0];

  for (int i = 0; i < colors.length; i++) {
    float colorR = red(colors[i]);
    float colorG = green(colors[i]);
    float colorB = blue(colors[i]);
    colorDistances = append(colorDistances, dist(R, G, B, colorR, colorG, colorB));
  }

  float minDistance = min(colorDistances);

  int index = findMinIndex(colorDistances);
  return index;
}

// FIND THE INDEX OF MIN VALUE
int findMinIndex(float[] distArray) {
  float minDist = distArray[0];
  int index = 0;
  for (int i = 1; i < distArray.length; i++) {
    if (minDist > distArray[i]) {
      index = i;
      minDist = distArray[i];
    }
  }

  if (minDist < colorTolerance) {
    return index;
  } 
  else {
    return 0;
  }
}


void enableVideo() {
  if (video.available()) {
    video.read();
    video.loadPixels();

    background(0);
    //image(video, 0, 0, width, height);
    //loadPixels();

    for (int x = 0; x < width; x += pixelSize) {
      for (int y = 0; y < height; y += pixelSize) {

        // from left to right, up to down
        int thisPixel = x + y * video.width;
        int thisLego = x / pixelSize + y / pixelSize * video.width / pixelSize;

        color colorFromVideo = video.pixels[thisPixel];
        float pixelR = red(colorFromVideo);
        float pixelG = green(colorFromVideo);
        float pixelB = blue(colorFromVideo);

        //println(colorInLegoIndex(pixelR, pixelG, pixelB));
        int thisLegoColorIndex = colorInLegoIndex(pixelR, pixelG, pixelB);

        //myLegos[thisLego].brickColor = colors[colorInLegoIndex(pixelR, pixelG, pixelB)];
        myLegos[thisLego].brickColorIndex = colorInLegoIndex(pixelR, pixelG, pixelB);


        //myLegos[thisLego].brickColor = colorFromVideo;
        myLegos[thisLego].drawBrick();
        //myLegos[thisLego].drawBrickWithColor(colorFromVideo);
      }
    }
    //updatePixels();
  }
}

