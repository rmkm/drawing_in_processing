void draw_tech(int w) {
  stroke(255);
  strokeWeight(0.2); 
  for (int i=0; i<100; i++) { 
    rad1=random(0, 2*PI); 
    rad2=random(0, 2*PI); 
    radius1=random(15, w);
    radius2=random(15, w);
    line(mouseX+radius1*cos(rad1), mouseY+radius1*sin(rad1), 
      mouseX+radius2*cos(rad2), mouseY+radius2*sin(rad2));
  }
  for (int i=0; i<50; i++) { 
    rad3=random(0, 2*PI); 
    radius3=random(15, w);
    str1=random(0.5, 5);
    tra=random(60, 180);
    fill(255, tra);
    ellipse(mouseX+radius3*cos(rad3), mouseY+radius3*sin(rad3), str1, str1);
  }
}

color pink = color(230, 3, 197);

void random_fill(int rgb,int tra) {//0red,1green,2blue,3all
  colorMode(HSB, 360, 100, 100,100);
  float sat = random(80, 100);
  float bri = 100;
  switch(rgb) {
  case 0:
    if (int(random(0, 100))%2==0) {
      fill(random(0, 60), sat, bri, tra);
    } else {
      fill(random(300, 359), sat, bri, tra);
    }
    break;
  case 1:
    fill(random(60, 180), sat, bri, tra);
    break;
  case 2:
    fill(random(180, 300), sat, bri, tra);
    break;
  default:
    fill(random(0, 359), sat, bri, tra);
    break;
  }
  colorMode(RGB, 255, 255, 255);
}

void random_stroke(int rgb, int tra) {//0red,1green,2blue,3all
  colorMode(HSB, 360, 100, 100);
  float sat = random(80, 100);
  float bri = 100;
  switch(rgb) {
  case 0:
    if (int(random(0, 100))%2==0) {
      stroke(random(0, 60), sat, bri, tra);
    } else {
      stroke(random(300, 359), sat, bri, tra);
    }
    break;
  case 1:
    stroke(random(60, 180), sat, bri, tra);
    break;
  case 2:
    stroke(random(180, 300), sat, bri, tra);
    break;
  default:
    stroke(random(0, 359), sat, bri, tra);
    break;
  }
  colorMode(RGB, 255, 255, 255);
}

color randomColor(int rgb) {
  colorMode(HSB, 360, 100, 100);
  float sat = random(80, 100);
  float bri = 100;
  float tra = random(150, 250);
  switch(rgb) {
  case 0:
    if (int(random(0, 100))%2==0) {
      return color(random(0, 60), sat, bri, tra);
    } else {
      return color(random(300, 359), sat, bri, tra);
    }
  case 1:
    return color(random(60, 180), sat, bri, tra);
  case 2:
    return color(random(180, 300), sat, bri, tra);
  default:
    return color(random(0, 359), sat, bri, tra);
  }
}
