package Liga;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class LigaOna {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] taldeak = new String[8];  // 8 talde

        // Taldeen izenak lortu
        for (int i = 0; i < 8; i++) {
            System.out.print((i + 1) + ". taldearen izena sartu: ");
            taldeak[i] = scanner.nextLine();
        }

        // Fitxategiaren izenak
        String partiduFitxIzena = "partiduak.txt";
        String sqlInsertFitxIzena = "sql_inserts.txt";

        try (BufferedWriter partiduWriter = new BufferedWriter(new FileWriter(partiduFitxIzena));
             BufferedWriter sqlInsertWriter = new BufferedWriter(new FileWriter(sqlInsertFitxIzena))) {

            // Egutegia sortu
            int jornadaKopurua = 7;  // 7 jardunaldi
            int partiduakJardunaldian = taldeak.length / 2;

            for (int jardunaldia = 1; jardunaldia <= jornadaKopurua; jardunaldia++) {
                partiduWriter.write("\n" + jardunaldia + ". jardunaldia:\n");
                for (int partido = 0; partido < partiduakJardunaldian; partido++) {
                    int localTaldea = partido;
                    int bisitatzaileTaldea = (taldeak.length - 1) - partido;
                    partiduWriter.write(taldeak[localTaldea] + " vs " + taldeak[bisitatzaileTaldea] + "\n");

                    // INSERT INTO sententzia sortu
                    String sqlInsert = "INSERT INTO Partidoa (Kod, Lokala, Bisitaria, Pts_lokala, Pts_bisitaria, Data, Hasiera_ordua, Txapelketa_kod) " +
                            "VALUES (NULL, '" + taldeak[localTaldea] + "', '" + taldeak[bisitatzaileTaldea] + "', NULL, NULL, NULL, NULL, NULL);\n";
                    sqlInsertWriter.write(sqlInsert);
                }

                // Taldeak biratu hurrengo jardunaldiarentzako
                String temp = taldeak[taldeak.length - 1];
                for (int i = taldeak.length - 1; i > 1; i--) {
                    taldeak[i] = taldeak[i - 1];
                }
                taldeak[1] = temp;
            }

            System.out.println("Egutegia partiduen " + partiduFitxIzena + " fitxategian eta SQL insert-en " + sqlInsertFitxIzena + " fitxategian gorde da.");
        } catch (IOException e) {
            System.err.println("Errorea fitxategiak idazterakoan");
            e.printStackTrace();
        }
    }
}
