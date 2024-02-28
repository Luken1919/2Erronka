package Liga;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Sub18Liga {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] taldeak = new String[8];  // 8 talde

        // Taldeen izenak lortu
        for (int i = 0; i < 8; i++) {
            System.out.print("Sartu taldearen izena " + (i + 1) + ": ");
            taldeak[i] = scanner.nextLine();
        }

        // Fitxategiaren izena
        String fitxategiIzena = "Sub18Egutegia.txt";

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fitxategiIzena))) {

            // Egutegia sortu
            int jardunaldiKopurua = 7;  // 7 jardunaldi
            int jardunaldikoPartiduak = taldeak.length / 2;

            for (int jardunaldia = 1; jardunaldia <= jardunaldiKopurua; jardunaldia++) {
                writer.write("\nJardunaldi " + jardunaldia + ":\n");
                for (int partidua = 0; partidua < jardunaldikoPartiduak; partidua++) {
                    int taldeaLokala = partidua;
                    int taldeaBisitaria = (taldeak.length - 1) - partidua;
                    writer.write(taldeak[taldeaLokala] + " vs " + taldeak[taldeaBisitaria] + "\n");

                    // INSERT INTO sententzia sortu
                    String sqlInsert = "INSERT INTO Partidoa (Kod, Lokala, Bisitaria, Pts_lokala, Pts_bisitaria, Data, Hasiera_ordua, Txapelketa_kod) " +
                            "VALUES (NULL, '" + taldeak[taldeaLokala] + "', '" + taldeak[taldeaBisitaria] + "', NULL, NULL, NULL, NULL, NULL);\n";
                    writer.write("SQL sententzia: " + sqlInsert);
                }

                // Taldeak biratzeko hurrengo jardunaldia
                String temp = taldeak[taldeak.length - 1];
                for (int i = taldeak.length - 1; i > 1; i--) {
                    taldeak[i] = taldeak[i - 1];
                }
                taldeak[1] = temp;
            }

            System.out.println("Egutegia " + fitxategiIzena + " fitxategian gorde da.");
        } catch (IOException e) {
            System.err.println("Errorea " + fitxategiIzena + " fitxategian idazterakoan");
            e.printStackTrace();
        }
    }
}
