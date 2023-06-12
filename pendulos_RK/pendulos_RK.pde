// Example 13-6: Oscillation


static float theta01 = PI/2;
static float theta02 = PI/2;
static float dt = 0.001;

float theta1 = theta01;
float dtheta1_dt = 0;
float d2theta1_dt2 = 0;

float theta2 = theta02;
float dtheta2_dt = 0;
float d2theta2_dt2 = 0;

float w = 1.0;
float t = 0;
float l = 750;


long t0 = System.currentTimeMillis();



void setup() {
  size(1800, 1000);
}

void draw() {
  background(0);
  
//Integral con metodo de Euler, hacemos de 15 pasos y actualizamos

for(int i = 0; i < 15; i++){
//pendulo con sen( theta )
d2theta1_dt2 = - w * sin(theta1);
dtheta1_dt = dtheta1_dt +  d2theta1_dt2 * dt;
theta1 = theta1  + dtheta1_dt * dt;

//pendulo con theta
d2theta2_dt2 = - w * (theta2);
dtheta2_dt = dtheta2_dt +  d2theta2_dt2 * dt;
theta2 = theta2  + dtheta2_dt * dt;
}
//fin Euler int


//posiciones : cambiamos de polares a cartesianas.
  float x1 = l * sin(theta1);
  float y1 = l * (cos(theta1));

  float x2 = l * sin(theta2);
  float y2 = l * (cos(theta2));
  
  
  
//dibujo sin theta 
  fill(0,150,150);
  stroke(0,150,150);
  strokeWeight(6);
  line(width/2, 0, width/2 + x1, y1);
  circle(width/2+x1,y1, 25);
 //pendulo theta
  fill(255,50,0);
  stroke(255,50,0);
  strokeWeight(6);
  line(width/2, 0, width/2 + x2, y2);
  circle(width/2+x2,y2, 25);
 
  t = t + dt;
  
}
