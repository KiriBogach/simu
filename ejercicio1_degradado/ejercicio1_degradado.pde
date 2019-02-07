/*** SETUP ***/
size(645,450);
background(255);

int x;
int margenIzquierda = 20;
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

/*** PARTE DE ARRIBA ***/
noFill();
rect(margenIzquierda, 10, 500, 100);
fill(0);

x = margenIzquierda;
noStroke();
for (int i = 255; i > 0; i--) {
  fill(0, 0, 0, i);
  rect(x, 10, 2, 100);
  x += 2;
}

stroke(1);
fill(241, 175, 77);
rect(550, 10, 70, 100);

/*** PARTE DEL MEDIO ***/

x = margenIzquierda;
int ancho = 75;
for (int i = 0; i < colores.length; i++) {
  fill(colores[i]);
  rect(x, 125, ancho, ancho);
  x += ancho;
}

noStroke();
fill(0);
rect(0, 240, 650, 75);

stroke(1);
x = margenIzquierda;
for (int i = 0; i < colores.length; i++) {
  fill(colores[i], 200);
  rect(x, 200, ancho, ancho);
  x += ancho;
}

/*** PARTE DE ABAJO ***/
stroke(1);
fill(87, 28, 250);
rect(margenIzquierda, 335, 600, 100);

fill(0);
x = margenIzquierda;
noStroke();
for (int i = 255; i > 0; i--) {
  fill(0, 0, 0, i);
  rect(x, 335, 2, 100);
  x += 2;
}
