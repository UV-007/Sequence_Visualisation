class ArcCircle {
  
  int value;
  IntList numbers;
  //int radius;
  //int angle;
  
  ArcCircle(int val) {
    value = val;
    numbers = new IntList();
  }
  
  void addNew(int number) {
    numbers.append(number);
  }
  
  void show() {
    colorMode(HSB);
    noFill();
    strokeWeight(1);
    if (numbers.size() != 0) {
      float angle = -PI / 2;
      float angle_step = 2 * PI / numbers.size();
      for (int number : numbers) {
        stroke(number, 255, 255);
        arc(0, 0, value, value, angle, angle + angle_step);
        angle += angle_step;
      }
    }
  }
}
