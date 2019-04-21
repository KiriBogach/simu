public class BotonPlay extends Boton {


	BotonPlay(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "play";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		mov.play();
	}

	public boolean isSelected() {
		return false;
	}
}