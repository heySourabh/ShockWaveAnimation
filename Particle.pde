class Particle {
  final static float RADIUS = 8;
  final float seed = (float)Math.random();
  float x, y;
  
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    
  }
  
  void render() {
    fill(255);
    ellipse(x, y, RADIUS, RADIUS);
  }
}