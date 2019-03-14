public class ColorPicker {

	public int res = 20;
	protected int base = 0;
	protected int sat = 0;
	protected int bri = 100;
	protected int xRest = 0;
	protected int yRest = 0;

	public ColorPicker() {
		textSize(16);
	}

	public void draw() {
		colorMode(HSB, this.res);
		noStroke();
		for (int i = 0; i < res; i++) {
			fill(i, res, res);
			rect(i * width / res, 0, width / res, 40);
		}

		translate(0, 40);

		for (int x = 0; x < res; x++) {
			for (int y = 0; y < res; y++) {
				fill(base, x, y);
				rect(x * (width / res), y * (width / res), width / res, width / res);
			}
		}
		if (mousePressed && mouseY > 45) {
			noCursor();
			xRest = mouseX;
			yRest = mouseY;
			sat = (int)map(xRest, 0, width, 0, res);
			bri = (int)map(yRest, 0, width, 0, res);

			if (mouseButton == 37) {
				guardarConfigBorde();
			} else if (mouseButton == 39) {
				guardarConfigRelleno();
			}
			fill(base, sat, bri);

			if (mouseY < 200) {
				stroke(3, 0, 21);
			} else {
				stroke(2, 0, 2);
			}

			strokeWeight(5);
			ellipse(mouseX, mouseY - 40, 5, 5);
			strokeWeight(1);
			rect(mouseX - 20, mouseY - 40, 40, 40);
			noStroke();
		} else {
			cursor();
		}

		fill(base, map(xRest, 0, width, 0, res), map(yRest, 0, width, 0, res));

		rect(0, 400, width, 60);


		fill(0);
		text("[boton enter] salir seleccion", 300, height - 110);
		text("[click iquierdo] color borde", 300, height - 80);
		text("[click derecho] color relleno", 300, height - 50);
		colorMode(RGB, 255);
	}

	void clicked() {
		if (mouseY < 40) {
			base = (int)map(mouseX, 0, width, 0, res - 1);
		}
	}

	public void guardarConfigRelleno() {
		float s = map(xRest, 0, width, 0, res);
		float b = map(yRest, 0, width, 0, res);

		conf.colorRelleno = color(base, s, b);
		fill(base, s, b);
		text("RELLENO", 380, height - 310);
	}

	public void guardarConfigBorde() {
		float s = map(xRest, 0, width, 0, res);
		float b = map(yRest, 0, width, 0, res);
		conf.colorBorde = color(base, s, b);

		fill(base, s, b);
		text("BORDE", 380, height - 310);
	}

}