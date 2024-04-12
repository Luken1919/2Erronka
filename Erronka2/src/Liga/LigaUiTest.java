package Liga;

import static org.junit.Assert.*;

import javax.swing.JTextField;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class LigaUITest {
    
    private LigaUI ligaUI;
    
    @Before
    public void setUp() throws Exception {
        ligaUI = new LigaUI();
    }

    @After
    public void tearDown() throws Exception {
        ligaUI = null;
    }

    @Test
    public void testSortuTaldeak() {
        // Talde kopurua 6 dela egiaztatu
        ligaUI.SortuTaldeak(6);
        JTextField[] txtTaldeak = ligaUI.getTaldeak();
        assertEquals(6, txtTaldeak.length);

        // Talde kopurua 8 dela egiaztatu
        ligaUI.SortuTaldeak(8);
        txtTaldeak = ligaUI.getTaldeak();
        assertEquals(8, txtTaldeak.length);

        // Talde kopurua 10 dela egiaztatu
        ligaUI.SortuTaldeak(10);
        txtTaldeak = ligaUI.getTaldeak();
        assertEquals(10, txtTaldeak.length);

        // Talde kopurua 12 dela egiaztatu
        ligaUI.SortuTaldeak(12);
        txtTaldeak = ligaUI.getTaldeak();
        assertEquals(12, txtTaldeak.length);
    }

    @Test
    public void testSortuGordeBotoia() {
        // Talde kopurua eta Txapelketa Kodea ezarri
        ligaUI.getComboBoxTaldeKop().setSelectedItem(6);
        ligaUI.getComboBoxTxapelketaKodeak().setSelectedItem("1-Gizona");
        ligaUI.SortuTaldeak(6);
        ligaUI.sortuGordeBotoia();
        assertNotNull(ligaUI.getBtnGorde());
    }

    @Test
    public void testInsertPartidoak() {
        // Talde kopurua eta Txapelketa Kodea ezarri
        ligaUI.getComboBoxTaldeKop().setSelectedItem(6);
        ligaUI.getComboBoxTxapelketaKodeak().setSelectedItem("1-Gizona");
        ligaUI.SortuTaldeak(6);

        // Taldeen izenak sartu
        for (int i = 0; i < 6; i++) {
            ligaUI.getTxtTaldeak()[i].setText("Taldea " + (i + 1));
        }

        // Partiduak datubasean sartu
        SQLManager sqlManager = new SQLManager();
        sqlManager.insertPartidoak(ligaUI.getComboBoxTaldeKop().getSelectedIndex(), (String) ligaUI.getComboBoxTxapelketaKodeak().getSelectedItem(), ligaUI.getTxtTaldeak());

        // Partiduak gordeta dauden fitxategia existitzen den egiaztatu
        assertNotNull(getClass().getClassLoader().getResource("Partidoak.txt"));
    }
}
