package Liga;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class GizonLiga {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] taldeak = new String[12];

        // Taldeen izenak lortu
        for (int i = 0; i < 12; i++) {
            System.out.print((i + 1) + ". taldearen izena sartu: ");
            taldeak[i] = scanner.nextLine();
        }

        // Fitxategiaren izena
        String fitxategiIzena = "egutegia.txt";

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fitxategiIzena))) {

            // Egutegia sortu
            int jornadaKopurua = taldeak.length - 1;
            int partiduakJardunaldiko = taldeak.length / 2;

            for (int jardunaldia = 1; jardunaldia <= jornadaKopurua; jardunaldia++) {
                System.out.println("\n" + jardunaldia + ". Jardunaldia:");
                for (int partida = 0; partida < partiduakJardunaldiko; partida++) {
                    int localTaldea = partida;
                    int bisitatzaileTaldea = (taldeak.length - 1) - partida;
                    System.out.println(taldeak[localTaldea] + " vs " + taldeak[bisitatzaileTaldea]);

                    // INSERT INTO sententzia sortu
                    String sqlInsert = "INSERT INTO Partidoa (Kod, Lokala, Bisitaria, Pts_lokala, Pts_bisitaria, Data, Hasiera_ordua, Txapelketa_kod) " +
                            "VALUES (NULL, '" + taldeak[localTaldea] + "', '" + taldeak[bisitatzaileTaldea] + "', NULL, NULL, NULL, NULL, NULL);";
                    System.out.println("SQL sententzia: " + sqlInsert);
                }

                // Taldeen txandak aldatu hurrengo jardunaldian
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
