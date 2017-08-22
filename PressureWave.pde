class PressureWave {
  final float WAVE_WIDTH = 10;
  float x;
  PressureWave(float initX) {
    this.x = initX;
  }
  
  float waveSpeed(float x) {
    return 2.0;
  }
  
  void update() {
    x += FLUID_VEL + waveSpeed(x);
    x %= PIPE_WIDTH;
  }
  
  float displacement(float atX) {
    float dx = abs(atX - this.x + WAVE_WIDTH);
    if(dx < WAVE_WIDTH) return 10 * exp(-dx * dx / WAVE_WIDTH / WAVE_WIDTH);
    else return 0;
  }
  
  void render() {
    stroke(255, 0, 0, 100);
    strokeWeight(5);
    line(x, 0, x, PIPE_HEIGHT);
  }
}