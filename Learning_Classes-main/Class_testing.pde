class MusicPlayerDivs {
int NumberOfMusicPanelDIVs = 7; //All Music Panel components
float[][] MusicPanelDivRatios = new float[NumberOfMusicPanelDIVs][4]; //Store ratios (Rectangles)
float[] MusicPanelDivs = new float [NumberOfMusicPanelDIVs*4]; //Music Panel Position and Size of components
int NumberOfButtonDIVs = 10; //All Music Player Buttons
float[][] ButtonDivRatios = new float[NumberOfButtonDIVs][4]; //Store ratios (Rectangles)
float[] ButtonDivs = new float [NumberOfButtonDIVs*4]; //Button Positions and Size
int NumberOfButtonIconDIVs = 9; //All Music Player Button Icons
float[][] ButtonIconDivRatios = new float[NumberOfButtonIconDIVs][6]; //Store ratios (Triangles)
float[] ButtonIconDivs = new float [NumberOfButtonIconDIVs*6]; //Icon Positions and Size
int NumberOfAltButtonIconDIVs = 2; //All Alternate Music Player Button Icons
float[][] AltButtonIconDivRatios = new float[NumberOfAltButtonIconDIVs][4]; //Store ratios (rectangle)
float[] AltButtonIconDivs = new float [NumberOfAltButtonIconDIVs*4]; //Icon Positions and Size
int NumberOfPlaylistDIVs = 6; //Music Player Playlist
float[][] PlaylistDivRatios = new float[NumberOfPlaylistDIVs][4]; //Store ratios (rectangle)
float[] PlaylistDivs = new float [NumberOfPlaylistDIVs*4]; //Icon Positions and Size
color resetDefaultInk=#FFFFFF;
color Gray=#C9C9C9;
color LightGray=#CECECE;
color Black=#000000;
color Purple=#B031E8;
color TextPurple=#F986FF;
boolean MusicPlayer = false;
boolean PlaylistView = false;
boolean MouseIsOver(float xVariable, float yVariable, float widthVariable, float heightVariable) {
  return mouseX > xVariable && mouseX < xVariable + widthVariable && mouseY > yVariable && mouseY < yVariable + heightVariable;
}
  //
  /*
  Each matrix array contains two different arrays so I will use the Music Panel array as an example. In this array it creates a string of four variables per div called MusicPanelDiveRatios which stores
  coordinates as ratios in groups of four as the array MusicPanelDivs and gives them a designation depending on if it is the 1st, 2nd, 3rd, or 4th ratio in the group. The designations are as follows:
  1st ratio: X which is the Position from left as a fraction of appWidth, 2nd ratio: Y which is the Position from left as a fraction of appHeight, 3rd ratio: Width as a fraction of appWidth and
  4th ratio: Height as a fraction of appHeight. The ratios are given their values by inputing them into MusicPanelDiveRatios thus giving each value in MusicPanelDivs a ratio. Every ratio is then
  converted into a function of either appWidth for the x and width ratios or appHeight for the y and height ratios. Finally every group is generated as a rectangle in the Music Panel. The same process
  is used in ButtonIconDivRatios except there are 6 ratios and the 1st, 3rd and 5th are ratios of X and the 2nd, 4th and 6th are ratios of Y as triangles do not use a width or height when being created.
  However the function conversion and generation are the same but creating triangles instead of rectangles.
  */
  MusicPlayerDivs() {
    DivSetup();
  }
  //
void DivSetup() {
  //
  //Music Panel Divs
  //{X value in ratio of appwidth, Y value in ratio of appwidth, width value in ratio of appwidth, height value in ratio of appheight}
  MusicPanelDivRatios[0] = new float[]{0.0, 0.0, 1.0/1, 1.0/1}; //Background Component
  MusicPanelDivRatios[1] = new float[]{2.0/27, 1.0/10, 23.0/27, 4.0/5}; //Music Panel Component
  MusicPanelDivRatios[2] = new float[]{2.0/7, 3.0/20, 3.0/7, 1.0/11}; //Song Title Component
  MusicPanelDivRatios[3] = new float[]{1.0/3, 3.0/20+1.0/11, 1.0/3, 1.0/18}; //Song Author Component
  MusicPanelDivRatios[4] = new float[]{1.0/3, 3.0/20+1.0/11+1.0/18, 1.0/3, 1.0/18}; //Date of Publish/Release
  MusicPanelDivRatios[5] = new float[]{1.0/3, 3.0/20+1.0/11+1.0/9, 1.0/3, 1.0/6}; //Song Image Component
  MusicPanelDivRatios[6] = new float[]{5.0/26, 13.0/16, 8.0/13, 1.0/48}; //Song Progress Bar
  //
  //Button Divs
  //{X value in ratio of appwidth, Y value in ratio of appwidth, width value in ratio of appwidth, height value in ratio of appheight}
  ButtonDivRatios[0] = new float[]{23.0/24, 0.0, 1.0/24, 1.0/30}; //Quit Button
  ButtonDivRatios[1] = new float[]{11.0/12, 23.0/24, 1.0/12, 1.0/24}; //Toggle PlayList View
  ButtonDivRatios[2] = new float[]{5.0/26, 24.0/40, 1.0/26, 1.0/26}; //Previous Song Button
  ButtonDivRatios[3] = new float[]{9.0/26, 24.0/40, 1.0/26, 1.0/26}; //Rewind Button
  ButtonDivRatios[4] = new float[]{25.0/52, 24.0/40, 1.0/26, 1.0/26}; //Play/Pause Button
  ButtonDivRatios[5] = new float[]{16.0/26, 24.0/40, 1.0/26, 1.0/26}; //Fast Forward Button
  ButtonDivRatios[6] = new float[]{20.0/26, 24.0/40, 1.0/26, 1.0/26}; //Next Song Button
  ButtonDivRatios[7] = new float[]{25.0/52, 24.0/40+2.5/26, 1.0/26, 1.0/26}; //Shuffle Songs Button
  ButtonDivRatios[8] = new float[]{9.0/26, 24.0/40+2.5/26, 1.0/26, 1.0/26}; //Replay Song Button
  ButtonDivRatios[9] = new float[]{16.0/26, 24.0/40+2.5/26, 1.0/26, 1.0/26}; //Loop Button
  //
  //Button Icon Divs
  //{The first, third and fifth ratios are X values in ratio of appwidth. The second, fourth and sixth ratios are y values in ratio of appheight}
  ButtonIconDivRatios[0] = new float[]{5.0/26+5.0/156, 24.0/40+1.2/104, 5.0/26+5.0/156, 24.0/40+4.8/104, 2.0/10, 25.0/40+1.0/208}; //Previous Button Triangle One
  ButtonIconDivRatios[1] = new float[]{5.0/26+1.0/156, 24.0/40+1.0/104, 5.0/26+1.0/156, 24.0/40+5.0/104, 5.0/26+1.0/156, 25.0/40+1.0/208}; //Previous Button Triangle Two
  ButtonIconDivRatios[2] = new float[]{9.0/26+2.0/104, 24.0/40+1.3/104, 9.0/26+2.0/104, 24.0/40+4.7/104, 9.0/26+1.0/156, 25.0/40+1.0/208}; //Rewind Button Triangle One
  ButtonIconDivRatios[3] = new float[]{9.0/26+2.0/104+2.0/156, 24.0/40+1.3/104, 9.0/26+2.0/104+2.0/156, 24.0/40+4.7/104, 9.0/26+2.0/104, 25.0/40+1.0/208}; //Rewind Button Triangle Two
  //ButtonIconDivRatios[4] = new float[]{25.4/52, 24.0/40+1.0/104, 25.4/52, 24.0/40+5.0/104, 26.6/52, 25.0/40+1.0/208}; //Play/Pause Button Triangle
  ButtonIconDivRatios[5] = new float[]{16.0/26+1.0/156, 24.0/40+1.3/104, 16.0/26+1.0/156, 24.0/40+4.7/104, 16.0/26+3.0/156, 25.0/40+1.0/208}; //Fast Forward Button Triangle One
  ButtonIconDivRatios[6] = new float[]{16.0/26+3.0/156, 24.0/40+1.3/104, 16.0/26+3.0/156, 24.0/40+4.7/104, 16.0/26+5.0/156, 25.0/40+1.0/208}; //Fast Forward Button Triangle Two
  ButtonIconDivRatios[7] = new float[]{20.0/26+1.0/156, 24.0/40+1.2/104, 20.0/26+1.0/156, 24.0/40+4.8/104, 20.0/26+4.7/156, 25.0/40+1.0/208}; //Next Button Triangle One
  ButtonIconDivRatios[8] = new float[]{20.0/26+5.0/156, 24.0/40+1.0/104, 20.0/26+5.0/156, 24.0/40+5.0/104, 20.0/26+5.0/156, 25.0/40+1.0/208}; //Next Button Triangle Two
  //
  //Alternative Button Icon Divs
  AltButtonIconDivRatios[0] = new float[]{204.0/416, 24.0/40+1.0/104, 1.0/208, 1.0/26}; //Previous Button Triangle One
  AltButtonIconDivRatios[1] = new float[]{202.0/416+1.0/52, 24.0/40+1.0/104, 1.0/208, 1.0/26}; //Previous Button Triangle Two
  //
  //Playlist Display Divs
  PlaylistDivRatios[0] = new float[]{3.0/27+23/432, 23.0/100+22.0/243, 21.0/27, 2.0/21}; //Playlist Song 1
  PlaylistDivRatios[1] = new float[]{3.0/27+23/432, 23.0/100+44.0/243, 21.0/27, 2.0/21}; //Playlist Song 2
  PlaylistDivRatios[2] = new float[]{3.0/27+23/432, 23.0/100+65.0/243, 21.0/27, 2.0/21}; //Playlist Song 3
  PlaylistDivRatios[3] = new float[]{3.0/27+23/432, 23.0/100+86.0/243, 21.0/27, 2.0/21}; //Playlist Song 4
  PlaylistDivRatios[4] = new float[]{3.0/27+23/432, 23.0/100+108.0/243, 21.0/27, 2.0/21}; //Playlist Song 5
  PlaylistDivRatios[5] = new float[]{3.0/27+23/432, 23.0/100+130.0/243, 21.0/27, 2.0/21}; //Playlist Song 6
  //
  CalculateDIVs();
  //
}
void CalculateDIVs() {
  for (int i = 0; i < NumberOfMusicPanelDIVs; i++) {
    int baseIndex = i*4;
    MusicPanelDivs[baseIndex] = appWidth*MusicPanelDivRatios[i][0]; //X position
    MusicPanelDivs[baseIndex+1] = appHeight*MusicPanelDivRatios[i][1]; //Y position
    MusicPanelDivs[baseIndex+2] = appWidth*MusicPanelDivRatios[i][2]; //Width
    MusicPanelDivs[baseIndex+3] = appHeight*MusicPanelDivRatios[i][3]; //Height
  }
  for (int i = 0; i < NumberOfButtonDIVs; i++) {
    int baseIndex = i*4;
    ButtonDivs[baseIndex] = appWidth*ButtonDivRatios[i][0]; //X position
    ButtonDivs[baseIndex+1] = appHeight*ButtonDivRatios[i][1]; //Y position
    ButtonDivs[baseIndex+2] = appWidth*ButtonDivRatios[i][2]; //Width
    if (i != 0 || i == 9) {
      ButtonDivs[baseIndex+3] = ButtonDivs[baseIndex+2]; //Square Buttons
    } else {
      ButtonDivs[baseIndex+3] = appHeight*ButtonDivRatios[i][3]; //Height
    }
  }
  for (int i = 0; i < NumberOfButtonIconDIVs; i++) {
    int baseIndex = i*6;
    ButtonIconDivs[baseIndex] = appWidth*ButtonIconDivRatios[i][0]; //X1 position
    ButtonIconDivs[baseIndex+1] = appHeight*ButtonIconDivRatios[i][1]; //Y1 position
    ButtonIconDivs[baseIndex+2] = appWidth*ButtonIconDivRatios[i][2]; //X2 position
    ButtonIconDivs[baseIndex+3] = appHeight*ButtonIconDivRatios[i][3]; //Y2 position
    ButtonIconDivs[baseIndex+4] = appWidth*ButtonIconDivRatios[i][4]; //X3 position
    ButtonIconDivs[baseIndex+5] = appHeight*ButtonIconDivRatios[i][5]; //Y3 position
  }
   for (int i = 0; i < NumberOfAltButtonIconDIVs; i++) {
    int baseIndex = i*4;
    AltButtonIconDivs[baseIndex] = appWidth*AltButtonIconDivRatios[i][0]; //X position
    AltButtonIconDivs[baseIndex+1] = appHeight*AltButtonIconDivRatios[i][1]; //Y position
    AltButtonIconDivs[baseIndex+2] = appWidth*AltButtonIconDivRatios[i][2]; //Width position
    AltButtonIconDivs[baseIndex+3] = appHeight*AltButtonIconDivRatios[i][3]; //Height position
  }
  for (int i = 0; i < NumberOfPlaylistDIVs; i++) {
    int baseIndex = i*4;
    PlaylistDivs[baseIndex] = appWidth*PlaylistDivRatios[i][0]; //X position
    PlaylistDivs[baseIndex+1] = appHeight*PlaylistDivRatios[i][1]; //Y position
    PlaylistDivs[baseIndex+2] = appWidth*PlaylistDivRatios[i][2]; //Width position
    PlaylistDivs[baseIndex+3] = appHeight*PlaylistDivRatios[i][3]; //Height position
  }
} 
void draw() {
  //
  rect(MusicPanelDivs[0], MusicPanelDivs[1], MusicPanelDivs[2], MusicPanelDivs[3]);
  //
  if (MusicPlayer == true) {
  fill(Black);
  fill(resetDefaultInk);
  strokeWeight(3);
  stroke(Purple);
  fill(Black);
  rect(MusicPanelDivs[4], MusicPanelDivs[5], MusicPanelDivs[6], MusicPanelDivs[7]);
  /*
  strokeWeight(3);
  stroke(Purple);
  fill(Black);
  for (int i = 1; i < NumberOfMusicPanelDIVs; i++) {
    int baseIndex = i*4;
    rect(MusicPanelDivs[baseIndex], MusicPanelDivs[baseIndex+1], MusicPanelDivs[baseIndex+2], MusicPanelDivs[baseIndex+3]);
  }
  noStroke();
  //
  //Buttons
  strokeWeight(3);
  stroke(Purple);
  fill(Black);
  for (int i = 1; i < NumberOfButtonDIVs; i++) {
  int baseIndex = i*4;
  rect(ButtonDivs[baseIndex], ButtonDivs[baseIndex+1], ButtonDivs[baseIndex+2], ButtonDivs[baseIndex+3]);
  }
  //
  //Music Button Icons
  strokeWeight(3);
  stroke(TextPurple);
  fill(TextPurple);
  for (int i = 0; i < NumberOfButtonIconDIVs; i++) {
  int baseIndex = i*6;
    triangle(ButtonIconDivs[baseIndex], ButtonIconDivs[baseIndex+1], ButtonIconDivs[baseIndex+2], ButtonIconDivs[baseIndex+3], ButtonIconDivs[baseIndex+4], ButtonIconDivs[baseIndex+5]);
    }
    rect(AltButtonIconDivs[0], AltButtonIconDivs[1], AltButtonIconDivs[2], AltButtonIconDivs[3]);
    rect(AltButtonIconDivs[4], AltButtonIconDivs[5], AltButtonIconDivs[6], AltButtonIconDivs[7]);
    */
    ///*
  strokeWeight(3);
  stroke(Purple);
  fill(Black);
  for (int i = 0; i < NumberOfPlaylistDIVs; i++) {
  int baseIndex = i*4;
  rect(PlaylistDivs[baseIndex], PlaylistDivs[baseIndex+1], PlaylistDivs[baseIndex+2], PlaylistDivs[baseIndex+3]);
  }
  //*/
  }
  strokeWeight(3);
  stroke(Purple);
  fill(Black);
  rect(ButtonDivs[0], ButtonDivs[1], ButtonDivs[2], ButtonDivs[3]);
  }
void keyPressed() {
  if (key=='m' || key=='M') {
    ToggleMusicPlayer();
  }
}
void mousePressed() {
  if (MouseIsOver(ButtonDivs[0], ButtonDivs[1], ButtonDivs[2], ButtonDivs[3])) {
    ToggleMusicPlayer();
    }
  }
void ToggleMusicPlayer() {
  if (!MusicPlayer) {
    MusicPlayer = true;
  } else if (MusicPlayer) {
    MusicPlayer = false;
  }
}
}
