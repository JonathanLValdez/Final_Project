import processing.core.PApplet;

public class Player {
  private PApplet p;

  private int x;
  private int y;
  private int snapX;
  private int snapY;

  private boolean collidingUp;
  private boolean collidingDown;
  private boolean collidingLeft;
  private boolean collidingRight;

  private boolean dead;
  private double opacity;

  public Player(PApplet p) {
    this.p = p;
    this.x = 400;
    this.y = 300;
    this.snapX = x / 40;
    this.snapY = y / 40;
    this.collidingUp = false;
    this.collidingDown = false;
    this.collidingLeft = false;
    this.collidingRight = false;
    this.dead = false;
    this.opacity = 255;
  }

  public void draw() {
    p.fill(0, 0, 0, (int) opacity);
    p.rect(x - 15, y - 15 + 22, 31, 31);
    p.fill(255, 0, 0, (int) opacity);
    p.rect(x - 12, y - 12 + 22, 25, 25);
  }

  public void update() {
    snapX = x / 40;
    snapY = y / 40;

    // Update collision detection

    if (p.keyPressed && p.key == 'w' && !collidingUp) {
      y--;
    }
    if (p.keyPressed && p.key == 's' && !collidingDown) {
      y++;
    }
    if (p.keyPressed && p.key == 'a' && !collidingLeft) {
      x--;
    }
    if (p.keyPressed && p.key == 'd' && !collidingRight) {
      x++;
    }
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public int getSnapX() {
    return snapX;
  }

  public int getSnapY() {
    return snapY;
  }

  public boolean isCollidingUp() {
    return collidingUp;
  }

  public boolean isCollidingDown() {
    return collidingDown;
  }

  public boolean isCollidingLeft() {
    return collidingLeft;
  }

  public boolean isCollidingRight() {
    return collidingRight;
  }

  public boolean isDead() {
    return dead;
  }

  public void setDead(boolean dead) {
    this.dead = dead;
  }

  public double getOpacity() {
    return opacity;
  }

  public void reset() {
    x = 400;
    y = 300;
    snapX = x / 40;
    snapY = y / 40;
    collidingUp = false;
    collidingDown = false;
    collidingLeft = false;
    collidingRight = false;
    dead = false;
    opacity = 255;
  }
}
