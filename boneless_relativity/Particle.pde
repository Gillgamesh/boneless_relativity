class Particle {
    //PURELY PHYSICS CONSTANTS
    float MASS_RAD_CONVERSION = 50;
    float charge, mass;
    PVector location, momentum, force;
    //PURELY VISUAL CONSTANTS
    float radius = mass * MASS_RAD_CONVERSION;
    color c;
    
    public Particle(float mass, float charge, PVector location, PVector momentum, boolean plankUnits) {
      if (!plankUnits) {
        charge = charge / PLANCK_CHARGE;
        mass = mass / PLANCK_MASS;
        location = location.mult(1 / PLANCK_LENGTH);
        momentum = momentum.mult((1 / PLANCK_MASS) * (1 / CONSTANT_C));
      }
      location = location.mult(1/ UNITS_PER_PIXEL);
      this.charge = charge;
      this.mass = mass;
      this.location = location;
      this.momentum = momentum;
      this.c = color(128+random(128),128+random(128),128+random(128));
      this.radius = this.mass * MASS_RAD_CONVERSION;
    }
        
    void draw() {
      PVector pos = this.location.mult(UNITS_PER_PIXEL);
      pushMatrix();
      translate(pos.x,pos.y,pos.z);
      noStroke();
      // for speed: use bit shifting need be
      fill(red(c),green(c),blue(c));
      sphere(this.radius);
      popMatrix();
    }
    
    void setForce(PVector f) {
      force = f;
    }
    void update(float dt) {
      if (force != null)
      momentum = momentum.add(force.mult((dt)));
      location = location.add(momentum.mult(dt/mass));
    }
    
    PVector getForce(Particle other) {
      // ELECTRIC FIELD
      PVector r = this.location.sub(other.location);
      PVector E = r.mult(MODIFIER_E * this.charge * other.charge / r.mag());
      print(E);
      PVector B = this.momentum.mult(MODIFIER_B * this.charge * other.charge / this.mass).cross(other.momentum.mult(1/other.mass).cross(r.mult(1/r.mag())));
      PVector g = r.mult(MODIFIER_G * this.mass * other.mass / r.mag());
      PVector F = E.add(B).add(g);
      return F;
    }
    
    //EVERYTHING IS IN GAUSS UNITS
}