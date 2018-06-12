class Particle {
    //PURELY PHYSICS CONSTANTS
    float charge, mass;
    PVector location, momentum, force, gravity, magneticField, electricField;
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
        
    void draw(boolean draw_g, boolean draw_E, boolean draw_B) {
      PVector pos = this.location.mult(UNITS_PER_PIXEL);
      pushMatrix();
      translate(pos.x,height-pos.y,pos.z);
      noStroke();
      // for speed: use bit shifting need be
      fill(red(c),green(c),blue(c));
      sphere(this.radius);
      if (draw_g) {
        pushMatrix();
        stroke(COLOR_G);
        strokeWeight(2);
        drawArrow(gravity,COLOR_G);
        popMatrix();
      }
      if (draw_B) {
        pushMatrix();
        stroke(COLOR_B);
        strokeWeight(2);
        drawArrow(magneticField,COLOR_B);
        popMatrix();
      }
      if (draw_E) {
        pushMatrix();
        stroke(COLOR_E);
        strokeWeight(2);
        drawArrow(electricField,COLOR_E);
        popMatrix();
      }
      popMatrix();
    }
    
    void setForce(PVector f) {
      this.force = f;
    }
    void update(float dt) {
      // UPDATE LOCATION BASED OFF MOMENTUM
      location = location.add(momentum.mult(dt/mass));
      //UPDATE MOMENTUM BASED OFF FORCE
      if (force != null)
      momentum = momentum.add(force.mult((dt)));
      //UPDATE FORCES BASED OFF FIELDS
      PVector g = gravity.copy().mult(this.mass);
      // F = Eq * k
      PVector E = electricField.copy().mult(this.charge);
      // F = qvxB * k
      PVector B = this.momentum.copy().mult(this.charge / this.mass).cross(magneticField);
      PVector F = E.add(B).add(g);
      force = F;
    }
    PVector getElectricField(Particle other) {
      PVector r = this.location.copy().sub(other.location.copy());
      PVector E = r.copy().mult(other.charge * MODIFIER_E/ pow(r.mag(),3));
      return E;
    }
    PVector getMagneticField(Particle other) {
        PVector r = this.location.copy().sub(other.location.copy());
        // Ba = ((qv) x r)/mag3(r)
        PVector B = other.momentum.copy().mult(MODIFIER_B * other.charge / other.mass)
        .cross(r)
        .mult(1/pow(r.mag(),3));        
        return B;
    }
    PVector getGravitationalField(Particle other) {
        PVector r = this.location.copy().sub(other.location.copy());
        PVector g = r.copy().mult(-MODIFIER_G * other.mass / pow(r.mag(),3));
        return g;
    }
    
    void setElectricField(PVector e) {
      this.electricField = e;
    }
    void setMagneticField(PVector b) {
      this.magneticField = b;
    }
    void setGravitationalField(PVector g) {
      this.gravity = g;
    }
    
    
    
    
    
    
    // POSSIBLY DEPRECATED 
    PVector getForce(Particle other) {
      // F = mg * k
      PVector g = getGravitationalField(other).mult(this.mass * MODIFIER_G);
      // F = Eq * k
      PVector E = getElectricField(other).mult(this.charge * MODIFIER_E);
      // F = qvxB * k
      PVector B = this.momentum.copy().mult(MODIFIER_B * this.charge / this.mass).cross(getMagneticField(other));
      PVector F = E.add(B).add(g);
      return F;
    }
    //everything is in planck units and mofiiers are later used. this means that without then modifiers, for charge*charge = mass*mass, G and E are the same.
}