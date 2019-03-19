public abstract class Boton {

	protected PImage img;
	protected PVector pos;
	protected float ancho;
	protected float alto;
	protected String titulo;
	protected boolean enCursor;

	// Clase abstracta con el patrón del método plantilla
	// Heredan todas las clases llamadas Boton*

	Boton(float x, float y, float ancho, float alto) {
		this.pos = new PVector(x, y);
		this.ancho = ancho;
		this.alto = alto;
	}

	public void update() {
		this.enCursor = this.overRect();

		if (this.isSelected()) {
			fill(200, 255, 200);
		} else {
			fill(255, 255, 255);
		}

		if (conf.mouseClicked && this.enCursor) {
			fill(200, 255, 200, 150);
			this.comportamiento();
		} else if (this.enCursor) {
			fill(200, 255, 255);
		}
	}

	public void show() {
		stroke(1);
		strokeWeight(3);
		if (!this.enCursor) {
			this.colorearBoton();
		}
		rect(this.pos.x, this.pos.y, this.ancho, this.alto);
		image(this.img, this.pos.x, this.pos.y, this.ancho, this.alto);
	}

	public abstract boolean isSelected();
	public abstract void comportamiento();

	public void colorearBoton() {
	}

	public boolean overRect()  {
		return (mouseX >= this.pos.x && mouseX <= this.pos.x + this.ancho &&
		        mouseY >= this.pos.y && mouseY <= this.pos.y + this.alto);

	}
}