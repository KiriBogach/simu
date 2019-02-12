ArrayList<Scrollbar> scrollbars;
Scrollbar cejas, colorCara, boca;

void setup() {
	size(600, 600);

	cejas = new Scrollbar(50, 550, 500, 0, 30);
	colorCara = new Scrollbar(50, 500, 500, 0, 10);
	boca = new Scrollbar(50, 450, 500, 0, 10);

	scrollbars = new ArrayList<Scrollbar>();
	scrollbars.add(cejas);
	scrollbars.add(colorCara);
	scrollbars.add(boca);
}

void draw() {
	background(168, 173, 180);


	for (Scrollbar s : scrollbars) {
		s.update();
		s.show();
	}

	color col = color(0);
	int valorColor = round(map(colorCara.getValue(), 0, 10, 0, 2));
	switch (valorColor) {
		case 0:
			col = color(255, 0, 0); // rojo
			break;
		case 1:
			col = color(255, 255, 0); // amarillo
			break;
		case 2:
			col = color(0, 0, 255); // azul
			break;
	}

	fill(col);
	ellipse(300, 200, 350, 350);
}
