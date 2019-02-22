public class BotonRelleno extends Boton {

	BotonRelleno(float x, float y, float ancho, float alto, Configuracion conf) {
		super(x,y,ancho,alto,conf);
		this.titulo = "relleno";
		this.img = loadImage(this.titulo + ".png");
	}

	public void comportamiento() {
		this.conf.relleno = !this.conf.relleno;
	}

	public boolean isSelected() {
		return this.conf.relleno == true;
	}
}