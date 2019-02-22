public abstract class Boton {

	protected PImage img;
	protected PVector pos;
	protected float ancho;
	protected float alto;
	protected String titulo;
	protected Configuracion conf;


	Boton(float x, float y, float ancho, float alto, Configuracion conf) {
		this.pos = new PVector(x, y);
		this.ancho = ancho;
		this.alto = alto;
		this.conf = conf;
	}

	public void update() {
		boolean enCursor = this.overRect();

		if (this.isSelected()) {
			fill(200, 255, 200);
		} else {
			fill(255, 255, 255);
		}

		if (this.conf.mouseClicked && enCursor) {
			fill(200, 255, 200, 150);
			this.comportamiento();
		} else if (enCursor) {
			fill(200, 255, 255);
		}
	}

	public void show() {
		strokeWeight(3);
		rect(this.pos.x, this.pos.y, this.ancho, this.alto);
		image(this.img, this.pos.x, this.pos.y, this.ancho, this.alto);
	}

	public abstract boolean isSelected();
	public abstract void comportamiento();

	public boolean overRect()  {
		return (mouseX >= this.pos.x && mouseX <= this.pos.x + this.ancho &&
		        mouseY >= this.pos.y && mouseY <= this.pos.y + this.alto);

	}

	/*void onClick() {
		println(mouseX);
	}*/
}