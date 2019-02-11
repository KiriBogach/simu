public class Scrollbar {
	private static final int ANCHURA = 15;

	private float min, max;
	private float value;
	private float longitud;

	private PVector pos;
	private PVector value_pos;
	private boolean seleccionado;

	public Scrollbar(float pos_x, float pos_y, float longitud, float min, float max) {
		this.pos = new PVector(pos_x, pos_y);
		this.longitud = longitud;
		this.min = min;
		this.max = max;
		this.value = (max - min) / 2;

		float value_x = map(value, min, max, pos.x, pos.x + longitud);
		this.value_pos = new PVector(value_x, pos_y);
	}

	public void update() {
		if (this.seleccionado && mousePressed) {
			this.value_pos.x = mouseX;
		} else {
			this.seleccionado = isClickado() && mousePressed;
		}
	}
	public void show() {
		fill(255);
		rect(pos.x, pos.y, longitud, ANCHURA);

		if (this.seleccionado) {
			fill(0, 255, 0);
		} else {
			fill(255, 0, 0);
		}
		rect(value_pos.x, value_pos.y, ANCHURA, ANCHURA);
	}

	boolean isClickado() {
		return (mouseX > value_pos.x && mouseX < value_pos.x + ANCHURA &&
				mouseY > value_pos.y && mouseY < value_pos.y + ANCHURA);
	}

}
