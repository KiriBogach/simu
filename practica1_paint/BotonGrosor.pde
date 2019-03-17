public class BotonGrosor extends Boton {

	protected float grosor;

	BotonGrosor(String filtro, float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = filtro;
		this.img = loadImage("img/" + this.titulo + ".png");

		// Cogemos el valor del grosor tal que --> grosor1.png, grosor = 1
		this.grosor = Float.parseFloat(this.titulo.substring(this.titulo.length() - 1));
	}

	public void comportamiento() {
		conf.grosor = this.grosor;
	}

	public boolean isSelected() {
		return conf.grosor == this.grosor;
	}

}