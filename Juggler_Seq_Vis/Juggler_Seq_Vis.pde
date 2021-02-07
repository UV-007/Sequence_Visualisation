import processing.svg.*;
boolean record = false;

// Computing

float start = 2;
float current = 2;

// int biggest = 0;

// Drawing

boolean calculate = true;

//int mult = 2;
int lim = 1000;
float zoom;
int out = 1;

ArcCircle[] ArcArray;

void setup() {
  size(800, 800);
  ArcArray = new ArcCircle[lim];
  for (int i = 0; i < lim; i++) {
    ArcArray[i] = new ArcCircle(i);
  }
  zoom = 200;
}

void draw() {
  println(start);
  if (record) {
    beginRecord(SVG, "Juggler-####.svg");
  }
  background(0);
  translate(width / 2, height / 2);
  scale(zoom);
  if (out == 1) {
    zoom *= 0.99;
  } else if (out == 2) {
    zoom *= 1.01;
  }

  if (calculate) {
    step();
  }

  for (ArcCircle a : ArcArray) {
    a.show();
  }
  if (record) {
    endRecord();
    record = false;
  }
}

void step() {
  if (current % 2 == 0) {
    current = floor(sqrt(current));
  } else {
    //println(pow(current, 1.5));
    current = floor(pow(current, 1.5));
  }

  if (current < ArcArray.length) {
    ArcArray[int(current)].numbers.append(int(start));
  }

  if (current == 1) {
    start++;
    current = start;
  }

  if (start == 361) {
    calculate = false;
  }
}

void keyPressed() {
  if (key == '1') {
    out = 1;
  } else if (key == '2') {
    out = 2;
  } else if (key == ' ') {
    out = 0;
  } else if (key == 'r') {
    record = true;
  }
}
