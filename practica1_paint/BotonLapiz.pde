public class BotonLapiz extends Boton {

	BotonLapiz(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "lapiz";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		conf.forma = this.titulo;
	}

	public boolean isSelected() {
		return conf.forma.equals(this.titulo);
	}
}