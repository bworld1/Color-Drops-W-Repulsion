ArrayList<Color> colors;
ArrayList<Particle> particles;

  void setup() {
    size(1024,1024);
    particles = new ArrayList<Particle>();
    colors = new ArrayList<Color>();
    for (int i = 0;i <= 99;i++) {
      colors.add(new Color(int(random(50,255)), int(random(50,255)), int(random(50,255))));
      particles.add(new Particle(new PVector((width/2), 100)));
    }
  }

  void draw() {
    background(255);
      for (int i = particles.size()-1; i >= 0; i--) {
        Particle p = particles.get(i);
        Color c = colors.get(i);
        c.mkCol(c.red, c.green, c.blue);
        PVector gravity = new PVector(0,.8);
        PVector drag = new PVector(0, -10.0);
        gravity.mult(objMass);
        p.applyForce(gravity);
        p.applyForce(drag);        
        p.run();
        if (lifeSpan <=0) {
          particles.remove(i);
          colors.remove(i);
          colors.add(new Color(int(random(50,255)), int(random(50,255)), int(random(50,255))));
          particles.add(new Particle(new PVector(width/2, 50)));
          lifeSpan = 255;
        }
      }
  }
  