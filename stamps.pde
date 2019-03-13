void draw_ast(float _x, float _y, float _r, int p) {
  int vertex_num = p-1;//+1
  strokeWeight(2);
  strokeJoin(ROUND);
  pushMatrix();
  translate(_x, _y);
  beginShape();
  noStroke();
  for (int theta = 0; theta < 360; theta++) {
    float x = _r * (vertex_num * cos(radians(theta)) + cos(radians(-vertex_num * theta)));
    float y = _r * (vertex_num * sin(radians(theta)) + sin(radians(-vertex_num * theta)));
    vertex(x, y);
  }
  endShape();
  popMatrix();
}

void draw_drop(int w) {
  for (int i=0; i<10; i++) { 
    rad1=random(0, 2*PI); 
    //rad2=random(0, 2*PI); 
    radius1=random(15, w);
    //radius2=random(15, R_out);
    str1=random(8, 20);
    str2=random(1, 3);
    tra=random(180, 255);
    oth=random(4, 10);
    alpha(int(tra));//pink
    if (random(0, 100)>40) {
      ellipse(mouseX+radius1*cos(rad1), mouseY+radius1*sin(rad1), str1, str1);
    } else {
      draw_ast(mouseX+radius1*cos(rad1), mouseY+radius1*sin(rad1), str2, int(oth));
    }
  }
}

void draw_lines(int w) {
  int i=0;
  pushMatrix();
  translate(mouseX, mouseY);
  oth = random(0, 360);
  rotate(radians(-90+oth));
  strokeWeight(0.5);
  while (-w/2+2*i<+w/2) {
    line(-w/2, -w/2+2*i, +w/2, -w/2+2*i);
    i++;
  }
  popMatrix();
}

void draw_triangle(int w) {
  noFill();
  strokeWeight(0.2);
  for (int i=0; i<20; i++) { 
    rad1=random(0, 2*PI); 
    rad2=random(0, 2*PI); 
    rad3=random(0, 2*PI); 
    radius1=random(10, w);
    radius2=random(10, w);
    radius3=random(10, w);
    triangle(mouseX+radius1*cos(rad1), mouseY+radius1*sin(rad1), 
      mouseX+radius2*cos(rad2), mouseY+radius2*sin(rad2), mouseX+radius3*cos(rad3), mouseY+radius3*sin(rad3));
  }
}

void draw_rect_64(float w1, int pos, float w2) {
  pushMatrix();
  noStroke();
  if ((pos>=0) && (pos<=63)) {
    rectMode(CENTER);
    rect(-(7)*(w1/16)+(w1/8)*(pos%8), -(7)*(w1/16)+(w1/8)*(pos/8), w2, w2);
    println(pos);
  }
  popMatrix();
}

void draw_rects(int w) {
  pushMatrix();
  translate(mouseX, mouseY);
  float p=random(0, 2*PI);
  rotate(p);
  float d=0.5;
  int j=0;
  for (; j<8; j++) {
    for (int i=8*j; i<8*j+8; i++) {
      alpha(240-30*j);
      draw_rect_64(w, i, w/(8.5+d*j));
    }
  }
  popMatrix();
}

int light_position_x;
int light_position_y;
float light_power;
void draw_light() {
  color c=get(mouseX,mouseY);
  light_power=1-(brightness(c)/255);
  float red_power = random(0, 255);
  float green_power = random(0, 255);
  float blue_power = random(0, 255);
  loadPixels();
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      int pixelIndex=x+y*width;

      int r = pixels[pixelIndex] >> 16 & 0xFF;
      int g = pixels[pixelIndex] >> 8 & 0xFF;
      int b = pixels[pixelIndex] & 0xFF;

      float dx = mouseX - x;
      float dy = mouseY - y;
      float distance = sqrt(dx * dx + dy * dy);

      if (distance < 1) {
        distance = 1;
      }

      r += (red_power * light_power) / (0.5*distance);
      g += (green_power * light_power) / (0.5*distance);
      b += (blue_power * light_power) / (0.5*distance);//modified

      pixels[pixelIndex] = color(r, g, b);
    }
  }
  updatePixels();
}

int vertex_num;
float R; 
float r;
float x; 
float y; //star2
void draw_star(int w) {
  pushMatrix();
  translate(mouseX, mouseY);
  oth = random(0, 360);
  rotate(radians(-90+oth));
  beginShape();
  noStroke();
  while (true) {
    vertex_num = int(random(4, 12));
    if (vertex_num%2==0) {
      break;
    }
  }
  r = random(0.3*w, 0.9*w);
  for (int i = 0; i < vertex_num; i++) {
    if (i%2 == 0) {
      R = w;
    } else {
      R = r;
    }
    x = R * cos(radians(360*i/vertex_num));
    y = R * sin(radians(360*i/vertex_num));
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}

void draw_blur(int w) {
  color c = get(mouseX, mouseY);
  noStroke();
  for (int i=0; i<10; i++) {
    fill(c, 20*(i+1)/10);
    //alpha(255-255*i/10);
    ellipse(mouseX, mouseY, w-w*i/10, w-w*i/10);
  }
}

void draw_blur_tri(int w) {
  color c = get(mouseX, mouseY);
  noStroke();
  rad1=random(0, 2*PI); 
  rad2=random(0, 2*PI); 
  rad3=random(0, 2*PI); 
  radius1=random(0, w);
  radius2=random(0, w);
  radius3=random(0, w);
  fill(c);
  triangle(mouseX+radius1*cos(rad1), mouseY+radius1*sin(rad1), 
    mouseX+radius2*cos(rad2), mouseY+radius2*sin(rad2), mouseX+radius3*cos(rad3), mouseY+radius3*sin(rad3));
}



int num3 = 50; 
float[] rad = new float[num3]; 
float[] radius= new float[num3]; 
float[] strw = new float[num3]; 
float[] trs = new float[num3]; 
boolean mp=false;
void draw_brush(int w) { 
  //strokeWeight(1);
  if ((mousePressed)&&(mp==false)) { 
    for (int i=0; i<num3; i++) { 
      rad[i]=random(0, 2*PI); 
      radius[i]=random(0, w); 
      strw[i]=random(0.5, 2); 
      trs[i]=random(40, 255);
    } 
    mp = true;
  } 
  for (int i=0; i<num3; i++) { 
    strokeWeight(strw[i]); 
    //stroke(p3.r, p3.g, p3.b, trs[i]);
    alpha(int(trs[i]));
    line(pmouseX+radius[i]*cos(rad[i]), pmouseY+radius[i]*sin(rad[i]), 
      mouseX+radius[i]*cos(rad[i]), mouseY+radius[i]*sin(rad[i]));
  } 
}

float rad_p, radius_p; 
void draw_particles(int w) {
  for (int i=0; i<50; i++) { 
    rad_p =random(0, 2*PI); 
    radius_p = random(0, w*0.9); 
    ellipse(mouseX+radius_p*cos(rad_p), mouseY+radius_p*sin(rad_p), 1, 1);
  }
}