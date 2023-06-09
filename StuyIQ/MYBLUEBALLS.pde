class Obstacle {
  float x; // X position of the obstacle
  float y; // Y position of the obstacle
  float speed; // Speed of the obstacle
  int direction; // Direction of movement (1 or -1)
  
  Obstacle(float x, float y, float speed, int direction) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.direction = direction;
  }
}

void createObstacles() {
  for (int i = 0; i < 10; i++) {
  float x = random(BORDER_SIZE, WINDOW_WIDTH - BORDER_SIZE - OBSTACLE_SIZE);
  float y = random(BORDER_SIZE, WINDOW_HEIGHT - BORDER_SIZE - OBSTACLE_SIZE);
  float speed = random(5, 10); // Adjust the speed range as needed
  int direction = random(2) == 0 ? 1 : -1; // Randomly choose between 1 and -1 for direction
  obstacles.add(new Obstacle(x, y, speed, direction));
}
}

void drawObstacles() {
  fill(0, 0, 139); // Dark blue color for the obstacles
  for (Obstacle obstacle : obstacles) {
    ellipse(obstacle.x, obstacle.y, OBSTACLE_SIZE, OBSTACLE_SIZE);
  }
}

void moveObstacles() {
  for (Obstacle obstacle : obstacles) {
    // Move the obstacles vertically
    obstacle.y += obstacle.direction * obstacle.speed;

// Check for collision with the green boxes
if ((obstacle.x + OBSTACLE_SIZE >= BORDER_SIZE && obstacle.x <= BORDER_SIZE + BOX_SIZE &&
     obstacle.y + OBSTACLE_SIZE >= WINDOW_HEIGHT - BORDER_SIZE - BOX_SIZE && obstacle.y <= WINDOW_HEIGHT - BORDER_SIZE) ||
    (obstacle.x + OBSTACLE_SIZE >= WINDOW_WIDTH - BORDER_SIZE - BOX_SIZE && obstacle.x <= WINDOW_WIDTH - BORDER_SIZE &&
     obstacle.y + OBSTACLE_SIZE >= BORDER_SIZE && obstacle.y <= BORDER_SIZE + BOX_SIZE)) {
  // Collision with either green box occurred
  
  if (obstacle.x <= BORDER_SIZE) {
    obstacle.x -= obstacle.direction * obstacle.speed;
  } else if (obstacle.x + OBSTACLE_SIZE >= BORDER_SIZE + BOX_SIZE) {
    obstacle.x -= obstacle.direction * obstacle.speed;
  }
  
  if (obstacle.y <= BORDER_SIZE) {
    obstacle.y -= obstacle.direction * obstacle.speed;
  } else if (obstacle.y + OBSTACLE_SIZE >= WINDOW_HEIGHT - BORDER_SIZE - BOX_SIZE) {
    obstacle.y -= obstacle.direction * obstacle.speed;
  }
  
  obstacle.direction *= -1; // Reverse the direction of the obstacle
}

    // Reverse the direction if the obstacle reaches the top or bottom border
    if (obstacle.y <= BORDER_SIZE || obstacle.y >= WINDOW_HEIGHT - BORDER_SIZE - OBSTACLE_SIZE) {
      obstacle.direction *= -1;
    }
  }
}
