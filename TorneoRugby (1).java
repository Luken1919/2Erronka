package GizonakLiga;

import java.util.Scanner;

public class TorneoRugby {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] equipos = new String[12];

        // Obtener los nombres de los equipos
        for (int i = 0; i < 12; i++) {
            System.out.print("Ingresa el nombre del equipo " + (i + 1) + ": ");
            equipos[i] = scanner.nextLine();
        }

        // Generar el calendario
        int numJornadas = equipos.length - 1;
        int partidosPorJornada = equipos.length / 2;

        for (int jornada = 1; jornada <= numJornadas; jornada++) {
            System.out.println("\nJornada " + jornada + ":");
            for (int partido = 0; partido < partidosPorJornada; partido++) {
                int equipoLocal = partido;
                int equipoVisitante = (equipos.length - 1) - partido;
                System.out.println(equipos[equipoLocal] + " vs " + equipos[equipoVisitante]);

                // Generar la sentencia INSERT INTO
                String sqlInsert = "INSERT INTO Partidoa (Kod, Lokala, Bisitaria, Pts_lokala, Pts_bisitaria, Data, Hasiera_ordua, Txapelketa_kod) " +
                        "VALUES (NULL, '" + equipos[equipoLocal] + "', '" + equipos[equipoVisitante] + "', NULL, NULL, NULL, NULL, NULL);";
                System.out.println("Sentencia SQL: " + sqlInsert);
            }

            // Rotar los equipos para la siguiente jornada
            String temp = equipos[equipos.length - 1];
            for (int i = equipos.length - 1; i > 1; i--) {
                equipos[i] = equipos[i - 1];
            }
            equipos[1] = temp;
        }
    }
}


