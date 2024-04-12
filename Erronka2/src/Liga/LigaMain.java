package Liga;

import java.awt.EventQueue;

/**
 * LigaMain klasea aplikazioa exekutatzeko klasea da.
 * 
 */
public class LigaMain {

    
    /** 
     * Main metodoa, aplikazioa exekutatzeko.
     * @param args Komando-lerro argumentuak
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    LigaUI window = new LigaUI();
                    window.getFrame().setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }
}
