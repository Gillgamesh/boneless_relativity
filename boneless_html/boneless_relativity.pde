ArrayList<Particle> particles;
float dt = 1;
float rotX = 0;
float rotY = 0;
float rotZ = 0;

boolean draw_g, draw_E, draw_B;

// PROJECT UNITS: KMS
//SCALE: 1 pixel = 1 meter
void setup() {
  size(500,500,P3D);
  particles = new ArrayList<Particle>();
  // ASSUME 0,0 is the bottom left, which processing doesnt do. 
  particles.add(new Particle(1, 1, new PVector(0 , height-100, 0), new PVector(1.0, 0, 0), true));
  particles.add(new Particle(1, 1, new PVector(0, 100, 0), new PVector(1.0, 0, 0), true));
  //particles.add(new Particle(1, 1, new PVector(0, height/2 - 50, 0), new PVector(1.0, 0, 0), true));
}
void draw() {
  //HARDCODED FOR NOW, GET FROM JS WHEN CONVERTED
  draw_g = true;
  draw_E = true;
  draw_B = true;
  //
  pushMatrix();
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  lights();
  pushMatrix();
  background(0);
  //in place force calculations
  for (Particle particle :particles) {
      particle.draw(draw_g, draw_E, draw_B);
      PVector E = new PVector(0,0,0);
      PVector g = new PVector(0,0,0);
      PVector B = new PVector(0,0,0);
      for (Particle other : particles) {
        if (particle != other) {
          E = E.add(particle.getElectricField(other));
          g = g.add(particle.getGravitationalField(other));
          B = B.add(particle.getMagneticField(other));
        }
      }
      particle.setElectricField(E);
      particle.setGravitationalField(g);
      particle.setMagneticField(B);
  }
  for (Particle particle : particles) {
      particle.update(dt);
  }
  popMatrix();
  popMatrix();
}


//draws an arrow given a starting PVector and an ending PVector
//since pushing a translation matrix makes things centered at 0,0,0 we can assume the starting point is 0. 
void drawArrow(PVector vec, color stroke) {
  if (vec != null) {
    //basically,we wish to do a transformation such that [1,0,0] maps to [x,y,z] if we want to make an arrow.
    // thats too much work, so our solution is just have the line point in the direction of the field
    float x = vec.x * VECTOR_MODIFIER, y = vec.y * VECTOR_MODIFIER, z = vec.z * VECTOR_MODIFIER;
    //REMEMBER THAT PROCESSING IS TOP-LEFT AND WE WANT BOTTOM_RIGHT
    line(0,0,0,x,-y,z);
    // R*A = B, find R 
    pushMatrix();
    translate(x,-y,z);
    textSize(32);
    textAlign(CENTER);
    fill(stroke);
    text(String.format("%.2e", vec.mag()),0,0);
    popMatrix();
    
  }
}