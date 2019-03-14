/*
	lápiz, elipse, rectángulo, color, relleno, borrar y guardar
*/

/*
	La práctica se puede ampliar con la inclusión de otras herramientas, como grosor de línea,
	otras figuras, texto o edición de imágenes (filtros, máscaras, recortes…)
*/

/*
	Se pueden utilizar las librerías de Java para seleccionar ficheros
	javax.swing.JFileChooser;
	javax.swing.filechooser.FileNameExtensionFilter;
*/

import javax.swing.JFrame;
import javax.imageio.ImageIO;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.JFileChooser;

final JFileChooser chooser = new JFileChooser();
PGraphics editor;
PImage imagenCargada;

Configuracion conf;
ArrayList<Boton> botones;
final int TOPE_CONFIG = 100;

ColorPicker colorPicker;


void setup() {
	size(800, 800);
	background(51);

	FileNameExtensionFilter filter = new FileNameExtensionFilter("Image files", ImageIO.getReaderFileSuffixes());
	chooser.setFileFilter(filter);

	editor = createGraphics(width, height - TOPE_CONFIG);

	editor.beginDraw();
	editor.background(255);
	editor.endDraw();

	conf = new Configuracion();
	botones = new ArrayList<Boton>();
	botones.add(new BotonLapiz(50, 20, 60, 60));
	botones.add(new BotonEllipse(125, 20, 60, 60));
	botones.add(new BotonBorrar(200, 20, 60, 60));
	botones.add(new BotonRelleno(275, 20, 60, 60));
	botones.add(new BotonPaleta(350, 20, 60, 60));

	botones.add(new BotonCargar(600, 20, 60, 60));
	botones.add(new BotonGuardar(675, 20, 60, 60));

	colorPicker = new ColorPicker();
}


void draw() {

	// Si estamos seleccionado color solo dibujamos esa parte
	if (conf.inColorSelection) {
		colorPicker.draw();
		return;
	}

	background(51);
	for (Boton b : botones) {
		b.update();
		b.show();
	}

	strokeWeight(5);
	line(0, TOPE_CONFIG, width, TOPE_CONFIG);
	strokeWeight(1);

	image(editor, 0, TOPE_CONFIG);

	readConfig(false);

	conf.mouseClicked = false;
}


void readConfig(boolean dibujar) {
	int mouse_x = mouseX;
	int mouse_y = mouseY - TOPE_CONFIG;
	if (mouse_y <= 0) return;

	editor.beginDraw();

	if (dibujar) {
		dibujarEditor();
	} else {
		marcarDibujado();
	}

	editor.endDraw();
}

void dibujarEditor() {
	int mouse_x = mouseX;
	int mouse_y = mouseY - TOPE_CONFIG;

	editor.colorMode(HSB);

	editor.fill(conf.colorRelleno);
	editor.stroke(conf.colorBorde);

	switch (conf.forma) {
	case "lapiz":
		editor.strokeWeight(1);
		editor.fill(0);
		editor.point(mouse_x, mouse_y);
		break;
	case "ellipse":
		if (conf.relleno) {
			editor.noStroke();
		} else {
			editor.noFill();
		}
		editor.ellipse(mouse_x, mouse_y, 100, 100);
		break;
	case "delete":
		editor.noStroke();
		editor.fill(255);
		editor.rect(mouse_x - 50, mouse_y - 50, 100, 100);
		break;
	}

	editor.colorMode(RGB);
}

void marcarDibujado() {
	colorMode(HSB);

	fill(conf.colorRelleno);
	stroke(conf.colorBorde);

	switch (conf.forma) {
	case "lapiz":
		strokeWeight(4);
		fill(0);
		point(mouseX, mouseY);
		strokeWeight(1);
		break;
	case "ellipse":
		if (conf.relleno) {
			noStroke();
		} else {
			noFill();
		}
		ellipse(mouseX, mouseY, 100, 100);
		break;
	case "delete":
		stroke(0);
		fill(255);
		rect(mouseX - 50, mouseY - 50, 100, 100);
		break;
	}

	colorMode(RGB);
}

void mouseClicked() {
	conf.mouseClicked = true;
	readConfig(true);
	colorPicker.clicked();
}

void mouseDragged() {
	readConfig(true);
}

void keyPressed() {
	if (keyPressed) {
		if (keyCode == ENTER) {
			conf.inColorSelection = false;
		}
	}
}