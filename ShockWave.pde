final int PIPE_WIDTH = 1200;
final int PIPE_HEIGHT = 300;
final int NUM_PARTICLES = 1000;

final float FLUID_VEL = 1.0;

ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<PressureWave> waves = new ArrayList<PressureWave>();

void setup() {
  size(1200, 300, FX2D);
  surface.setTitle("Shock wave formation demo - Created by Sourabh Bhat");

  for (int i = 0; i < NUM_PARTICLES; i++) {
    particles.add(new Particle(random(0, PIPE_WIDTH), random(0, PIPE_HEIGHT)));
  }
}

void draw() {
  background(255);
  for (PressureWave wave : waves) {
    wave.update(); 
    wave.render();
  }

  for (int i = 0; i < NUM_PARTICLES; i++) {
    Particle p = particles.get(i); 
    p.update(); 
    p.render();
  }
}

void mouseClicked() {
  waves.add(new PressureWave(mouseX));
}