ArrayList<Scrollbar> scrollbars;
Scrollbar cejas, colorCara, boca;

void setup() {
	size(600, 600);
	//rectMode(CENTER);

	cejas = new Scrollbar(50, 550, 500, 0, 10);
	colorCara = new Scrollbar(50, 500, 500, 0, 10);
	boca = new Scrollbar(50, 450, 500, 0, 10);

	scrollbars = new ArrayList<Scrollbar>();
	scrollbars.add(cejas);
	scrollbars.add(colorCara);
	scrollbars.add(boca);
}

void draw() {
	background(51);

	for (Scrollbar s : scrollbars) {
		s.update();
		s.show();
	}

}
