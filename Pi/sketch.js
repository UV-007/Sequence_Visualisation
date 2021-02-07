const pi = "31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679";

const e = "2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274"

const nodeSize = 10;
const radius = 2850;
const dist = 100;
const rand = 100;

let nodeArray = []

function setup() {
  createCanvas(6000, 6000);

  for (let i = 0; i < 10; i++) {
    let angle = radians(i * 36);
    colorMode(HSB);
    let col = color(36 * i, 255, 255);
    let node = new Node(i, createVector((width / 2) + (radius * sin(angle)), (height / 2) - (radius * cos(angle))), col);
    nodeArray.push(node);
  }

}

function draw() {

  background(0);

  for (let i = 1; i < pi.length; i++) {
    let current = pi[i];
    let previous = pi[i - 1];
    let node_current = nodeArray[current];
    let node_previous = nodeArray[previous];

    let x_average = (node_current.position.x + node_previous.position.x) / 2 + random(-rand, rand);
    let y_average = (node_current.position.y + node_previous.position.y) / 2 + random(-rand, rand);

    noFill();
    strokeWeight(10);
    stroke(node_previous.color);
    bezier(node_previous.position.x, node_previous.position.y, x_average, x_average, y_average, y_average, node_current.position.x, node_current.position.y);
  }

  for (let node of nodeArray) {
    node.show();
  }

  saveCanvas('pi', 'png')
  noLoop();
}