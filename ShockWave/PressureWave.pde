class PressureWave {
  final float WAVE_WIDTH = 10;
  float x;
  PressureWave(float initX) {
    this.x = initX;
  }

  float waveSpeed(float x) {
    return sqrt(getProp(x).temperature) / 20;
  }
  
  void updateProperties() {
    int idx = (int) x;
    for(int i = 0; i < idx; i++) {
      props[i].temperature += 50;
      //props[i].velocity += 0.1;
    }
    for(int i = idx; i < props.length; i++) {
      
    }
  }

  void update() {
    float ws = waveSpeed(x);
    x += FLUID_VEL + ws;
    if (x >= PIPE_WIDTH) x = 0;
    if (x < 0) x = PIPE_WIDTH - 1;
  }

  float displacement(float atX) {
    float dx = abs(atX - this.x);
    if (dx < WAVE_WIDTH)
      return exp(-dx * dx / WAVE_WIDTH / WAVE_WIDTH) * Math.signum(waveSpeed(atX));
    else
      return 0;
  }

  void render() {
    stroke(255, 0, 0, 25);
    strokeWeight(5);
    line(x, 0, x, PIPE_HEIGHT);
  }
}