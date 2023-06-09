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
  // Draw the coins on the screen
  for (Coin coin : coins) {
    ellipse(coin.x, coin.y, COIN_SIZE, COIN_SIZE);
  }
}

void checkCoinCollision(){
  for (int i = coins.size()-1; i<=0; i--){
    Coin coin = coins.get(i);
    if (playerX == coin.x && playerY == coin.y) {
      coins.remove(i);
      score++;
    }
  }
}
