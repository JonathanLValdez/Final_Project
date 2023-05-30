
public class Dot {
    private PPoint pos1;
    private PPoint pos2;
    private float x;
    private float y;
    private int snapX;
    private int snapY;
    private float speed;
    private boolean moveToPos1;
    private boolean vertMovement;

    public Dot() {
        this.x = 0;
        this.y = 0;
        this.snapX = 0;
        this.snapY = 0;
        this.pos1 = new PPoint(0, 0);
        this.pos2 = new PPoint(0, 0);
        this.speed = 1;
        this.moveToPos1 = true;
        this.vertMovement = false;
    }

    public Dot(int x, int y, PPoint pos1, PPoint pos2, float speed, boolean moveToPos1, boolean vertMovement) {
        this.x = x * 40;
        this.y = y * 40;
        this.snapX = x;
        this.snapY = y;
        this.pos1 = pos1;
        this.pos2 = pos2;
        this.speed = speed;
        this.moveToPos1 = moveToPos1;
        this.vertMovement = vertMovement;
    }

    public void draw(PGraphics g) {
        g.fill(0);
        g.ellipse(this.x - 10 + 20, this.y - 10 + 20 + 22, 20, 20);
        g.fill(0, 0, 255);
        g.ellipse(this.x - 8 + 20, this.y - 8 + 20 + 22, 16, 16);
    }

    public void update() {
        this.snapX = (int) (this.x / 40);
        this.snapY = (int) (this.y / 40);

        if (moveToPos1) {
            if (!this.vertMovement)
                this.x -= this.speed;
            else
                this.y -= this.speed;
            if (this.snapX < this.pos1.x || this.snapY < this.pos1.y) this.moveToPos1 = false;
        } else {
            if (!this.vertMovement)
                this.x += this.speed;
            else
                this.y += this.speed;
            if (this.snapX > this.pos2.x || this.snapY > this.pos2.y) this.moveToPos1 = true;
        }
    }

    public PPoint getPos1() {
        return this.pos1;
    }

    public PPoint getPos2() {
        return this.pos2;
    }

    public float getX() {
        return this.x;
    }

    public float getY() {
        return this.y;
    }

    public int getSnapX() {
        return this.snapX;
    }

    public int getSnapY() {
        return this.snapY;
    }

    public float getSpeed() {
        return this.speed;
    }
}
