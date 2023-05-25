import processing.core.PApplet;
import processing.core.PFont;

  private static final int WINDOW_WIDTH = 800;
  private static final int WINDOW_HEIGHT = 600;
  private static final int BUTTON_WIDTH = 200;
  private static final int BUTTON_HEIGHT = 80;

  private PFont titleFont;
  private Button playButton;
  private Button loadLevelsButton;

  public void settings() {
    size(WINDOW_WIDTH, WINDOW_HEIGHT);
  }

  public void setup() {
    titleFont = createFont("Arial", 64);
    playButton = new Button(
      (WINDOW_WIDTH - BUTTON_WIDTH) / 2,
      (WINDOW_HEIGHT - BUTTON_HEIGHT) / 2 - 40,
      BUTTON_WIDTH,
      BUTTON_HEIGHT,
      "Play"
    );
    loadLevelsButton = new Button(
      (WINDOW_WIDTH - BUTTON_WIDTH) / 2,
      (WINDOW_HEIGHT - BUTTON_HEIGHT) / 2 + 40,
      BUTTON_WIDTH,
      BUTTON_HEIGHT,
      "Load Levels"
    );
  }

  public void draw() {
    background(135, 206, 235); // Light blue sky background

    textAlign(CENTER, CENTER);
    textFont(titleFont);
    textSize(64);
    fill(255);
    text("TEST YOUR STUY IQ", width / 2, height / 2 - 200);

    playButton.display();
    loadLevelsButton.display();
  }

  public void mousePressed() {
    if (playButton.isMouseOver()) {
      // Handle play button click
      println("Play button clicked!");
    } else if (loadLevelsButton.isMouseOver()) {
      // Handle load levels button click
      println("Load levels button clicked!");
    }
  }

  class Button {
    private int x, y;
    private int width, height;
    private String label;

    public Button(int x, int y, int width, int height, String label) {
      this.x = x;
      this.y = y;
      this.width = width;
      this.height = height;
      this.label = label;
    }

    public void display() {
      stroke(0);
      fill(255);
      rect(x, y, width, height);
      fill(0);
      textSize(32);
      textAlign(CENTER, CENTER);
      text(label, x + width / 2, y + height / 2);
    }

    public boolean isMouseOver() {
      return mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height;
    }
  }

}

