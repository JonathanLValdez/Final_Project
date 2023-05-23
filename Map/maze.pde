import processing.core.PApplet;
//Game Setup

  // Game Constants
  private static final int WINDOW_WIDTH = 800;
  private static final int WINDOW_HEIGHT = 600;
  private static final int SQUARE_SIZE = 20;

  // Red Square Position
  private int redSquareX;
  private int redSquareY;



  public void settings() {
    size(WINDOW_WIDTH, WINDOW_HEIGHT);
  }


  public void setup() {
    // Set up the initial position of the red square
    redSquareX = width / 2;
    redSquareY = height / 2;
  }

  public void draw() {
    background(255);
    drawRedSquare();
  }

  private void drawRedSquare() {
    fill(255, 0, 0); // Red color
    rect(redSquareX, redSquareY, SQUARE_SIZE, SQUARE_SIZE);
  }

//move in player class
  public void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP || key == 'w' || key == 'W') {
        moveRedSquare(0, -SQUARE_SIZE);
      } else if (keyCode == DOWN || key == 's' || key == 'S') {
        moveRedSquare(0, SQUARE_SIZE);
      } else if (keyCode == LEFT || key == 'a' || key == 'A') {
        moveRedSquare(-SQUARE_SIZE, 0);
      } else if (keyCode == RIGHT || key == 'd' || key == 'D') {
        moveRedSquare(SQUARE_SIZE, 0);
      }
    }
  }

//Character Redsquare class
  private void moveRedSquare(int deltaX, int deltaY) {
    int nextX = redSquareX + deltaX;
    int nextY = redSquareY + deltaY;

    // Check if the next position is within the game boundaries
    if (nextX >= 0 && nextX <= width - SQUARE_SIZE && nextY >= 0 && nextY <= height - SQUARE_SIZE) {
      redSquareX = nextX;
      redSquareY = nextY;
    }
  }
}
