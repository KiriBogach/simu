public class ColorPicker {

	protected int resolucion = 20;
	protected int base = 0;
	protected int saturacion = 0;
	protected int brillo = 100;
	protected int xRest = 0;
	protected int yRest = 0;

	public ColorPicker() {
		textSize(16);
	}

	public void draw() {
		// Utilizamos el modelo HSB para dibujar los colores más fácilmente
		colorMode(HSB, this.resolucion);
		noStroke();

		// Cabecera: Paleta de colores
		for (int i = 0; i < this.resolucion; i++) {
			fill(i, this.resolucion, this.resolucion);
			rect(i * width / this.resolucion, 0, width / this.resolucion, 40);
		}

		translate(0, 40);

		// Cuerpo: Colores de la paleta seleccionado
		for (int x = 0; x < this.resolucion; x++) {
			for (int y = 0; y < this.resolucion; y++) {
				fill(this.base, x, y);
				rect(x * (width / this.resolucion), y * (width / this.resolucion), width / this.resolucion, width / this.resolucion);
			}
		}

		// Manejamos el evento del click y su comportamiento
		if (mousePressed && mouseY > 45) {
			noCursor();
			this.xRest = mouseX;
			this.yRest = mouseY;
			this.saturacion = (int)map(this.xRest, 0, width, 0, this.resolucion);
			this.brillo = (int)map(this.yRest, 0, width, 0, this.resolucion);

			if (mouseButton == 37) {
				guardarConfigBorde();
			} else if (mouseButton == 39) {
				guardarConfigRelleno();
			}

			fill(this.base, this.saturacion, this.brillo);

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

		fill(this.base, map(this.xRest, 0, width, 0, this.resolucion), map(this.yRest, 0, width, 0, this.resolucion));

		rect(0, 400, width, 60);

		// Mostramos información al usuario
		fill(0);
		text("[boton enter] salir seleccion", 300, height - 110);
		text("[click iquierdo] color borde", 300, height - 80);
		text("[click derecho] color relleno", 300, height - 50);
		colorMode(RGB, 255);
	}

	void clicked() {
		if (mouseY < 40) {
			this.base = (int)map(mouseX, 0, width, 0, this.resolucion - 1);
		}
	}

	// Guardamos el color relleno
	public void guardarConfigRelleno() {
		float s = map(this.xRest, 0, width, 0, this.resolucion);
		float b = map(this.yRest, 0, width, 0, this.resolucion);

		conf.colorRelleno = color(this.base, s, b);
		fill(this.base, s, b);
		text("RELLENO", 380, height - 310);
	}

	// Guardamos el color borde
	public void guardarConfigBorde() {
		float s = map(this.xRest, 0, width, 0, this.resolucion);
		float b = map(this.yRest, 0, width, 0, this.resolucion);

		conf.colorBorde = color(this.base, s, b);
		fill(this.base, s, b);
		text("BORDE", 380, height - 310);
	}

}