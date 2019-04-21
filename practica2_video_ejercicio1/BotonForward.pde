public class BotonForward extends Boton {


	BotonForward(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "forward";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		float salto = mov.time() + SALTO;
  		mov.jump(salto);
	}

	public boolean isSelected() {
		return false;
	}
}