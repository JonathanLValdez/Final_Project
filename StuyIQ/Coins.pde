void drawCoins() {
  fill(255, 255, 0); // Yellow color for the coins
  int centerX = (NUM_TILES_X / 2) * TILE_SIZE;
  int centerY = (NUM_TILES_Y / 2) * TILE_SIZE;

  // Spawn 4 yellow coins in the middle of the entire background
  ellipse(centerX - COIN_SIZE, centerY - COIN_SIZE, COIN_SIZE, COIN_SIZE);
  ellipse(centerX + COIN_SIZE, centerY - COIN_SIZE, COIN_SIZE, COIN_SIZE);
  ellipse(centerX - COIN_SIZE, centerY + COIN_SIZE, COIN_SIZE, COIN_SIZE);
  ellipse(centerX + COIN_SIZE, centerY + COIN_SIZE, COIN_SIZE, COIN_SIZE);
}

