package Kopa;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class KopaRugbyEmakume  {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String[] equipos = new String[8];

		// Obtener los nombres de los equipos
		for (int i = 0; i < 8; i++) {
			System.out.print("Ingresa el nombre del equipo " + (i + 1) + ": ");
			equipos[i] = scanner.nextLine();
		}

		// Dividir los equipos en 2 grupos de 4 equipos cada uno
		String[][] grupos = new String[2][4];
		int index = 0;
		for (int i = 0; i < 2; i++) {
			for (int j = 0; j < 4; j++) {
				grupos[i][j] = equipos[index++];
			}
		}

		// Nombre del archivo
		String nombreArchivo = "calendario.txt";

		try (BufferedWriter writer = new BufferedWriter(new FileWriter(nombreArchivo))) {

			// Generar el calendario para cada grupo
			for (int grupo = 0; grupo < 2; grupo++) {
				System.out.println("\nGrupo " + (grupo + 1) + ":");
				for (int i = 0; i < 4; i++) {
					for (int j = i + 1; j < 4; j++) {
						System.out.println(grupos[grupo][i] + " vs " + grupos[grupo][j]);

						// Generar la sentencia INSERT INTO
						String sqlInsert = "INSERT INTO Partidoa (Kod, Lokala, Bisitaria, Pts_lokala, Pts_bisitaria, Data, Hasiera_ordua, Txapelketa_kod) " +
								"VALUES (NULL, '" + grupos[grupo][i] + "', '" + grupos[grupo][j] + "', NULL, NULL, NULL, NULL, NULL);";
						System.out.println("Sentencia SQL: " + sqlInsert);
					}
				}
			}

			System.out.println("El calendario se ha guardado en el archivo " + nombreArchivo);
		} catch (IOException e) {
			System.err.println("Error al escribir en el archivo " + nombreArchivo);
			e.printStackTrace();
		}
	}
}


