package Liga;

import static org.junit.Assert.*;

import javax.swing.JTextField;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class SQLManagerTest {
    
    private SQLManager sqlManager;
    
    @Before
    public void setUp() throws Exception {
        sqlManager = new SQLManager();
    }

    @After
    public void tearDown() throws Exception {
        sqlManager = null;
    }

    @Test
    public void testInsertPartidoak() {
        JTextField[] taldeak = new JTextField[6];
        for (int i = 0; i < taldeak.length; i++) {
            taldeak[i] = new JTextField("Taldea " + (i + 1));
        }
        sqlManager.insertPartidoak(6, "1-Gizona", taldeak);
        
        // Partiduak gordeta dauden fitxategia existitzen den egiaztatu
        assertNotNull(getClass().getClassLoader().getResource("Partidoak.txt"));
    }

    @Test
    public void testGetTxapelketaKod() {
        assertEquals(1, sqlManager.getTxapelketaKod("1-Gizona"));
        assertEquals(2, sqlManager.getTxapelketaKod("2-Emakumea"));
        assertEquals(3, sqlManager.getTxapelketaKod("3-Sub-18"));
        assertEquals(4, sqlManager.getTxapelketaKod("4-Sub-16"));
        assertEquals(0, sqlManager.getTxapelketaKod("Ez da aurkitu"));
    }
}
