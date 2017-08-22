final int PIPE_WIDTH = 1200;
final int PIPE_HEIGHT = 300;
final int NUM_PARTICLES = 1000;

final float FLUID_VEL = 0.0;

ArrayList<Particle> particles = new ArrayList<Particle>();
PressureWave wave = new PressureWave(100.0);

void setup() {
  size(1200, 300, FX2D);
  surface.setTitle("Shock wave formation demo - Created by Sourabh Bhat");
  
  for(int i = 0; i < NUM_PARTICLES; i++) {
    particles.add(new Particle(random(0, PIPE_WIDTH), random(0, PIPE_HEIGHT)));
  }
}

void draw() {
  background(0);
  
  wave.update();
  wave.render();
  
  for(int i = 0; i < NUM_PARTICLES; i++) {
    Particle p = particles.get(i);
    p.update();
    p.render();
  }
}