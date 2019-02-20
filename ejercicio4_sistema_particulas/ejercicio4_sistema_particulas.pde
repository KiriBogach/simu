final int NUM_PARTICULAS = 1000;
final PVector GRAVEDAD = new PVector(0, 0.08);
final int FUERZA_VIENTO = 8;

ArrayList<Copo> copos;
PImage imagenCopo;
PImage snowMan;

int xSnowMan = 20;
boolean dirSnowMan = true;

void setup() {
  size(600, 600);
  imagenCopo = loadImage("img/copo.png");
  snowMan = loadImage("img/snowman.png");

  copos = new ArrayList<Copo>();
  for (int i = 0; i < NUM_PARTICULAS; i++) {
    Copo c = new Copo(imagenCopo, GRAVEDAD);
    copos.add(c);
  }
}

void draw() {
  background(240, 230, 230);
  for (Copo c : copos) {
    PVector viento = new PVector(random(-FUERZA_VIENTO, FUERZA_VIENTO), 0);
    viento.mult(0.01);
    c.update(viento);
    c.show();
  }

  image(snowMan, xSnowMan, 380, 220, 200);
  if (xSnowMan >= 350) {
    dirSnowMan = false;
  } else if (xSnowMan <= 20) {
    dirSnowMan = true;
  }
  if (dirSnowMan) {
    xSnowMan++;
  } else {
    xSnowMan--;
  }
}
