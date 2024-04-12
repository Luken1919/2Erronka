package Liga;


import javax.swing.*;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

/**
 * SQLManager klasea datuak datubasean txertatzeko eta fitxategian idazteko erabiliko da.
 * 
 */
public class SQLManager {
    
    /** 
     * Partiduen datuak datubasean sartzen ditu.
     * @param taldeKop Talde kopurua
     * @param txapelketaKodString Txapelketaren kodea String formatuan
     * @param txtTaldeak Taldeen izenak gordetzeko JTextField arraya
     */
    public void insertPartidoak(int taldeKop, String txapelketaKodString, JTextField[] txtTaldeak) {
        String[] taldeak = new String[taldeKop];
        for (int i = 0; i < taldeKop; i++) {
            taldeak[i] = txtTaldeak[i].getText();
            if (taldeak[i].isEmpty()) {
                JOptionPane.showMessageDialog(null, "Mesedez, sartu izenak guztiak.");
                return;
            }
        }

        String fitxategiarenIzena = "Partidoak.txt";

        try (BufferedWriter sqlInsertWriter = new BufferedWriter(new FileWriter(fitxategiarenIzena, true))) {
            int jornadaKopurua = taldeKop - 1;
            int partiduakJardunaldian = taldeak.length / 2;
            for (int jardunaldia = 1; jardunaldia <= jornadaKopurua; jardunaldia++) {
                for (int partido = 0; partido < partiduakJardunaldian; partido++) {
                    int lokalTaldea = partido;
                    int bisitatzaileTaldea = (taldeak.length - 1) - partido;

                    String sqlInsert = "INSERT INTO Partidoa (Lokala, Bisitaria, Txapelketa_kod) " +
                            "VALUES ('" + taldeak[lokalTaldea] + "', '" + taldeak[bisitatzaileTaldea] + "', " + getTxapelketaKod(txapelketaKodString) + ");\n";
                    sqlInsertWriter.write(sqlInsert);
                }

                String temp = taldeak[taldeak.length - 1];
                for (int i = taldeak.length - 1; i > 1; i--) {
                    taldeak[i] = taldeak[i - 1];
                }
                taldeak[1] = temp;
            }

            JOptionPane.showMessageDialog(null, "SQL insert-ak " + fitxategiarenIzena + " fitxategian gorde da.");
        } catch (IOException e) {
            System.err.println("Errorea fitxategiak idazterakoan");
            e.printStackTrace();
        }
    }

    /** 
     * Txapelketaren kodea zenbakitan itzultzen du.
     * @param txapelketaKodString Txapelketaren kodea String formatuan
     * @return int Txapelketaren kodea
     */
    private int getTxapelketaKod(String txapelketaKodString) {
        switch (txapelketaKodString) {
            case "1-Gizona":
                return 1;
            case "2-Emakumea":
                return 2;
            case "3-Sub-18":
                return 3;
            case "4-Sub-16":
                return 4;
            default:
                return 0;
        }
    }

}
