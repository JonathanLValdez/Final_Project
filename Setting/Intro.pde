
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
