package Kopa;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class KopaRugbyEmakume {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] taldeak = new String[8];

        // Taldeen izenak lortu
        for (int i = 0; i < 8; i++) {
            System.out.print((i + 1) + ". taldearen izena sartu: ");
            taldeak[i] = scanner.nextLine();
        }

        // Taldeak 2 taldeko 4 taldeetan banatu
        String[][] taldeGrupoak = new String[2][4];
        int index = 0;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 4; j++) {
                taldeGrupoak[i][j] = taldeak[index++];
            }
        }

        // Fitxategiaren izena
        String fitxategiIzena = "egutegia.txt";

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fitxategiIzena))) {

            // Talde bakoitzeko egutegia sortu
            for (int taldeGrup = 0; taldeGrup < 2; taldeGrup++) {
                System.out.println("\n" + (taldeGrup + 1) + ". Taldea:");
                for (int i = 0; i < 4; i++) {
                    for (int j = i + 1; j < 4; j++) {
                        System.out.println(taldeGrupoak[taldeGrup][i] + " vs " + taldeGrupoak[taldeGrup][j]);

                        // INSERT INTO sententzia sortu
                        String sqlInsert = "INSERT INTO Partidoa (Kod, Lokala, Bisitaria, Pts_lokala, Pts_bisitaria, Data, Hasiera_ordua, Txapelketa_kod) " +
                                "VALUES (NULL, '" + taldeGrupoak[taldeGrup][i] + "', '" + taldeGrupoak[taldeGrup][j] + "', NULL, NULL, NULL, NULL, NULL);";
                        System.out.println("SQL sententzia: " + sqlInsert);
                    }
                }
            }

            System.out.println("Egutegia " + fitxategiIzena + " fitxategian gorde da.");
        } catch (IOException e) {
            System.err.println("Errorea " + fitxategiIzena + " fitxategian idazterakoan");
            e.printStackTrace();
        }
    }
}
