public class BotonFiltro extends Boton {

	BotonFiltro(String filtro, float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = filtro;
		this.img = loadImage("img/" + this.titulo + ".png");
	}


	@Override
	public void colorearBoton() {
		switch (this.titulo) {
		case "tinte":
			fill(conf.colorBorde, 125);
			break;
		default:
			break;
		}
	}

	public void comportamiento() {
		switch (this.titulo) {
		case "tinte":
			this.tintar();
			break;
		case "negativo":
			this.negativo();
			break;
		case "byn":
			this.blancoNegro();
			break;
		case "blur":
			this.blur();
			break;
		case "recortar":
			this.recortar();
			break;
		default:
			break;
		}
	}

	public boolean isSelected() {
		switch (this.titulo) {
		case "recortar":
			return conf.forma.equals("recorte");
		default:
			return false;
		}
	}

	public void tintar() {
		PImage capturado = editor.get();
		editor.beginDraw();
		editor.tint(conf.colorBorde);
		editor.image(capturado, 0, 0);
		editor.endDraw();
	}

	public void negativo() {
		PImage capturado = editor.get();

		for (int x = 0; x < capturado.width; x++) {
			for (int y = 0; y < capturado.height; y++) {
				color c = capturado.get(x, y);
				capturado.set(x, y, color(255 - red(c), 255 - green(c), 255 - blue(c)));
			}
		}

		editor.beginDraw();
		editor.image(capturado, 0, 0);
		editor.endDraw();
	}

	public void blancoNegro() {
		editor.beginDraw();
		editor.filter(GRAY);
		editor.endDraw();
	}

	public void blur() {
		editor.beginDraw();
		editor.filter(BLUR);
		editor.endDraw();
	}

	public void recortar() {
		if (conf.recorte0 == null || conf.recorte1 == null) {
			conf.forma = "recorte";
		} else if (conf.forma.equals("recorte")) {
			PImage capturado = editor.get();

			int xStart = int(min(conf.recorte0.x, conf.recorte1.x));
			int xEnd = int(max(conf.recorte0.x, conf.recorte1.x));
			int yStart = int(min(conf.recorte0.y, conf.recorte1.y));
			int yEnd = int(max(conf.recorte0.y, conf.recorte1.y));

			PImage recorte = createImage(xEnd - xStart, yEnd - yStart, RGB);

			for (int x = xStart; x < xEnd; x++) {
				for (int y = yStart; y < yEnd; y++) {
					color c = capturado.get(x, y - TOPE_CONFIG);
					recorte.set(x - xStart, y - yStart, c);
				}
			}
			editor.beginDraw();
			editor.background(255);
			editor.image(recorte, 0, 0);
			editor.endDraw();

			conf.forma = "";
			conf.recorte0 = null;
			conf.recorte1 = null;
		}
	}
}