float angulo = 0;
boolean lado = true;
color robot = color(217, 255, 188);

void setup() {
  size(400, 500);
  strokeWeight(2);
  ellipseMode(RADIUS);
  rectMode(CENTER);
}

void draw() {
  background(203, 238, 243);

  /*** CUELLO ***/
  rect(width/2, height/2, 10, 90);
  fill(robot);

  /*** BRAZOS ***/
  push();
  translate(width/2, height/2 + 100);
  rotate(PI/3);
  rect(-75, 40, 35, 150);
  arc(-75, 100, 30, 30, 0, PI);
  pop();

  push();
  translate(width/2 + 80, height/2 - 30);
  rotate(-PI/3);
  rect(-75, 40, 35, 150);
  arc(-75, 100, 30, 30, 0, PI);
  pop();

  /*** PIERNAS **/
  rect(width/2 - 20, 350, 50, 200);
  rect(width/2 - 32, 450, 80, 50);

  rect(width/2 + 20, 350, 50, 200);
  rect(width/2 + 32, 450, 80, 50);

  /*** CUERPO ***/
  fill(robot);
  rect(width/2, 300, 100, 100);
  fill(0, 0, 0, 150);
  rect(width/2 - 15, 280, 50, 15);
  ellipse(width/2 + 25, 280, 5, 5);
  ellipse(width/2 + 40, 280, 5, 5);
  fill(robot);

  /*** CABEZA ***/
  push();
  translate(width/2, height/2 - 100);
  rotate(angulo);
  rect(0, 0, 250, 120);
  fill(255);
  ellipse(-55, -15, 40, 40);
  ellipse(+55, -15, 40, 40);
  fill(robot);
  arc(0, 25, 30, 30, 0, PI);
  pop();

  /*** LÓGICA CABEZA ***/
  if (lado) {
    angulo -= 0.01;
  } else {
    angulo += 0.01;
  }

  if (angulo < -0.4) {
    lado = false;
  } else if (angulo > 0.4) {
    lado = true;
  }
}
