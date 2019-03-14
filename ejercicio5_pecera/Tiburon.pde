public class Tiburon {

  protected PImage imagen;
  protected PVector location;
  protected PVector velocity;
  protected PVector acceleration;
  protected float topspeed;
  protected float angle;

  public Tiburon(PImage imagen) {
    this.imagen = imagen;
    this.location = new PVector(width / 2, height / 2);
    this.velocity = new PVector(0, 0);
    this.topspeed = 1;
    this.angle = 0;
  }

  public void update() {
    float x = map(sin(this.angle * 0.6) * sin(this.angle * 0.3), -1, 1, 0, width);
    float y = map(cos(this.angle * 0.3), -1, 1, 200, height);

    PVector next = new PVector(x, y);

    PVector dir = PVector.sub(next, location);
    dir.normalize();
    dir.mult(0.5);
    this.acceleration = dir;

    this.velocity.add(acceleration);
    this.velocity.limit(topspeed);
    this.location.add(velocity);

    this.angle = this.angle + 0.015;
  }

  public void display() {
    float theta = velocity.heading();

    pushMatrix();

    translate(this.location.x, this.location.y);
    rotate(theta);
    image(this.imagen, 0, 0, 300, 200);
    
    popMatrix();
  }
}
