public class BotonRelleno extends Boton {

	BotonRelleno(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "relleno";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		conf.relleno = !conf.relleno;
	}

	public boolean isSelected() {
		return conf.relleno == true;
	}
}