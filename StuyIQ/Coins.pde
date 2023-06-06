class Coin {
  float x;
  float y;

  Coin(float x, float y) {
    this.x = x;
    this.y = y;
  }
}


void drawCoins() {
  fill(255, 255, 0); // Yellow color for the coins
  int centerX = (NUM_TILES_X / 2) * TILE_SIZE;
  int centerY = (NUM_TILES_Y / 2) * TILE_SIZE;

  // Spawn 4 yellow coins in the middle of the entire background
  coins.add(new Coin(centerX - COIN_SIZE, centerY - COIN_SIZE));
  coins.add(new Coin(centerX + COIN_SIZE, centerY - COIN_SIZE));
  coins.add(new Coin(centerX - COIN_SIZE, centerY + COIN_SIZE));
  coins.add(new Coin(centerX + COIN_SIZE, centerY + COIN_SIZE));

  // Draw the coins on the screen
  for (Coin coin : coins) {
    ellipse(coin.x, coin.y, COIN_SIZE, COIN_SIZE);
  }
}
