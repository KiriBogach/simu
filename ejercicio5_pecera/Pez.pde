public class Pez {

  protected PVector location;
  protected PVector velocity;
  protected PVector acceleration;
  protected float topspeed;
  protected PImage imagen;
  protected PVector fuerzaAgua;
  protected float desvioX, desvioY;
  protected ArrayList<PVector> oxigeno;


  public Pez(PImage imagen) {
    this.imagen = imagen;
    this.location = new PVector(random(width), random(200, height));
    this.velocity = new PVector(0, 0);
    this.topspeed = 2;
    this.fuerzaAgua = new PVector(random(-2, 2), random(-2, 2));
    this.oxigeno = new ArrayList<PVector>();
  }

  public void update() {
    // Oxigeno que no ha salido a la superficie
    ArrayList<PVector> alive = new ArrayList<PVector>();
    for (PVector ox : this.oxigeno) {
      ox.y--;
      if (ox.y > 140) {
        alive.add(ox);
      }
    }
    this.oxigeno = alive;

    // Nuevo Oxigeno
    if (random(1) > 0.995) {
      this.oxigeno.add(this.location.copy());
    }

    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, this.location);

    // Para que no se queden en el ratón
    if (abs(dir.x) < 40 && abs(dir.y) < 40) {
      return;
    }

    dir.normalize();
    dir.mult(0.5);
    this.acceleration = dir;

    this.fuerzaAgua.normalize();
    this.fuerzaAgua.mult(0.2);

    if (random(1) > 0.4) {
      this.velocity.add(acceleration);
    }
    this.velocity.add(this.fuerzaAgua);
    this.velocity.limit(topspeed);

    // Para que no salgan del agua
    if (this.location.y + this.velocity.y < 180) {
      return;
    }

    this.location.add(this.velocity);
  }

  public void display() {
    float theta = this.velocity.heading();

    pushMatrix();

    translate(this.location.x, this.location.y);
    rotate(theta);
    image(this.imagen, 0, 0, 60, 50);

    popMatrix();

    strokeWeight(1);
    stroke(255);
    for (PVector ox : this.oxigeno) {
      fill(255);
      ellipse(ox.x, ox.y, 4, 4);
    }
  }

  public void checkEdges() {
    if (this.location.x > width) {
      this.location.x = 0;
    } else if (this.location.x < 0) {
      this.location.x = width;
    }

    if (this.location.y > height) {
      this.location.y = height;
    }
  }
}
