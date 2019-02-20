public class Copo {

  private static final int LIMITE_SUPERIOR = -100;
  private static final float VELOCIDAD_POR_SIZE = 0.5;
  private static final int MIN_SIZE = 2;
  private static final int MAX_SIZE = 16;

  private PImage imagen;
  protected PVector pos;
  protected PVector vel;
  protected PVector acc;
  protected float r;
  protected PVector gravedad;

  Copo(PImage imagen, PVector gravedad) {
    this.imagen = imagen;
    this.gravedad = gravedad;

    float x = random(width);
    float y = random(height);
    this.inicializarCopo(x, y);
  }

  public void reiniciarCopo() {
    float x = random(width);
    float y = random(LIMITE_SUPERIOR, LIMITE_SUPERIOR/2);
    this.inicializarCopo(x, y);
  }

  private void inicializarCopo(float x, float y) {
    this.pos = new PVector(x, y);
    this.vel = new PVector(0, 0);
    this.acc = new PVector();
    this.r = random(MIN_SIZE, MAX_SIZE);
  }

  public void update(PVector viento) {
    this.acc.add(gravedad);
    this.acc.add(viento);

    this.vel.add(acc);
    this.vel.limit(r * VELOCIDAD_POR_SIZE);

    pos.add(vel);
    acc.mult(0);

    if (pos.y > height + r) {
      reiniciarCopo();
    }
  }

  public void show() {
    image(imagen, this.pos.x, this.pos.y, this.r * 2, this.r * 2);
  }
}
