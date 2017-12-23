final int PIPE_WIDTH = 1200;
final int PIPE_HEIGHT = 300;
final int NUM_PARTICLES = 1000;

final float FLUID_VEL = 0.0;
final FluidProperty[] props = new FluidProperty[PIPE_WIDTH];
float minTempr = 0.0;
float maxTempr = 0.0;
float maxDisplacement = 0.0;

ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<PressureWave> waves = new ArrayList<PressureWave>();

boolean paused = false;

void setup() {
  size(1200, 300);
  surface.setTitle("Shock wave formation demo - Created by Sourabh Bhat");
  surface.setResizable(false);

  for (int i = 0; i < props.length; i++) {
    props[i] = new FluidProperty();
  }

  for (int i = 0; i < NUM_PARTICLES; i++) {
    particles.add(new Particle(random(0, PIPE_WIDTH), random(0, PIPE_HEIGHT)));
  }
}

void draw() {
  if (!paused) {
    background(255);

    resetProps();
    for (PressureWave wave : waves) {
      wave.updateProperties();
    }
    updateMinMax();

    for (PressureWave wave : waves) {
      wave.update();
      wave.render();
    }

    for (int i = 0; i < NUM_PARTICLES; i++) {
      Particle p = particles.get(i); 
      p.update();
    }

    updateMaxDisplacement();
    for (int i = 0; i < NUM_PARTICLES; i++) {
      Particle p = particles.get(i); 
      p.render();
    }
  }
  
  //saveFrame("frames/####.png");
}

void resetProps() {
  for (int i = 0; i < props.length; i++) {
    props[i].temperature = 300;
    props[i].velocity = FLUID_VEL;
  }
}

void mousePressed() {
  waves.add(new PressureWave(mouseX));
}

void keyPressed() {
  if (key == ' ') {
    paused = !paused;
  }
}

void updateMinMax() {
  minTempr = props[0].temperature;
  maxTempr = props[0].temperature;
  for (int i = 0; i < props.length; i++) {
    float tempr = props[i].temperature;
    minTempr = minTempr > tempr ? tempr : minTempr;
    maxTempr = maxTempr < tempr ? tempr : maxTempr;
  }
}

void updateMaxDisplacement() {
  maxDisplacement = 1;
  for (int i = 0; i < NUM_PARTICLES; i++) {
    Particle p = particles.get(i); 
    maxDisplacement = p.displacement > maxDisplacement ? p.displacement : maxDisplacement;
  }
}