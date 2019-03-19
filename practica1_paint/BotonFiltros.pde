public class BotonFiltros extends Boton {

	BotonFiltros(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "filtros";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		conf.inFiltros = true;
	}

	public boolean isSelected() {
		return conf.inFiltros;
	}

	@Override
	public void colorearBoton() {
		fill(255, 188, 217);
	}
}