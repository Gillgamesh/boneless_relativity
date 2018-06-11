/*


LOCATION OF CONSTANTS IN PLANCK UNITS

*/
//ALL OF THESE ARE DEFINED AS ONE IN PLANCK UNITS

final float CONSTANT_C = 2.99792458 * pow(10,8);
final float CONSTANT_G = 6.6740831 * pow(10,-11);
final float CONSTANT_H = 6.6740831 * pow(10,-11);
final float CONSTANT_Ke = 8.987551787368176 * pow(10,9);
final float CONSTANT_Kb =  1.3806485279 * pow(10,-23);
final float CONSTANT_a = 0.007297352566417;
final float CONSTANT_e =  1.602176620898 * pow(10,-19);
final float CONSTANT_eps = 8.854187817 * pow(10,-12);

final float PLANCK_LENGTH = sqrt(((CONSTANT_H * CONSTANT_G / pow(CONSTANT_C,3))));
final float PLANCK_MASS = sqrt(CONSTANT_H * CONSTANT_C / CONSTANT_G);
final float PLANCK_TIME = sqrt(sqrt(CONSTANT_H * CONSTANT_G / pow(CONSTANT_C,5)));
final float PLANCK_CHARGE = CONSTANT_e / sqrt(CONSTANT_a);


//modifier constants

float MODIFIER_G = 0.0;
float MODIFIER_E = 0.0;
float MODIFIER_B = 0.0;

//visualization constants

//planck length units per pixel
//this makes it about a meter per pixel
float UNITS_PER_PIXEL = pow(10,-44);