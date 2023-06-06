final int MENU_STATE = 0;
final int PLAY_STATE = 1;
final int GAMEOVER_STATE = 2;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>(); // List to store the obstacles
ArrayList<Coin> coins = new ArrayList<Coin>();
final int WINDOW_WIDTH = 800;
final int WINDOW_HEIGHT = 600;
final int BORDER_SIZE = 10;
final int COIN_SIZE = 20;
final int OBSTACLE_SIZE = 30;
final int TILE_SIZE = 50;
final int NUM_TILES_X = (WINDOW_WIDTH - 2 * BORDER_SIZE) / TILE_SIZE;
final int NUM_TILES_Y = (WINDOW_HEIGHT - 2 * BORDER_SIZE) / TILE_SIZE;
int state = MENU_STATE;
int score = 0;
int deathCount = 0;

boolean isLevelStarting = true; // Flag to track if the level is starting

void setup() {
  size(800, 600);
  background(135, 206, 235); // Sky blue color
  
// Set initial player position
playerX = BORDER_SIZE + OBSTACLE_SIZE + (BOX_SIZE - PLAYER_SIZE) / 2;
playerY = WINDOW_HEIGHT - BORDER_SIZE - BOX_SIZE + (BOX_SIZE - PLAYER_SIZE) / 2;
}

void draw() {
  switch (state) {
    case MENU_STATE:
      drawMenu();
      break;
    case PLAY_STATE:
      drawGame();
      drawPlayer();
      break;
    case GAMEOVER_STATE:
      // drawGameOver();
      break;
  }
}

void keyPressed() {
  if (state == MENU_STATE && key == ' ') {
    state = PLAY_STATE;
    score = 0;
    deathCount++;
    levelOneSetup();
  } else if (state == GAMEOVER_STATE && key == ' ') {
    state = MENU_STATE;
  }
  
  if (state == PLAY_STATE) {
    if (isLevelStarting) {
      if (keyCode == LEFT || key == 'a' || key == 'A') {
        if (playerX > BORDER_SIZE + PLAYER_SIZE / 2) {
          playerX -= PLAYER_SIZE;
        }
      } else if (keyCode == RIGHT || key == 'd' || key == 'D') {
        if (playerX < WINDOW_WIDTH - BORDER_SIZE - PLAYER_SIZE / 2) {
          playerX += PLAYER_SIZE;
        }
      } else if (keyCode == UP || key == 'w' || key == 'W') {
        if (playerY > BORDER_SIZE + PLAYER_SIZE / 2) {
          playerY -= PLAYER_SIZE;
        }
      } else if (keyCode == DOWN || key == 's' || key == 'S') {
        if (playerY < WINDOW_HEIGHT - BORDER_SIZE - PLAYER_SIZE / 2) {
          playerY += PLAYER_SIZE;
        }
      }
    }
  }
}


void drawMenu() {
  background(135, 206, 235); // Sky blue color
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(30);
  text("Test Your StuyIQ", width / 2, height / 2 - 50);
  textSize(20);
  text("Press Space to Play", width / 2, height / 2 + 50);
}

void drawBorders() {
  noFill();
  stroke(0);
  strokeWeight(BORDER_SIZE);
  rect(BORDER_SIZE / 2, BORDER_SIZE / 2, width - BORDER_SIZE, height - BORDER_SIZE);
}

void drawGame() {
  background(135, 206, 235); // Sky blue color
  drawBorders();
  drawBoxes();
  drawCoins();
  moveObstacles(); // Move the obstacles in each frame
  drawObstacles(); // Draw the obstacles on the screen
  //Death count and score count
  textAlign(LEFT, TOP);
  fill(255, 255, 0); // Yellow color
  textFont(createFont("Times New Roman", 24));
  text("Score: " + score, 10, 10);
  text("Death Count: " + deathCount, 10, 40);
  checkCoinCollision();
 // Check for collision between player and obstacles
  for (Obstacle obstacle : obstacles) {
    float distance = dist(playerX, playerY, obstacle.x, obstacle.y);
    if (distance <= OBSTACLE_SIZE / 2) {
      // Collision occurred with an obstacle, reset player position, score, and update death count
      playerX = BORDER_SIZE + OBSTACLE_SIZE + (BOX_SIZE - PLAYER_SIZE) / 2;
      playerY = WINDOW_HEIGHT - BORDER_SIZE - BOX_SIZE + (BOX_SIZE - PLAYER_SIZE) / 2;
      coins.clear();
      score = 0;
      deathCount++;
      break;// Exit the loop since the collision has been handled
    }
  }
/*
// Check for collision between player and coins
for (int i = coins.size() - 1; i >= 0; i--) {
  Coin coin = coins.get(i);
  

  // Calculate the distance between the player's center and the coin's center
  float distance = dist(playerX + PLAYER_SIZE / 2, playerY + PLAYER_SIZE / 2, coin.x, coin.y);

  // Check if the distance is less than or equal to the sum of half the player's size and half the coin's size
  if (distance <= (PLAYER_SIZE + COIN_SIZE) ) {
    // Collision occurred, remove the coin and increment score
    coins.remove(i);
    score++;
    break; // Exit the loop since the collision has been handled
  }
}
*/
}
void drawBoxes() {
  fill(0, 255, 0); // Green color for the boxes
  
  // Draw box in the bottom left
  rect(BORDER_SIZE, WINDOW_HEIGHT - BORDER_SIZE - BOX_SIZE, BOX_SIZE, BOX_SIZE);
  
  // Draw box in the top right
  rect(WINDOW_WIDTH - BORDER_SIZE - BOX_SIZE, BORDER_SIZE, BOX_SIZE, BOX_SIZE);
}

void drawGameOver() {
  background(135, 206, 235); // Sky blue color
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(30);
  text("You will definitely pay next...", width / 2, height / 2);
  textSize(20);
  text("Press Space to Restart", width / 2, height / 2 + 50);
}
