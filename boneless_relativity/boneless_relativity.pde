ArrayList<Particle> particles;
float dt = 1;
float rotX = 0;
float rotY = 0;
float rotZ = 0;
void setup() {
  size(500,500,P3D);
  particles = new ArrayList<Particle>();
  particles.add(new Particle(1, 0.1, new PVector(width/2 , height, 0), new PVector(0.5, 0, 0), true));
  particles.add(new Particle(0.5, 0.1, new PVector(width/2, 0, 0), new PVector(0, 0, 0), true));

}
void draw() {
  pushMatrix();
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  lights();
  pushMatrix();
  background(0);
  for (Particle particle :particles) {
      particle.draw();
      PVector F = new PVector(0,0,0);
      for (Particle other : particles) {
        if (particle != other) {
          //F = F.add(particle.getForce(other));
          print(F.y);
        }
      }
      particle.setForce(F);
      particle.update(dt);
  }
  popMatrix();
  popMatrix();
}