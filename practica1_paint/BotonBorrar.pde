public class BotonBorrar extends Boton {

	BotonBorrar(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "delete";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		conf.forma = this.titulo;
	}

	public boolean isSelected() {
		return conf.forma.equals(this.titulo);
	}
}