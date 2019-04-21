public class BotonFiltro extends Boton {


	BotonFiltro(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "filtro";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		conf.mostrarEfecto = !conf.mostrarEfecto;
	}

	public boolean isSelected() {
		return conf.mostrarEfecto;
	}
}