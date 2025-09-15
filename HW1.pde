float[] x = {80, 180, 320, 420, 520}; //horizontal coords
float[] y = {90, 140, 220, 120, 260}; //vertical coords
boolean snap = false;
int grid = 40;
int seed = 1;
color[] pal = {#F2EBDC, #111111, #E04A3A, #3A6BB3, #E8D33F}; // light tan, black, red, blue, yellow

void setup() {
  size(600, 400);
  noLoop();
  rando();
}

void draw() {
  background(pal[0]);
  stroke(pal[1]);
  fill(pal[2]);

  // draw points and lines
  for (int i = 0; i < 5; i++) {
    float sx = x[i];
    float sy = y[i];
    if (snap) {
      sx = round(x[i] / grid) * grid;
      sy = round(y[i] / grid) * grid;
    }

    stroke(pal[2]);
    point(sx, sy);

    if (i < 4) {
      float tx = x[i + 1];
      float ty = y[i + 1];
      if (snap) {
        tx = round(x[i + 1] / grid) * grid;
        ty = round(y[i + 1] / grid) * grid;
      }
      stroke(pal[3]);
      line(sx, sy, tx, ty);
    }
  }

  // one primitive shape (ellipse)
  float ex = x[4];
  float ey = y[4];
  if (snap) {
    ex = round(x[4] / grid) * grid;
    ey = round(y[4] / grid) * grid;
  }
  stroke(pal[4]);
  ellipse(ex, ey, 28, 28);
}

void rando() {
  randomSeed(seed);
  for (int i = 0; i < 5; i++) {
    x[i] = random(30, width - 30);
    y[i] = random(30, height - 30);
  }
  redraw();
}

// Interaction Stuff

//mouse stuff
void mousePressed() {
  seed = int(random(1 << 30));
  rando();
}
//keyboard stuff
void keyPressed() {
  if (key == 'g' || key == 'G') {
    snap = !snap; 
    redraw();
  }
}
