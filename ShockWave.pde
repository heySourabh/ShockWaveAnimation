final int PIPE_WIDTH = 1500;
final int PIPE_HEIGHT = 500;

Particle p = new Particle(200, 250);

void setup() {
  size(1500, 500);
}

void draw() {
  background(0);
  p.render();
}