//Classes
MusicPlayerDivs musicPlayerDivs;
//
int appWidth, appHeight;
int size;
int ShorterSide;
//
void setup() {
  //
  size(1200, 800);
  appWidth = width;
  appHeight = height;
  ShorterSide = (appWidth >= appHeight) ? appHeight : appWidth;
  //
  musicPlayerDivs = new MusicPlayerDivs();
  //
}
void draw() {
  //
  musicPlayerDivs.draw();
  //
}
void keyPressed() {
  //
  musicPlayerDivs.keyPressed();
  //
}
void mousePressed() {
  //
  musicPlayerDivs.mousePressed();
  //
}
