public class BotonCancelar extends Boton {

	BotonCancelar(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "cancelar";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		conf.inFiltros = false;
	}

	public boolean isSelected() {
		return false;
	}
}