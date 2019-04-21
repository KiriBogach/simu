import processing.video.*;

Capture webcam; // Varible control webcam
int threshold;  // Límite variable

/* 
    Con los botones UP, DOWN 
    se controla el límite de brillo
*/

void setup() {
    size(1280, 720);

    webcam = new Capture(this, width, height);
    webcam.start();

    // Comenzamos en un punto intermedio
    threshold = 127; 
}

void draw() {
    // Mostramos la información del threshold
    fill(255, 0, 0);
    noStroke();
    rect(10, 10, 110, 20);
    fill(255);
    text("Threshold: " + threshold, 14, 24);

    // Si la cámara no está disponible no precesamos la imagen
    if (!webcam.available()) {
        return;
    }

    // Iniciamos las varibles para buscar el rectángulo
    // que recoge la parte brillante de la imágen
    // en función del threshold actual
    int minX = Integer.MAX_VALUE;
    int minY = Integer.MAX_VALUE;
    int maxX = Integer.MIN_VALUE;
    int maxY = Integer.MIN_VALUE;

    webcam.read();
    image(webcam, 0, 0);

    // Iteramos por las coordenadas 'x' e 'y'.
    loadPixels();
    for (int x = 0; x < webcam.width; x++) {
        for (int y = 0; y < webcam.height; y++) {

            // Calculamos qué pixel es el actual
            // y el brillo de dicho pixel
            int pixel = x + y * webcam.width;
            float b = brightness(webcam.pixels[pixel]);

            // Comparamos en función del límite
            if (b > threshold) {

                // Comparamos con el máximo y el mínimo
                if (x < minX) {
                    minX = x;
                }
                if (x > maxX) {
                    maxX = x;
                }
                if (y < minY) {
                    minY = y;
                }
                if (y > maxY) {
                    maxY = y;
                }

                // Ponemos a blanco el pixel
                pixels[pixel] = color(255);
            } else {
                // Ponemos a negro el pixel
                pixels[pixel] = color(0);
            }
        }
    }
    updatePixels();

    // Dibujamos el rectángulo
    strokeWeight(8);
    stroke(255, 0, 0);
    noFill();
    rect(minX, minY, maxX - minX, maxY - minY);
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == UP) {
            threshold++;
        }
        if (keyCode == DOWN) {
            threshold--;
        }
    }
}