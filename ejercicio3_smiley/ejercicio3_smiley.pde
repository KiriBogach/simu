ArrayList<Scrollbar> scrollbars;
Scrollbar cejas, colorCara, boca;
color backgroundColor;

void setup() {
	size(600, 600);
	colorMode(RGB);
	smooth(10);

	backgroundColor = color(168, 173, 180);

	boca = new Scrollbar(50, 450, 500, 0, 10);
	cejas = new Scrollbar(50, 500, 500, 0, 10);
	colorCara = new Scrollbar(50, 550, 500, 0, 10);

	scrollbars = new ArrayList<Scrollbar>();
	scrollbars.add(cejas);
	scrollbars.add(colorCara);
	scrollbars.add(boca);
}

void draw() {
	background(backgroundColor);

	// Dibujamos los scrollbars
	for (Scrollbar s : scrollbars) {
		s.update();
		s.show();
	}

	// Dibujamos el Smiley
	dibujarColorCara();
	dibujarCejas();
	dibujarOjos();
	dibujarBoca();
}

void dibujarColorCara() {
	color col = color(0);
	int tipoColor = round(map(colorCara.getValue(), 0, 10, 0, 2));
	switch (tipoColor) {
	case 0:
		col = color(255, 255, 0); // amarillo
		break;
	case 1:
		col = color(0, 155, 255); // azul
		break;
	case 2:
		col = color(255, 0, 0); // rojo
		break;
	}

	// Circunferencia principal
	fill(col);
	ellipse(300, 200, 350, 350);
}

void dibujarOjos() {
	fill(255);
	ellipse(235, 180, 120, 120);
	ellipse(365, 180, 120, 120);

	fill(0);
	ellipse(235, 185, 35, 35);
	ellipse(365, 185, 35, 35);
}


void dibujarCejas() {
	int tipoCeja = round(map(cejas.getValue(), 0, 10, 0, 2));
	strokeWeight(5);
	switch (tipoCeja) {
	case 0:
		// enfadado
		line(190, 90, 280, 120);
		line(320, 120, 410, 90);
		break;
	case 1:
		// normal
		line(190, 110, 280, 110);
		line(320, 110, 410, 110);
		break;
	case 2:
		// triste
		line(190, 110, 280, 80);
		line(320, 80, 410, 110);
		break;
	}
	strokeWeight(1);
}

void dibujarBoca() {
	strokeWeight(3);
	noFill();

	int tipoBoca = round(map(boca.getValue(), 0, 10, 0, 2));

	beginShape();
	curveVertex(250, 280);
	curveVertex(250, 280);

	switch (tipoBoca) {
	case 0:
		// triste
		curveVertex(300, 250);
		break;
	case 1:
		// normal
		curveVertex(300, 280);
		break;
	case 2:
		// feliz
		curveVertex(300, 310);
		break;
	}

	curveVertex(350, 280);
	curveVertex(350, 280);
	endShape();

	strokeWeight(1);
}