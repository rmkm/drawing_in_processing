/**
   Key mapping
   1: Bushy
   2: Squre
   3: Water drops
   4: Star
   5: Blur (Circle)
   6: Blur (Triangle)
   7: Brush
   's': Save the picture
*/ 

int wide=1366, high=768;

int input=1;

float rad1, rad2, rad3; 
float radius1, radius2, radius3; 
float str1, str2, tra, oth;

int image_num = 15; 
PImage[] sum = new PImage[image_num];
PImage[] background = new PImage[image_num];
float dx=wide*8/100, dy = high*8/60, squre=high*16/75;
String[] name={"Black", "Green Wall", "Pink Pastel", "Sunset", "Gloomy", "Check", "Crack", "Colorful Swirl", "Dark Mosaic", "Green Geometry", "Parchment", "Pastel Blue", "Firework", "Pink Strype", "Water"};
PFont osaka;

int gameState=-1;
boolean flag = false;

int colorType=0;
color c1;


void setup() {
  //fullScreen();
  size(1366, 768); 
  background(30);
  for (int i=0; i<15; i++) {
    sum[i] = loadImage("Sumnail/"+i+".jpg");
    background[i] = loadImage("1366_768/"+i+".jpg");
  }
  osaka=loadFont("Osaka-48.vlw");
  c1=randomColor(colorType);
}

void draw() {
  if (gameState==-1) {
    pushMatrix();
    translate(wide/2, high/2);
    imageMode(CENTER);
    int k=0;
    for (int i=0; i<3; i++) {
      for (int j=0; j<5; j++) {
        image(sum[k], -4*dx+j*2*dx, 2*dy*(i-1), squre, squre);
        k++;
      }
    }
    textAlign(CENTER);
    textFont(osaka, 16);
    k=0;
    for (int i=0; i<3; i++) {
      for (int j=0; j<5; j++) {
        text(name[k], -4*dx+j*2*dx, dy*(2*i-1));
        k++;
      }
    }
    popMatrix();
  }
  if (gameState>=0 && gameState<=14) {
    if (flag == false) {
      image(background[gameState], wide/2, high/2);
      flag=true;
    }

    if (mousePressed && input == 1) {
      random_stroke(colorType,100);
      draw_triangle(50);
    }
    if (mousePressed && input == 2) {
      random_stroke(colorType,50);
      draw_lines(100);
    }
    if(mousePressed && input==4){
      random_fill(colorType,100);
      draw_light();
    }
    if (mousePressed && input == 5) {
      draw_blur(60);
    }
    if (mousePressed && input == 6) {
      draw_blur_tri(60);
    }
    if (mousePressed && input == 7) {
      stroke(c1,45);
      draw_brush(25);
      fill(c1,45);
      draw_particles(25);
    }
    if (!mousePressed) {
      mp=false;
      c1=randomColor(colorType);
    }
  }
  if (key == 's') {
    saveFrame("NewImage.png");
  }
}

void keyPressed() { 
  switch(key) { 
  case '1': 
    input = 1; 
    break; 
  case '2': 
    input = 2; 
    break; 
  case '3': 
    input = 3; 
    break; 
  case '4': 
    input = 4; 
    break; 
  case '5': 
    input = 5; 
    break; 
  case '6': 
    input = 6; 
    break; 
  case '7': 
    input = 7; 
    break; 
  case '8': 
    input = 8; 
    break; 
  case '9': 
    input = 9; 
    break; 
  case '0': 
    input = 0; 
    break; 
  default: 
    break;
  }
}

void mousePressed() {
  if (gameState == -1) {
    //pushMatrix();
    //translate(wide/2, high/2);
    for (int i=0; i<3; i++) {
      for (int j=0; j<5; j++) {
        if (mouseX>=-4*dx-(squre/2)+j*2*dx+wide/2 && mouseX<=-4*dx+(squre/2)+j*2*dx+wide/2 && mouseY>=-2*dy-(squre/2)+i*2*dy+high/2 && mouseY<=-2*dy+(squre/2)+i*2*dy+high/2) {
          gameState=(5*i)+j;
        }
      }
    }
  }

  if (gameState>=0 && gameState <=14) {
    //int colorType=2;
    switch(input) {
    case 1:
      break;
    case 2:
      break;
    case 3:
      random_fill(colorType,50);
      draw_drop(50);
      break;
    case 4:
      break;
    case 5:
      break;
    case 6: 
      break; 
    case 7: 
      break; 
    case 8: 
      break; 
    case 9: 
      break; 
    case 0: 
      break; 
    default:
      break;
    }
  }
}
