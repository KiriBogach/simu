public class BotonPaleta extends Boton {

	BotonPaleta(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "paleta";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		conf.inColorSelection = true;
	}

	public boolean isSelected() {
		return false;
	}
}