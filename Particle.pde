class Particle {
  final static float RADIUS = 8;
  float x, y;
  float noiseX = (float)Math.random() * 1000;
  float noiseY = (float)Math.random() * 1000;
  
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    noiseX += 0.021;
    noiseY += 0.051;
    x += FLUID_VEL;
  }
  
  void render() {
    noStroke();
    fill(255);
    ellipse((x + noise(noiseX) * 10 - 5) % PIPE_WIDTH + wave.displacement(x), (y + noise(noiseY) * 10 - 5) % PIPE_HEIGHT, RADIUS, RADIUS);
  }
}