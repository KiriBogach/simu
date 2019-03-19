/*
	lápiz, elipse, rectángulo, color, relleno, borrar y guardar

	La práctica se puede ampliar con la inclusión de otras herramientas, como grosor de línea,
	otras figuras, texto o edición de imágenes (filtros, máscaras, recortes…)
*/

import javax.swing.JFrame;
import javax.imageio.ImageIO;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.JFileChooser;

PGraphics editor; // Panel donde se dibuja
final int TOPE_CONFIG = 100; // Tope entre el panel de dibujado y la cabecera
final JFileChooser chooser = new JFileChooser(); // Selector de ficheros para leer y guardar

Configuracion conf; // Objeto con la configuración en tiempo real del proyecto

// Variables globales
ArrayList<Boton> botones; // Botones en la vista principal
ArrayList<Boton> botonesFiltros; // Botones en la vista de filtros
Boton botonRecorte; // Referencia al botonRecorte para lanzar el evento tras elegir el recorte

ColorPicker colorPicker; // Vista de la elección de color de borde y relleno


void setup() {
	size(800, 800);
	background(51);

	// Se crea un filtro para tratar con imágenes
	FileNameExtensionFilter filter = new FileNameExtensionFilter("Image files", ImageIO.getReaderFileSuffixes());
	chooser.setFileFilter(filter);

	// Se crea el editor donde se dibujará
	editor = createGraphics(width, height - TOPE_CONFIG);

	editor.beginDraw();
	editor.background(255);
	editor.endDraw();

	conf = new Configuracion();
	colorPicker = new ColorPicker();

	// Se crean y posicionan los botones 
	botones = new ArrayList<Boton>();
	botones.add(new BotonLapiz(25, 20, 60, 60));
	botones.add(new BotonEllipse(100, 20, 60, 60));
	botones.add(new BotonBorrar(175, 20, 60, 60));
	botones.add(new BotonRelleno(250, 20, 60, 60));
	botones.add(new BotonPaleta(325, 20, 60, 60));

	botones.add(new BotonFiltro("rotar", 400, 20, 60, 60));

	botones.add(new BotonFiltros(515, 20, 60, 60));

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
}


void draw() {
	// Si estamos seleccionado color solo dibujamos la interfaz de selección de colores
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

	// Línea de separación entre cabecera y cuerpo
	strokeWeight(5);
	line(0, TOPE_CONFIG, width, TOPE_CONFIG);
	strokeWeight(1);

	// Dibujamos lo dibujado en el canvas
	image(editor, 0, TOPE_CONFIG);

	// Miramos si debemos dibujar o marcar el dibuajado
	readConfig(false);

	// Variable de control del clickado el ratón en un tick
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

// Si se clickea dentro de la parte de dibujado, se dibuja en el canvas
void dibujarEditor() {
	int mouse_x = mouseX;
	int mouse_y = mouseY - TOPE_CONFIG;

	editor.colorMode(HSB);

	editor.fill(conf.colorRelleno);
	editor.stroke(conf.colorBorde);
	editor.strokeWeight(conf.grosor);

	switch (conf.forma) {
	case "lapiz":
		editor.fill(0);
		editor.point(mouse_x, mouse_y);
		break;
	case "ellipse":
		if (conf.relleno) {
			editor.noStroke();
		} else {
			editor.noFill();
		}
		editor.ellipse(mouse_x, mouse_y, conf.elementSize, conf.elementSize);
		break;
	case "delete":
		editor.noStroke();
		editor.strokeWeight(1);
		editor.fill(255);
		editor.rect(mouse_x - 50, mouse_y - 50, conf.elementSize, conf.elementSize);
		break;
	}

	editor.colorMode(RGB);
}

// Si estamos en el canvas pero no hemos hecho click, mostramos el comportamiento esperado
void marcarDibujado() {
	colorMode(HSB);

	fill(conf.colorRelleno);
	stroke(conf.colorBorde);
	strokeWeight(conf.grosor * 2);

	switch (conf.forma) {
	case "lapiz":
		fill(0);
		point(mouseX, mouseY);
		break;
	case "ellipse":
		if (conf.relleno) {
			noStroke();
		} else {
			noFill();
		}
		ellipse(mouseX, mouseY, conf.elementSize, conf.elementSize);
		break;
	case "delete":
		stroke(0);
		strokeWeight(1);
		fill(255);
		rect(mouseX - 50, mouseY - 50, conf.elementSize, conf.elementSize);
		break;
	case "recorte":
		stroke(0);
		strokeWeight(1);
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

// Manejamos eventos al clickar con el ratón
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

// Manejamos eventos al usar el teclado
void keyPressed() {
	if (!keyPressed) {
		return;
	}

	switch (keyCode) {
	case ENTER:
		conf.inColorSelection = false;
		break;
	default:
		break;
	}

	switch (key) {
	case '+':
		conf.elementSize++;
		break;
	case '-':
		conf.elementSize--;
	default:
		break;
	}

}