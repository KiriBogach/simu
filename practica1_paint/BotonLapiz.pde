public class BotonLapiz extends Boton {

	BotonLapiz(float x, float y, float ancho, float alto, Configuracion conf) {
		super(x,y,ancho,alto,conf);
		this.titulo = "lapiz";
		this.img = loadImage(this.titulo + ".png");
	}

	public void comportamiento() {
		this.conf.forma = this.titulo;
	}

	public boolean isSelected() {
		return this.conf.forma.equals(this.titulo);
	}
}