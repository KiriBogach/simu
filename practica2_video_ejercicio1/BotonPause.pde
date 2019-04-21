public class BotonPause extends Boton {


	BotonPause(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "pause";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		mov.pause();
	}

	public boolean isSelected() {
		return false;
	}
}