class Particle {
  final static float RADIUS = 8;
  float x, y;
  float noiseX = (float)Math.random() * 1000;
  float noiseY = (float)Math.random() * 1000;
  float displacement;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    noiseX += 0.021;
    noiseY += 0.051;
    x += getProp(x).velocity;
    if (x >= PIPE_WIDTH) x = 0;
    if (x < 0) x = PIPE_WIDTH - 1;

    displacement = 0.0;
    for (PressureWave wave : waves) {
      displacement += wave.displacement(x);
    }
  }

  void render() {
    noStroke();
    fill(map(getProp(x).temperature, minTempr-1, maxTempr+1, 200, 150), 20, 20);    
    ellipse((x + noise(noiseX) * 10 - 5) + displacement / maxDisplacement * 10, (y + noise(noiseY) * 10 - 5) % PIPE_HEIGHT, RADIUS, RADIUS);
  }
}