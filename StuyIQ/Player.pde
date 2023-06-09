
int playerX, playerY; // Player position variables
final int PLAYER_SIZE = 20;
final int BOX_SIZE = 60;

void drawPlayer(){
  if (isLevelStarting) {
    fill(255, 0, 0); // Red color for the player square
    rect(playerX, playerY, PLAYER_SIZE, PLAYER_SIZE);
  }
}

void spawnRedSquare(int x, int y) {
  fill(255, 0, 0); // Red color for the red square
  rect(x, y, PLAYER_SIZE, PLAYER_SIZE);
}
