PApplet parent;
ControlP5 cp5;
boolean isSetup;
int currentParticle = 1;
PFont font;

void setupControl() {
  //gravity
  cp5.addSlider("Gravity Modifier")
  .setRange(0,5000)
  .setPosition(20, 50)
  .setValue(150)
  .setHeight(40)
  .setWidth(200)
  .setFont(font);
  //electric field
  cp5.addSlider("Electric Field Modifier")
  .setRange(0,5000)
  .setPosition(20, 100)
  .setValue(1000)
  .setHeight(40)
  .setWidth(200)
  .setFont(font);
  cp5.addSlider("Magnetic Field Modifier")
  .setRange(0,5000)
  .setPosition(20, 150)
  .setValue(2000)
  .setHeight(40)
  .setWidth(200)
  .setFont(font);
  
  //PARTICLE
  cp5.addTextfield("Mass").setPosition(350,50)
  .setValue("1.0")
  .setSize(50,40)
  .setAutoClear(false)
  .setFont(font);
  cp5.addTextfield("Charge").setPosition(450,50)
  .setValue("1.0")
  .setSize(50,40)
  .setAutoClear(false)
  .setFont(font);
  cp5.addTextfield("x").setPosition(350,150)
  .setValue("0.0")
  .setSize(50,40)
  .setAutoClear(false)
  .setFont(font);
   cp5.addTextfield("y").setPosition(405,150)
  .setValue("0.0")
  .setSize(50,40)
  .setAutoClear(false)
  .setFont(font);
   cp5.addTextfield("z").setPosition(460,150)
  .setValue("0.0")
  .setSize(50,40)
  .setAutoClear(false)
  .setFont(font);
  cp5.addTextfield("px").setPosition(350,250)
  .setValue("0.0")
  .setSize(50,40)
  .setAutoClear(false)
  .setFont(font);
   cp5.addTextfield("py").setPosition(405,250)
  .setValue("0.0")
  .setSize(50,40)
  .setAutoClear(false)
  .setFont(font);
   cp5.addTextfield("pz").setPosition(460,250)
  .setValue("0.0")
  .setSize(50,40)
  .setAutoClear(false)
  .setFont(font);


  //cp5.addTextfield("Particle").setPosition(400,400).setSize(200,40).setAutoClear(false);
  cp5.addBang("Add Particle").setPosition(350,350).setSize(80,40);
  cp5.addBang("Submit").setPosition(100, 300).setSize(80,40);
}

void Submit() {
  MODIFIER_G = cp5.getController("Gravity Modifier").getValue();
  MODIFIER_E = cp5.getController("Electric Field Modifier").getValue();
  MODIFIER_B = cp5.getController("Magnetic Field Modifier").getValue();
  isSetup = true;
  cp5.hide();
  
}
void AddParticle() {
  println(currentParticle);
  float mass = parseFloat(cp5.get(Textfield.class, "Mass").getText());
  if (Float.isNaN(mass)) return;
  float charge = parseFloat(cp5.get(Textfield.class, "Charge").getText());
  if (Float.isNaN(charge)) return; 
  float x = parseFloat(cp5.get(Textfield.class, "x").getText());
  if (Float.isNaN(x)) return; 
  float y = parseFloat(cp5.get(Textfield.class, "y").getText());
  if (Float.isNaN(y)) return; 
  float z = parseFloat(cp5.get(Textfield.class, "z").getText());
  if (Float.isNaN(z)) return; 
  float px = parseFloat(cp5.get(Textfield.class, "px").getText());
  if (Float.isNaN(px)) return; 
  float py = parseFloat(cp5.get(Textfield.class, "py").getText());
  if (Float.isNaN(py)) return; 
  float pz = parseFloat(cp5.get(Textfield.class, "pz").getText());
  if (Float.isNaN(pz)) return; 
  particles.add(new Particle(mass, charge, new PVector(x, height-y, z), new PVector(px, py, pz), true));
  
  //INCREASE PARTICLE NUMBER
  currentParticle += 1;
}
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    if (theEvent.getController().getName().equals("Submit")) {
      Submit();
    }
    if (theEvent.getController().getName().equals("Add Particle")) {
      AddParticle();
    }
  }
}