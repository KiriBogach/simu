/*****************************************************/

/* Colores de la escena */
color cielo = color(178, 225, 218);
color agua = color(126, 204, 196);
color aguaProfunda = color(13, 133, 142);
color suelo = color(15, 98, 99);

/* Variables globales */
Tiburon tiburon;
PImage imgTiburon;
ArrayList<Pez> peces;
ArrayList<PImage> imgPeces;
ArrayList<Alga> algas;
PImage imgAlga;

float tiempoPerliNoise = 0;
final int NUM_PECES = 20;
final int NUM_IMAGENES_PECES = 8;

/*
  Las distintas profundidades de agua se han simulado con 'PerliNoise'.
  El tiburón sigue un movimiento ondulatorio.
  Los peces siguen al ratón (en sus límites) y sueltan oxígeno.
  Las algas siguen un movimiento armónico (oscilación).
*/

/*****************************************************/

void setup() {
  size(600, 600);
  imageMode(CENTER);
  strokeWeight(5);
  smooth();

  /* Inicializamos las imagenes y entidades de
   * tiburon, peces y algas.
   */

  // Tiburón
  imgTiburon = loadImage("img/tiburon.png");
  tiburon = new Tiburon(imgTiburon);

  // Peces
  peces = new ArrayList<Pez>();
  imgPeces = new ArrayList<PImage>();

  for (int i = 0; i < NUM_IMAGENES_PECES; i++) {
    imgPeces.add(loadImage("img/pez" + i + ".png"));
  }

  for (int i = 0; i < NUM_PECES; i++) {
    int indicePez = (int) random(NUM_IMAGENES_PECES);
    peces.add(new Pez(imgPeces.get(indicePez)));
  }

  // Algas
  algas = new ArrayList<Alga>();
  imgAlga = loadImage("img/alga.png");

  algas.add(new Alga(25, 565, imgAlga));
  algas.add(new Alga(100, 575, imgAlga));
  algas.add(new Alga(550, 560, imgAlga));
  algas.add(new Alga(490, 575, imgAlga));
}


void draw() {
  background(cielo);
  strokeWeight(5);

  // Dibujamos las olas superiores
  stroke(agua);
  for (float x = 0; x < width; x += 3) {
    line(x, 100 + 60 * noise(x / 80, tiempoPerliNoise), x, height);
  }

  // Dibujamos corrientes de agua profundas
  stroke(aguaProfunda);
  for (float x = 0; x < width; x += 3) {
    line(x, 480 + 40 * noise(x / 400, tiempoPerliNoise), x, height);
  }

  // Dibujamos el suelo
  fill(suelo);
  triangle(-10, 570, 230, 610, -10, 610);
  triangle(400, 610, 610, 550, 610, 610);

  // Manejo entidad Tiburón
  tiburon.update();
  tiburon.display();

  // Manejo entidades Pez
  for (Pez p : peces) {
    p.update();
    p.checkEdges();
    p.display();
  }

  // Manejo entidades Alga
  for (Alga a : algas) {
    a.update();
    a.display();
  }

  tiempoPerliNoise = tiempoPerliNoise + 0.01;

  //text("x:" + mouseX + ", y:" + mouseY, 10, 10);
}
