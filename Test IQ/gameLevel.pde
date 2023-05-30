import processing.core.PApplet;
import processing.core.PVector;
import processing.core.PGraphics;
import java.util.ArrayList;

public class gameLevel {

  /** Spawn point of the level. */
  private PVector spawnPoint;

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
  PGraphics levelArea;

  public Level() {
    this.levelArea = new PGraphics();
    this.tileMap = new ArrayList<Tile>();
    this.dots = new ArrayList<Dot>();
    this.spawnPoint = new PVector(20, 20);
    this.id = -1;
    this.levelTitle = "";
  }

  public Level(PVector spawn, int id) {
    this.levelArea = new PGraphics();
    this.tileMap = new ArrayList<Tile>();
    this.dots = new ArrayList<Dot>();
    this.spawnPoint = spawn;
    this.id = id;
    this.levelTitle = "";
  }

  public PVector getSpawnPoint() {
    return this.spawnPoint;
  }

  public int getID() {
    return this.id;
  }

  public ArrayList<Tile> getTileMap() {
    return this.tileMap;
  }

  public String getTitle() {
    return this.levelTitle;
  }



  /** Draw the tiles based on a text file in the maps package. */
  public void drawTiles(PApplet p) {

    PGraphics g = p.g;

    try {
      /*for (Tile t : this.tileMap) {
        //Background
        if (t.getType() == 0) {
          g.setColor(new Color(180, 181, 254));
          g.fillRect(t.getX(), t.getY(), 40, 40);
        }
      }*/

      g.fill(180, 181, 254);
      g.rect(0, 0, 800, 600);

      //Border around level
      g.fill(0);
      g.shape(this.levelArea);

      for (Tile t : this.tileMap) {

        if (t.getType() != 0) {
          //Floor Tile
          if (t.getType() == 1) {

            if (t.getSnapX() % 2 == 0) {
              if (t.getSnapY() % 2 == 0) {
                g.fill(230, 230, 255);
              } else {
                g.fill(255);
              }
            } else if (t.getSnapX() % 2 == 

  /** Draw the tiles based on a text file in the maps package. */
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
      g.fillRect(0, 0, 800, 600);
      
      //Border around level
      g2.setColor(Color.BLACK);
      g2.fill(this.levelArea);
      
      for (Tile t : this.tileMap) {
        
        if (t.getType() != 0) {
          //Floor Tile
          if (t.getType() == 1) {
          
            if (t.getSnapX() % 2 == 0) {
              if (t.getSnapY() % 2 == 0) {
                g.setColor(new Color(230, 230, 255));
              } else {
                g.setColor(Color.WHITE);
              }
            } else if (t.getSnapX() % 2 == 1) {
              if (t.getSnapY() % 2 == 0) {
                g.setColor(Color.WHITE);
              } else {
                g.setColor(new Color(230, 230, 255));
              }
            }
            g.fillRect(t.getX(), t.getY(), 40, 40);
          
          //Checkpoint
          } else if (t.getType() == 2) {
            g.setColor(new Color(181, 254, 180));
            g.fillRect(t.getX(), t.getY(), 40, 40);
            
          //Goal
          } else if (t.getType() == 3) {
            g.setColor(new Color(181, 254, 180));
            g.fillRect(t.getX(), t.getY(), 40, 40);
          }
        }
        
      }
    } catch (Exception e) {
      System.out.println("File not found.");
      e.printStackTrace();
    }
  }
  
  
  
  public void drawDots(Graphics g) {
    for (Dot dot : this.dots) dot.draw(g);
  }
  
  
  
  public void updateDots() {
    if (this.dots != null)
      for (Dot dot : this.dots) dot.update();
  }
  
  
  
  public void drawCoins(Graphics g) {
    if (this.coins != null)
      for (Coin coin : this.coins) coin.draw(g);
  }
  
  
  
  public boolean allCoinsCollected() {
    if (this.coins != null) {
      for (Coin coin : this.coins) {
        if (!coin.collected) return false;
      }
    }
    return true;
  }
          }
  
  
  
