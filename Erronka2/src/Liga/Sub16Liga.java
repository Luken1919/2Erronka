package Liga;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Sub16Liga {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String[] equipos = new String[6];  // 6 equipos

		// Obtener los nombres de los equipos
		for (int i = 0; i < 6; i++) {
			System.out.print("Ingresa el nombre del equipo " + (i + 1) + ": ");
			equipos[i] = scanner.nextLine();
		}

		// Nombre del archivo
		String nombreArchivo = "calendario.txt";

		try (BufferedWriter writer = new BufferedWriter(new FileWriter(nombreArchivo))) {
			// Generar el calendario
			int numJornadas = 5;  // 5 jornadas
			int partidosPorJornada = equipos.length / 2;

			for (int jornada = 1; jornada <= numJornadas; jornada++) {
				writer.write("\nJornada " + jornada + ":\n");
				for (int partido = 0; partido < partidosPorJornada; partido++) {
					int equipoLocal = partido;
					int equipoVisitante = (equipos.length - 1) - partido;
					writer.write(equipos[equipoLocal] + " vs " + equipos[equipoVisitante] + "\n");

					// Generar la sentencia INSERT INTO
					String sqlInsert = "INSERT INTO Partidoa (Kod, Lokala, Bisitaria, Pts_lokala, Pts_bisitaria, Data, Hasiera_ordua, Txapelketa_kod) " +
							"VALUES (NULL, '" + equipos[equipoLocal] + "', '" + equipos[equipoVisitante] + "', NULL, NULL, NULL, NULL, NULL);\n";
					writer.write("Sentencia SQL: " + sqlInsert);
				}

				// Rotar los equipos para la siguiente jornada
				String temp = equipos[equipos.length - 1];
				for (int i = equipos.length - 1; i > 1; i--) {
					equipos[i] = equipos[i - 1];
				}
				equipos[1] = temp;
			}

			System.out.println("El calendario se ha guardado en el archivo " + nombreArchivo);
		} catch (IOException e) {
			System.err.println("Error al escribir en el archivo " + nombreArchivo);
			e.printStackTrace();
		}
	}
}
