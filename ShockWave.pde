final int PIPE_WIDTH = 1500;
final int PIPE_HEIGHT = 500;
final int NUM_PARTICLES = 2000;

ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(1500, 500);
  
  for(int i = 0; i < NUM_PARTICLES; i++) {
    particles.add(new Particle(random(0,PIPE_WIDTH), random(0, PIPE_HEIGHT)));
  }
}

void draw() {
  background(0);
  
  for(int i = 0; i < NUM_PARTICLES; i++) {
    Particle p = particles.get(i);
    p.update(1);
    p.render();
  }
}