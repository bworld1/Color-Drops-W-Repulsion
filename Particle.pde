float locX, locY, objMass, pntMass;
int lifeSpan = 255;

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Particle(PVector l) {
    acceleration = new PVector(random(0.06, 2.4), random(0.06, 6.0));
    velocity = new PVector(random(-10,10), random(-8,8));
    location = l;
    objMass = 500;
    pntMass = 100;
  }
  
  void run() {
     update();
     bounce();
     display();
  }
  
  void update() {
    if (mousePressed) {
      PVector mouse = new PVector(mouseX, mouseY);
      PVector diff = PVector.sub(mouse, location);
      float d = diff.magSq();
      float strength = -1.8 * (.8 * pntMass * objMass) / d;
      diff.mult(strength);
      applyForce(diff);
    }
    velocity.add(acceleration);
    location.add(velocity); 
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,objMass);
    acceleration.add(f);
  }
  
  void bounce() {
    locX = location.x;
    locY = location.y;
    if ((location.x > width - 18) || (location.x < 18)) {
      velocity.x = velocity.x * -.8;
      lifeSpan -= 20;
    }
    if (( location.y > height - 18) || (location.y < 0)) {
      velocity.y = velocity.y * -.8;
      lifeSpan -= 20;
    }
  }
  
  void display() {
//    println(c.red + "  " + c.green + "  " + c.blue);
    stroke(0, 255);
    strokeWeight(2);

    fill(nRed, nGreen, nBlue, 255);
    ellipse(location.x, location.y, 18, 18);
  }
}