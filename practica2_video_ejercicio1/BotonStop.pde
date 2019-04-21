public class BotonStop extends Boton {


	BotonStop(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "stop";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		println("test: ");
		mov.stop();
	}

	public boolean isSelected() {
		return false;
	}
}