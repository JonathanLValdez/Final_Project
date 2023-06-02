import processing.core.PApplet;
import processing.core.PConstants;

public class Coin {
    private int x;
    private int y;
    private double snapX;
    private double snapY;
    private boolean collected;

    public Coin(int x, int y) {
        this.x = x;
        this.y = y;
        this.snapX = x / 40.0;
        this.snapY = y / 40.0;
        this.collected = false;
    }

    public void draw(PApplet g) {
        if (!collected) {
            g.fill(0);
            g.ellipseMode(PConstants.CENTER);
            g.ellipse(this.x + 20, this.y + 20 + 22, 40, 40);
            g.fill(255, 255, 0);
            g.ellipse(this.x + 20, this.y + 20 + 22, 32, 32);
        }
    }

    public int getX() {
        return this.x;
    }

    public int getY() {
        return this.y;
    }

    public int getSnapX() {
        return (int) this.snapX;
    }

    public int getSnapY() {
        return (int) this.snapY;
    }

    public boolean isCollected() {
        return collected;
    }

    public void setCollected(boolean collected) {
        this.collected = collected;
    }
}
