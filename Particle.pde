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
    x %= PIPE_WIDTH;
    if(x < 0) x += PIPE_WIDTH;
  }
  
  void render() {
    noStroke();
    fill(100);
    float displacement = 0.0;
    for(PressureWave wave : waves) {
      displacement += wave.displacement(x);
    }
    ellipse((x + noise(noiseX) * 10 - 5) + displacement, (y + noise(noiseY) * 10 - 5) % PIPE_HEIGHT, RADIUS, RADIUS);
  }
}