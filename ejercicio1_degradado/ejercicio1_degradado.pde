size(650,355);
background(255);

noFill();
rect(20, 10, 500, 100);

// PARTE DE ARRIBA
fill(0);
int x = 20;
noStroke();
for (int i = 255; i > 0; i--) {
  fill(0, 0, 0, i);
  rect(x, 10, 2, 100);
  x += 2;
}

stroke(1);
fill(241, 175, 77);
rect(550, 10, 70, 100);


// PARTE DEL MEDIO
int cuadros = 8;
int colores[] = {
  color(255, 0, 0),
  color(0, 255, 0),
  color(0, 0, 255),
  color(0, 255, 255),
  color(255, 0, 255),
  color(255, 255, 0),
  color(255, 255, 255),
  color(0, 0, 0)
};

x = 20;
int ancho = 75;
for (int i = 0; i < cuadros; i++) {
  fill(colores[i]);
  rect(x, 125, ancho, 100);
  x += ancho;
}

// PARTE DE ABAJO
stroke(1);
fill(87, 28, 250);
rect(20, 240, 600, 100);

fill(0);
x = 20;
noStroke();
//87, 28, 250
for (int i = 255; i > 0; i--) {
  fill(0, 0, 0, i);
  rect(x, 240, 2, 100);
  x += 2;
}
