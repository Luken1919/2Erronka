package Liga;

import static org.junit.Assert.*;

import javax.swing.JTextField;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class PartiduDatuakTest {
    
    private PartiduDatuak partiduDatuak;
    
    @Before
    public void setUp() throws Exception {
        JTextField[] taldeak = new JTextField[6];
        for (int i = 0; i < taldeak.length; i++) {
            taldeak[i] = new JTextField("Taldea " + (i + 1));
        }
        partiduDatuak = new PartiduDatuak(6, "1-Gizona", taldeak);
    }

    @After
    public void tearDown() throws Exception {
        partiduDatuak = null;
    }

    @Test
    public void testGetTaldeKop() {
        assertEquals(6, partiduDatuak.getTaldeKop());
    }

    @Test
    public void testGetTxapelketaKodeak() {
        assertEquals("1-Gizona", partiduDatuak.getTxapelketaKodeak());
    }

    @Test
    public void testGetTaldeak() {
        JTextField[] taldeak = partiduDatuak.getTaldeak();
        assertNotNull(taldeak);
        assertEquals(6, taldeak.length);
        for (int i = 0; i < taldeak.length; i++) {
            assertEquals("Taldea " + (i + 1), taldeak[i].getText());
        }
    }
}
