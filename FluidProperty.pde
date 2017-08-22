FluidProperty getProp(float x) {
  int idx = (int)x;
  return props[idx];
}

class FluidProperty {
  float temperature, velocity;
}