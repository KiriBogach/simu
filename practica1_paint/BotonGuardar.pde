public class BotonGuardar extends Boton {


	BotonGuardar(float x, float y, float ancho, float alto) {
		super(x, y, ancho, alto);
		this.titulo = "guardar";
		this.img = loadImage("img/" + this.titulo + ".png");
	}

	public void comportamiento() {
		chooser.setDialogTitle("Specify a file to save");

		int userSelection = chooser.showSaveDialog(new JFrame());

		if (userSelection == JFileChooser.APPROVE_OPTION) {
			File fileToSave = chooser.getSelectedFile();
			editor.save(fileToSave.getAbsolutePath());
		}
		println("GUARDAR");
	}

	public boolean isSelected() {
		return false;
	}
}