package Liga;

import static org.junit.Assert.*;

import java.awt.EventQueue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class LigaMainTest {
    
    private LigaMain ligaMain;
    
    @Before
    public void setUp() throws Exception {
        ligaMain = new LigaMain();
    }

    @After
    public void tearDown() throws Exception {
        ligaMain = null;
    }

    @Test
    public void testMain() {
        // Main metodoa exekutatu
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    ligaMain.main(null);
                } catch (Exception e) {
                    fail("Errorea aplikazioa exekutatzean: " + e.getMessage());
                }
            }
        });
    }
}
