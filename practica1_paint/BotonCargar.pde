public class BotonCargar extends Boton {

	BotonCargar(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "cargar";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		int returnVal = chooser.showOpenDialog(new JFrame());

		if (returnVal == JFileChooser.APPROVE_OPTION) {
			println("You chose to open this file: " +
			        chooser.getSelectedFile().getName());
			imagenCargada = loadImage(chooser.getSelectedFile().getAbsolutePath());

			editor.beginDraw();
			editor.image(imagenCargada, 0, 0);
			editor.endDraw();
		}
	}

	public boolean isSelected() {
		return false;
	}
}