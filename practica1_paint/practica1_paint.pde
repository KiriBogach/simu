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
ArrayList<Boton> botonesFiltros;
Boton botonRecorte;
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
	botones.add(new BotonLapiz(25, 20, 60, 60));
	botones.add(new BotonEllipse(100, 20, 60, 60));
	botones.add(new BotonBorrar(175, 20, 60, 60));
	botones.add(new BotonRelleno(250, 20, 60, 60));
	botones.add(new BotonPaleta(325, 20, 60, 60));

	botones.add(new BotonFiltros(475, 20, 60, 60));

	botones.add(new BotonCargar(625, 20, 60, 60));
	botones.add(new BotonGuardar(700, 20, 60, 60));

	botonesFiltros = new ArrayList<Boton>();
	botonesFiltros.add(new BotonFiltro("tinte", 25, 20, 60, 60));
	botonesFiltros.add(new BotonFiltro("negativo", 100, 20, 60, 60));
	botonesFiltros.add(new BotonFiltro("byn", 175, 20, 60, 60));
	botonesFiltros.add(new BotonFiltro("blur", 250, 20, 60, 60));
	botonRecorte = new BotonFiltro("recortar", 325, 20, 60, 60);
	botonesFiltros.add(botonRecorte);
	botonesFiltros.add(new BotonGrosor("grosor1", 425, 20, 60, 60));
	botonesFiltros.add(new BotonGrosor("grosor2", 500, 20, 60, 60));
	botonesFiltros.add(new BotonGrosor("grosor3", 575, 20, 60, 60));
	botonesFiltros.add(new BotonCancelar(700, 20, 60, 60));

	colorPicker = new ColorPicker();
}


void draw() {

	// Si estamos seleccionado color solo dibujamos esa parte
	if (conf.inColorSelection) {
		colorPicker.draw();
		return;
	}

	background(188, 217, 255);
	ArrayList<Boton> botoresToShow = (conf.inFiltros) ? botonesFiltros : botones;
	for (Boton b : botoresToShow) {
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
		editor.strokeWeight(conf.grosor);
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
		strokeWeight(8);
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
	case "recorte":
		stroke(0);
		noFill();
		if (conf.recorte0 != null) {
			if (conf.recorte1 == null) {
				rect(conf.recorte0.x, conf.recorte0.y, mouseX - conf.recorte0.x, mouseY - conf.recorte0.y);
			} else {
				rect(conf.recorte0.x, conf.recorte0.y, conf.recorte1.x - conf.recorte0.x, conf.recorte1.y - conf.recorte0.y);
			}
		}
		break;
	}

	colorMode(RGB);
}

void mouseClicked() {
	conf.mouseClicked = true;
	readConfig(true);
	colorPicker.clicked();

	if (conf.forma.equals("recorte")) {
		if (conf.recorte0 == null) {
			conf.recorte0 = new PVector(mouseX, mouseY);
		} else if (conf.recorte1 == null) {
			conf.recorte1 = new PVector(mouseX, mouseY);
			botonRecorte.comportamiento();
		}
	} else {
		conf.recorte0 = null;
	}
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