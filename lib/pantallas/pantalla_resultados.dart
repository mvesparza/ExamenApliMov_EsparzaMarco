import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importa la librería para cerrar la app.
import '../logica/logica_triangulo.dart'; // Importa la lógica que genera el triángulo.

class PantallaResultados extends StatelessWidget {
  final int altura; // Recibe la altura del triángulo como parámetro.

  const PantallaResultados({Key? key, required this.altura}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logica = LogicaTriangulo(); // Instancia la lógica que genera el triángulo.
    final triangulo = logica.generarTriangulo(altura); // Genera el triángulo usando la altura.

    return Scaffold(
      body: Container(
        // Fondo con un gradiente de colores.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A82FB), Color(0xFFFC5C7D)], // Gradiente de azul a rosa.
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido verticalmente.
              crossAxisAlignment: CrossAxisAlignment.center, // Centra el contenido horizontalmente.
              children: [
                const Text(
                  'Triángulo Generado',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Estilo del texto.
                  ),
                ),
                const SizedBox(height: 30),
                // Contenedor animado con sombra y bordes redondeados.
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda.
                    children: [
                      const Text(
                        'Resultado:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A82FB), // Color azul para el texto.
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Muestra cada fila del triángulo con una animación de opacidad.
                      ...triangulo.map((fila) => Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: AnimatedOpacity(
                          opacity: 1.0,
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            fila, // Muestra cada fila del triángulo.
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6A82FB),
                            ),
                          ),
                        ),
                      )).toList(),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Botón para regresar a la pantalla anterior.
                InkWell(
                  onTap: () {
                    Navigator.pop(context); // Regresa a la pantalla anterior.
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFF6A82FB), // Color del botón.
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // El tamaño del Row solo ocupará lo necesario.
                      children: const [
                        Text(
                          'Regresar', // Texto del botón.
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Color blanco para el texto.
                          ),
                        ),
                        SizedBox(width: 10), // Espacio entre el texto y el ícono.
                        Icon(
                          Icons.arrow_back, // Ícono de flecha hacia atrás.
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Botón para cerrar la aplicación.
                InkWell(
                  onTap: () {
                    SystemNavigator.pop(); // Cierra la aplicación.
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.red, // Color del botón de cierre.
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Salir', // Texto del botón.
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Color blanco para el texto.
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.exit_to_app, // Ícono para cerrar la app.
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
