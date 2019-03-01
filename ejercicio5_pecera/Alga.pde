public class Alga {

  protected PImage imagen;
  protected PVector location;
  protected PVector dir;
  protected float angle;
  protected float sum;

  public Alga(float x, float y, PImage imagen) {
    this.location = new PVector(x, y);
    this.imagen = imagen;
    this.angle = random(TWO_PI);
    this.sum = random(0.05);
  }

  public void update() {
    float x = map(sin(this.angle * 0.5), -1, 1, 0, width);
    float y = height / 2;

    PVector next = new PVector(x, y);
    this.dir = PVector.sub(next, location);
    this.dir.normalize();
    
    this.angle = this.angle + this.sum;
  }

  public void display() {
    float theta = this.dir.heading();

    pushMatrix();

    translate(this.location.x, this.location.y);
    rotate(theta + PI / 2);
    image(this.imagen, 0, 0, 40, 40);
    
    popMatrix();
  }
}
