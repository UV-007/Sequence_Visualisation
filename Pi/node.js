class Node {
  
  constructor(index, position, color) {
    
    this.index = index;
    this.position = position;
    this.color = color;
  }
  
  show() {
    
    colorMode(HSB, 100);
    noStroke();
    fill(this.color);
    ellipse(this.position.x, this.position.y, nodeSize);
  }
}