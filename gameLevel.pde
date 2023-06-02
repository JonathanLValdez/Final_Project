
public class GameLevel {
  /** Spawn point of the level. */
  private Point spawnPoint;

  /** The ID of the level. The first level has an ID of 1. */
  private int id;

  /** The message that is displayed before the level. */
  private String levelTitle;

  /** A list of all of the level's tiles. */
  private ArrayList<Tile> tileMap;

  /** A list of all of the level's dots. */
  public ArrayList<Dot> dots;

  /** A list of all of the level's coins. **/
  public ArrayList<Coin> coins;

  /** The area of the level, not including background tiles. */
  private Area levelArea;

  public GameLevel() {
    this.levelArea = new Area();
    this.tileMap = new ArrayList<Tile>();
    this.dots = new ArrayList<Dot>();
    this.spawnPoint = new Point(20, 20);
    this.id = -1;
    this.levelTitle = "\"Intimidating message\nhere\"";
  }

  public GameLevel(Point spawn, int id) {
    this.levelArea = new Area();
    this.tileMap = new ArrayList<Tile>();
    this.dots = new ArrayList<Dot>();
    this.spawnPoint = spawn;
    this.id = id;
    this.levelTitle = "\"Intimidating message\nhere\"";
  }

  /**
   * @return spawnPoint
   */
  public Point getSpawnPoint() {
    return this.spawnPoint;
  }

  /**
   * @return id
   */
  public int getID() {
    return this.id;
  }

  /**
   * @return tileMap
   */
  public ArrayList<Tile> getTileMap() {
    return this.tileMap;
  }

  /**
   * @return levelTitle
   */
  public String getTitle() {
    return this.levelTitle;
  }

  /** Draw the tiles based on a text file in the maps package.
   *
   *
   */
  public void drawTiles(Graphics g) {

    Graphics2D g2 = (Graphics2D) g;

    try {
      /*for (Tile t : this.tileMap) {
        //Background
        if (t.getType() == 0) {
          g.setColor(new Color(180, 181, 254));
          g.fillRect(t.getX(), t.getY(), 40, 40);
        }
      }*/

      g.setColor(new Color(180, 181, 254));
      g.fillRect(0, 22, 800, 622);

      //Border around level
      g2.setColor(Color.BLACK);
      g2.fill(this.levelArea);

      for (Tile t : this.tileMap) {
        t.draw(this, g);
      }
    } catch (Exception e) {
      System.out.println("File not found.");
      TextFileWriter.appendToFile(Game.logFilePath, Game.getStringFromStackTrace(e));
    }
  }

  public void drawDots(Graphics g) {
    for (Dot dot : this.dots) {
      dot.draw(g);
    }
  }

  public void updateDots() {
    if (this.dots != null) {
      for (Dot dot : this.dots) {
        dot.update();
      }
    }
  }

public void drawCoins(Graphics g) {
    if (this.coins != null) {
        for (Coin coin : this.coins) {
            coin.draw(g);
        }
    }
}
public boolean allCoinsCollected() {
    if (this.coins != null) {
        for (Coin coin : this.coins) {
            if (!coin.collected) {
                return false;
            }
        }
    }
    return true;
}
