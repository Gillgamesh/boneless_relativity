# boneless_relativity

A basic particle physics simulator that does electromagnetic and gravitational forces. The simulation is done in Planck units (G=Ke=Kb=c=1) with each pixel equivalent to a planck length. Still demonstrates inverse square law. For sake of demonstration, editable modifiers have been added to magnetic, electric, and gravitational forces, with the default values being the ones found to be most interesting.
ie without the modifiers, with m=v=q=1 for both particles, gravitational and electric force are equal in magnitude, and assuming the particles to be parellel as is the magnetic force (this will likely not be the case after a while though).
## Requirements

1. Processing 3 (tested on build #0263)
2. controlp5 2.2 or later (can be installed easily from Library manager)
## HOW TO USE

1. Install the "controlp5" library through Processing's built in Library manager ("Sketch-->"Import Library"-->"Add Library")
2. Open the "boneless_relativity" folder in Processing
3. Run the app, and set the constants.
4. Add particles before pressing submit. Good recomended starting ones are the ones commented out in the main pde file (mass=charge=1, momentum = [1,0,0], x=0,z=0 for both, then x = 100 and x = 400)


Can host multiple particles, simply add to the ArrayList in "boneless_relativity.pde" or use the (as of writing this documentation) still to be implemented particle adder tool [future]
