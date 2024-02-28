package Liga;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

import javax.swing.JOptionPane;

public class LigaOna {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		// Fitxategiaren izenak
        String fitxategiarenIzena = JOptionPane.showInputDialog(null, "Zer izenarekin gorde nahi ditzu paritdoak");
        
        if (!fitxategiarenIzena.endsWith(".txt")) {
            fitxategiarenIzena += ".txt";
        }

        // Talde Kopurua eskatu
        int taldeKop = Integer.parseInt(JOptionPane.showInputDialog(null, "Sartu Talde kopurua"));

        // Txapelketa Kodea eskatu
        String[] txapelketaKodeak = {"1-Gizona", "2-Emakumea", "3-Sub-18", "4-Sub-16"};
        String txapelketaKodString = (String) JOptionPane.showInputDialog(null, "Sartu txapelketa kodea", "Txapelketa Kodea", JOptionPane.QUESTION_MESSAGE, null, txapelketaKodeak, txapelketaKodeak[0]);
        int txapelketaKod = 0;
        for (int i = 0; i < txapelketaKodeak.length; i++) {
            if (txapelketaKodString.equals(txapelketaKodeak[i])) {
                txapelketaKod = i + 1;
                break;
            }
        }

        // Taldeen array-a
        String[] taldeak = new String[taldeKop];

        // Taldeen Izenak eskatu
        for (int i = 0; i < taldeKop; i++) {
            taldeak[i] = JOptionPane.showInputDialog(null, (i + 1) + ". taldearen izena sartu");
		}

		try (BufferedWriter sqlInsertWriter = new BufferedWriter(new FileWriter(fitxategiarenIzena))) {

			// Egutegia sortu
			int jornadaKopurua = taldeKop -1;  
			int partiduakJardunaldian = taldeak.length / 2;
			for (int jardunaldia = 1; jardunaldia <= jornadaKopurua; jardunaldia++) {
				for (int partido = 0; partido < partiduakJardunaldian; partido++) {
					int lokalTaldea = partido;
					int bisitatzaileTaldea = (taldeak.length - 1) - partido;

					// INSERT INTO sententzia sortu
					String sqlInsert = "INSERT INTO Partidoa (Lokala, Bisitaria, Pts_lokala, Pts_bisitaria, Data, Hasiera_ordua, Txapelketa_kod) " +
							"VALUES ('" + taldeak[lokalTaldea] + "', '" + taldeak[bisitatzaileTaldea] + "', NULL, NULL, NULL, NULL, " + txapelketaKod + ");\n";
					sqlInsertWriter.write(sqlInsert);
				}

				// Talde aldaketak hurrengo jaurdunaldirako
				String temp = taldeak[taldeak.length - 1];
				for (int i = taldeak.length - 1; i > 1; i--) {
					taldeak[i] = taldeak[i - 1];
				}
				taldeak[1] = temp;
			}

			System.out.println("SQL insert-en " + fitxategiarenIzena + " fitxategian gorde da.");
		} catch (IOException e) {
			System.err.println("Errorea fitxategiak idazterakoan");
			e.printStackTrace();
		}
	}
}
