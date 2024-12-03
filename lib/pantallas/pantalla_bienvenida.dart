import 'package:flutter/material.dart';
import 'dart:math'; // Importación de la librería matemática (aunque no se usa en este código).
import 'pantalla_ingreso_datos.dart'; // Importación de la pantalla de ingreso de datos.

class PantallaBienvenida extends StatefulWidget {
  const PantallaBienvenida({Key? key}) : super(key: key);

  @override
  State<PantallaBienvenida> createState() => _PantallaBienvenidaState();
}

class _PantallaBienvenidaState extends State<PantallaBienvenida>
    with SingleTickerProviderStateMixin {
  // Declaración del controlador de animación y la animación de escala.
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Inicialización del controlador de animación con una duración de 2 segundos.
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // Usamos "this" para que el controlador de animación esté sincronizado con el ciclo de vida del widget.
    )..repeat(reverse: true); // Hace que la animación repita hacia adelante y hacia atrás.

    // Definición de la animación de escala que va de 1.0 a 1.2 con una curva de aceleración y desaceleración.
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Liberamos los recursos del controlador de animación al destruir el widget.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fondo con un gradiente suave de colores.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)], // Gradiente de azul a verde.
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          // Centra el contenido vertical y horizontalmente.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Alineación vertical centrada.
            children: [
              // Animación que escala el texto "¡Bienvenido!".
              AnimatedBuilder(
                animation: _scaleAnimation, // Construcción de la animación con el valor de escala.
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value, // Aplica el valor de escala calculado.
                    child: const Text(
                      '¡Bienvenid@!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // Agrega sombra al texto para un efecto de profundidad.
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black38,
                            offset: Offset(3.0, 3.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30), // Espaciado entre el texto y el botón.
              GestureDetector(
                // Detecta el toque del usuario para navegar a la siguiente pantalla.
                onTap: () {
                  Navigator.push(
                    context,
                    // Página de ingreso de datos con animación de transición.
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                      const PantallaIngresoDatos(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        // Define la animación de deslizamiento desde la derecha.
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        final tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        final offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation, // Aplica la animación de deslizamiento.
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30), // Ajusta el padding del botón.
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30), // Bordes redondeados.
                    boxShadow: [
                      // Sombra alrededor del botón para dar un efecto de profundidad.
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // El tamaño del Row solo ocupará el espacio necesario.
                    children: const [
                      Text(
                        'Comenzar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00C9FF), // Color azul para el texto.
                        ),
                      ),
                      SizedBox(width: 10), // Espacio entre el texto y el ícono.
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF00C9FF), // Ícono de flecha con el mismo color.
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
