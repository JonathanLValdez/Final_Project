
int[][] tiles; // Array to store the tile pattern
int[][] blueDots; // Array to store the blue dots positions
boolean blueDotsMovingLeft; // Flag to track the direction of blue dots movement

void levelOneSetup() {
  // Initialize the tiles array
  tiles = new int[NUM_TILES_X][NUM_TILES_Y];
  // Create obstacles for level one
  createObstacles();
  // Set the pattern of tiles (white color) inside the borders
  for (int i = 1; i < NUM_TILES_X - 1; i++) {
    for (int j = 1; j < NUM_TILES_Y - 1; j++) {
      tiles[i][j] = 0;
    }
  }

  // Set the pattern of tiles (alternating 0 and 1) for even rows and columns
  for (int i = 1; i < NUM_TILES_X - 1; i += 2) {
    for (int j = 1; j < NUM_TILES_Y - 1; j += 2) {
      tiles[i][j] = 1;
    }
  }

  // Initialize the blue dots array
  blueDots = new int[NUM_TILES_X][NUM_TILES_Y];

  // Set the initial positions of the blue dots in the middle of the board
  int startRow = NUM_TILES_Y / 2 - 1;
  int startCol = NUM_TILES_X / 2 - 1;

  // Set three blue dots to move left and the others to move right
  blueDotsMovingLeft = true;
  for (int i = startRow; i <= startRow + 1; i++) {
    for (int j = startCol; j <= startCol + 1; j++) {
      if (blueDotsMovingLeft) {
        if (j % 2 == 0) {
          blueDots[i][j] = 1;
        }
      } else {
        if (j % 2 == 1) {
          blueDots[i][j] = 1;
        }
      }
    }
  }
}
