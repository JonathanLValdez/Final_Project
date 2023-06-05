boolean isLevelStarting = false; // Flag to track if the level is starting
int playerX, playerY; // Player position variables
final int PLAYER_SIZE = 10;
final int BOX_SIZE = 50;

void drawPlayer() {
  if (isLevelStarting) {
    fill(255, 0, 0); // Red color for the player square
    rect(playerX, playerY, PLAYER_SIZE, PLAYER_SIZE);
  }
}

void spawnRedSquare(int x, int y) {
  fill(255, 0, 0); // Red color for the red square
  rect(x, y, PLAYER_SIZE, PLAYER_SIZE);
}

void drawBoxes() {
  fill(0, 255, 0); // Green color for the boxes
  
  // Draw box in the bottom left
  rect(BORDER_SIZE, WINDOW_HEIGHT - BORDER_SIZE - BOX_SIZE, BOX_SIZE, BOX_SIZE);
  
  // Draw box in the top right
  rect(WINDOW_WIDTH - BORDER_SIZE - BOX_SIZE, BORDER_SIZE, BOX_SIZE, BOX_SIZE);
}
