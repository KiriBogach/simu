public class BotonEllipse extends Boton {

	BotonEllipse(float x, float y, float ancho, float alto, Configuracion conf) {
		super(x, y, ancho, alto, conf);
		this.titulo = "ellipse";
		this.img = loadImage(this.titulo + ".png");
	}

	public void comportamiento() {
		this.conf.forma = this.titulo;
	}

	public boolean isSelected() {
		return this.conf.forma.equals(this.titulo);
	}
}