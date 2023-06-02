import processing.core.PApplet;
import processing.core.PConstants;
import java.awt.Graphics;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import javax.swing.Timer;

    private static Game game;
    private Timer timer;

    private static final int INTRO = 0;
    private static final int MAIN_MENU = 1;
    private static final int LEVEL_TITLE = 2;
    private static final int LEVEL = 3;

    private static int gameState = INTRO;

    private boolean showIntro = false;
    private boolean fadeOutIntro = false;
    private int introTextOpacity = 0;

    public Game() {
        timer = new Timer(5, this);
        timer.start();
    }

    public void settings (){ 
       size (800,800);
}

    public void actionPerformed(ActionEvent e) {
        update();
        repaint();
    }


    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        render(g);
        Toolkit.getDefaultToolkit().sync();
    }

    public void update() {
        if (gameState == INTRO) {
            if (introTextOpacity == 0 && !fadeOutIntro) {
                // Play drone sound
            }

            if (introTextOpacity < 255 && !fadeOutIntro) {
                introTextOpacity += 255 / 10;
                if (introTextOpacity > 255)
                    introTextOpacity = 255;
            }

            if (introTextOpacity == 225) {
                new Thread() {
                    public void run() {
                        try {
                            Thread.sleep(3500);
                        } catch (InterruptedException e) {
                            // Handle the exception
                        }
                        fadeOutIntro = true;
                        // Start background music
                    }
                }.start();
            }

            if (fadeOutIntro) {
                if (introTextOpacity > 0) {
                    introTextOpacity -= 255 / 20;
                    if (introTextOpacity < 0)
                        introTextOpacity = 0;
                }
            }

            if (fadeOutIntro && introTextOpacity == 0 && !endIntro.isAlive()) {
                // Start endIntro thread
            }
        } else if (gameState == MAIN_MENU) {
            if (showIntro) {
                if (key == ENTER) {
                    showIntro = false;
                    gameState = LEVEL_TITLE;
                    // Log message: "Game state set to LEVEL_TITLE"
                    player.reset();
                    levelNum = 1;
                    // Initialize level with player and levelNum
                    new Thread() {
                        public void run() {
                            try {
                                Thread.sleep(1750);
                            } catch (InterruptedException e) {
                                // Handle the exception
                            }
                            gameState = LEVEL;
                            // Log message: "Game state set to LEVEL"
                        }
                    }.start();
                }
            } else {
                if (mousePressed && mouseX > 304 && mouseY < 323 && mouseX < 515 && mouseY > 192) {
                    showIntro = true;
                }
            }
        } else if (gameState == LEVEL) {
            if (mouseOnWindow && mouseX <= 65 && mouseY <= 22 && mousePressed) {
                gameState = MAIN_MENU;
            }
        }
    }
}
