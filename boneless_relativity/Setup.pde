PApplet parent;
ControlP5 cp5;
boolean isSetup;

void setupControl() {
  //gravity
  cp5.addSlider("Gravity Modifier")
  .setRange(0,5000)
  .setPosition(20, 50)
  .setValue(150)
  .setHeight(40)
  .setWidth(200);
  //electric field
  cp5.addSlider("Electric Field Modifier")
  .setRange(0,5000)
  .setPosition(20, 100)
  .setValue(1000)
  .setHeight(40)
  .setWidth(200);
  cp5.addSlider("Magnetic Field Modifier")
  .setRange(0,5000)
  .setPosition(20, 150)
  .setValue(2000)
  .setHeight(40)
  .setWidth(200);

  //cp5.addTextfield("ayylmao").setPosition(20,400).setSize(200,40).setAutoClear(false);
  cp5.addBang("Submit").setPosition(100, 300).setSize(80,40);
}

void Submit() {
  MODIFIER_G = cp5.getController("Gravity Modifier").getValue();
  MODIFIER_E = cp5.getController("Electric Field Modifier").getValue();
  MODIFIER_B = cp5.getController("Magnetic Field Modifier").getValue();
  isSetup = true;
  cp5.hide();
  
}
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    if (theEvent.getController().getName() == "Submit") {
      Submit();
    }
  }
}