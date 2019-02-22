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

PGraphics editor;


Configuracion conf;
ArrayList<Boton> botones;
final int TOPE_CONFIG = 100;

void setup() {
	size(800, 800);
	background(51);

	editor = createGraphics(width, height - TOPE_CONFIG);

	editor.beginDraw();
	editor.background(255);
	editor.endDraw();

	conf = new Configuracion();
	botones = new ArrayList<Boton>();
	botones.add(new BotonLapiz(50, 20, 60, 60, conf));
	botones.add(new BotonEllipse(125, 20, 60, 60, conf));
	botones.add(new BotonBorrar(200, 20, 60, 60, conf));
	botones.add(new BotonRelleno(275, 20, 60, 60, conf));
}


void draw() {
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
/*
void mousePressed() {
  for (Boton b : botones) {
    button.onClick();
  }
}*/

void mouseClicked() {
	conf.mouseClicked = true;
	readConfig(true);
}


void mouseDragged() {
	readConfig(true);
}

void readConfig(boolean dibujar) {
	int mouse_x = mouseX;
	int mouse_y = mouseY - TOPE_CONFIG;
	if (mouse_y <= TOPE_CONFIG) return;

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
	switch (conf.forma) {
	case "lapiz":
		editor.fill(0);
		editor.point(mouse_x, mouse_y);
		break;
	case "ellipse":
		if (conf.relleno) {
			editor.fill(255, 0, 0);
			editor.noStroke();
		} else {
			editor.noFill();
		}
		editor.ellipse(mouse_x, mouse_y, 100, 100);
		break;
	case "delete":
		editor.noStroke();
		editor.fill(255);
		editor.ellipse(mouse_x, mouse_y, 100, 100);
		break;
	}
}

void marcarDibujado() {
	switch (conf.forma) {
	case "lapiz":
		fill(0);
		point(mouseX, mouseY);
		break;
	case "ellipse":
		if (conf.relleno) {
			fill(255, 0, 0);
			noStroke();
		} else {
			noFill();
		}

		ellipse(mouseX, mouseY, 100, 100);
		break;
	case "delete":
		noStroke();
		fill(255);
		ellipse(mouseX, mouseY, 100, 100);
		break;
	}
}